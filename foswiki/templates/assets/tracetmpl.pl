#!/usr/bin/perl -w
use strict;

print "File: $ARGV[0]\n";
# --- Get the template file text
my $template = slurp($ARGV[0]);
# --- Parse the text for definitions =%TMPL:DEF{ "directivename" }%definition%TMPL:END%=
# and print each with an opening and closing line.
while ( $template =~ m!%TMPL:DEF\{"([^"]+)"}%(.*?)%TMPL:END%!gs ) {
  print "\n---------- $1 --------------\n$2\n---------- $1 END ----------\n";
}

$template =~ s!%TMPL:DEF\{"([^"]+)"}%(.*?)%TMPL:END%!!gs;
$template =~ s!\s*%\{.*?}%\s*!!gs;
$template =~ s!\n+!\n!gs;

# remove all definitions and print the active statements in the template
print "\n---------- ACTIONS --------------\n$template\n---------- ACTIONS END ----------\n";

# Read the template file
sub slurp {
  my ( $filename ) = @_;
  my $t = $/;
  undef $/;
  open FILE, "<$filename";
  my $file = <FILE>;
  close FILE;
  $/ = $t;
  return $file; 
}