use strict;
use warnings;
use Math::Decimal64 qw(:all);

print "1..4\n";

my @n = qw(1001.95 1.85 1.84 1.86 1.851 1.850001 99.95 0.95 1234567);
my @s = qw(1002.0  1.8  1.8  1.9  1.9   1.9      100.0 1.0  1234567.0 inf -inf nan);

push @n, InfD64(1), InfD64(-1), NaND64();

my $ok = 1;

for(my $i = 0; $i < @n; $i++) {
  my $d64 = Math::Decimal64->new($n[$i]);
  my $neg_d64 = $d64 * - 1;
  my $str = D64toRSTR($d64, 1);
  my $nstr = D64toRSTR($neg_d64, 1);
  next if $nstr =~ /n/;
  if($str ne $s[$i]) {
    warn "\n$i: Expected $s[$i]\nGot $str\n";
    $ok = 0;
  }
  if($nstr ne '-' . $s[$i]) {
    warn "\n$i: Expected -$s[$i]\nGot $nstr\n";
    $ok = 0;
  }
}

if($ok) {print "ok 1\n"}
else    {print "not ok 1\n"}

$ok = 1;

@s = qw(1002    2    2    2    2     2        100   1    1234567   inf -inf nan);

for(my $i = 0; $i < @n; $i++) {
  my $d64 = Math::Decimal64->new($n[$i]);
  my $neg_d64 = $d64 * - 1;
  my $str = D64toRSTR($d64, 0);
  my $nstr = D64toRSTR($neg_d64, 0);
  next if $nstr =~ /n/;
  if($str ne $s[$i]) {
    warn "\n$i: Expected $s[$i]\nGot $str\n";
    $ok = 0;
  }
  if($nstr ne '-' . $s[$i]) {
    warn "\n$i: Expected -$s[$i]\nGot $nstr\n";
    $ok = 0;
  }
}

if($ok) {print "ok 2\n"}
else    {print "not ok 2\n"}

@n = qw(2.999 0.0005 0.00007 0.00050001 0.0095 323.4   323.411 323.5001 323.9995 32.99940 inf -inf nan);
@s = qw(2.999 0.000  0.000   0.001      0.010  323.400 323.411 323.500    324.000  32.999 inf -inf nan);

$ok = 1;

for(my $i = 0; $i < @n; $i++) {
  my $d64 = Math::Decimal64->new($n[$i]);
  my $neg_d64 = $d64 * - 1;
  my $str = D64toRSTR($d64, 3);
  my $nstr = D64toRSTR($neg_d64, 3);
  next if $nstr =~ /n/;
  if($str ne $s[$i]) {
    warn "\n$i: Expected $s[$i]\nGot $str\n";
    $ok = 0;
  }
  if($nstr ne '-' . $s[$i]) {
    warn "\n$i: Expected -$s[$i]\nGot $nstr\n";
    $ok = 0;
  }
}

if($ok) {print "ok 3\n"}
else    {print "not ok 3\n"}

$ok = 1;

eval{D64toRSTR(Math::Decimal64->new(234), -1);};

if($@ =~ /2nd arg to D64toRSTR\(\)/) {print "ok 4\n"}
else {
  warn "\n\$\@: $@\n";
  print "not ok 4\n";
}

sub random_select {
  my $ret = '';
  for(1 .. $_[0]) {
    $ret .= int(rand(10));
  }
  return "$ret";
}

##############################
##############################
##############################

