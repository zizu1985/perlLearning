# Backup to DropBox essential folders. Compress them with zip.
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
use File::Find qw(find);
use Cwd;
use Readonly;

# Readonly 
Readonly::Scalar my $prc => 100; 

# read all folders to be compressed
# return reference to array
sub readfiles
{
	my ($filename) = @_;
	my @files;
	open my $fh,'<',$filename;
	while ( <$fh> ) 
	{
		next if ( /^$/xms );
		chomp;
		unshift @files, "$_";
	}
	close $fh;
	return \@files;
}


# Input parameter is JSON DropBox configuration file
# get OS path to DropBox folder
sub getDropBoxPath
{
	my ($jsonFile) = @_;
	
	croak "DropBox json file $jsonFile doesn't exist \n." if (! -e -f -r $jsonFile);
	
	open (my $fh,'<', $jsonFile);
	my $json_text = <$fh>;
	close $fh;
	my $data = decode_json( $json_text ); 

	my $path = $data->{personal}->{path};

	return defined $path ? $path : undef;
}

# Backup input folder and backup as compressed zip with maximum compression
sub backupFolder 
{
	
	my ($folder,$target_dir) = @_;
	croak "DropBox folder $folder doesn't exist !!! \n." if (! -e $folder);
	croak "DropBox folder $folder is not directory !!! \n." if (! -d $folder);
	croak "DropBox folder $folder is not readable !!! \n." if (! -r $folder);
		
	my $name = fileparse($folder);
	my $targetFile = $target_dir."\\$name.zip";
	
	# Remove target zip file if exists
	if (-e $targetFile) {
		say "Target zip file exists $targetFile";
		if (! unlink $targetFile) {
			say "Can't remove zip file $targetFile";
		} 
		else {
			say "Zip file $targetFile removed";
		}
	}
	
	my $zip = Archive::Zip->new();
	my $dir_member = $zip->addTree($folder);
	
	foreach my $member (map { $zip->memberNamed ($_) } $zip->memberNames)
	{
		$member->desiredCompressionLevel( Archive::Zip::COMPRESSION_LEVEL_BEST_COMPRESSION );
	}
	
	croak 'write error' if (! $zip->writeToFileNamed($targetFile) == AZ_OK );
       
    
	
	my $srcSize;
	find(sub { $srcSize += -s if -f }, $folder);
	my $stComp = stat($targetFile);
		
	return ($targetFile, $srcSize, $stComp->size);
		
}


my $Location = getDropBoxPath( $ENV{LOCALAPPDATA} . '\Dropbox\info.json');
croak "Location for DropBox can't be found " if (! -e $Location);

my $cwd = cwd();
my $importantFolders = readfiles("$cwd/chapter_9/filesToBackup.txt");

for my $dir (@ { $importantFolders })
{
	my ($target , $sizeBefore, $sizeAfter) = backupFolder $dir , $Location;
	say "$dir backed as $target";
	say "Size before : $sizeBefore";
	say "Size after : $sizeAfter";
	my $compressionRatio = ( 1 - ($sizeAfter / $sizeBefore) ) * $prc;
	say "Compression Ratio : $compressionRatio"; 
}


1;

