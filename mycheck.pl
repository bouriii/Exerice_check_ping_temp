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
my $png        = Net::Ping->new('icmp');
my $temp;

for (keys %{$config->{checks}->{ping}}) {
        $temp = 0;
        if( $png->ping($config->{checks}->{ping}->{$_}) ) {
                say "V $_ ";
                $temp = 1;
        }
        if ( $temp eq 0) {
                say "X $_ ";
        }
}
