			RR GUI 3.0 by FigaroCool
on 1:load: {
  rrgui.load rr-guiobj.mrc
  rrgui.load rr-guiconf.mrc
  rrgui.load rr-guie.mrc
  rrgui.load rr-guie2.mrc
  rrgui.load rr-guie3.mrc
  echo $colour(info) -s *** RR-Gui $rrgui.version has been installed.
  if ($isalias(rrgui.about.go)) { .timer 1 0 rrgui.about.go }
}
on 1:start: rrgui.init
alias rrgui.init {
  if ($1 == $null) && ($window(@rrgui.fade) != $null) { halt }
  rrgui.createini
  window -c @rrgui.init
  window -ph +f @rrgui.init 50 50 143 30
  window -ra @rrgui.init
  drawrect -rfn @rrgui.init $rrgui.color(1) 1 0 0 145 30
  drawtext -rn @rrgui.init $rrgui.color(5) "Ms Sans Serif" 14 15 3 Initializing RR-GUI $rrgui.version
  rrgui.box @rrgui.init 1 3 18 130 4
  drawdot @rrgui.init
  window -c @rrgui.fade
  window -ph +f @rrgui.fade 10 10 505 250
  drawrect -rf @rrgui.fade $rrgui.color(1) 1 0 0 505 250
  drawrect -rf @rrgui.fade $rgb(255,255,255) 1 4 4 202 6
  rrgui.fade init 5 $readini $scriptdirrrgui.ini Titlebar 1 $readini $scriptdirrrgui.ini Titlebar 2 @rrgui.init 5 20 127 1
  rrgui.fade init 106 $readini $scriptdirrrgui.ini Titlebar 3 $readini $scriptdirrrgui.ini Titlebar 4 @rrgui.init 5 20 127 1
  if $exists($rrgui.file(Icon)) { drawpic @rrgui.fade 0 20 $rrgui.file(Icon) }
  drawtext -r @rrgui.fade $rrgui.color(5) "Ms Sans Serif" 16 60 220 This Window is required for RR-GUI $rrgui.version to work. - Click to hide it.
  window -c @rrgui.init
  unset %rrgui.*
  write -c $scriptdirrrgui2.ini
}
menu @rrgui.fade {
  sclick window -h @rrgui.fade 
}
alias rrgui.fade {
  if ($1 == init) {
    set %rrgui.fade.dec1 $calc( $calc( $gettok($3,1,44) - $gettok($4,1,44) ) / 100)
    set %rrgui.fade.dec2 $calc( $calc( $gettok($3,2,44) - $gettok($4,2,44) ) / 100)
    set %rrgui.fade.dec3 $calc( $calc( $gettok($3,3,44) - $gettok($4,3,44) ) / 100)
    set %rrgui.fade.c1 $gettok($3,1,44)
    set %rrgui.fade.c2 $gettok($3,2,44)
    set %rrgui.fade.c3 $gettok($3,3,44)
    set %rrgui.fade.num 0
    :go
    set %rrgui.fade.c1 $calc(%rrgui.fade.c1 - %rrgui.fade.dec1)
    set %rrgui.fade.c2 $calc(%rrgui.fade.c2 - %rrgui.fade.dec2)
    set %rrgui.fade.c3 $calc(%rrgui.fade.c3 - %rrgui.fade.dec3)
    if (%rrgui.fade.num == 100) { goto done }
    drawline -r @rrgui.fade $rgb(%rrgui.fade.c1,%rrgui.fade.c2,%rrgui.fade.c3) 1 $calc($2 + %rrgui.fade.num) 5 $calc($2 + %rrgui.fade.num) 10
    drawcopy @rrgui.fade $2 5 100 2 $5-
    inc %rrgui.fade.num 1
    goto go
    :done
  }
  if ($3 != $null) {
    if ($2 == 1) { drawcopy -n @rrgui.fade 5 5 99 2 $1 $3- }
    if ($2 == 2) { drawcopy -n @rrgui.fade 106 5 99 2 $1 $3- }
  }
}
alias rrgui.handle {
  if (%rrgui.drop.halt == Yes) { unset %rrgui.drop.halt | halt }
  set %rrgui.check.window $readini $scriptdirrrgui2.ini $remove($2,@) sclick
  if ($gettok(%rrgui.check.window,2,46) != $null) && ($inrect($mouse.x,$mouse.y,$gettok($gettok(%rrgui.check.window,1,46),2,46),$gettok(%rrgui.check.window,2,32),$gettok(%rrgui.check.window,3,46),$remove($gettok(%rrgui.check.window,4,46),Open)) == $false) { set %rrgui.handle.halt No }
  if (%rrgui.check.window != $null) {
    if ($gettok(%rrgui.check.window,1,32) == TextBox) { 
      set %rrgui.handele.tmp $remove($gettok(%rrgui.check.window,2-,32),Open) 
      rrgui.do $2 $gettok(%rrgui.handele.tmp,1,46) $gettok(%rrgui.handele.tmp,2,46) $editbox(@gui.textbox) 
      rrgui.obj textbox $2 2 $replace($remove($gettok(%rrgui.check.window,2-,32),Open),$chr(46),$chr(32)) $editbox(@gui.textbox) $chr(160)
      drawdot $2
      if ($editbox(@gui.textbox) != $null) { writeini $scriptdirrrgui2.ini $remove($2,@) $replace($gettok(%rrgui.check.window,2-,32),Open,Text) $editbox(@gui.textbox) }
      else { writeini $scriptdirrrgui2.ini $remove($2,@) $replace($gettok(%rrgui.check.window,2-,32),Open,Text) $null }
      set %rrgui.handle.halt No
    }
    window -c @gui. $+ $gettok(%rrgui.check.window,1,32) 
    remini $scriptdirrrgui2.ini $remove($2,@) sclick
    writeini $scriptdirrrgui2.ini $remove($2,@) $gettok(%rrgui.check.window,2-,32) No
    unset %rrgui.textbox.dropfrom
    if (%rrgui.handle.halt != No) { halt }
    unset %rrgui.handle.halt
  }
  if (%rrgui.handle.lastobject. [ $+ [ $2 ] ] != $null) {
    set %rrgui.handle.lastobject.parm1 $gettok( %rrgui.handle.lastobject. [ $+ [ $2 ] ] ,5,32) | set %rrgui.handle.lastobject.parm2 $gettok( %rrgui.handle.lastobject. [ $+ [ $2 ] ] ,6,32) | set %rrgui.handle.lastobject.parm3 $gettok( %rrgui.handle.lastobject. [ $+ [ $2 ] ] ,7,32) | set %rrgui.handle.lastobject.parm4 $gettok( %rrgui.handle.lastobject. [ $+ [ $2 ] ] ,8,32)
    if (%rrgui.handle.lastobject.parm2 !isin *Button*RealButton*ToolButton*CheckBox*RadioButton*TextBox*DropDown*Box) { rrgui.obj handle new %rrgui.handle.object }
    if ($inrect($mouse.x,$mouse.y,%rrgui.handle.lastobject.parm1,%rrgui.handle.lastobject.parm2,%rrgui.handle.lastobject.parm3,%rrgui.handle.lastobject.parm4) == $false) {
      if (%rrgui.handle.lastobject. [ $+ [ $2 ] ] != DoNull) {
        if ($mouse.key != 1) { 
          $replace(%rrgui.handle.lastobject. [ $+ [ $2 ] ] ,*Num*,1) 
          set %rrgui.handle.lastobject. [ $+ [ $2 ] ] $null
          unset %rrgui.handle.laststate %rrgui.handle.lastobject.*
        }
        if ($mouse.key == 1) && (%rrgui.handle.laststate != 1) { 
          $replace(%rrgui.handle.lastobject. [ $+ [ $2 ] ] ,*Num*,4) 
          set %rrgui.handle.laststate 1
        }
        drawdot $2
      }
    }
  }
  set %rrgui.handle.object $rrgui.objects($2,$mouse.x,$mouse.y)
  if (%rrgui.handle.object == $null) { return }
  if ($mouse.key == 1) {
    if ($inrect($mouse.x,$mouse.y,%rrgui.handle.lastobject.parm1,%rrgui.handle.lastobject.parm2,%rrgui.handle.lastobject.parm3,%rrgui.handle.lastobject.parm4) == $false) { return }
  }
  if ($gettok(%rrgui.handle.object,1,32) !isin *Button*RealButton*ToolButton*CheckBox*RadioButton*TextBox*DropDown*Box) { rrgui.obj handle $1 %rrgui.handle.object }
  if ($gettok(%rrgui.handle.object,1,32) == Button) || ($gettok(%rrgui.handle.object,1,32) == RealButton) || ($gettok(%rrgui.handle.object,1,32) == ToolButton) {
    if ($1 == sclick) { 
      rrgui.obj $gettok(%rrgui.handle.object,1,32) $2 3 $gettok(%rrgui.handle.object,2-,32) 
      set %rrgui.handle.lastclick $gettok(%rrgui.handle.object,2-,32)
    }
    if ($1 == uclick) {
      if ($gettok(%rrgui.handle.object,2-,32) == %rrgui.handle.lastclick) {
        rrgui.obj $gettok(%rrgui.handle.object,1,32) $2 2 $gettok(%rrgui.handle.object,2-,32) 
        drawdot $2
        rrgui.do $2 $gettok(%rrgui.handle.object,2-,32)
        unset %rrgui.handle.lastobject.*
      }
    }
    if ($1 == mouse) { 
      if ($mouse.key == 1) {
        rrgui.obj $gettok(%rrgui.handle.object,1,32) $2 3 $gettok(%rrgui.handle.object,2-,32) 
        set %rrgui.handle.lastobject. [ $+ [ $2 ] ] rrgui.obj $gettok(%rrgui.handle.object,1,32) $2 *num* $gettok(%rrgui.handle.object,2-,32) 
        unset %rrgui.handle.laststate
      }
      if ($mouse.key != 1) {
        rrgui.obj $gettok(%rrgui.handle.object,1,32) $2 2 $gettok(%rrgui.handle.object,2-,32) 
        set %rrgui.handle.lastobject. [ $+ [ $2 ] ] rrgui.obj $gettok(%rrgui.handle.object,1,32) $2 *num* $gettok(%rrgui.handle.object,2-,32) 
      }
    }
    if ($left($2,1) == @) { drawdot $2 }
  }
  if ($gettok(%rrgui.handle.object,1,32) == CheckBox) {
    if ($1 == mouse) { set %rrgui.handle.lastobject. [ $+ [ $2 ] ] DoNull }
    if ($1 == sclick) { 
      set %rrgui.handle.object.parm1 $gettok(%rrgui.handle.object,2,32) | set %rrgui.handle.object.parm2 $gettok(%rrgui.handle.object,3,32) | set %rrgui.handle.object.parm3 $gettok(%rrgui.handle.object,4,32) | set %rrgui.handle.object.parm4 $gettok(%rrgui.handle.object,5,32)
      set %rrgui.check.open $readini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Open) 
      if (%rrgui.check.open == No) || (%rrgui.check.open == $null) { 
        rrgui.obj checkbox $2 2 $gettok(%rrgui.handle.object,2-,32) 
        drawdot $2
        rrgui.do $2 %rrgui.handle.object.parm1 %rrgui.handle.object.parm2 $true
        writeini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Open) Yes
      }
      if (%rrgui.check.open == Yes) { 
        rrgui.obj checkbox $2 1 $gettok(%rrgui.handle.object,2-,32) 
        drawdot $2
        rrgui.do $2 %rrgui.handle.object.parm1 %rrgui.handle.object.parm2 $false
        writeini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Open) No
      }
    }
  }
  if ($gettok(%rrgui.handle.object,1,32) == RadioButton) {
    if ($1 == mouse) { set %rrgui.handle.lastobject. [ $+ [ $2 ] ] DoNull }
    if ($1 == sclick) { 
      set %rrgui.handle.object.parm1 $gettok(%rrgui.handle.object,2,32) | set %rrgui.handle.object.parm2 $gettok(%rrgui.handle.object,3,32) | set %rrgui.handle.object.parm3 $gettok(%rrgui.handle.object,4,32) | set %rrgui.handle.object.parm4 $gettok(%rrgui.handle.object,5,32)
      set %rrgui.handle.group.name $readini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Group) 
      set %rrgui.handle.group.num 1
      :group-go
      set %rrgui.handle.group.pos $readini $scriptdirrrgui2.ini %rrgui.handle.group.name %rrgui.handle.group.num 
      if (%rrgui.handle.group.pos == $null) { goto group-done }
      rrgui.obj radiobutton $2 1 %rrgui.handle.group.pos
      inc %rrgui.handle.group.num 1
      goto group-go
      :group-done
      rrgui.obj radiobutton $2 2 $gettok(%rrgui.handle.object,2-,32) 
      drawdot $2
      rrgui.do $2 %rrgui.handle.object.parm1 %rrgui.handle.object.parm2 $true
    }
  }
  if ($gettok(%rrgui.handle.object,1,32) == TextBox) {
    if ($1 == mouse) { set %rrgui.handle.lastobject. [ $+ [ $2 ] ] DoNull }
    if ($1 == sclick) { 
      writeini $scriptdirrrgui2.ini $remove($2,@) Active Yes
      set %rrgui.handle.object.parm1 $gettok(%rrgui.handle.object,2,32) | set %rrgui.handle.object.parm2 $gettok(%rrgui.handle.object,3,32) | set %rrgui.handle.object.parm3 $gettok(%rrgui.handle.object,4,32) | set %rrgui.handle.object.parm4 $gettok(%rrgui.handle.object,5,32)
      set %rrgui.check.open $readini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Open) 
      if (%rrgui.check.open == No) || (%rrgui.check.open == $null) { 
        set %rrgui.textbox.x $window($2).x | inc %rrgui.textbox.x $calc( %rrgui.handle.object.parm1 +4)
        set %rrgui.textbox.y $window($2).y | inc %rrgui.textbox.y $calc( %rrgui.handle.object.parm2 +4)
        window -eh +b @gui.textbox %rrgui.textbox.x %rrgui.textbox.y $calc(%rrgui.handle.object.parm3 -1) 19 Ms Sans Serif 13
        window -ra @gui.textbox
        set %rrgui.textbox.txt $readini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Text)
        if (%rrgui.textbox.txt != $null) { editbox @gui.textbox %rrgui.textbox.txt }
        unset %rrgui.textbox.txt 
        writeini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Open) Yes
        writeini $scriptdirrrgui2.ini $remove($2,@) sclick TextBox $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Open)
        set %rrgui.textbox.dropfrom $2
      }
    }
  }
  if ($gettok(%rrgui.handle.object,1,32) == DropDown) {
    if ($1 == mouse) { set %rrgui.handle.lastobject. [ $+ [ $2 ] ] DoNull }
    if ($1 == sclick) { 
      set %rrgui.handle.object.parm1 $gettok(%rrgui.handle.object,2,32) | set %rrgui.handle.object.parm2 $gettok(%rrgui.handle.object,3,32) | set %rrgui.handle.object.parm3 $gettok(%rrgui.handle.object,4,32) | set %rrgui.handle.object.parm4 $gettok(%rrgui.handle.object,5,32)
      set %rrgui.check.open $readini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Open) 
      if (%rrgui.check.open == No) || (%rrgui.check.open == $null) { 
        set %rrgui.dropdown.x $window($2).x | inc %rrgui.dropdown.x $calc( %rrgui.handle.object.parm1 +4)
        set %rrgui.dropdown.y $window($2).y | inc %rrgui.dropdown.y $calc( %rrgui.handle.object.parm2 +22)
        set %rrgui.dropdown.d $readini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Lines)
        window -lh +b @gui.dropdown %rrgui.dropdown.x %rrgui.dropdown.y $calc(%rrgui.handle.object.parm3 -2) $rrgui.dropheight(%rrgui.dropdown.d) "Ms Sans Serif" 12
        window -ra @gui.dropdown
        set %rrgui.dropdown.addlines 1
        :addlines
        set %rrgui.dropdown.addlines.tmp $readini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Line [ $+ [ %rrgui.dropdown.addlines ] ] )
        if (%rrgui.dropdown.addlines.tmp == $null) { goto adddone }
        aline @gui.dropdown %rrgui.dropdown.addlines.tmp 
        inc %rrgui.dropdown.addlines 1
        goto addlines
        :adddone
        unset %rrgui.dropdown.addlines*
        writeini $scriptdirrrgui2.ini $remove($2,@) $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Open) Yes
        writeini $scriptdirrrgui2.ini $remove($2,@) sclick DropDown $rrgui.parmdot(%rrgui.handle.object.parm1,%rrgui.handle.object.parm2,%rrgui.handle.object.parm3,%rrgui.handle.object.parm4,Open)
        .timerDropDown -m 0 10 rrgui.dropdown.check $2 $gettok(%rrgui.handle.object,2-,32)
        set %rrgui.drop.halt Yes
      }
    }
  }
  if ($gettok(%rrgui.handle.object,1,32) == Titlebar) {
    if ($1 == mouse) { 
      set %rrgui.handle.lastobject. [ $+ [ $2 ] ] DoNull 
      if (%rrgui.move == $2) {
        if ($mouse.key == 1) {
          set %rrgui.move.winx $window($active).x
          set %rrgui.move.winy $window($active).y
          set %rrgui.move.x $calc( %rrgui.move.winx + $calc( $mouse.x - %rrgui.move.mx ))
          set %rrgui.move.y $calc( %rrgui.move.winy + $calc( $mouse.y - %rrgui.move.my ))
          window $active %rrgui.move.x %rrgui.move.y $window($active).w $window($active).h
        }
        else { unset %rrgui.move* }
      }
    }
    if ($1 == sclick) { 
      set %rrgui.move $2 
      set %rrgui.move.mx $mouse.x
      set %rrgui.move.my $mouse.y
    }
  }
  unset %rrgui.handle.object.parm* %rrgui.handle.lastobject.parm*
}
alias rrgui.objects {
  set %rrgui.objects.tmp $remove($1,@) $+ .objects($2,$3)
  return  $ [ $+ [ %rrgui.objects.tmp ] ]
}
alias rrgui.color {
  set %rrgui.color $readini $scriptdirrrgui.ini Colors $1
  return $rgb($gettok(%rrgui.color,1,44),$gettok(%rrgui.color,2,44),$gettok(%rrgui.color,3,44))
}
alias rrgui.file return $readini $scriptdirrrgui.ini Files $1 [ $+ [ File ] ]
alias rrgui.obj {
  if ($1 == handle) {
    set %rrgui.obj $readini $scriptdirrrgui.ini Objects $3 $+ .handle
    if ($isalias(%rrgui.obj)) { %rrgui.obj $2 $4- }
  }
  else {
    set %rrgui.obj $readini $scriptdirrrgui.ini Objects $1
    if ($isalias(%rrgui.obj)) { %rrgui.obj $2- }
  }
}
alias rrgui.do {
  set %rrgui.do.tmp $remove($1,@) $+ .do
  if ($isalias(%rrgui.do.tmp)) { %rrgui.do.tmp $2- }
  else { rrgui.dialog oko 130 Center Error 31 The Required alias~' $+ %rrgui.do.tmp $+ '~can't be found. }
}
alias rrgui.dropdown.check {
  if ($sline(@gui.dropdown,1) != $null) {
    .timerDropDown Off
    rrgui.dropdown $1 2 $2- $sline(@gui.dropdown,1)
    rrgui.do $remove($1,@) $2 $3 $sline(@gui.dropdown,1)
    remini $scriptdirrrgui2.ini $remove($1,@) sclick
    writeini $scriptdirrrgui2.ini $remove($1,@) $rrgui.parmdot($2,$3,$4,$5,Open) No
    unset %rrgui.textbox.dropfrom
    set %rrgui.drop.halt Yes
    window -h @gui.dropdown
    ; If I close the window at this stage mIRC wont close it and the window becomes uncloseabel. 
    ; Hopefully this bug will be fixed untill next version og mIRC
    .timer -m 1 1 window -c @gui.dropdown
  }
}
on 1:input: {
  if ($active == @gui.textbox) { rrgui.input $1- }
}
alias rrgui.input {
  set %rrgui.check.window $readini $scriptdirrrgui2.ini $remove(%rrgui.textbox.dropfrom,@) sclick
  rrgui.textbox %rrgui.textbox.dropfrom 2 $replace($remove($gettok(%rrgui.check.window,2-,32),Open),$chr(46),$chr(32)) $1- $chr(160)
  set %rrgui.handele.tmp $remove($gettok(%rrgui.check.window,2-,32),Open) 
  rrgui.do $remove(%rrgui.textbox.dropfrom,@) $gettok(%rrgui.handele.tmp,1,46) $gettok(%rrgui.handele.tmp,2,46) $1-
  writeini $scriptdirrrgui2.ini $remove(%rrgui.textbox.dropfrom,@) $replace($gettok(%rrgui.check.window,2-,32),Open,Text) $1-
  window -c @gui.textbox
  remini $scriptdirrrgui2.ini $remove(%rrgui.textbox.dropfrom,@) sclick
  writeini $scriptdirrrgui2.ini $remove(%rrgui.textbox.dropfrom,@) $gettok(%rrgui.check.window,2-,32) No
  unset %rrgui.textbox.dropfrom
  halt
}
alias rrgui echo $colour(info) -s RR-Gui $rrgui.version ( $+ $rrgui.fullver $+ ) for mIRC version $rrgui.mircver | echo $colour(info) -s Use rrgui.about for more info
alias rrgui.about $iif($isalias(rrgui.about.go),rrgui.about.go,echo 2 -s This feature is a part of the configuration tool and it's not installed.)
alias rrgui.version return 3.0
alias rrgui.fullver return 3.00.162
alias rrgui.mircver return 5.41
alias rrgui.date return August 13, 1998
alias rrgui.settings return $readini $scriptdirrrgui2.ini Settings $1
alias rrgui.parmdot return $1 $+ . $+ $2 $+ . $+ $3 $+ . $+ $4 $+ $5
alias rrgui.dropheight return $iif($round($calc(13 * $1 +2),0) > 81,81,$round($calc(13 * $1 +2),0))
alias rrgui.droplines writeini $scriptdirrrgui2.ini $remove($1,@) $2 $+ Line $+ $3 $4-
alias rrgui.center return $round( $calc( $calc( $window(-3).w /2) - $calc( $1 /2) ) ,0) $round( $calc( $calc( $window(-3).h /2) - $calc( $2 /2) ) ,0) $1 $2
alias rrgui.tcenter return $round( $calc( $calc( $window(-3).w /2) - $calc( $1 /2) ) ,0) $round( $calc( $calc( $window(-3).h /3) - $calc( $2 /2) ) ,0) $1 $2
alias rrgui.makegroup {
  set %rrgui.makegroup. [ $+ [ $1 ] ] 0
  remini $scriptdirrrgui2.ini $1
}
alias rrgui.window  {
  if ($2 != FreePos) {
    .timer $+ $1 -m 0 10 rrgui.wincheck $1-
    window -par +f $1 $rrgui.center($2,$3) $1
    rrgui.window2 $1-
  }
  if ($2 == FreePos) { 
    .timer $+ $1 -m 0 10 rrgui.wincheck $1 $5-
    window -par +f $1 $3-6 $1
    rrgui.window2 $1 $5-
  }
}
alias rrgui.window2  {
  drawrect -rf $1 $rrgui.color(1) 1 0 0 $2 $3
  if ($4 > 0) {
    rrgui.fade $1 1 0 0 $calc($2 -3) 17
    writeini $scriptdirrrgui2.ini $remove($1,@) Toolbar 0 0 $calc( $2 -3 ) 17
  }
  rrgui.window3 $1-
}
alias rrgui.window3 {
  if ($4 > 2) {
    rrgui.toolbutton $1 1 $calc( $2 - 58) 2 15 13
    drawrect -nrf $1 $rrgui.color(1) 1 $calc( $2 - 56) 4 11 9
    drawtext -nr $1 $rrgui.color(5) Marlett 10 $calc( $2 - 55) 4 0
    rrgui.toolbutton $1 1 $calc( $2 - 42) 2 15 13
    drawrect -nrf $1 $rrgui.color(1) 1 $calc( $2 - 40) 4 11 9
    drawtext -nr $1 $rrgui.color(5) Marlett 10 $calc( $2 - 39) 4 1
  }
  if ($4 > 1) {
    rrgui.toolbutton $1 1 $calc( $2 - 24) 2 15 13
    drawrect -nrf $1 $rrgui.color(1) 1 $calc( $2 - 22) 4 11 9
    drawtext -nr $1 $rrgui.color(5) Marlett 10 $calc( $2 - 21) 4 r
  }
  if ($4 > 0) {
    if ($5 != Center) { drawtext -ro $1 $rrgui.color(6) "Ms Sans Serif" 16 $5 1 $6- }
    if ($5 == Center) { rrgui.txt2 $1 1 0 $2 20 18 $6- }
  }
}
alias rrgui.wincheck {
  if ($window($1) == $null) { .timer $+ $1 off | halt }
  set %rrgui.wincheck.win $readini $scriptdirrrgui2.ini $remove($1,@) Active
  if (%rrgui.wincheck.win == $null) { writeini $scriptdirrrgui2.ini $remove($1,@) Active Yes }
  if ($active == @gui.dropdown) || ($active == @gui.textbox) { halt }
  if ($active == $1) && (%rrgui.wincheck.win == No) {
    writeini $scriptdirrrgui2.ini $remove( $1, @) Active Yes
    if ($4 != 0) { rrgui.fade $1 1 $readini $scriptdirrrgui2.ini $remove($1,@) Toolbar }
    rrgui.window3 $1-
    drawdot $1
  } 
  if ($active != $1) && (%rrgui.wincheck.win == Yes) {
    writeini $scriptdirrrgui2.ini $remove( $1, @) Active No
    if ($4 != 0) { rrgui.fade $1 2 $readini $scriptdirrrgui2.ini $remove($1,@) Toolbar }
    set %rrgui.wincheck.tmp %rrgui.handle.lastobject. [ $+ [ $1 ] ]
    if (%rrgui.wincheck.tmp != $null) && (%rrgui.wincheck.tmp != DoNull) { $replace(%rrgui.wincheck.tmp,*num*,1) }
    unset %rrgui.wincheck.tmp %rrgui.handle.lastobject. [ $+ [ $1 ] ]
    rrgui.window3 $1-
    drawdot $1
  }
}
alias rrgui.close {
  .timer $+ $1 off
  .timer 1 0 window -c $1
  window -c @gui.textbox
  window -c @gui.dropdown
  remini $scriptdirrrgui2.ini $remove($1,@)
  halt
}
alias rrgui.dialog {
  unset %rrgui.dialog.do*
  set %rrgui.toolbar 1
  window -c @gui.dialog 
  window -phr +f @gui.dialog $rrgui.tcenter(260,$2)
  rrgui.window @gui.dialog FreePos $rrgui.tcenter(260,$2) 2 $3 $replace($4,~,$chr(32))
  window -a @gui.dialog
  .timerDialog -m 0 10 rrgui.wincheck @gui.dialog 260 $2 2 $3 $replace($4,~,$chr(32))
  if ($5 != 0) { rrgui.icon $5 @gui.dialog 10 27 }
  if ($1 == oko) { rrgui.realbutton @gui.dialog 1 75 $calc( $2 -45) 90 30 }
  else { rrgui.realbutton @gui.dialog 1 20 $calc( $2 -45) 90 30 | rrgui.realbutton @gui.dialog 1 130 $calc( $2 -45) 90 30 }
  if ($gettok($6-,1,126) != $null) { drawtext -rn @gui.dialog $rrgui.color(5) "Ms Sans Serif" 16 50 30 $gettok($6-,1,126) }
  if ($gettok($6-,2,126) != $null) { drawtext -rn @gui.dialog $rrgui.color(5) "Ms Sans Serif" 16 50 45 $gettok($6-,2,126) }
  if ($gettok($6-,3,126) != $null) { drawtext -rn @gui.dialog $rrgui.color(5) "Ms Sans Serif" 16 50 60 $gettok($6-,3,126) }
  if ($gettok($6-,4,126) != $null) { drawtext -rn @gui.dialog $rrgui.color(5) "Ms Sans Serif" 16 50 75 $gettok($6-,4,126) }
  if ($1 == yn) { drawtext -rn @gui.dialog $rrgui.color(5) 50 $calc( $2 -37) Yes | drawtext -r @gui.dialog $rrgui.color(5) 165 $calc( $2 -37) No }
  if ($1 == ok) { drawtext -rn @gui.dialog $rrgui.color(5) 55 $calc( $2 -37) OK | drawtext -r @gui.dialog $rrgui.color(5) 155 $calc( $2 -37) Cancel }
  if ($1 == oko) { drawtext -rn @gui.dialog $rrgui.color(5) 110 $calc( $2 -37) OK }
  drawdot @gui.dialog
  set %rrgui.type $1
}
alias gui.dialog.objects {
  set %rrgui.dialog.button.top $window($active).h | dec %rrgui.dialog.button.top 45
  if ($inrect($1,$2,0,0,236,13)) { return Titlebar }
  if ($inrect($1,$2,236,2,15,13)) { return ToolButton 236 2 15 13 }
  if (%rrgui.type == ok) || (%rrgui.type == yn) {
    if ($inrect($1,$2,20,%rrgui.dialog.button.top ,90,30)) { return RealButton 20 %rrgui.dialog.button.top 90 30 }
    if ($inrect($1,$2,130,%rrgui.dialog.button.top ,90,30)) { return RealButton 130 %rrgui.dialog.button.top 90 30 }
  }
  else {
    if ($inrect($1,$2,75,%rrgui.dialog.button.top ,90,30)) { return RealButton 75 %rrgui.dialog.button.top 90 30 }
  }
}
alias gui.dialog.do {
  .timerDialog off
  set %rrgui.dialog.button.top $window($active).h | dec %rrgui.dialog.button.top 45
  .timer 1 0 unset %rrgui.dialog.*
  .timer 1 0 rrgui.close @gui.dialog
  if (%rrgui.type == ok) || (%rrgui.type == yn) {
    if ($inrect($1,$2,20,%rrgui.dialog.button.top ,90,30)) { %rrgui.dialog.do1 }
    if ($inrect($1,$2,130,%rrgui.dialog.button.top ,90,30)) { %rrgui.dialog.do2 }
  }
  else {
    if ($inrect($1,$2,75,%rrgui.dialog.button.top ,90,30)) { %rrgui.dialog.do1 }
  }
}
menu @gui.dialog {
  sclick rrgui.handle sclick $active
  mouse rrgui.handle mouse $active
  uclick rrgui.handle uclick $active
}
alias rrgui.icon {
  if ($1 <= 15) { set %rrgui.copy.y 21 | set %rrgui.copy.tmp 1 }
  if ($1 <= 30) && ($1 > 15) { set %rrgui.copy.y 54 | set %rrgui.copy.tmp 16 }
  if ($1 <= 45) && ($1 > 30) { set %rrgui.copy.y 87 | set %rrgui.copy.tmp 31 }
  if ($1 <= 60) && ($1 > 45) { set %rrgui.copy.y 120 | set %rrgui.copy.tmp 46 }
  if ($1 <= 75) && ($1 > 60) { set %rrgui.copy.y 153 | set %rrgui.copy.tmp 61 }
  if ($1 <= 90) && ($1 > 75) { set %rrgui.copy.y 186 | set %rrgui.copy.tmp 76 }
  set %rrgui.copy.x $calc( $calc( $calc($1 - %rrgui.copy.tmp) *33) +1)
  drawcopy -nt @rrgui.fade $rgb(255,0,255) %rrgui.copy.x %rrgui.copy.y 31 31 $2-
  unset %rrgui.copy.*
}
alias rrgui.txt {
  if ($width($7-,"Ms Sans Serif",$6,0,0) > $4) || ($height($7-,"Ms Sans Serif",$6) > $5) { return }
  set %rrgui.text.width $calc($width($7-,"Ms Sans Serif",$6,0,0) /2)
  set %rrgui.text.width.max $calc( $4 / 2 )
  set %rrgui.text.left $round( $calc( %rrgui.text.width.max - %rrgui.text.width + $2),0)
  set %rrgui.text.height $calc($height($7-,"Ms Sans Serif",$6) /2)
  set %rrgui.text.height.max $calc( $5 / 2 )
  set %rrgui.text.top $round( $calc( %rrgui.text.height.max - %rrgui.text.height + $3),0)
  drawtext -nrc $1 $rrgui.color(5) "Ms Sans Serif" $6 %rrgui.text.left %rrgui.text.top $calc($width($7-,"Ms Sans Serif",$6,0,0) *1.25) $calc($height($7-,"Ms Sans Serif",$6) *1.25) $7-
  unset %rrgui.text.width* %rrgui.text.height* %rrgui.text.top %rrgui.text.left
}
alias rrgui.txt2 {
  set %rrgui.text.width $width($7-,"Ms Sans Serif",$6,B,0)
  if (%rrgui.text.width > $4) { halt }
  set %rrgui.text.width2 $calc( %rrgui.text.width / 2 )
  set %rrgui.text.width.max $calc( $4 / 2 )
  set %rrgui.text.left $round( $calc( %rrgui.text.width.max - %rrgui.text.width2 + $2),0)
  drawtext -nrco $1 $rrgui.color(6) "Ms Sans Serif" $6 %rrgui.text.left $calc($3 +1) $calc(%rrgui.text.width *1.25) $calc($height($7-,"Ms Sans Serif",$6) *1.25) $7-
  unset %rrgui.text.width* %rrgui.text.left
}
alias rrgui.makeini {
  set %rrgui.makeini.tmp $readini $scriptdirrrgui.ini $1 $2
  if (%rrgui.makeini.tmp == $null) { writeini $scriptdirrrgui.ini $1 $2 $3- }
}
alias rrgui.createini {
  rrgui.makeini Titlebar 1 0,0,128
  rrgui.makeini Titlebar 2 16,136,208
  rrgui.makeini Titlebar 3 128,128,128
  rrgui.makeini Titlebar 4 184,184,184
  rrgui.makeini Objects Button rrgui.button
  rrgui.makeini Objects RealButton rrgui.realbutton
  rrgui.makeini Objects ToolButton rrgui.toolbutton
  rrgui.makeini Objects CheckBox rrgui.checkbox
  rrgui.makeini Objects RadioButton rrgui.radiobutton
  rrgui.makeini Objects TextBox rrgui.textbox
  rrgui.makeini Objects DropDown rrgui.dropdown
  rrgui.makeini Objects rIcon rrgui.rIcon
  rrgui.makeini Objects rText rrgui.rText
  rrgui.makeini Objects Box rrgui.box
  rrgui.makeini Colors 1 192,192,192
  rrgui.makeini Colors 2 255,255,255
  rrgui.makeini Colors 3 128,128,128
  rrgui.makeini Colors 4 0,0,0
  rrgui.makeini Colors 5 0,0,0
  rrgui.makeini Colors 6 255,255,255
  rrgui.makeini Files IconFile rrgui.bmp
  rrgui.makeini Files ColorFile rrcolor.bmp
  rrgui.makeini Files EditorFile rrgep.bmp
  rrgui.makeini Editor 1 $true
  rrgui.makeini Editor 2 $true
  rrgui.makeini Editor 3 $true
  rrgui.makeini Editor 4 $false
  rrgui.makeini Editor 5 $true
  rrgui.makeini Help Path Online
}
alias rrgui.uload if ($script($1)) { .unload -rs $1 }
alias rrgui.load if ($exists($scriptdir [ $+ [ $1 ] ] )) { .load -rs $scriptdir [ $+ [ $1 ] ] }
alias rrgui.unload {
  if ($?!="Are you sure you want to uninstall RR-Gui? $crlf ") {
    rrgui.uload rr-guiobj.mrc
    rrgui.uload rr-guiconf.mrc
    rrgui.uload rr-guie.mrc
    rrgui.uload rr-guie2.mrc
    rrgui.uload rr-guie3.mrc
    .timer 1 0 .unload -rs rr-gui.mrc
    .timer 1 0 echo $colour(info) -s *** RR-Gui $rrgui.version has been uninstalled.
  }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		- BO ????
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias drawtext {
  if ($1 == do) { drawtext $2- }
  else {
    if (c isin $1) && ($left($1,1) == -) { drawtext $1- }
    else {
      if ($chr(34) isin $1-) { drawtext2 $gettok($1-,1,34) " $+ $replace($gettok($1-,2,34),$chr(32),$chr(160)) $+ " $gettok($1-,3,34) }
      else { drawtext2 $1- }
    }
  }
}
alias drawtext2 {
  if ($left($1,1) == -) {
    if (b isin $1) { drawtext do $1 $+ c $2-4 $iif($5 isnum,Fixedsys,$replace($5,$chr(160),$chr(32))) $iif($5 isnum,9,$6) $iif($4 isnum,$5-6,$7-8) $window($2).w $window($2).h $iif($4 isnum,$7-,$9-) }
    else { drawtext do $1 $+ c $2-3 $iif($4 isnum,Fixedsys,$replace($4,$chr(160),$chr(32))) $iif($4 isnum,9,$5) $iif($4 isnum,$4-5,$6-7) $window($2).w $window($2).h $iif($4 isnum,$6-,$8-) }
  }
  else { drawtext do -c $1-2 $iif($3 isnum,Fixedsys,$replace($3,$chr(160),$chr(32))) $iif($3 isnum,9,$4) $iif($3 isnum,$3-4,$5-6) $window($1).w $window($1).h $iif($3 isnum,$5-,$7-) }
}
