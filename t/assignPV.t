use strict;
use warnings;
use Math::Decimal64 qw(:all);

my $t = 64;

print "1..$t\n";

my $rop = Math::Decimal64->new();

assignPV($rop, 'inf');

if(is_InfD64($rop) == 1) {print "ok 1\n"}
else {
  warn "Inf: $rop\n";
  print "not ok 1\n";
}

assignPV($rop, '-inf');

if(is_InfD64($rop) == -1) {print "ok 2\n"}
else {
  warn "-Inf: $rop\n";
  print "not ok 2\n";
}

assignPV($rop, '+inf');

if(is_InfD64($rop) == 1) {print "ok 3\n"}
else {
  warn "+Inf: $rop\n";
  print "not ok 3\n";
}

# Space for 2 tests here.
print "ok 4\nok 5\n";

assignPV($rop, 'nan');

if(is_NaND64($rop)) {print "ok 6\n"}
else {
  warn "NaN: $rop\n";
  print "not ok 6\n";
}

assignPV($rop, '+nan');

if(is_NaND64($rop)) {print "ok 7\n"}
else {
  warn "+NaN: $rop\n";
  print "not ok 7\n";
}

assignPV($rop, '-nan');

if(is_NaND64($rop)) {print "ok 8\n"}
else {
  warn "-NaN: $rop\n";
  print "not ok 8\n";
}

if($rop != NaND64()) {print "ok 9\n"}
else {
  warn "$rop == ", NaND64(), "\n";
  print "not ok 9\n";
}

my $ok = 1;

for my $exp(0..10, 20, 30, 350 .. 430) {
  for my $digits(1..16) {
    my $man = '-' . random_select($digits);
    my $d64 = MEtoD64($man, -$exp);
    assignPV($rop, $man . 'e' . -$exp);
    #my $check = PVtoD64($man . 'e' . -$exp);
    if($rop != $d64) {
      $ok = 0;
      warn "\n  (man, exp): ($man, $exp)\n";
      warn "  MEtoD64: $d64\n  PVtoD64: $rop\n";
    }
  }
}

$ok ? print "ok 10\n" : print "not ok 10\n";

$ok = 1;

for my $exp(0..10, 20, 30, 350 .. 430) {
  for my $digits(1..16) {
    my $man = random_select($digits);
    my $d64 = MEtoD64($man, $exp);
    assignPV($rop, $man . 'E' . $exp);
    #my $check = PVtoD64($man . 'E' . $exp);
    if($rop != $d64) {
      $ok = 0;
      warn "\n  (man, exp): ($man, $exp)\n";
      warn "  MEtoD64: $d64\n  PVtoD64: $rop\n";
    }
  }
}

$ok ? print "ok 11\n" : print "not ok 11\n";

$ok = 1;

for my $exp(0..10, 20, 30, 350 .. 430) {
  for my $digits(1..16) {
    my $man = '-' . random_select($digits);
    my $d64 = MEtoD64($man, $exp);
    assignPV($rop, $man . 'E' . $exp);
    #my $check = PVtoD64($man . 'E' . $exp);
    if($rop != $d64) {
      $ok = 0;
      warn "\n  (man, exp): ($man, $exp)\n";
      warn "  MEtoD64: $d64\n  PVtoD64: $rop\n";
    }
  }
}

$ok ? print "ok 12\n" : print "not ok 12\n";

$ok = 1;

for my $exp(0..10, 20, 30, 350 .. 430) {
  for my $digits(1..16) {
    my $man = random_select($digits);
    my $d64 = MEtoD64($man, -$exp);
    assignPV($rop, $man . 'e' . -$exp);
    #my $check = PVtoD64($man . 'e' . -$exp);
    if($rop != $d64) {
      $ok = 0;
      warn "\n  (man, exp): ($man, $exp)\n";
      warn "  MEtoD64: $d64\n  PVtoD64: $rop\n";
    }
  }
}

$ok ? print "ok 13\n" : print "not ok 13\n";

$ok = 1;

for my $exp(0..10, 20, 30, 350 .. 430) {
  for my $digits(1..16) {
    my $man = '-' . random_select($digits);
    my $d64 = MEtoD64($man, -$exp);
    my $mod = me2pv($man, -$exp);
    assignPV($rop, $mod);
    #my $check = PVtoD64($mod);
    if($rop != $d64) {
      $ok = 0;
      warn "\n  (man, exp): ($man, $exp)\n";
      warn "  \$mod: $mod\n";
      warn "  MEtoD64: $d64\n  PVtoD64: $rop\n";
    }
  }
}

