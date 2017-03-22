package My::CustomTypes;

use Moose::Util::TypeConstraints;
use namespace::autoclean;

subtype 'IntPositive',
	as 'Int' ,
	where { $_ > 0 };


__PACKAGE__->meta->make_immutable;

1;