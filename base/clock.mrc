on *:close:@c2clock:c_savepos
on *:load: {
  if ($exists($scriptdirdigital.c1) == $false) { echo $colour(info) -a *** Could not locate default skin file. Reunzip and load clock.mrc agian | echo $colour(info) -a *** Unloaded clock.mrc | .unload -rs $script }
  if ($exists($scriptdirc1skin.bmp) == $false) .copy -o $scriptdirdigital.c1 $scriptdirc1skin.bmp
  if ($c_read(mode) == $null) { c_write mode normal | c_write dock ll | c_write pos 0 $round($calc( [ $window(-3).h ] - 27),0) 107 | c_write secs true | c_write skindir $scriptdir }
}
on *:start:clock

alias clock {
  if ($1 == off) && ($window(@c2clock).w) { .timerclock off | c_savepos | window -c @c2clock | return }
  if ($exists($scriptdirc1skin.bmp) == $false) {
    if ($exists($scriptdirdigital.c1) == $false) { echo $colour(info) -a *** Could not locate default skin file. Reunzip and load clock.mrc agian | echo $colour(info) -a *** Unloaded clock.mrc | .unload -rs $script | return }
    .copy -o $scriptdirdigital.c1 $scriptdirc1skin.bmp | echo $colour(info) -s *** Skin bitmap not found, reselected default skin
  }
  window -kph $+ $iif($c_read(ontp) == 1,do) +fL @c2clock $c_read(pos) 27 @c2clock | window -a @c2clock
  drawrect -f @c2clock 1 1 0 0 500 500
  .timerclock 0 1 c2clockdraw
  c_write time 99 99 99 99 99 99 | c2clockdraw 1
}
alias -l c2clockdraw {
  %hour = $iif($gettok($time,1,58) > 12 && $c_read(mode) == normal, [ $calc($gettok($time,1,58) -12) ] ,$gettok($time,1,58)) | %hour = $iif($len(%hour) < 2,0) $+ %hour
  if (%hour == 00) %hour = 12
  %1 = $left(%hour,1) | %2 = $right(%hour,1) | %3 = $left($gettok($time,2,58),1) | %4 = $right($gettok($time,2,58),1) | %5 = $left($gettok($time,3,58),1) | %6 = $right($gettok($time,3,58),1) | %hour =
  if (%1 != $c_num(1)) c_draw_num 2 2 %1
  if (%2 != $c_num(2)) c_draw_num 16 2 %2
  if ($1) c_draw_num 29 2 c
  if (%3 != $c_num(3)) c_draw_num 37 2 %3
  if (%4 != $c_num(4)) c_draw_num 51 2 %4
  if ($c_read(secs) == true) {
    if ($1) c_draw_num 64 2 c
    if (%5 != $c_num(5)) c_draw_num 72 2 %5
    if (%5 != $c_num(6)) c_draw_num 86 2 %6
  }
  writeini $mircini clock time %1 %2 %3 %4 %5 %6 | unset %1 %2 %3 %4 %5 %6
}
alias c2clockmove { window @c2clock $calc( [ $iif($c_read(ontp) == 1,$mouse.dx,$mouse.mx) ] - %mouse.x -3) $calc( [ $iif($c_read(ontp) == 1,$mouse.dy,$mouse.my) ] - %mouse.y -3) $window(@c2clock).w 27 }

