use strict;
use warnings;
use Module::CoreList;

my $regex = qr\^Data*?\;
foreach (Module::CoreList::find_modules($regex))
{
	print $_."\n";
}