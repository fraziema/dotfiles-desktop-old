#!/usr/bin/perl

#use Warnings;
#use Strict;
use Getopt::Long;
use Term::ANSIColor;

GetOptions(
	"damage=s"	=> \$damage_string,
	"add"				=> \$is_add,
	"average"		=> \$is_average,
	"help"			=> \$is_help
);


#-------------------------------------------------------------------------
# Setting global variables & etc.
my $total = 0;
my $average_total = 0;
my @individual_damages = split(/,/,$damage_string);


#-------------------------------------------------------------------------
# &get_help is responsible for checking input as well as for trying to help
# someone who specifies --help.
#

&get_help;


#-------------------------------------------------------------------------
# Now we need to actually roll the dice. &roll_dice is responsible for parsing
# @individual_damages as well as for actually generating the dice rolls. It is
# also responsible for calling &output_roll.
#

($total,$average_total) = &roll_dice(@individual_damages);

#-------------------------------------------------------------------------
# If I've been asked to add up the total, this is where I report it.
#

if ($is_add) {
	&output_roll(2,$average_total,$total);
}



#-------------------------------------------------------------------------
#
#-------------------------------------------------------------------------
#
#-------------------------------------------------------------------------
# Subroutines start here.
#

sub roll_dice {
	my @individual_damages = @_;
	my $damage = 0;
	my $average = 0;

	foreach (@individual_damages) {
		&output_roll(0,$_);
		$damage = 0;
		$average = 0;
		my @rolls = split(/\+/);

		foreach (@rolls) {
			if (/^\d+d\d+$/) {
				my @dice = split(/d/);
				$average += @dice[0]*(@dice[1]+1)/2;
				for ($i=1; $i<=@dice[0]; $i++) {
					$damage += int(rand(@dice[1]))+1;
				}
			} elsif (/^-?\d+$/) {
				$average += $_;
				$damage += $_;
			} else {
				print"wtf?! i can't roll $_!\n";
				exit;
			}
		}

		# &output_roll(1, , ) is prints the results of a given roll.
		&output_roll(1,$average,$damage);

		$average_total += $average;
		$total += ($is_average) ? $average : $damage;
	}
	return ($total,$average_total);
}

sub output_roll {
	if ($_[0] == 0) {
		# I'm announcing that I'm rolling ...
		print"Rolling $_[1]\n";
	} 
	elsif ($_[0] == 1) {
		# I'm reporting the result of a single roll combo.
		my $average = $_[1];
		my $damage = $_[2];
		print" The average roll is $average.\n";
		unless ($is_average){ 
			print" The rolled result is ";
			print color 'bold red';
			print"$damage";
			print color 'reset';
			print".\n";
		}
		print"\n";
	} 
	elsif ($_[0] == 2) {
		# I'm reporting the total.
		my $average_total = $_[1];
		my $total = $_[2];
		print"The average total is $average_total.\n";
		print"The total is ";
		print color 'bold red';
		print"$total";
		print color 'reset';
		print"\n" ;
	} 
	else {
		# It should not be possible to get here.
		die "wtf?! how did i get here? you called &output_roll with an invalid argument!: $!\n";
	}

}

sub get_help {
	# Okay, what am I looking for? I need to check the $damage_string and whether
	# someone set $is_help, and that's all.
	if (
		$is_help or 
		not ($damage_string =~ /^\d+[d,]-?\d+([d,\+]-?\d+)*([d,\+]-?\d+)*$/)
	) {
		print"Welcome to damagev2! Basic usage looks like:\n";
		print"\tdamagev2 --damage 1d8+8,1d6,1d6 --add\n";
		print"
The --damage flag takes a string of comma-separated damage rolls. Each roll may
be any combination of dice rolls and modifiers, separated by + signs. If you
wish to subtract a dice roll or a modifier you may, and the syntax is\n";
		print"\tdamagev2 --damage 1d8+-8";
		print"
That is, you must add a negative number.\n";
		print"
The -add flag is optional, and tells damagev2 to add the result of all dice
rolls. \n";
		print"
Another optional flag is --average. If this flag is present, damagev2 will
report only the average value of the dice rolls. You may specify both --average
and --add at the same time.\n";
		exit;
	}
}
