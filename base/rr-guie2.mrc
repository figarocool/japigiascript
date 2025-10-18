			RR GUI 3.0 Visual Editor by EAE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This script was created by Emil A Eklund (EAE) If you have any questions and/or comments
feel free to E-Mail me, eae@eae.net, or find me as EAE on DALnet, my ICQ Uin is 2473022.
Feel free to include this addon in your own script(-s) as long as you're giving me credits for it. 
Check ReadMe array for more information.				         EAE

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias rrgui.ricon rrgui.icon $7 $1 $3-4 $calc($5 -1) $calc($6 -1)
alias rrgui.rtext drawtext -rbc $1 $rgb($gettok($9,1,44),$gettok($9,2,44),$gettok($9,3,44)) $rgb(192,192,192) " $+ $replace($7,',$chr(160)) $+ " $8 $3-6 $10-
alias rrge.options return $readini $scriptdirrrgui.ini Editor $1
alias rrge.getnum {
  unset %rrge.getnum.*
  set %rrge.getnum.num 1
  set %rrge.getnum.num2 1
  :go
  set %rrge.getnum.txt $readini $scriptdirrrge.ini Objects %rrge.getnum.num
  if (%rrge.getnum.txt == $null) { goto done }
  if (%rrge.getnum.txt != Empty) {
    if ($inrect($1,$2,$gettok(%rrge.getnum.txt,2,32),$gettok(%rrge.getnum.txt,3,32),$gettok(%rrge.getnum.txt,4,32),$gettok(%rrge.getnum.txt,5,32))) { 
      set %rrge.getnum.hit [ $+ [ %rrge.getnum.num2 ] ] %rrge.getnum.num %rrge.getnum.txt 
      inc %rrge.getnum.num2 1
    }
  }
  inc %rrge.getnum.num 1
  goto go
  :done
  set %rrge.getnum.num 1
  :go2
  set %rrge.getnum.tmp %rrge.getnum.hit [ $+ [ %rrge.getnum.num ] ]
  if (%rrge.getnum.tmp == $null) { goto done2 }
  if ($gettok(%rrge.getnum.small,1,32) == $null) { set %rrge.getnum.small $calc($gettok(%rrge.getnum.tmp,5,32) + $gettok(%rrge.getnum.tmp,6,32)) %rrge.getnum.tmp }
  if ($gettok(%rrge.getnum.small,1,32) > $calc($gettok(%rrge.getnum.tmp,5,32) + $gettok(%rrge.getnum.tmp,6,32))) { set %rrge.getnum.small $calc($gettok(%rrge.getnum.tmp,5,32) + $gettok(%rrge.getnum.tmp,6,32)) %rrge.getnum.tmp }
  inc %rrge.getnum.num 1
  goto go2
  :done2
  set %rrge.getnum.return $gettok(%rrge.getnum.small,2-,32)
  if (%rrge.getnum.return == $null) { set %rrge.getnum.return $null }
  return %rrge.getnum.return
}
alias rrge.add {
  set %rrge.add.num 1
  :go
  set %rrge.add.txt $readini $scriptdirrrge.ini Objects %rrge.add.num
  if (%rrge.add.txt == $null) || (%rrge.add.txt == Empty) { goto done }
  inc %rrge.add.num 
  goto go
  :done
  if ($1 == DropDown) { writeini $scriptdirrrge.ini Ext [ $+ [ %rrge.add.num ] ] 1 DropDown }
  set %rrge.edit.type place
  set %rrge.edit.place $1-
  unset %rrge.edit.place.drag
  rrge.properties %rrge.add.num Place 0 0 $3-4
}
alias rrge.compile {
  if (%rrge.file.open != Yes) { rrgui.dialog oko 130 Center Error 31 There's no open project. }
  else {
    set %rrge.compile.output.window $readini $scriptdirrrge.ini Compile Window
    set %rrge.compile.output.file $readini $scriptdirrrge.ini Compile File
    if (%rrge.compile.output.window == $null) { 
      set %rrge.compile.output.window $readini $scriptdirrrge.ini Window Titlebar 
      set %rrge.compile.output.window $gettok(%rrge.compile.output.window,3,32)
    }
    if (%rrge.compile.output.file == $null) { set %rrge.compile.output.file script.mrc }
    rrgui.window @rrge.compile FreePos $rrgui.tcenter(278,140) 1 Center Compile
    drawtext -rbc @rrge.compile $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 16 10 26 98 16 Window name:
    drawtext -rbc @rrge.compile $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 16 10 49 73 16 Output file: 
    drawtext -rbc @rrge.compile $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 7 75 260 16 Important, do NOT include the @ in the window name.
    rrgui.TextBox @rrge.compile 1 110 25 150 20 %rrge.compile.output.window 
    rrgui.TextBox @rrge.compile 1 110 50 150 20 %rrge.compile.output.file 
    rrgui.RealButton @rrge.compile 1 30 100 100 30 Compile
    rrgui.RealButton @rrge.compile 1 140 100 100 30 Cancel
    drawdot @rrge.compile
  }
}
alias rrge.compile.objects {
  if ($inrect($1,$2,0,0,278,13)) { return TitleBar }
  if ($inrect($1,$2,110,25,150,20)) { return TextBox 110 25 150 20 }
  if ($inrect($1,$2,110,50,150,20)) { return TextBox 110 50 150 20 }
  if ($inrect($1,$2,30,100,100,30)) { return RealButton 30 100 100 30 }
  if ($inrect($1,$2,140,100,100,30)) { return RealButton 140 100 100 30 }
}
alias rrge.compile.do {
  if ($inrect($1,$2,110,25,150,20)) && ($3 != $null) { set %rrge.compile.output.window $3 }
  if ($inrect($1,$2,110,50,150,20)) && ($3 != $null) { set %rrge.compile.output.file $3 }
  if ($inrect($1,$2,30,100,100,30)) {
    writeini $scriptdirrrge.ini Compile Window %rrge.compile.output.window
    writeini $scriptdirrrge.ini Compile File %rrge.compile.output.file
    if ($exists(%rrge.compile.output.file)) { 
      rrgui.dialog yn 130 Center Question 33 The selected file alredy exists~Do you want to overwrite it?
      set %rrgui.dialog.do1 rrge.compile.yes
    }
    else { rrge.compile.yes }
  }
  if ($inrect($1,$2,140,100,100,30)) { 
    rrgui.close @rrge.compile
    unset %rrge.compile.*
  }
}
alias rrge.compile.yes {
  .timer -m 1 200 rrge.compile.go 
  rrgui.close @rrge.compile
}
menu @rrge.compile {
  sclick rrgui.handle sclick @rrge.compile
  mouse rrgui.handle mouse @rrge.compile
  uclick rrgui.handle uclick @rrge.compile
}
alias rrge.compile.go {
  set %rrge.compile.win $readini $scriptdirrrge.ini Window Titlebar
  set %rrge.compile.pos $readini $scriptdirrrge.ini Window Pos
  set %rrge.compile.sze $readini $scriptdirrrge.ini Window Size
  window -h @rrge.compile
  aline @rrge.compile ; The Script Interface was created using RR-Gui 3.0 by EAE (RR-Team)
  aline @rrge.compile ; Visit www.eae.net/rr/gui for more information
  aline @rrge.compile ;
  aline @rrge.compile alias %rrge.compile.output.window $chr(123)
  if ($gettok(%rrge.compile.pos,3,32)) { aline @rrge.compile rrgui.window @ $+ %rrge.compile.output.window %rrge.compile.sze $gettok(%rrge.compile.win,1,32) $iif($gettok(%rrge.compile.win,2,32),Center,5) $gettok(%rrge.compile.win,3-,32) }
  else { aline @rrge.compile rrgui.window @ $+ %rrge.compile.output.window FreePos $gettok(%rrge.compile.pos,1-2,32) %rrge.compile.sze $gettok(%rrge.compile.win,1,32) $iif($gettok(%rrge.compile.win,2,32),Center,5) $gettok(%rrge.compile.win,3-,32) }
  write -c rrge1.tmp alias %rrge.compile.output.window $+ .objects $chr(123)
  write -c rrge2.tmp alias %rrge.compile.output.window $+ .do $chr(123)
  if ($gettok(%rrge.compile.win,1,32) > 0) {
    if ($gettok(%rrge.compile.win,1,32) > 2) { 
      write rrge1.tmp if ($inrect($1,$2, $+ $calc($gettok(%rrge.compile.sze,1,32) - 58) $+ ,2,15,13)) $chr(123) return ToolButton $calc($gettok(%rrge.compile.sze,1,32) -58) 2 15 13 $chr(125) 
      write rrge2.tmp if ($inrect($1,$2, $+ $calc($gettok(%rrge.compile.sze,1,32) - 58) $+ ,2,15,13)) $chr(123) window -n  @ $+ %rrge.compile.output.window $chr(125) 
      write rrge1.tmp if ($inrect($1,$2, $+ $calc($gettok(%rrge.compile.sze,1,32) - 42) $+ ,2,15,13)) $chr(123) return ToolButton $calc($gettok(%rrge.compile.sze,1,32) -42) 2 15 13 $chr(125) 
      write rrge2.tmp if ($inrect($1,$2, $+ $calc($gettok(%rrge.compile.sze,1,32) - 42) $+ ,2,15,13)) $chr(123) rrgui.dialog oko 130 Center Error 31 You can not maximize RR-Gui~Windows. Check ReadMe file for~more information. $chr(125)
    }
    if ($gettok(%rrge.compile.win,1,32) > 1) { 
      write rrge1.tmp if ($inrect($1,$2, $+ $calc($gettok(%rrge.compile.sze,1,32) - 24) $+ ,2,15,13)) $chr(123) return ToolButton $calc($gettok(%rrge.compile.sze,1,32) -24) 2 15 13 $chr(125) 
      write rrge2.tmp if ($inrect($1,$2, $+ $calc($gettok(%rrge.compile.sze,1,32) - 24) $+ ,2,15,13)) $chr(123) unset %rrge.compile.output.window $+ .* $chr(124) rrgui.close @ $+ %rrge.compile.output.window $chr(125)
    }
    write rrge1.tmp if ($inrect($1,$2,0,0, $+ $gettok(%rrge.compile.sze,1,32) $+ ,13)) $chr(123) return Titlebar $chr(125)
  }
  set %rrge.compile.num 1
  unset %rrge.compile.groups
  :gocomp
  set %rrge.compile.txt $readini $scriptdirrrge.ini Objects %rrge.compile.num
  if (%rrge.compile.txt == $null) { goto donecomp }
  if (%rrge.compile.txt != Empty) { 
    set %rrge.compile.stat 1
    if ($gettok(%rrge.compile.txt,1,32) == Box) { set %rrge.compile.stat 2 }
    unset %rrge.compile.ext
    if ($gettok(%rrge.compile.txt,1,32) == Checkbox) { set %rrge.compile.ext $gettok(%rrge.compile.txt,7-,32) }
    if ($gettok(%rrge.compile.txt,1,32) == RadioButton) { 
      set %rrge.compile.ext $gettok(%rrge.compile.txt,7-,32)
      if ($gettok(%rrge.compile.txt,7,32) !isin %rrge.compile.groups) {
        set %rrge.compile.groups %rrge.compile.groups $gettok(%rrge.compile.txt,7,32)
        aline @rrge.compile rrgui.makegroup $gettok(%rrge.compile.txt,7,32)
      }
    }
    if ($gettok(%rrge.compile.txt,1,32) == Button) || ($gettok(%rrge.compile.txt,1,32) == RealButton) { set %rrge.compile.ext $gettok(%rrge.compile.txt,6-,32) }
    if ($gettok(%rrge.compile.txt,1,32) == DropDown) { 
      aline @rrge.compile if (% $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num == $ $+ null) $chr(123) set % $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num $gettok(%rrge.compile.txt,7-,32) $chr(125)
      set %rrge.compile.ext $gettok(%rrge.compile.txt,6,32) % $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num
    }
    if ($gettok(%rrge.compile.txt,1,32) == TextBox) { 
      aline @rrge.compile if (% $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num == $ $+ null) $chr(123) set % $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num $gettok(%rrge.compile.txt,6-,32) $chr(125)
      set %rrge.compile.ext % $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num
    }
    if ($gettok(%rrge.compile.txt,1,32) == rIcon) { aline @rrge.compile rrgui.Icon $gettok(%rrge.compile.txt,6,32) @ $+ %rrge.compile.output.window $gettok(%rrge.compile.txt,2-3,32) $calc($gettok(%rrge.compile.txt,4,32) -1) $calc($gettok(%rrge.compile.txt,5,32) -1) }
    if ($gettok(%rrge.compile.txt,1,32) == rText) { aline @rrge.compile drawtext -rbc @ $+ %rrge.compile.output.window $ $+ rgb( $+ $gettok(%rrge.compile.txt,8,32) $+ ) $ $+ rgb(192,192,192) " $+ $replace($gettok(%rrge.compile.txt,6,32),',$chr(160)) $+ " $gettok(%rrge.compile.txt,7,32) $gettok(%rrge.compile.txt,2-5,32) $gettok(%rrge.compile.txt,9-,32) }
    if ($gettok(%rrge.compile.txt,1,32) != rText) && ($gettok(%rrge.compile.txt,1,32) != rIcon) { aline @rrge.compile rrgui.obj $gettok(%rrge.compile.txt,1,32) @ $+ %rrge.compile.output.window %rrge.compile.stat $gettok(%rrge.compile.txt,2-5,32) %rrge.compile.ext }
    if ($gettok(%rrge.compile.txt,1,32) == RadioButton) {
      aline @rrge.compile if (% $+ %rrge.compile.output.window $+ .obj $+ $gettok(%rrge.compile.txt,7,32) == %rrge.compile.num $+ ) $chr(123)  rrgui.obj RadioButton @ $+ %rrge.compile.output.window 2 $gettok(%rrge.compile.txt,2-5,32) %rrge.compile.ext $chr(125) 
      if ($gettok(%rrge.compile.txt,6,32)) { aline @rrge.compile if (% $+ %rrge.compile.output.window $+ .obj $+ $gettok(%rrge.compile.txt,7,32) == $ $+ null) $chr(123) rrgui. $+ $gettok(%rrge.compile.txt,1,32) @ $+ %rrge.compile.output.window 2 $gettok(%rrge.compile.txt,2-5,32) %rrge.compile.ext $chr(125) }
    }
    if ($gettok(%rrge.compile.txt,1,32) == CheckBox) { 
      if ($gettok(%rrge.compile.txt,6,32)) { aline @rrge.compile if (% $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num == $ $+ null) $chr(123) set % $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num $ $+ true $chr(125) }
      aline @rrge.compile if (% $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num $+ ) $chr(123) rrgui.obj CheckBox @ $+ %rrge.compile.output.window 2 $gettok(%rrge.compile.txt,2-5,32) %rrge.compile.ext $chr(125) 
    }
    if ($gettok(%rrge.compile.txt,1,32) == DropDown) {
      set %rrge.compile.drop.num 1
      :godrop
      set %rrge.compile.drop.txt $readini $scriptdirrrge.ini Ext [ $+ [ %rrge.compile.num ] ] %rrge.compile.drop.num
      if (%rrge.compile.drop.txt == $null) { goto donedrop }
      aline @rrge.compile rrgui.droplines @ $+ %rrge.compile.output.window $rrgui.parmdot($gettok(%rrge.compile.txt,2,32),$gettok(%rrge.compile.txt,3,32),$gettok(%rrge.compile.txt,4,32),$gettok(%rrge.compile.txt,5,32)) %rrge.compile.drop.num %rrge.compile.drop.txt
      inc %rrge.compile.drop.num 1
      goto godrop      
      :donedrop
    }
    if ($gettok(%rrge.compile.txt,1,32) !isin *rText*rIcon*Box*) { write rrge1.tmp if ($inrect($1,$2, $+ $gettok(%rrge.compile.txt,2,32) $+ , $+ $gettok(%rrge.compile.txt,3,32) $+ , $+ $gettok(%rrge.compile.txt,4,32) $+ , $+ $gettok(%rrge.compile.txt,5,32) $+ )) $chr(123) return $gettok(%rrge.compile.txt,1-5,32) $chr(125) }
    unset %rrge.compile.do*
    if ($gettok(%rrge.compile.txt,1,32) == DropDown) || ($gettok(%rrge.compile.txt,1,32) == TextBox) || ($gettok(%rrge.compile.txt,1,32) == CheckBox) {
      set %rrge.compile.do1 set % $+ %rrge.compile.output.window $+ .obj $+ %rrge.compile.num $ $+ 3-
    }
    if ($gettok(%rrge.compile.txt,1,32) == RadioButton) {
      set %rrge.compile.do1 set % $+ %rrge.compile.output.window $+ .obj $+ $gettok(%rrge.compile.txt,7,32) %rrge.compile.num
    }
    set %rrge.compile.do2 $readini $scriptdirrrge.ini Commands %rrge.compile.num 
    set %rrge.compile.tmp $ $+ 3-

if (*Close* isin %rrge.compile.do2) { set %rrge.compile.do2 unset %rrge.compile.output.window $+ .* $chr(124) rrgui.close @ $+ %rrge.compile.output.window }
else { set %rrge.compile.do2 $replace($replace($replace(%rrge.compile.do2,*Text*,%rrge.compile.tmp),*,$chr(37)),~,$chr(36)) }
    if (%rrge.compile.do1 == $null) && (%rrge.compile.do2 != $null) { set %rrge.compile.do %rrge.compile.do2 } 
    if (%rrge.compile.do1 != $null) && (%rrge.compile.do2 == $null) { set %rrge.compile.do %rrge.compile.do1 } 
    if (%rrge.compile.do1 != $null) && (%rrge.compile.do2 != $null) { set %rrge.compile.do %rrge.compile.do1 $chr(124) %rrge.compile.do2 } 
    if (%rrge.compile.do != $null) { write rrge2.tmp if ($inrect($1,$2, $+ $gettok(%rrge.compile.txt,2,32) $+ , $+ $gettok(%rrge.compile.txt,3,32) $+ , $+ $gettok(%rrge.compile.txt,4,32) $+ , $+ $gettok(%rrge.compile.txt,5,32) $+ )) $chr(123) %rrge.compile.do $chr(125) }
  }
  inc %rrge.compile.num 1
  goto gocomp
  :donecomp
  aline @rrge.compile drawdot @ $+ %rrge.compile.output.window
  aline @rrge.compile $chr(125)
  write rrge1.tmp $chr(125)
  write rrge2.tmp $chr(125)
  loadbuf @rrge.compile rrge1.tmp
  loadbuf @rrge.compile rrge2.tmp
  aline @rrge.compile menu @ $+ %rrge.compile.output.window $chr(123)
  aline @rrge.compile sclick rrgui.handle sclick @ $+ %rrge.compile.output.window 
  aline @rrge.compile mouse rrgui.handle mouse @ $+ %rrge.compile.output.window 
  aline @rrge.compile uclick rrgui.handle uclick @ $+ %rrge.compile.output.window 
  aline @rrge.compile dclick rrgui.handle sclick @ $+ %rrge.compile.output.window 
  aline @rrge.compile $chr(125)
  .remove rrge1.tmp
  .remove rrge2.tmp
  savebuf @rrge.compile %rrge.compile.output.file
  .timer 1 0 rrge.compile.done
  rrgui.close @rrge.compile
}
alias rrge.compile.done {
  rrgui.window @rrge.compile.done 353 150 2 130 Completed
  window @rrge.compile.done $rrgui.tcenter(353,150)
  drawtext -rbco @rrge.compile.done $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 16 97 29 150 16 Compiling Completed.
  rrgui.RealButton @rrge.compile.done 1 19 108 100 30 Run Script
  rrgui.RealButton @rrge.compile.done 1 123 108 100 30 View Source
  rrgui.RealButton @rrge.compile.done 1 227 108 100 30 Close
  drawtext -rbc @rrge.compile.done $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 26 61 348 14 The source code has been inserted to a file, you may load
  drawtext -rbc @rrge.compile.done $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 31 78 337 14 and run this file, view it in notepad or close this window.
  drawdot @rrge.compile.done
}
alias rrge.compile.done.objects {
  if ($inrect($1,$2,0,0,295,13)) { return Titlebar }
  if ($inrect($1,$2,329,2,15,13)) { return ToolButton 329 2 15 13 }
  if ($inrect($1,$2,97,29,146,16)) { return rText 97 29 146 16 }
  if ($inrect($1,$2,19,108,100,30)) { return RealButton 19 108 100 30 }
  if ($inrect($1,$2,123,108,100,30)) { return RealButton 123 108 100 30 }
  if ($inrect($1,$2,227,108,100,30)) { return RealButton 227 108 100 30 }
  if ($inrect($1,$2,26,61,348,14)) { return rText 26 61 348 14 }
  if ($inrect($1,$2,31,78,337,14)) { return rText 31 78 337 14 }
}
alias rrge.compile.done.do {
  if ($inrect($1,$2,19,108,100,30)) { 
    .load -rs %rrge.compile.output.file 
    %rrge.compile.output.window
  }
  if ($inrect($1,$2,123,108,100,30)) { run notepad %rrge.compile.output.file }
  unset %rrge.compile.* 
  .timer 1 0 rrgui.close @rrge.compile
  rrgui.close @rrge.compile.done
}
menu @rrge.compile.done {
  sclick rrgui.handle sclick @rrge.compile.done
  dclick rrgui.handle sclick @rrge.compile.done
  mouse rrgui.handle mouse @rrge.compile.done
  uclick rrgui.handle uclick @rrge.compile.done
}
alias rrge.objects {
  if ($2 < 13) { return Titlebar }
}
menu @rrge {
  sclick {
    if ($readini $scriptdirrrgui2.ini rrge Active == No) { set %rrge.uclick.go Do }
    if ($mouse.y <= 13) { rrgui.handle sclick @rrge }
    set %rrge.file.change Yes
    if ($window(@gui.dropdown) != $null) { window -c @gui.dropdown }
    if ($window(@gui.textbox) != $null) && ($readini $scriptdirrrgui2.ini rrge.Properties Active == Yes) {
      set %rrgui.textbox.dropfrom @rrge.Properties
      rrgui.input $editbox(@gui.textbox)
    }
    if (%rrge.edit.type == place) {
      unset %rrge.edit.last
      set %rrge.edit.x $mouse.x
      set %rrge.edit.y $mouse.y
      set %rrge.edit.place.drag Yes
    }
    else {
      if ($inrect($mouse.x,$mouse.y,$gettok(%rrge.active.obj,3,32),$gettok(%rrge.active.obj,4,32),$gettok(%rrge.active.obj,5,32),$gettok(%rrge.active.obj,6,32))) {
        unset %rrge.uclick.go
        drawrect -rin @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32)-3) $calc($gettok(%rrge.active.obj,4,32)-3) $calc($gettok(%rrge.active.obj,5,32)+6) $calc($gettok(%rrge.active.obj,6,32)+6) 
        drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32) + $gettok(%rrge.active.obj,5,32) -5) $calc($gettok(%rrge.active.obj,4,32) + $gettok(%rrge.active.obj,6,32) -5) 7 7
        drawrect -rfn @rrge $rgb(192,192,192) 1 $gettok(%rrge.active.obj,3-6,32)
        drawrect -rin @rrge $rgb(0,0,0) 1 $gettok(%rrge.active.obj,3-6,32)
        drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32) + $gettok(%rrge.active.obj,5,32) -7) $calc($gettok(%rrge.active.obj,4,32) + $gettok(%rrge.active.obj,6,32) -7) 6 6
        set %rrge.uclick.go Do
        set %rrge.edit.tmp1 $calc($gettok(%rrge.active.obj,3,32) + $gettok(%rrge.active.obj,5,32) -5) 
        set %rrge.edit.tmp2 $calc($gettok(%rrge.active.obj,4,32) + $gettok(%rrge.active.obj,6,32) -5)
        if ($inrect($mouse.x,$mouse.y,%rrge.edit.tmp1,%rrge.edit.tmp2,10,10)) { 
          set %rrge.edit.type resize
          set %rrge.edit.x $calc($mouse.x - $gettok(%rrge.active.obj,5,32))
          set %rrge.edit.y $calc($mouse.y - $gettok(%rrge.active.obj,6,32))
          set %rrge.edit.last $gettok(%rrge.active.obj,3-4,32) $calc($mouse.x - %rrge.edit.x) $calc($mouse.y - %rrge.edit.y) 
        }
        else { 
          set %rrge.edit.type move 
          set %rrge.edit.x $calc($mouse.x - $gettok(%rrge.active.obj,3,32))
          set %rrge.edit.y $calc($mouse.y - $gettok(%rrge.active.obj,4,32))
          set %rrge.edit.last $calc($mouse.x - %rrge.edit.x) $calc($mouse.y - %rrge.edit.y) $gettok(%rrge.active.obj,5-6,32) 
        }
        unset %rrge.edit.tmp*
        drawdot @rrge
      }
      else { 
        set %rrge.active.obj $rrge.getnum($mouse.x,$mouse.y) 
        set %rrge.uclick.go Yes
      }
      if (%rrge.active.obj == $null) { 
        if (%rrge.active.last != $null) { 
          drawrect -ri @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.last,3,32)-3) $calc($gettok(%rrge.active.last,4,32)-3) $calc($gettok(%rrge.active.last,5,32)+6) $calc($gettok(%rrge.active.last,6,32)+6) 
          drawrect -rif @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.last,3,32) + $gettok(%rrge.active.last,5,32) -5) $calc($gettok(%rrge.active.last,4,32) + $gettok(%rrge.active.last,6,32) -5) 7 7
        }       
        rrge.properties 0 Window 
        unset %rrge.active.last
      }
    }
  }
  uclick {
    if ($mouse.y <= 13) { rrgui.handle uclick @rrge }
    if (%rrge.edit.type == place) && (%rrge.edit.place.drag == Yes) && ($gettok(%rrge.edit.last,3,32) < 5) && ($gettok(%rrge.edit.last,4,32) < 5) { 
      writeini $scriptdirrrge.ini Objects %rrge.add.num $gettok(%rrge.edit.place,1,32) %rrge.edit.x %rrge.edit.y $gettok(%rrge.edit.place,3-,32)
      remini $scriptdirrrgui2.ini rrge.properties
      set %rrge.active.obj %rrge.add.num $gettok(%rrge.edit.place,1,32) %rrge.edit.x %rrge.edit.y $gettok(%rrge.edit.place,3-,32)
      unset %rrge.active.last %rrge.edit.type %rrge.uclick.go %rrge.edit.place %rrge.edit.x %rrge.edit.y
      set %rrge.active.last %rrge.active.obj
      rrge.update
      rrge.properties %rrge.active.obj
      drawrect -rin @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32)-3) $calc($gettok(%rrge.active.obj,4,32)-3) $calc($gettok(%rrge.active.obj,5,32)+6) $calc($gettok(%rrge.active.obj,6,32)+6) 
      drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32) + $gettok(%rrge.active.obj,5,32) -5) $calc($gettok(%rrge.active.obj,4,32) + $gettok(%rrge.active.obj,6,32) -5) 7 7
      drawdot @rrge
    }
    if (%rrge.uclick.go == Do) {
      if (%rrge.edit.type != Place) { rrge.update }
      drawrect -rin @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32)-3) $calc($gettok(%rrge.active.obj,4,32)-3) $calc($gettok(%rrge.active.obj,5,32)+6) $calc($gettok(%rrge.active.obj,6,32)+6) 
      drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32) + $gettok(%rrge.active.obj,5,32) -5) $calc($gettok(%rrge.active.obj,4,32) + $gettok(%rrge.active.obj,6,32) -5) 7 7
      drawdot @rrge
    }
    if (%rrge.uclick.go == Yes) {
      if (%rrge.active.obj != $null) {
        if (%rrge.active.last != $null) { 
          drawrect -ri @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.last,3,32)-3) $calc($gettok(%rrge.active.last,4,32)-3) $calc($gettok(%rrge.active.last,5,32)+6) $calc($gettok(%rrge.active.last,6,32)+6) 
          drawrect -rif @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.last,3,32) + $gettok(%rrge.active.last,5,32) -5) $calc($gettok(%rrge.active.last,4,32) + $gettok(%rrge.active.last,6,32) -5) 7 7
        }
        drawrect -ri @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32)-3) $calc($gettok(%rrge.active.obj,4,32)-3) $calc($gettok(%rrge.active.obj,5,32)+6) $calc($gettok(%rrge.active.obj,6,32)+6) 
        drawrect -rif @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32) + $gettok(%rrge.active.obj,5,32) -5) $calc($gettok(%rrge.active.obj,4,32) + $gettok(%rrge.active.obj,6,32) -5) 7 7
        set %rrge.active.last %rrge.active.obj
        rrge.properties %rrge.active.obj
      }
    }
  }
  mouse {
    if ($mouse.y <= 13) { rrgui.handle mouse @rrge }
    if (%rrge.edit.type == Place) {
      if (%rrge.edit.last != $null) { 
        drawrect -rin @rrge $rgb(0,0,0) 1 %rrge.edit.last 
        drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.edit.last,1,32) + $gettok(%rrge.edit.last,3,32) -7) $calc($gettok(%rrge.edit.last,2,32) + $gettok(%rrge.edit.last,4,32) -7) 6 6
      }
      set %rrge.edit.last %rrge.edit.x %rrge.edit.y $calc($mouse.x - %rrge.edit.x) $calc($mouse.y - %rrge.edit.y) 
      drawrect -rin @rrge $rgb(0,0,0) 1 %rrge.edit.last
      drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.edit.last,1,32) + $gettok(%rrge.edit.last,3,32) -7) $calc($gettok(%rrge.edit.last,2,32) + $gettok(%rrge.edit.last,4,32) -7) 6 6
      rrge.properties %rrge.add.num Place %rrge.edit.last
    }
    else {
      if (%rrge.active.obj != $null) && (%rrge.uclick.go != Yes) && ($mouse.key == 1) {
        unset %rrge.uclick.go
        if (%rrge.edit.last != $null) { 
          drawrect -rin @rrge $rgb(0,0,0) 1 %rrge.edit.last 
          drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.edit.last,1,32) + $gettok(%rrge.edit.last,3,32) -7) $calc($gettok(%rrge.edit.last,2,32) + $gettok(%rrge.edit.last,4,32) -7) 6 6
        }
        if (%rrge.edit.type == resize) { set %rrge.edit.last $gettok(%rrge.active.obj,3-4,32) $calc($mouse.x - %rrge.edit.x) $calc($mouse.y - %rrge.edit.y) }
        if (%rrge.edit.type == move) { set %rrge.edit.last $calc($mouse.x - %rrge.edit.x) $calc($mouse.y - %rrge.edit.y) $gettok(%rrge.active.obj,5-6,32) }
        drawrect -rin @rrge $rgb(0,0,0) 1 %rrge.edit.last
        drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.edit.last,1,32) + $gettok(%rrge.edit.last,3,32) -7) $calc($gettok(%rrge.edit.last,2,32) + $gettok(%rrge.edit.last,4,32) -7) 6 6
        rrge.properties $gettok(%rrge.active.obj,1-2,32) %rrge.edit.last $gettok(%rrge.active.obj,7-,32) 
      }
    }
    drawdot @rrge
  }
  drop {
    if ($calc($mouse.x - %rrge.edit.x) > 0) && ($calc($mouse.y - %rrge.edit.y) > 0) {
      if (%rrge.edit.type == resize) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-2,32) $gettok(%rrge.active.obj,3-4,32) $calc($mouse.x - %rrge.edit.x) $calc($mouse.y - %rrge.edit.y) $gettok(%rrge.active.obj,7-,32) }
      if (%rrge.edit.type == move) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-2,32) $calc($mouse.x - %rrge.edit.x) $calc($mouse.y - %rrge.edit.y) $gettok(%rrge.active.obj,5-,32) }
      if (%rrge.edit.type == place) {
        writeini $scriptdirrrge.ini Objects %rrge.add.num $gettok(%rrge.edit.place,1,32) %rrge.edit.last $gettok(%rrge.edit.place,5-,32)
        remini $scriptdirrrgui2.ini rrge.properties
        set %rrge.active.obj %rrge.add.num $gettok(%rrge.edit.place,1,32) %rrge.edit.last $gettok(%rrge.edit.place,5-,32)
        rrge.properties %rrge.add.num $gettok(%rrge.edit.place,1,32) %rrge.edit.last $gettok(%rrge.edit.place,5-,32)
        unset %rrge.active.last %rrge.add.num 
      }
    }
    %rrge.edit.move.last 
    unset %rrge.edit.*
    rrge.update
    set %rrge.active.obj $gettok(%rrge.active.obj,1,32) $readini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1,32)
    drawrect -rin @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32)-3) $calc($gettok(%rrge.active.obj,4,32)-3) $calc($gettok(%rrge.active.obj,5,32)+6) $calc($gettok(%rrge.active.obj,6,32)+6) 
    drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32) + $gettok(%rrge.active.obj,5,32) -5) $calc($gettok(%rrge.active.obj,4,32) + $gettok(%rrge.active.obj,6,32) -5) 7 7
    set %rrge.active.last %rrge.active.obj
    drawdot @rrge
  }
  dclick { rrge.update }
  Remember Position
  .This Window:set %rrge-pos.prj $window(@rrge).x $window(@rrge).y
  .All Windows:set %rrge-pos.obj $window(@rrge.Toolbar).x $window(@rrge.Toolbar).y | set %rrge-pos.prj $window(@rrge).x $window(@rrge).y | set %rrge-pos.pro $window(@rrge.Properties).x $window(@rrge.Properties).y
  Reset Position
  .This Window:set %rrge-pos.prj 155 5
  .All Windows:set %rrge-pos.obj 5 5 | set %rrge-pos.prj 155 5 | set %rrge-pos.pro 5 358
  -
  Update Positions:rrge.updpos
}
