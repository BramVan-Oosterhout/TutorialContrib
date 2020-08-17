# Copyright (C) 2013-2019 Michael Daum http://michaeldaumconsulting.com
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details, published at
# http://www.gnu.org/copyleft/gpl.html

package Foswiki::Contrib::CopyContrib::TopicAgent;

use strict;
use warnings;

use Foswiki::Meta ();
use Foswiki::Func();
use Foswiki::OopsException();
use Foswiki::Contrib::CopyContrib::CopyAgent ();
use Error qw( :try );

our @ISA = qw( Foswiki::Contrib::CopyContrib::CopyAgent );

###############################################################################
sub parseRequestObject {
  my ($this, $request) = @_;

  $this->SUPER::parseRequestObject($request);

  $this->{src} = $request->param('source') || $this->{baseWeb} . '.' . $this->{baseTopic};
  ($this->{srcWeb}, $this->{srcTopic}) = Foswiki::Func::normalizeWebTopicName($this->{baseWeb}, $this->{src})
    unless defined $this->{srcWeb} && defined $this->{srcTopic};

  $this->{dstWeb} = $request->param("dstWeb") || $this->{baseWeb}
    unless defined $this->{dstWeb};
  $this->{dstTopic} = $request->param('destination') || $request->param("dstTopic") || $this->{src}
    unless defined $this->{dstTopic};
  ($this->{dstWeb}, $this->{dstTopic}) = Foswiki::Func::normalizeWebTopicName($this->{dstWeb}, $this->{dstTopic});

  throw Error::Simple("invalid topic name")
    unless Foswiki::Func::isValidTopicName($this->{dstTopic});

  throw Error::Simple("invalid web name")
    unless Foswiki::Func::isValidWebName($this->{dstWeb});

  throw Error::Simple("web does not exist")
    unless Foswiki::Func::webExists($this->{dstWeb});

  #$this->writeDebug("srcWeb=$this->{srcWeb}, srcTopic=$this->{srcTopic}");
  #$this->writeDebug("dstWeb=$this->{dstWeb}, dstTopic=$this->{dstTopic}");

  my @includeParts = ();
  my $includeParts = $request->param('includeparts');
  if (defined $includeParts) {
    push @includeParts, split(/\s*,\s*/, $includeParts);
  }
  $includeParts = $request->param('includepart');
  if ($includeParts) {
    push @includeParts, split(/\s*,\s*/, $includeParts);
  }
  push @includeParts, "all" unless @includeParts;    # default

  my @excludeParts = ();
  my $excludeParts = $request->param('excludeparts');
  if (defined $excludeParts) {
    push @excludeParts, split(/\s*,\s*/, $excludeParts);
  }
  $excludeParts = $request->param('excludepart');
  if (defined $excludeParts) {
    push @excludeParts, split(/\s*,\s*/, $excludeParts);
  }

  $this->{includeparts} = {map { $_ => 1 } @includeParts};
  $this->{excludeparts} = {map { $_ => 1 } @excludeParts};

  #print STDERR Data::Dumper->Dump([$this->{includeparts}])"\n";
  #print STDERR Data::Dumper->Dump([$this->{excludeparts}])"\n";

  $this->writeDebug("includeparts=" . join(", ", sort keys %{$this->{includeparts}}))
    if defined $this->{includeparts};
  $this->writeDebug("excludeparts=" . join(", ", sort keys %{$this->{excludeparts}}))
    if defined $this->{excludeparts};

  # get include<part-id> and exclude<part-id>
  foreach my $partId ($this->getKnownMetaAliases) {
    #$this->writeDebug("testing for part id $partId");

    foreach my $type (qw(include exclude)) {
      my $val = $request->param($type . $partId);
      if (defined $val) {
        #$this->writeDebug("$type$partId=$val");
        $this->{$type . $partId} = $val;
      }
    }
  }

  $this->{fromRev} = $request->param('fromrev') || 0;
  $this->{toRev} = $request->param('torev') || 0;
  $this->{preserveTopicInfo} = Foswiki::Func::isTrue($request->param('preservetopicinfo'), 0)
    unless defined $this->{preserveTopicInfo};
  $this->{trashSource} = Foswiki::Func::isTrue($request->param('trashsource'), 0);

  # make sure fromRev < toRev
  if ($this->{fromRev} > $this->{toRev}) {
    my $tmp = $this->{fromRev};
    $this->{fromRev} = $this->{toRev};
    $this->{toRev} = $tmp;
  }

  #  if ($this->{debug}) {
  #    print STDERR Data::Dumper->Dump([$this])"\n";
  #  }

  return $this;
}