$ok ? print "ok 14\n" : print "not ok 14\n";

$ok = 1;

for my $exp(0..10, 20, 30, 350 .. 430) {
  for my $digits(1..16) {
    my $man = random_select($digits);
    my $d64 = MEtoD64($man, $exp);
    my $mod = me2pv($man, $exp);
    assignPV($rop, $mod);
    #my $check = PVtoD64($mod);
    if($rop != $d64) {
      $ok = 0;
      warn "\n  (man, exp): ($man, $exp)\n";
      warn "\$mod: $mod\n";
      warn "  MEtoD64: $d64\n  PVtoD64: $rop\n";
    }
  }
}

$ok ? print "ok 15\n" : print "not ok 15\n";

$ok = 1;

for my $exp(0..10, 20, 30, 350 .. 430) {
  for my $digits(1..16) {
    my $man = '-' . random_select($digits);
    my $d64 = MEtoD64($man, $exp);
    my $mod = me2pv($man, $exp);
    assignPV($rop, $mod);
    #my $check = PVtoD64($mod);
    if($rop != $d64) {
      $ok = 0;
      warn "\n  (man, exp): ($man, $exp)\n";
      warn "\$mod: $mod\n";
      warn "  MEtoD64: $d64\n  PVtoD64: $rop\n";
    }
  }
}

$ok ? print "ok 16\n" : print "not ok 16\n";

$ok = 1;

for my $exp(0..10, 20, 30, 350 .. 430) {
  for my $digits(1..16) {
    my $man = random_select($digits);
    my $d64 = MEtoD64($man, -$exp);
    my $mod = me2pv($man, -$exp);
    assignPV($rop, $mod);
    #my $check = PVtoD64($mod);
    if($rop != $d64) {
      $ok = 0;
      warn "\n  (man, exp): ($man, $exp)\n";
      warn "  MEtoD64: $d64\n  PVtoD64: $rop\n";
    }
  }
}

$ok ? print "ok 17\n" : print "not ok 17\n";

my $d64 = Math::Decimal64->new();

# Testing some specific inputs - many of which failed at
# various times as I was sorting out _atodecimal()

assignPV($d64, '-0');
my $test = is_ZeroD64($d64);

if($test == -1) {print "ok 18\n"}
else {
  warn "\nExpected -1\nGot $test\n";
  print "not ok 18\n";
}

assignPV($d64, '0.0');
$test = is_ZeroD64($d64);

if($test == 1) {print "ok 19\n"}
else {
  warn "\nExpected 1\nGot $test\n";
  print "not ok 19\n";
}

assignPV($d64, '+inf');
$test = is_InfD64($d64);

if($test == 1) {print "ok 20\n"}
else {
  warn "\nExpected 1\nGot $test\n";
  print "not ok 20\n";
}

assignPV($d64, 'inf');
$test = is_InfD64($d64);

if($test == 1) {print "ok 21\n"}
else {
  warn "\nExpected 1\nGot $test\n";
  print "not ok 21\n";
}

assignPV($d64, '-inf');
$test = is_InfD64($d64);

if($test == -1) {print "ok 22\n"}
else {
  warn "\nExpected -1\nGot $test\n";
  print "not ok 22\n";
}

assignPV($d64, 'nan');
$test = is_NaND64($d64);

if($test == 1) {print "ok 23\n"}
else {
  warn "\nExpected 1\nGot $test\n";
  print "not ok 23\n";
}

assignPV($d64, '-nan');
$test = is_NaND64($d64);

if($test == 1) {print "ok 24\n"}
else {
  warn "\nExpected 1\nGot $test\n";
  print "not ok 24\n";
}

assignPV($d64, '+nan');
$test = is_NaND64($d64);

if($test == 1) {print "ok 25\n"}
else {
  warn "\nExpected 1\nGot $test\n";
  print "not ok 25\n";
}

assignPV($d64, '47');

if("$d64" eq '47e0') {print "ok 26\n"}
else {
  warn "\nExpected 47e0\nGot $d64\n";
  print "not ok 26\n";
}

assignPV($d64, '-47');

if("$d64" eq '-47e0') {print "ok 27\n"}
else {
  warn "\nExpected 47e0\nGot $d64\n";
  print "not ok 27\n";
}

