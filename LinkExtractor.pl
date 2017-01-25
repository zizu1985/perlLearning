use strict;
use warnings;

use HTML::SimpleLinkExtor;
use LWP::Simple 'get';
use Carp qw(carp);

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



sub saveLinks  {
	my ($links , $file) = @_;
	
	
	carp "File $file will be overwritten!" if -e $file;
	
	open(my $file_handle,">",$file) or die "Can't open file $file";
	
	foreach (@{ $links })
	{
		print $file_handle $_."\n";	
	}
	
	close $file_handle or die "Can't close the $file";
	
}

saveLinks(\@links,"links.txt");
