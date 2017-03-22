use Test::Most;
use lib '../lib';
use Unique ':ALL';

my @have = unique( 2, 3, 5, 4, 3, 5, 7 );
my @want = ( 2, 3, 5, 4, 7 );
is_deeply \@have, \@want,'unique() should return unique() elements in order';

done_testing();

