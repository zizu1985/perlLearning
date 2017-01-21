use strict;
use warnings;

use HTML::SimpleLinkExtor;
use LWP::Simple 'get';

# Modules below need to be installed before starting
# cpan libwww-perl HTML::SimpleLinkExtor

my $url = shift @ARGV or die "Give me URL!";
my $html = get($url) or die "Couldn't get $url !";

my $extor = HTML::SimpleLinkExtor->new();
$extor->parse($html);

my @links = $extor->links();

unless (@links) { 
	die "No links in URL $url ";
}

foreach (@links) {
	print "Found link : $_\n";
}
