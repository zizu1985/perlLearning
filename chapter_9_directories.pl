use strict;
use warnings;
use autodie;

my $directory = 'chapter_9';
my $dir;

=begin Listing directory using opendir, readdir

opendir $dir,$directory;

my @txts = grep { /\.txt$/ } readdir $dir;
print join "\n" , @txts;

closedir $dir;

=end
=cut 

# list files using glob
my @txts = glob("$directory/*txt");
print join "\n" , @txts;

