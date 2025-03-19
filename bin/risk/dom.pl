#!/usr/bin/perl

$runs = $ARGV[0];
my @results = ();
my $total = 0;


for($q=0;$q<$runs;$q++){
my @deck = (1,1,1,1,1,1,1,0,0,0);
my @hand = ();
my $tmp = "";

for ($i = 0; $i < 10; $i++) {

	my $j = int(rand($i+1));
	$tmp = $deck[$i] ;
	$deck[$i] = $deck[$j];
	$deck[$j] = $tmp;
#	print "@deck \n";
}

for ($i = 0; $i < 5; $i++){
$hand[$i] = $deck[$i];
}

my $count = 0;

for ($i = 0; $i < 5; $i++){
$count += $hand[$i];
}
$total++;

++$results[$count] ;
print "@deck \t @hand \n" 

}

print "@results \t $total \n\n";

for ($i = 2; $i <= 5; $i++){
$results[$i] /= $total;
}

print "@results";
