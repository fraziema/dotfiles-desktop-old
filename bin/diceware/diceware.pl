#!/usr/bin/perl

open(F, "diceware.list") || die();
while ( ($i, $j) = split(/\t/,<F>)) {
	chomp($i);
	chomp($j);
	$h{$i} = $j;
}
close(F);

print "\n\n\n";

print "\t\t$k\t=\t$h{$k}\n" while( chomp($k=<STDIN>) ); 


