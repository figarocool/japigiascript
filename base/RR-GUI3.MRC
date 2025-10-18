;===========================================Venom[v.3]============================================
alias rrgui.button {
  if ($2 == 1) { drawrect -nr $1 $rrgui.color(1) 1 $3 $4 $5 $6 }
  if ($2 == 2) || ($2 == 4) {
    drawrect -nr $1 $rrgui.color(3) 1 $3 $4 $5 $6
    drawline -nr $1 $rrgui.color(2) 1 $3 $4 $calc( $3 + $5 +1 ) $4
    drawline -nr $1 $rrgui.color(2) 1 $3 $4 $3 $calc( $4 + $6 )
  }
  if ($2 == 3) {
    drawrect -nr $1 $rrgui.color(2) 1 $3 $4 $5 $6
    drawline -nr $1 $rrgui.color(3) 1 $3 $4 $calc( $3 + $5 ) $4
    drawline -nr $1 $rrgui.color(3) 1 $3 $4 $3 $calc( $4 + $6 +1 )
  }
  if ($7 != $null) { 
    if ($7 isnum) { rrgui.txt $1 $3-  }
    else { rrgui.txt $1 $3-6 16 $7-  }
  }
}
alias rrgui.realbutton {
  if ($2 == 1) || ($2 == 2) {
    drawrect -nr $1 $rrgui.color(1) 1 $calc($3 +1) $calc($4 +1) $calc( $5 -3) $calc( $6 -3)
    drawrect -nr $1 $rrgui.color(1) 1 $calc( $3 +1) $calc( $4 +1) $calc( $5 -1) $calc( $6 -1)
    drawrect -nr $1 $rrgui.color(4) 1 $3 $4 $5 $6
    drawrect -nr $1 $rrgui.color(3) 1 $3 $4 $calc( $5 -1) $calc( $6 -1)
    drawline -nr $1 $rrgui.color(2) 1 $3 $4 $calc( $3 + $5 ) $4
    drawline -nr $1 $rrgui.color(2) 1 $3 $4 $3 $calc( $4 + $6 )
  }
  if ($2 == 3) {
    drawrect -nr $1 $rrgui.color(1) 1 $calc($3 +1) $calc($4 +1) $calc( $5 -3) $calc( $6 -3)
    drawrect -nr $1 $rrgui.color(4) 1 $3 $4 $5 $6
    drawrect -nr $1 $rrgui.color(3) 1 $calc($3 +1) $calc($4 +1) $calc($5 -2) $calc($6 -2)
  }
  if ($2 == 4) {
    drawrect -nr $1 $rrgui.color(4) 1 $3 $4 $5 $6
    drawrect -nr $1 $rrgui.color(4) 1 $calc($3 +1) $calc($4 +1) $calc($5 -2) $calc($6 -2)
    drawrect -nr $1 $rrgui.color(3) 1 $calc($3 +1) $calc($4 +1) $calc( $5 -3) $calc( $6 -3)
    drawline -nr $1 $rrgui.color(2) 1 $calc($3 +1) $calc($4 +1) $calc( $3 + $5 -1) $calc($4 +1)
    drawline -nr $1 $rrgui.color(2) 1 $calc($3 +1) $calc($4 +1) $calc($3 +1) $calc( $4 + $6 -1)
  }
  if ($7 != $null) { 
    if ($7 isnum) { rrgui.txt $1 $3-  }
    else { rrgui.txt $1 $3-6 16 $7-  }
  }
}
alias rrgui.toolbutton {
  if ($2 == 1) || ($2 == 2) || ($2 == 4) {
    drawrect -nr $1 $rrgui.color(1) 1 $calc($3 +1) $calc($4 +1) $calc( $5 -3) $calc( $6 -3)
    drawrect -nr $1 $rrgui.color(1) 1 $calc( $3 +1) $calc( $4 +1) $calc( $5 -1) $calc( $6 -1)
    drawrect -nr $1 $rrgui.color(4) 1 $3 $4 $5 $6
    drawrect -nr $1 $rrgui.color(3) 1 $3 $4 $calc( $5 -1) $calc( $6 -1)
    drawline -nr $1 $rrgui.color(2) 1 $3 $4 $calc( $3 + $5 ) $4
    drawline -nr $1 $rrgui.color(2) 1 $3 $4 $3 $calc( $4 + $6 )
  }
  if ($2 == 3) {
    drawrect -nr $1 $rrgui.color(3) 1 $calc( $3 +1) $calc( $4 +1) $calc( $5 -1) $calc( $6 -1)
    drawrect -nr $1 $rrgui.color(2) 1 $3 $4 $5 $6
    drawrect -nr $1 $rrgui.color(1) 1 $3 $4 $calc( $5 -1) $calc( $6 -1)
    drawline -nr $1 $rrgui.color(4) 1 $3 $4 $calc( $3 + $5 ) $4
    drawline -nr $1 $rrgui.color(4) 1 $3 $4 $3 $calc( $4 + $6 )
  }
}
alias rrgui.checkbox {
  if ($2 == 1) { rrgui.obj box $1-4 12 12 }
  if ($2 == 2) { drawtext -nr $1 $rrgui.color(4)  Marlett 14 $calc($3 -1) $calc($4 +1)  b } 
  if ($7 != $null) { drawtext -nrc $1 $rrgui.color(4)  "Ms Sans Serif" $iif($7 isnum,$7,16) $calc($3 +18) $calc($4 -$iif($7 isnum,0,2)) $calc($5 -18) $calc(10+ $6 - $iif($7 isnum,0,2)) $iif($7 isnum,$8-,$7-) }
}
alias rrgui.radiobutton {
  if ($2 == 1) {
    drawrect -nrf $1 $rrgui.color(1) 1 $3 $4 12 12
    drawtext -nr $1 $rrgui.color(3) Marlett 12 $3 $4 j 
    drawtext -nr $1  $rrgui.color(2) Marlett 12 $3 $4 k
    drawfill -nrs $1 $rrgui.color(2) $rrgui.color(1) $calc($3 +3) $calc($4 +3)
    drawtext -nr $1  $rrgui.color(4) Marlett 12 $3 $4 l
    drawtext -nr $1 $rrgui.color(1) Marlett 12 $3 $4 m
    if ($7 != $null) {
      writeini $scriptdirrrgui2.ini $remove($1,@) $rrgui.parmdot($3,$4,$5,$6,Group) $7
      inc %rrgui.makegroup. [ $+ [ $7 ] ] 1
      writeini $scriptdirrrgui2.ini $7 %rrgui.makegroup. [ $+ [ $7 ] ] $3-6
    }
  }
  if ($2 == 2) { drawtext -nr $1 $rrgui.color(4)  Marlett 6 $calc($3 +3) $calc($4 +3)  n }
  if ($8 != $null) { drawtext -nrc $1 $rrgui.color(4)  "Ms Sans Serif" $iif($8 isnum,$8,16) $calc($3 +15) $calc($4 -$iif($8 isnum,0,2)) $calc($5 -18) $calc(10+ $6 - $iif($8 isnum,0,2)) $iif($8 isnum,$9-,$8-) }
}
alias rrgui.textbox {
  if ($2 == 1) { rrgui.obj box $1-5 20 }
  if ($2 != 2) && ($7 != $null) { 
    drawtext -nrbc $1 $rrgui.color(4) $rrgui.color(2) "Ms Sans Serif" 16 $calc($3 +3) $calc( $4 +2) $calc($5 -5) 17 $7- $str($chr(160),100)
    writeini $scriptdirrrgui2.ini $remove($1,@) $rrgui.parmdot($3,$4,$5,$6,Text) $7-
  }
  if ($2 == 2) { 
    drawrect -nrf $1 $rrgui.color(2) 1 $calc( $3 + 2 ) $calc( $4 + 2 ) $calc( $5 - 5) 16
    drawtext -nrc $1 $rrgui.color(4) "Ms Sans Serif" 16 $calc($3 +3) $calc( $4 +2) $calc($5 -5) 17 $7-
  }
}
alias rrgui.dropdown {
  if ($2 == 1) {
    rrgui.obj box $1-5 20
    drawrect -nr $1 $rrgui.color(1) 1 $calc( $3 + $5 - 17 ) $calc( $4 + 2 ) 15 16
    drawrect -nrf $1 $rrgui.color(1) 1 $calc( $3 + $5 - 15 ) $calc( $4 + 4 ) 11 12
    drawline -nr $1 1 1 $calc( $3 + $5 - 2 ) $calc( $4 + 1 ) $calc( $3 + $5 - 2 ) $calc( $4 +  18 )
    drawline -nr $1 1 1 $calc( $3 + $5 - 17 ) $calc( $4 + 18 ) $calc( $3 +  $5 - 1 ) $calc( $4 +  18 ) 
    drawline -nr $1 $rrgui.color(3) 1 $calc( $3 + $5 - 3 ) $calc( $4 + 3 ) $calc( $3 + $5 - 3 ) $calc( $4 +  18 )
    drawline -nr $1 $rrgui.color(3) 1 $calc( $3 + $5 - 16 ) $calc( $4 + 17 ) $calc( $3 +  $5 - 2 ) $calc( $4 +  17 ) 
    drawtext -nr $1 $rrgui.color(4)  Marlett 14 $calc($3 + $5 -16) $calc($4 +2)  6
    writeini $scriptdirrrgui2.ini $remove($1,@) $rrgui.parmdot($3,$4,$5,$6,Lines) $7-
    drawtext -nrc $1 $rrgui.color(4) "Ms Sans Serif" 16 $calc($3 +3) $calc( $4 +2) $calc($5 -20) 17 $8-
  }
  if ($2 == 2) { 
    drawrect -nrf $1 $rrgui.color(2) 1 $calc( $3 + 2 ) $calc( $4 + 2 ) $calc( $5 - 20) 16
    drawtext -nrc $1 $rrgui.color(4) "Ms Sans Serif" 16 $calc($3 +3) $calc( $4 +2) $calc($5 -20) 17 $7- 
  }
}
alias rrgui.box {
  if ($2 == 1) {
    drawrect -nr $1 $rrgui.color(2) 1 $3 $4 $5 $6
    drawrect -nrf $1 $rrgui.color(2) 1 $calc( $3 + 2 ) $calc( $4 + 2 ) $calc( $5 - 4 ) $calc($6 -4)
    drawline -nr $1 $rrgui.color(3) 1 $3 $4 $calc( $3 + $5 ) $4
    drawline -nr $1 $rrgui.color(3) 1 $3 $4 $3 $calc( $4 + $6 +1)
    drawline -nr $1 $rrgui.color(4) 1 $calc( $3 + 1 ) $calc( $4 + 1 ) $calc( $3 + $5 - 1 ) $calc( $4 + 1 )
    drawline -nr $1 $rrgui.color(4) 1 $calc( $3 + 1 ) $calc( $4 + 1 ) $calc( $3 + 1 ) $calc( $4 +  $6 )
  }
  if ($2 == 2) {
    drawrect -nr $1 $rrgui.color(3) 1 $3 $4 $calc($5 -2) $calc($6 -2)
    drawrect -nr $1 $rrgui.color(2) 1 $calc($3 +1) $calc($4 +1) $calc($5 -2) $calc($6 -2)
  }
}
;===========================================Venom[v.3]============================================
