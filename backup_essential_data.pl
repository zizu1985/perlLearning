# Backup to DropBox essential folders. Compress them
# Print summary in HTML
# Some kind of warning method will be nice

use strict;
use warnings;
use autodie;
use Carp qw(carp croak);
use JSON qw(decode_json);
use feature 'say';
use Archive::Zip qw( :ERROR_CODES :CONSTANTS );
use File::stat;
use File::Basename;

my @importantFolders = qw(D:\Materials\Linux\Linux_Operations_Essentials_Course);

# get OS path to DropBox folder
sub getDropBoxPath
{
	my ($jsonFile) = @_;
	
	croak "DropBox json file $jsonFile doesn't exist \n." if (! -e -f -r $jsonFile);
	
	open (my $fh,'<', $jsonFile);
	my $json_text = <$fh>;
	my $data = decode_json( $json_text ); 

	my $path = $data->{personal}->{path};
	
	return defined $path ? $path : undef; 
			
}


sub backupFolder 
{
	
	my ($folder,$target_dir) = @_;
	croak "DropBox folder is crap \n." if (! -e -d -r $folder);
		
	my $name = fileparse($folder);
	my $targetFile = $target_dir."\\$name.zip";
	
	my $zip = Archive::Zip->new();
	my $dir_member = $zip->addTree($folder,'');
	
	unless ( $zip->writeToFileNamed($targetFile) == AZ_OK ) {
       croak 'write error';
    }
		
	my $st = stat($folder);
	my $stComp = stat($targetFile);
		
	return ($targetFile, $st->size, $stComp->size);		
		
}


my $Location = getDropBoxPath( $ENV{LOCALAPPDATA} . '\Dropbox\info.json');
croak "Location for DropBox can't be found " if not defined $Location;


for my $dir (@importantFolders)
{
	my ($target , $sizeBefore, $sizeAfter) = backupFolder $dir , $Location;
	say "$dir backed as $target";
	say "Size before : $sizeBefore";
	say "Size after : $sizeAfter";
}