assignPV($d64, '+047.0');

if("$d64" eq '47e0') {print "ok 28\n"}
else {
  warn "\nExpected 47e0\nGot $d64\n";
  print "not ok 28\n";
}

assignPV($d64, '-47e0');

if("$d64" eq '-47e0') {print "ok 29\n"}
else {
  warn "\nExpected 47e0\nGot $d64\n";
  print "not ok 29\n";
}

assignPV($d64, '47e-2');

if("$d64" eq '47e-2') {print "ok 30\n"}
else {
  warn "\nExpected 47e-2\nGot $d64\n";
  print "not ok 30\n";
}

assignPV($d64, '-47e-2');

if("$d64" eq '-47e-2') {print "ok 31\n"}
else {
  warn "\nExpected -47e-2\nGot $d64\n";
  print "not ok 31\n";
}

assignPV($d64, '47e+2');

if("$d64" eq '47e2') {print "ok 32\n"}
else {
  warn "\nExpected 47e2\nGot $d64\n";
  print "not ok 32\n";
}

assignPV($d64, '-47e+2');

if("$d64" eq '-47e2') {print "ok 33\n"}
else {
  warn "\nExpected -47e2\nGot $d64\n";
  print "not ok 33\n";
}

assignPV($d64, '47.116e+2');

if("$d64" eq '47116e-1') {print "ok 34\n"}
else {
  warn "\nExpected 47116e-1\nGot $d64\n";
  print "not ok 34\n";
}

assignPV($d64, '-47.1165e+2');

if("$d64" eq '-471165e-2') {print "ok 35\n"}
else {
  warn "\nExpected -471165e-2\nGot $d64\n";
  print "not ok 35\n";
}

assignPV($d64, '47.116');

if("$d64" eq '47116e-3') {print "ok 36\n"}
else {
  warn "\nExpected 47116e-3\nGot $d64\n";
  print "not ok 36\n";
}

assignPV($d64, '-47.1165');

if("$d64" eq '-471165e-4') {print "ok 37\n"}
else {
  warn "\nExpected -471165e-4\nGot $d64\n";
  print "not ok 37\n";
}

assignPV($d64, '47116.0e+2');

if("$d64" eq '47116e2') {print "ok 38\n"}
else {
  warn "\nExpected 47116e2\nGot $d64\n";
  print "not ok 38\n";
}

assignPV($d64, '-471165.0e+2');

if("$d64" eq '-471165e2') {print "ok 39\n"}
else {
  warn "\nExpected -471165e2\nGot $d64\n";
  print "not ok 39\n";
}

assignPV($d64, '-46e-180');

if("$d64" eq '-46e-180') {print "ok 40\n"}
else {
  warn "\nExpected -46e-180\nGot $d64\n";
  print "not ok 40\n";
}

assignPV($d64, '46e180');

if("$d64" eq '46e180') {print "ok 41\n"}
else {
  warn "\nExpected 46e180\nGot $d64\n";
  print "not ok 41\n";
}

assignPV($d64, '-46.98317e-180');

if("$d64" eq '-4698317e-185') {print "ok 42\n"}
else {
  warn "\nExpected -4698317e-185\nGot $d64\n";
  print "not ok 42\n";
}

assignPV($d64, '-46.98317e180');

if("$d64" eq '-4698317e175') {print "ok 43\n"}
else {
  warn "\nExpected -4698317e175\nGot $d64\n";
  print "not ok 43\n";
}

assignPV($d64, '-46.98317e180z1');

if("$d64" eq '-4698317e175') {print "ok 44\n"}
else {
  warn "\nExpected -4698317e175\nGot $d64\n";
  print "not ok 44\n";
}

assignPV($d64, '-51e383');

if("$d64" eq '-51e383') {print "ok 45\n"}
else {
  warn "\nExpected -51e383\nGot $d64\n";
  print "not ok 45\n";
}

assignPV($d64, '-0e410');

if("$d64" eq '-0') {print "ok 46\n"}
else {
  warn "\nExpected -0\nGot $d64\n";
  print "not ok 46\n";
}

assignPV($d64, '-2372646073611e353');
if("$d64" eq '-2372646073611e353') {print "ok 47\n"}
else {
  warn "\nExpected -2372646073611e353\nGot $d64\n";
  print "not ok 47\n";
}

assignPV($d64, '623537214927823e-409');

