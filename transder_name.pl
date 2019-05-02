use strict;
use warnings;

$ | =1;

sub main {

	my $input = './Apple/name.txt'; # /Apple can be any other folder that you are working with

	open (INPUT, $input) or die "CAN'T READ!\n";

	my $output = 'train.txt';

	open (OUTPUT, '>', $output) or die "CAN'T WRITE!\n";

	while (my $line = <INPUT>){
		if ($line =~/.jpg/){
			print OUTPUT "data/obj/$line";
		}
	}

	close(INPUT);
	close(OUTPUT);
}

main();
