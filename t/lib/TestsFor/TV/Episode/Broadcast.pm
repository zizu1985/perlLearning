package TestsFor::TV::Episode::Broadcast;
use Test::Most;
use base 'TestsFor::TV::Episode';

# Two more tasts for inherited from TestsFor::TV::Episode
sub attributes : Tests(+2) {
	
	my $test = shift;
	my $episode = $test->SUPER::attributes;
	
	my $attribute = "broadcast_date";
	my $now = DateTime->now;
	can_ok $episode,$attribute; 
	is $episode->$attribute,$now,"TV::Episode::Broadcast should have correct value";
	
}


1;