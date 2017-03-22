use strict;
use warnings;
use Module::CoreList;

my $regex = qr\Digest\;
foreach (Module::CoreList::find_modules($regex))
{
	print $_."\n";
}

