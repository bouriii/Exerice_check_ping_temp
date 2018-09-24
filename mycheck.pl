use strict;
use warnings;
use feature 'say';
use YAML::Tiny;
use YAML::XS 'LoadFile';
use Data::Dumper;
use 5.010;
use Net::Ping;
    
my $file       = $ARGV[0];
my $config     = LoadFile($file);
my $hostnam1   = $config->{checks}->{ping}->{google};
my $hostnam2   = $config->{checks}->{ping}->{mysite};
my $temp       = 0;
my $png        = Net::Ping->new('icmp');

if ( $png->ping($hostnam1) ) {
	       print " V ", $hostnam1 ,"\n";
	       $temp = 1;
}
if ( $temp eq 0) {
	       print "\n X ", $hostnam1 ,"\n";
}
$temp	       = 0;

if ( $png->ping($hostnam2) ) {
               print " V ", $hostnam2 ,"\n";
               $temp = 1;
}
if ( $temp eq 0) {
               print "\n X ", $hostnam2 ,"\n";
}
