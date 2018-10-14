#!/usr/bin/perl

$start = time();

for (my $i = 0; $i < 2**32 ;$i++) {
    if ($i % 1000000 == 0) {
        print $i;
        print "\n";
    }
}

$end = time();

print $end - $start;
