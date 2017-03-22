use Test::Most;
use lib '../lib';
use Unique ':ALL';

sub sort_array {
	return  sort { $a <=> $b } @_;
}


my @have = sort_array(unique( 2, 3, 5, 4, 3, 5, 7 ));
my @want = sort_array( 2, 3, 5, 4, 7 );
is_deeply \@have, \@want,'unique() should return unique() elements.';

done_testing();