###############################################################################
sub finish {
  my $this = shift;

  $this->SUPER::finish();

  undef $this->{srcMeta};
  undef $this->{dstMeta};
  undef $this->{includeparts};
  undef $this->{excludeparts};
  undef $this->{metaOfAlias};
}

###############################################################################
sub getKnownMetaAliases {
  my $this = shift;

  unless (defined $this->{metaOfAlias}) {

    foreach my $metaDataName (keys %Foswiki::Meta::VALIDATE) {
      next if $metaDataName =~ /^(TOPICINFO|CREATEINFO|TOPICMOVED|DISQUS|VERSIONS)$/;    # SMELL: have a cfg value for defaults

      my $validation = $Foswiki::Meta::VALIDATE{$metaDataName};
      my $key = ($validation->{alias} || lc($metaDataName));
      $this->{metaOfAlias}{$key} = $metaDataName;
    }

    #$this->writeDebug("knwon meta aliases: " . join(", ", sort keys %{$this->{metaOfAlias}}));
  }

  return keys %{$this->{metaOfAlias}};
}

###############################################################################
sub getMetaKeyOfAlias {
  my ($this, $alias) = @_;

  $this->getKnownMetaAliases;
  return $this->{metaOfAlias}{$alias};
}

###############################################################################
sub checkAccess {
  my $this = shift;

  my $user = Foswiki::Func::getWikiName();

  throw Foswiki::OopsException(
    "copy",
    def => "access_denied_error",
    params => ["Error during copy operation", "$this->{srcWeb}.$this->{srcTopic}"]
  ) unless Foswiki::Func::checkAccessPermission('view', $user, undef, $this->{srcTopic}, $this->{srcWeb});

  throw Foswiki::OopsException(
    "copy",
    def => "access_denied_error",
    params => ["Error during copy operation", "$this->{dstWeb}.$this->{dstTopic}"]
  ) unless Foswiki::Func::checkAccessPermission('change', $user, undef, $this->{dstTopic}, $this->{dstWeb});
}

###############################################################################
sub read {
  my ($this, $doReload, $rev) = @_;

  #$this->writeDebug("called read");

  # read/create destination object
  if (!defined($this->{dstMeta}) || $doReload) {
    #$this->writeDebug("... reloading dst $this->{dstWeb}.$this->{dstTopic}");
    if (Foswiki::Func::topicExists($this->{dstWeb}, $this->{dstTopic})) {
      ($this->{dstMeta}) = Foswiki::Func::readTopic($this->{dstWeb}, $this->{dstTopic});
    } else {
      $this->{dstMeta} = new Foswiki::Meta($this->{session}, $this->{dstWeb}, $this->{dstTopic});
    }
  }

  # read the source
  if (!(defined $this->{srcMeta}) || $doReload || $this->{loadedRev} != $rev) {
    #$this->writeDebug("... reloading src $this->{srcWeb}.$this->{srcTopic}, rev=$rev");
    ($this->{srcMeta}) = Foswiki::Func::readTopic($this->{srcWeb}, $this->{srcTopic}, $rev);
  }
  $this->{loadedRev} = $rev;

  return ($this->{srcMeta}, $this->{dstMeta});
}

