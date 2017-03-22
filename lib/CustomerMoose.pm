package CustomerMoose;
use Moose;
use namespace::autoclean;
extends 'PersonMoose';
use Carp 'croak';

sub BUILD {
	my $self = shift;
	if ($self->age < 18) {
		my $age = $self->age;
		croak "Customer has to have more than 18 years. Instead it has $age years";
	}
}


__PACKAGE__->meta->make_immutable;
1;