if("$d64" eq '6235e-398') {print "ok 48\n"}
else {
  warn "\nExpected 6235e-398\nGot $d64\n";
  print "not ok 48\n";
}

assignPV($d64, '-623537214927823e-409');

if("$d64" eq '-6235e-398') {print "ok 49\n"}
else {
  warn "\nExpected -6235e-398\nGot $d64\n";
  print "not ok 49\n";
}

assignPV($d64, '623557214927823e-409');

if("$d64" eq '6236e-398') {print "ok 50\n"}
else {
  warn "\nExpected 6236e-398\nGot $d64\n";
  print "not ok 50\n";
}

assignPV($d64, '-623557214927823e-409');

if("$d64" eq '-6236e-398') {print "ok 51\n"}
else {
  warn "\nExpected -6236e-398\nGot $d64\n";
  print "not ok 51\n";
}

assignPV($d64, '62355e-399');

if("$d64" eq '6236e-398') {print "ok 52\n"}
else {
  warn "\nExpected 6236e-398\nGot $d64\n";
  print "not ok 52\n";
}

assignPV($d64, '-62355e-399');

if("$d64" eq '-6236e-398') {print "ok 53\n"}
else {
  warn "\nExpected -6236e-398\nGot $d64\n";
  print "not ok 53\n";
}

assignPV($d64, '62345e-399');

if("$d64" eq '6234e-398') {print "ok 54\n"}
else {
  warn "\nExpected 6234e-398\nGot $d64\n";
  print "not ok 54\n";
}

assignPV($d64, '-62345e-399');

if("$d64" eq '-6234e-398') {print "ok 55\n"}
else {
  warn "\nExpected -6234e-398\nGot $d64\n";
  print "not ok 55\n";
}

assignPV($d64, '5371185275501e-397');

if("$d64" eq '5371185275501e-397') {print "ok 56\n"}
else {
  warn "\nExpected 5371185275501e-397\nGot $d64\n";
  print "not ok 56\n";
}

assignPV($d64 , '-3.090145872714666e15');

if("$d64" eq '-3090145872714666e0') {print "ok 57\n"}
else {
  warn "\nExpected -3090145872714666e0\nGot $d64\n";
  print "not ok 57\n";
}

assignPV($d64, '0.0062e385');

if("$d64" eq '62e381') {print "ok 58\n"}
else {
  warn "\nExpected 62e381\nGot $d64\n";
  print "not ok 58\n";
}

assignPV($d64, '.0062e385');

if("$d64" eq '62e381') {print "ok 59\n"}
else {
  warn "\nExpected 62e381\nGot $d64\n";
  print "not ok 59\n";
}

assignPV($d64, '-0.6e385');

if("$d64" eq '-6e384') {print "ok 60\n"}
else {
  warn "\nExpected -6e384\nGot $d64\n";
  print "not ok 60\n";
}

assignPV($d64, '');

if("$d64" eq '0') {print "ok 61\n"}
else {
  warn "\nExpected 0\nGot $d64\n";
  print "not ok 61\n";
}

assignPV($d64, '+');

if("$d64" eq '0') {print "ok 62\n"}
else {
  warn "\nExpected 0\nGot $d64\n";
  print "not ok 62\n";
}

assignPV($d64, '-');

if("$d64" eq '-0') {print "ok 63\n"}
else {
  warn "\nExpected -0\nGot $d64\n";
  print "not ok 63\n";
}

assignPV($d64, ' ');

if("$d64" eq '0') {print "ok 64\n"}
else {
  warn "\nExpected 0\nGot $d64\n";
  print "not ok 64\n";
}


sub random_select {
  my $ret = '';
  for(1 .. $_[0]) {
    $ret .= int(rand(10));
  }
  return "$ret";
}

sub me2pv {
  my($man, $exp) = (shift, shift);
  my $sign = '';
  if($man =~ /[^0-9]/) {
    $sign = substr($man, 0, 1);
    $man = substr($man, 1);
  }
  my $len = length($man);
  my $pos = int(rand($len + 1));
  my $insert;
  if($pos == $len) {$insert = '.0'}
  elsif($pos == 0 && $len % 2) {$insert = '0.'}
  else {$insert = '.'}
  substr($man, $pos, 0, $insert);
  $exp += $len - $pos;
  my $ret = $sign . $man . 'e' . $exp;
  #print "$ret\n";
  return $ret;
}