###############################################################################
sub copyPart {
  my ($this, $partId, $rev) = @_;

  #$this->writeDebug("called copyPart($partId, $rev)");

  unless (($this->{includeparts}{$partId} || $this->{includeparts}{all})
    && !$this->{excludeparts}{$partId})
  {
    #$this->writeDebug("... excluding $partId");
    return;
  }

  $this->read(0, $rev);

  # special handling of attachments
  if ($partId eq "attachments") {
    $this->trashAttachments($rev) if $this->{doClear};
    $this->copyAttachments($rev);

    return;
  }

  # special handling of text
  if ($partId eq 'text') {
    # TODO: let's have an appendtext param for this case
    #    if ($this->{doAppendText}) {
    #      $this->{dstMeta}->text($this->{dstMeta}->text().$this->{srcMeta}->text());
    #    } else {
    $this->{dstMeta}->text($this->{srcMeta}->text());
    #    }
    return;
  }

  my $metaDataName = $this->getMetaKeyOfAlias($partId);
  throw Error::Simple("Unknown meta data id '$partId'")
    unless defined $metaDataName;

  #$this->writeDebug("metaDataName=$metaDataName");

  my $exclude = $this->{'exclude' . $partId};
  my $include = $this->{'include' . $partId};

  my $count = 0;
  $this->{dstMeta}->remove($metaDataName) if $this->{doClear};

  foreach my $item ($this->{srcMeta}->find($metaDataName)) {
    if (defined $item->{name}) {
      if ( (defined $exclude && $item->{name} =~ /$exclude/)
        || (defined $include && $item->{name} !~ /$include/))
      {
        #$this->writeDebug("... skipping $item->{name}");
        next;
      }
      #print STDERR Data::Dumper->Dump([$item])"\n";
      #$this->writeDebug("... copying $item->{name}");
      $this->{dstMeta}->putKeyed($metaDataName, $item);
    } else {
      #$this->writeDebug("... copying unnamed item");
      $this->{dstMeta}->put($metaDataName, $item);
    }

    $count++;
  }

  #$this->writeDebug("copied $count $partId item(s)") if $count;
}

###############################################################################
sub trashTopic {
  my ($this, $web, $topic) = @_;

  $web ||= $this->{srcWeb};
  $topic ||= $this->{srcTopic};

  my $targetWeb = $Foswiki::cfg{TrashWebName};
  my $targetTopic = $web . $topic;
  $targetTopic =~ s/[\/\.]//g;

  my $tmp = $targetTopic;
  my $n = 1;
  while (Foswiki::Func::topicExists($targetWeb, $targetTopic)) {
    $targetTopic = $tmp . $n;
    $n++;
  }

  Foswiki::Func::moveTopic($this->{srcWeb}, $this->{srcTopic}, $targetWeb, $targetTopic);
}

###############################################################################
sub trashAttachments {
  my ($this, $rev) = @_;

  $this->read(0, $rev);

  my ($trash) = Foswiki::Func::readTopic($Foswiki::cfg{TrashWebName}, 'TrashAttachment');

  foreach my $attachment ($this->{dstMeta}->find('FILEATTACHMENT')) {
    my $name = $attachment->{name};
    $this->trashAttachment($attachment->{name}, $trash);

  }
}

###############################################################################
sub trashAttachment {
  my ($this, $name, $trash) = @_;

  #$this->writeDebug("trashing attachment $name");
  ($trash) = Foswiki::Func::readTopic($Foswiki::cfg{TrashWebName}, 'TrashAttachment')
    unless defined $trash;

  my $toName = $name;
  my $base = $toName;
  my $ext = '';

  if ($base =~ s/^(.*)(\..*?)$/$1_/) {
    $ext = $2;
  }

  my $n = 1;
  while ($trash->hasAttachment($toName)) {
    $toName = $base . $n . $ext;
    $n++;
  }

  $this->{dstMeta}->moveAttachment($name, $trash, new_name => $toName)
    unless $this->{dry};

  return $toName;
}

###############################################################################
sub copyAttachments {
  my ($this, $rev) = @_;

  #$this->writeDebug("called copyAttachments");

  $this->read(0, $rev);

  # SMELL: can't use Foswiki::Func::getAttachmentList as it returns non-attached files as well
  # that only happen to be in the same pub directory, i.e. thumbnails

  my $exclude = $this->{excludeattachments};

  my %seen = ();
  foreach my $attachment ($this->{srcMeta}->find('FILEATTACHMENT')) {
    my $name = $attachment->{name};
    $seen{$name} = 1;

    if (defined $exclude && $name =~ /$exclude/) {
      #$this->writeDebug("... skipping $name");
      next;
    }

    # check if the attachment still exists in the top revision
    if (Foswiki::Func::attachmentExists($this->{srcWeb}, $this->{srcTopic}, $name)) {

      if (Foswiki::Func::attachmentExists($this->{dstWeb}, $this->{dstTopic}, $name)) {
        #$this->writeDebug("... attachment already exists ... reattaching $name");
      } else {
        #$this->writeDebug("... copying attachment $name");
      }

      # attach another revision
      my $fh = $this->{srcMeta}->openAttachment($name, "<");
      $this->{dstMeta}->attach(
        name => $name,
        comment => $attachment->{comment},
        author => $attachment->{author},
        hide => $attachment->{hide},
        stream => $fh,
        dontlog => 1,
        notopicchange => 1,
        nohandlers => 1,
      );

    } else {
      #$this->writeDebug("... cannot copy attachment $name of rev=$rev not present in the top revision anymore");
    }
  }

  # trash attachments at dst that don't exist at src
  my ($trash) = Foswiki::Func::readTopic($Foswiki::cfg{TrashWebName}, 'TrashAttachment');

  foreach my $attachment ($this->{dstMeta}->find('FILEATTACHMENT')) {
    my $name = $attachment->{name};
    next if defined $exclude && $name =~ /$exclude/ || $seen{$name};
    $this->trashAttachment($name, $trash);
  }
}