alias -l c_dock {
  %a = $c_read(dock)
  %b = $iif($c_read(ontp) == 1,-1,-3)
  if (%a == ul) window @c2clock 0 0
  if (%a == ur) window @c2clock $round($calc( [ $window(%b).w ] - [ $window(@c2clock).w ] ),0) 0
  if (%a == ll) window @c2clock 0 $calc( [ $window(%b).h ] - 27)
  if (%a == lr) window @c2clock $round($calc( [ $window(%b).w ] - [ $window(@c2clock).w ] ),0) $round($calc( [ $window(%b).h ] - 27),0)
  unset %a %b
}
alias -l c_bounce $1-
alias -l c_changedir { .timer 1 0 if ($exists(tmp)) .remove tmp | %t = $sdir="Choose new directory to browse:" $c_read(skindir) | if (%t) { c_write skindir %t | did -r c_skin 4 | c_list_update } | %t = }
alias -l c_choose { c_create_bmp | %a = $dialog(c_skin,c_skin,-2) | if (%s) { .copy -o %s $scriptdirc1skin.bmp | echo $colour(info) -a *** New skin loaded: %s | c_write time 99 99 99 99 | drawpic -c | c2clockdraw 1 } | .remove tmp.bmp | unset %a %s }
alias -l c_create_bmp {
  bset &blah 122 1 | bset &blah 117 255 | bset &blah 119 2 | bset &blah 120 32
  bset &blah 1 66 | bset &blah 2 77 | bset &blah 3 122 | bset &blah 11 118 | bset &blah 15 40
  bset &blah 19 1 | bset &blah 23 1 | bset &blah 27 1 | bset &blah 29 4 | bset &blah 31 2
  bset &blah 35 4 | bset &blah 39 18 | bset &blah 40 11 | bset &blah 43 18 | bset &blah 44 11
  bset &blah 47 16 | bset &blah 51 16 | bset &blah 61 128 | bset &blah 107 255 | bset &blah 116 255
  bset &blah 68 128 | bset &blah 69 128 | bset &blah 71 128 | bset &blah 75 128
  bset &blah 77 128 | bset &blah 79 128 | bset &blah 80 128 | bset &blah 83 192 | bset &blah 84 192
  bset &blah 85 192 | bset &blah 87 128 | bset &blah 88 128 | bset &blah 89 128 | bset &blah 93 255
  bset &blah 96 255 | bset &blah 100 255 | bset &blah 101 255 | bset &blah 103 255
  bset &blah 109 255 | bset &blah 111 255 | bset &blah 112 255 | bset &blah 115 255
  bwrite tmp.bmp -1 &blah
  bset &blah1 1 255 | bset &blah2 1 255 | bset &blah3 1 255
  bwrite tmp.bmp 62 &blah1 | bwrite tmp.bmp 63 &blah2 | bwrite tmp.bmp 64 &blah3
}
alias -l c_draw_num drawpic -c @c2clock $1 $2 $c_pos($3) $scriptdirc1skin.bmp
alias -l c_list_update {
  did -o c_skin 1 1 $c_read(skindir)
  %i = 1 | :a
  %b = $findfile($c_read(skindir),*.c1,%i,1) | if (%b) { did -a c_skin 4 $nopath(%b) | inc %i | goto a } | unset %a %b %i
}
alias -l c_num return $gettok( [ $readini $mircini clock time ] ,$1,32)
alias -l c_pos { if ($1 == c) return 120 0 7 17 | return $calc($1 *12) 0 12 17 }
alias -l c_read return $readini $mircini clock $1
alias -l c_resize {
  %a = $iif($c_read(ontp) == 1,-1,-3)
  if ($c_read(secs) == true) %w = 107 | else %w = 71 | %x = $window(@c2clock).x
  if ($calc(%w + %x) > $window(%a).w) %x = $calc( [ $window(%a).w ] - %w)
  if ($c_read(secs) == false) && ($calc( [ $window(%a).w ] - 107) == $window(@c2clock).x) %x = $calc( [ $window(%a).w ] - 71) 
  window @c2clock %x $window(@c2clock).y %w 27
  drawrect -f @c2clock 1 1 0 0 500 500
  c_write time 99 99 99 99 99 99 | c2clockdraw 1 | unset %w %x
}
alias -l c_savepos { c_write pos $window(@c2clock).x $window(@c2clock).y $window(@c2clock).w }
alias -l c_write writeini $mircini clock $1 $2-

menu @c2clock {
  sclick: { if ($timer(c2clockmove)) .timerc2clockmove off | else { set %mouse.x $mouse.x | set %mouse.y $mouse.y | .timerc2clockmove -m 0 1 c2clockmove } }
  dclick: { c_dock }
  uclick: { .timerc2clockmove off | unset %mouse.x %mouse.y %mouse.dx $mouse.dy }
  display options
  .$iif($c_read(mode) == normal,>,  ) standard time:c_write mode normal | c2clockdraw
  .$iif($c_read(mode) == milit,>,  ) military time:c_write mode milit | c2clockdraw
  .-
  .$iif($c_read(secs) == true,>,  ) show seconds:/if ($c_read(secs) == true) c_write secs false | else c_write secs true | c_resize
  .$iif($c_read(ontp) == 1,>,  ) ontop (desktop):/if ($c_read(ontp) == 1) c_write ontp 0 | else c_write ontp 1 | clock off | clock -ontp
  .-
  .   choose skin:c_choose
  close clock:{ .timerclock off | c_savepos | window -c @c2clock }
  $c_bounce(.timerc2clockmove,off):{}
}

dialog c_skin {
  title "Clock.mrc skin browser"
  size -1 -1 200 385

  button "",99,0 0 0 0,ok

  text "Browsing:",9,10 11 60 20
  text "",1,10 26 158 20
  button ">",8,170 32 20 18
  button "?",2,170 11 20 18

  text "Single click to preview Double click to select",3,10 50 120 30
  list 4,10 80 180 200

  box "Preview:",5,10 280 180 60
  icon 6,36 305 127 17,tmp.bmp

  button "Cancel",7,60 350 80 23
}
on *:dialog:c_skin:*:*: {
  if ($devent == init) { c_list_update | did -h c_skin 6 | .remove tmp.bmp }
  if ($devent == sclick) {
    if ($did == 2) { .write tmp .timer -m 1 1 c_changedir | .play -c $me tmp 1 }
    if ($did == 8) { did -f c_skin 1 | if ($c_read(skindir) != $scriptdir) { c_write skindir $shortfn($scriptdir) | did -r c_skin 4 | c_list_update } }
    if ($did == 7) dialog -k c_skin
    if ($did == 4) {
      did -o c_skin 5 1 Preview: $did(c_skin,4,$did(c_skin,4,1).sel)
      %f = $c_read(skindir) $+ $did(c_skin,4,$did(c_skin,4,1).sel) | %f = $shortfn(%f)
      .copy -o %f $scriptdirc1temp.bmp | did -v c_skin 6 | did -g c_skin 6 $scriptdirc1temp.bmp | .remove $scriptdirc1temp.bmp | %f =
    }
  }
  if ($devent == dclick) && ($did == 4) { %s = $c_read(skindir) $+ $did(c_skin,4,$did(c_skin,4,1).sel) | %s = $shortfn(%s) | dialog -k c_skin }
}
