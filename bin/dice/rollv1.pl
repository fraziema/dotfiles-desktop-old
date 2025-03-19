#!/usr/bin/perl

#use Warnings;
#use Strict;
use Getopt::Long;
use Term::ANSIColor;

GetOptions(
	"roll=s"	=> \$roll_string,
	"damage=s"	=> \$roll_string,
	"add"				=> \$is_add,
	"average"		=> \$is_average,
	"help"			=> \$is_help
);

my @results;


#-------------------------------------------------------------------------
# Step zero: check to make sure the string makes sense.
#
#&get_help


#-------------------------------------------------------------------------
# Step one: kill off the commas
#

my @rolls = split(/,/,$roll_string);

#-------------------------------------------------------------------------
# Step two: call the dice roller. I need to check for iterations first.
#

foreach $roll (@rolls) {

	if ($roll =~ /\d+\*\(.*\)/) {
		my ($iterations, $temp) = split(/\*/,$roll);

		# $temp has parentheses in it ... i need to kill them off
		if ($temp =~ /\((.*)\)(.*)/) {
			$thing_iterated = $1;
			die "Syntax: there should be nothing the closing parenthesis" if ($2);
		} else {
			# I shouldn't end up here ...
			die "wtf, how did i end up here? $!";
		}

		for (my $i=1;$i<=$iterations;$i++){
			push(@results,($thing_iterated,&dice_roller($thing_iterated)));
		}
	} 
	
	else {
		push(@results,($roll,&dice_roller($roll)));
	}

}


#-------------------------------------------------------------------------
# Step 3: output the results.
#

&output(@results);



#-------------------------------------------------------------------------
#-------------------------------------------------------------------------
# Subroutines
#

sub get_help {
}

sub dice_roller {
	my $roll = $_[0];
	my $total = 0;
	my $average = 0;

	my @rolls = split(/\+/, $roll);
	foreach (@rolls) {
		if (/^\d+d\d+$/) {
			my @dice = split(/d/);
			$average += @dice[0]*(@dice[1]+1)/2;
			for (my $i=1; $i<=@dice[0]; $i++) {
				$total += int(rand(@dice[1]))+1;
			}
		} elsif (/^-?\d+$/) {
			$average += $_;
			$total += $_;
		} else {
			print"wtf?! i can't roll $_!\n";
			exit;
		}
	}
	($average,$total);
}


sub output {
	my @results = @_;
	my $i = 0;
	my $total = 0;
	my $average_total = 0;
	foreach (@results) {
		if($i%3 == 0) {
			# This should be a string representing a roll
			print"Rolled $_\n";
		} elsif ($i%3 == 1) {
			# This should be a number representing the average
			$average_total += $_;
			print"  Average: $_\n";
		} elsif ($i%3 == 2) {
			# This should be a number representing the result of rolling dice.
			$total += $_;
			print"  Your Roll: ";
			print color 'bold red';
			print"$_";
			print color 'reset';
			print"\n\n";
		} else {
			die "I shouldn't have gotten here!";
		}
		$i++;
	}
	if ($is_add) {
		print "The average total is $average_total.\n";
		print "The total is ";
		print color 'bold blue';
		print "$total";
		print color 'reset';
		print ".\n\n";
	} 
}