###############################################################################
sub copy {
  my ($this, $srcWeb, $srcTopic, $dstWeb, $dstTopic) = @_;

  $this->{srcWeb} = $srcWeb if defined $srcWeb;
  $this->{srcTopic} = $srcTopic if defined $srcTopic;
  $this->{dstWeb} = $dstWeb if defined $dstWeb;
  $this->{dstTopic} = $dstTopic if defined $dstTopic;

  $this->{src} = $this->{srcWeb} . "." . $this->{srcTopic};
  $this->{dst} = $this->{dstWeb} . "." . $this->{dstTopic};

  #$this->writeDebug("called copy() ".($this->{dry}?'...dry run':''));
  #$this->writeDebug("doClear=".$this->{doClear});
  #$this->writeDebug("onlyNew=".$this->{onlyNew});

  throw Error::Simple("Topic $this->{srcWeb}.$this->{srcTopic} does not exist")
    unless Foswiki::Func::topicExists($this->{srcWeb}, $this->{srcTopic});

  throw Foswiki::OopsException(
    "copy",
    def => "overwrite_error",
    params => ["Error during copy operation", "$this->{dstWeb}.$this->{dstTopic}"]
  ) if $this->{onlyNew} && Foswiki::Func::topicExists($this->{dstWeb}, $this->{dstTopic});

  # check access
  $this->checkAccess;

  # check copy to self error
  # throw Error::Simple("Cannot copy topic $srcWeb.$srcTopic on itself")
  #   if "$srcWeb.$srcTopic" eq "$dstWeb.$dstTopic";

  for (my $rev = $this->{fromRev} ; $rev <= $this->{toRev} ; $rev++) {

    # always get the last revision, just in case it exceeded ones created the loop before
    my ($topRevDate) = Foswiki::Func::getRevisionInfo($this->{dstWeb}, $this->{dstTopic});

    # copy the rest
    foreach my $partId (grep { !/attachments/ } sort $this->getKnownMetaAliases) {
      $this->copyPart($partId, $rev);
    }

    $this->copyPart("text", $rev);

    my $forceDate;
    my $forceAuthor;
    my $forceNewRevision = $this->{forceNewRevision};

    if ($this->{preserveTopicInfo}) {
      ($forceDate, $forceAuthor) = $this->{srcMeta}->getRevisionInfo();
      if ($forceDate > $topRevDate) {
        $forceNewRevision = 1;
        #$this->writeDebug("rev=$rev, date=$forceDate, author=$forceAuthor");
      } else {
        #$this->writeDebug("woops, cannot force date to past");
        $forceDate = undef;
        $forceAuthor = undef;
      }
    }

    # do attachments last
    $this->copyPart("attachments", $rev);

    # save
    if ($this->{dstMeta} && !$this->{dry}) {
      #$this->writeDebug("saving to $this->{dstWeb}.$this->{dstTopic}");
      $this->{dstMeta}->save(
        nohandlers => $this->{noHandlers},
        forcenewrevision => $forceNewRevision,
        dontlog => $this->{dontLog},
        minor => $this->{minor},
        forcedate => $forceDate,
        author => $forceAuthor,
      );
    }

    # reload
    $this->read(1, $rev);
  }

  # delete the source on requesst
  $this->trashTopic if $this->{trashSource};

  return ("topic_success", "$this->{srcWeb}.$this->{srcTopic}", "$this->{dstWeb}.$this->{dstTopic}");
}

1;
