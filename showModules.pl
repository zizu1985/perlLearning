use strict;
use warnings;
use Module::CoreList;

my $regex = qr\Compress\;
foreach (Module::CoreList::find_modules($regex))
{
	print $_."\n";
}