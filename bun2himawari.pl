=pod
    Copyright (C) 2005-2020 Masaya YAMAGUCHI

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
=cut

use strict;
use utf8;

binmode STDIN, ':encoding(Shift_JIS)';
binmode STDOUT, ':raw:encoding(UTF-16LE)';
binmode STDERR, ':utf8';

#
# NAME: bun2himawari.pl 
#           「分類語彙表増補改訂版」データベースを
#           『ひまわり』検索用の XML 文書に変換
#
# SYNOPSYS:
#   % perl bun2himawari.pl < INPUT_FILE > OUTPUT_FILE
#
# Written by Masaya YAMAGUCHI, 2005-02-25


my $F_BNO = 7;
my $BR = "\n"; 

my $prev_line = ""; 

my $cno1 = "";
my $cno2 = "";
my $cno3 = "";

my %s = ();

print pack("U", 0xFEFF); # byte order mark
print "<?xml version=\"1.0\" encoding=\"UTF-16\"?>$BR";
print "<bunrui name=\"分類語彙表増補改訂版データベース\" version=\"1.0.1\">$BR";

while(<>){
  chomp;
  my @w = split(",");
  next if($w[2] eq "B"); # 二つの語句を連結している項目
  
  my $bno = $w[$F_BNO];
  my $bno1 = substr($bno, 0, 1);
  my $bno2 = substr($bno, 0, 2);
  my $bno3 = substr($bno, 0, 4);
  my $bno4 = substr($bno, 0, 6);

  my $bname1 = "$w[3]";
  my $bname2 = "$w[3]\t$w[4]";
  my $bname3 = "$w[3]\t$w[4]\t$w[5]";
  my $bname4 = "$w[3]\t$w[4]\t$w[5]\t$w[6]";


  if($s{$bno1} ne $bname1){
    $s{$bno1} = $bname1;
  }

  if($s{$bno2} ne $bname2){
    $s{$bno2} = $bname2;
  }

  if($s{$bno3} ne $bname3){
    $s{$bno3} = $bname3;
  }

  if($s{$bno4} ne $bname4){

    my $tmp = $bname4;
    $tmp =~ s/\t/\//g;
    if($prev_line ne ""){
      print "    </l>$BR";
      print "  </s>$BR";
      print "</c>$BR"
    }
    print "<c 分類番号=\"$bno4\" 概念パス=\"/$tmp\">$BR";
    $s{$bno4} = $bname4;
    $cno1 = "";
    $cno2 = "";
    $prev_line = "";
  }


  if($cno1 ne $w[8]){
    if($prev_line ne ""){
      print "    </l>$BR";
      print "  </s>$BR";
    }
    print "  <s 段落番号=\"$w[8]\">$BR";
    $cno1 = $w[8];
    $cno2 = "";
    $prev_line = "";
  }


  if($cno2 ne $w[9]){
    if($prev_line ne ""){
      print "    </l>$BR";
    }
    print "    <l 小段落番号=\"$w[9]\">$BR";
    $cno2 = $w[9];
  }
  print "<e 読み=\"$w[13]\" 分類番号=\"$bno4\">$w[12]</e> ";
  $prev_line = "dummy";

}

print "</l>$BR";
print "</s>$BR";
print "</c>$BR";
print "</bunrui>$BR";
