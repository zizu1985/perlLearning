use strict;
use warnings;
use Module::CoreList;

my $regex = qr\File\;
foreach (Module::CoreList::find_modules($regex))
{
	print $_."\n";
}