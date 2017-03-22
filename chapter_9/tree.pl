use strict;
use warnings;
use File::Spec::Functions 'splitdir';
use File::Find::Rule;
no warnings 'numeric';

my $dir = @ARGV ? $ARGV[0] : '.';

my $rule = File::Find::Rule->any(
File::Find::Rule->directory, # only directories
File::Find::Rule->file, # or files
)->start($dir);

while ( defined( my $found = $rule->match ) ) {
	next if $found =~ /^\./;
	my @directories = splitdir($found);
	my $name = pop @directories;
	if ( -f $found ) {
		print "| "x ( @directories - 1 );
		print "|-- $name\n";
	}
	else {
		print "| "x @directories;
		print "$name/\n";
}
}