package Does::ToHash; 
use Moose::Role;

requires qw( get_attrs );


sub my_dump {
	
	my ($self) = @_;
	my $attrs = $self->get_attrs;
	
	my $href = {};
	for my $attr (@ { $attrs }) {
		my $method = "get_".$attr;
		$href->{$attr} = $self->$method;
	} 
	
	return $href;
	
}


1;