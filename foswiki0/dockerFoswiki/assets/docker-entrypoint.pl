#!/usr/bin/perl

my $pid = foswikiRunning();
my $killCmd = "kill " . $pid;
system( $killCmd ) if $pid;

my $startCmd = 'cd /var/www/foswiki/bin && ./foswiki.fcgi -l 127.0.0.1:9000 -n 5 -d';

system( $startCmd );



sub foswikiRunning {
    my $process = `ps`;
    ($process) = ($process =~ m!\n\s*(\d+).*?perl \./foswiki\.fcgi!);
    return $process;
}

__END__
Alternative:

pkill -f foswiki.fcgi
cd /var/www/foswiki/bin && ./foswiki.fcgi -l 127.0.0.1:9000 -n 5 -d