package User;
use v5.11;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use Digest::MD5 ();
with "Does::ToHash";

use MooseX::StrictConstructor;
use MooseX::SemiAffordanceAccessor;

has 'username' => ( is => 'ro', isa=>'Str', required => 1, default => 'XXX', reader => 'get_username', writer => 'set_username' );
has 'password' => ( is => 'ro', isa=>'Str', required => 1, default => 'xxx', reader => 'get_password', writer => 'set_password'  );

sub get_attrs {
	
	my $self = shift;
	my $aref = ();
	my @attributes = map { $_->name } $self->meta->get_all_attributes;
	foreach my $attr (@attributes) {		
		if ( ! ref $attr) {
			push  @{ $aref } , $attr;
		}
	}
		
	return $aref;
}

sub BUILD {
	my $self = shift;
	my $digest = Digest::MD5::md5_hex($self->get_username);
	$self->set_password($digest);
}

__PACKAGE__->meta->make_immutable;
1;