			RR GUI 3.0 Visual Editor by EAE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This script was created by Emil A Eklund (EAE) If you have any questions and/or comments
feel free to E-Mail me, eae@eae.net, or find me as EAE on DALnet, my ICQ Uin is 2473022.
Feel free to include this addon in your own script(-s) as long as you're giving me credits for it. 
Check ReadMe array for more information.				         EAE

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias rrge {
  unset %rrge.*
  if (%rrge-pos.obj == $null) { set %rrge-pos.obj 5 5 }
  rrgui.window @rrge.Toolbar FreePos %rrge-pos.obj 147 350 0
  rrgui.box @rrge.Toolbar 2 5 5 130 18
  drawtext -nro @rrge.Toolbar $rgb(0,0,0) "Ms Sans Serif" 14 45 7 Objects
  rrge.objbutt
  rrgui.realbutton @rrge.Toolbar 1 5 259 63 20 Load
  rrgui.realbutton @rrge.Toolbar 1 72 259 63 20 Save
  rrgui.realbutton @rrge.Toolbar 1 5 281 63 20 New
  rrgui.realbutton @rrge.Toolbar 1 72 281 63 20 Close
  rrgui.realbutton @rrge.Toolbar 1 5 310 130 30 Exit
  drawdot @rrge.Toolbar
  if ($readini $scriptdirrrgui.ini Editor 4) && (%rrge-lastprj) { 
    if ($exists($scriptdirrrge.ini)) { .remove $scriptdirrrge.ini }
    .copy %rrge-lastprj $scriptdirrrge.ini
    set %rrge.file.open Yes
    unset %rrge.file.change
    rrge.update Load
  }
  else { rrge.new }
  rrge.properties
  window -a @rrge
}
alias rrge.update {
  if (%rrge-pos.prj == $null) { set %rrge-pos.prj 155 5 }
  set %rrge.add.wtmp $readini $scriptdirrrge.ini Window Pos
  if ($1 == $null) { set %rrge.add.wsize $window(@rrge).w $window(@rrge).h }
  else { 
    if ($1 == New) { set %rrge.add.wsize 450 350 }
    else { set %rrge.add.wsize $readini $scriptdirrrge.ini Window Size }
    if ($window(@rrge) == $null) {
      window -p +fs @rrge %rrge-pos.prj %rrge.add.wsize 
      unset %rrge.properties.last
      rrge.objbutt
      .timer 1 0 rrge.properties
    }
  }
  :tset
  set %rrge.add.tbar $readini $scriptdirrrge.ini Window Titlebar
  set %rrge.add.wpos $readini $scriptdirrrge.ini Window Size
  if (%rrge.add.wpos == $null) { writeini $scriptdirrrge.ini Window Pos 10 10 $true }
  if (%rrge.add.tbar == $null) { writeini $scriptdirrrge.ini Window Titlebar 3 $true Caption | goto tset }
  writeini $scriptdirrrge.ini Window Size %rrge.add.wsize
  drawrect -rfn @rrge $rgb(192,192,192) 1 0 0 4000 4000 
  rrgui.window @rrge FreePos %rrge-pos.prj %rrge.add.wsize $gettok(%rrge.add.tbar,1,32) $iif($gettok(%rrge.add.tbar,2,32) == $true,Center,5) $gettok(%rrge.add.tbar,3-,32)
  set %rrge.add.num 1
  :goadd
  set %rrge.add.txt $readini $scriptdirrrge.ini Objects %rrge.add.num
  if (%rrge.add.txt == $null) { goto doneadd }
  set %rrge.add.on 1
  if (%rrge.add.txt != Empty) {
    if ($gettok(%rrge.add.txt,1,32) == Button) || ($gettok(%rrge.add.txt,1,32) == Box) { set %rrge.add.on 2 }
    rrgui.obj $gettok(%rrge.add.txt,1,32) @rrge %rrge.add.on $remove($remove($gettok(%rrge.add.txt,2-,32),$true),$false)
    if ($gettok(%rrge.add.txt,6,32) == $true) { rrgui. [ $+ [ $gettok(%rrge.add.txt,1,32) ] ] @rrge 2 $remove($remove($gettok(%rrge.add.txt,2-,32),$true),$false) }
  }
  inc %rrge.add.num 1
  goto goadd
  :doneadd
  unset %rrge.add.*
  drawdot @rrge
  if (%rrge.properties.last == Window) { 
    unset %rrge.properties.last
    rrge.properties 0 Window 
  }
}
alias rrge.Toolbar.objects {
  if ($inrect($1,$2,5,5,130,18)) { return Titlebar }
  if (%rrge.file.open == Yes) { 
    if ($inrect($1,$2,5,27,130,20)) { return RealButton 5 27 130 20 }
    if ($inrect($1,$2,5,49,130,20)) { return RealButton 5 49 130 20 }
    if ($inrect($1,$2,5,71,130,20)) { return RealButton 5 71 130 20 }
    if ($inrect($1,$2,5,93,130,20)) { return RealButton 5 93 130 20 }
    if ($inrect($1,$2,5,115,130,20)) { return RealButton 5 115 130 20 }
    if ($inrect($1,$2,5,137,130,20)) { return RealButton 5 137 130 20 }
    if ($inrect($1,$2,5,159,130,20)) { return RealButton 5 159 130 20 }
    if ($inrect($1,$2,5,181,63,20)) { return RealButton 5 181 63 20 }
    if ($inrect($1,$2,72,181,63,20)) { return RealButton 72 181 63 20 }
    if ($inrect($1,$2,5,203,130,20)) { return RealButton 5 203 130 20 }
    if ($inrect($1,$2,5,237,130,20)) { return RealButton 5 237 130 20 }
  }
  if ($inrect($1,$2,5,259,63,20)) { return RealButton 5 259 63 20 }
  if ($inrect($1,$2,72,259,63,20)) { return RealButton 72 259 63 20 }
  if ($inrect($1,$2,5,281,63,20)) { return RealButton 5 281 63 20 }
  if ($inrect($1,$2,72,281,63,20)) { return RealButton 72 281 63 20 }
  if ($inrect($1,$2,5,310,130,30)) { return RealButton 5 310 130 30 }
}
alias rrge.Toolbar.do {
  if ($inrect($1,$2,3,3,133,21)) { rrge.about }
  if ($inrect($1,$2,5,27,130,20)) { rrge.add RealButton 1 100 40 Button }
  if ($inrect($1,$2,5,49,130,20)) { rrge.add Button 2 100 40 3D-Button }
  if ($inrect($1,$2,5,71,130,20)) { rrge.add Box 2 100 100 }
  if ($inrect($1,$2,5,93,130,20)) { rrge.add CheckBox 1 100 12 $true 12 CheckBox }
  if ($inrect($1,$2,5,115,130,20)) { rrge.add RadioButton 1 100 11 $false Group 12 RadioButton }
  if ($inrect($1,$2,5,137,130,20)) { rrge.add TextBox 1 100 20 TextBox }
  if ($inrect($1,$2,5,159,130,20)) { rrge.add DropDown 1 100 20 1 DropDown }
  if ($inrect($1,$2,5,181,63,20)) { rrge.add rText 1 100 16 Ms'Sans'Serif 14 0,0,0 Text }
  if ($inrect($1,$2,72,181,63,20)) { rrge.add rIcon 1 32 32 1 }
  if ($inrect($1,$2,5,203,130,20)) { 
    set %rrge.add.obj $file="Select Object" $scriptdir*.rro
    set %rrge.add.obj.tmp $readini %rrge.add.obj RRO ObjName
    if (%rrge.add.obj.tmp != $null) { rrge.add %rrge.add.obj.tmp $readini %rrge.add.obj RRO ObjProp }
  }
  if ($inrect($1,$2,5,237,130,20)) { rrge.compile }
  if ($inrect($1,$2,5,259,63,20)) { rrge.load }
  if ($inrect($1,$2,72,259,63,20)) { rrge.save }
  if ($inrect($1,$2,5,281,63,20)) { rrge.new }
  if ($inrect($1,$2,72,281,63,20)) { rrge.close }
  if ($inrect($1,$2,5,310,130,30)) { rrge.exit }
}
alias rrge.properties {
  if ($1 == noOpen) { 
    drawrect -rfn @rrge.Properties $rgb(192,192,192) 1 30 0 570 150
    drawtext -nro @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 240 10 No Open Project
    drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 25 There's no open project, to create a new one press the 'new'
    drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 40 button on the Objects Toolbar, or press 'Load' to open an 
    drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 55 existing one. Check Help Array for more information.
    unset %rrge.properties.last
  }
  elseif ($1 == $null) {
    remini $scriptdirrrgui2.ini rrge.properties
    if (%rrge-pos.pro == $null) { set %rrge-pos.pro 5 358 }
    rrgui.window @rrge.Properties FreePos %rrge-pos.pro 600 112 0
    rrgui.box @rrge.Properties 2 5 5 18 97
    if ($exists($rrgui.file(Editor))) { drawpic -n @rrge.Properties 9 25 $rrgui.file(Editor) }
    drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 30 10 Left:
    drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 30 35 Top:
    drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 30 60 Width:
    drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 30 85 Height:  
    rrgui.obj TextBox @rrge.Properties 1 100 5 30 20
    rrgui.obj TextBox @rrge.Properties 1 100 30 30 20
    rrgui.obj TextBox @rrge.Properties 1 100 55 30 20
    rrgui.obj TextBox @rrge.Properties 1 100 80 30 20
    rrgui.obj RealButton @rrge.Properties 1 480 5 100 25 Object Order
    rrgui.obj RealButton @rrge.Properties 1 480 40 100 25 Remove
    rrgui.obj RealButton @rrge.Properties 1 480 75 100 25 Help
    goto win
  }
  else {
    if (%rrge.properties.last == $2) && (%rrge.properties.last2 == $rrgui.parmdot($3,$4,$5,$6)) {
      if ($readini $scriptdirrrgui.ini Editor 1) {
        rrgui.obj TextBox @rrge.Properties 3 100 5 30 20 $3
        rrgui.obj TextBox @rrge.Properties 3 100 30 30 20 $4
        rrgui.obj TextBox @rrge.Properties 3 100 55 30 20 $5
        rrgui.obj TextBox @rrge.Properties 3 100 80 30 20 $6
      }
    }
    else {
      drawrect -rfn @rrge.Properties $rgb(192,192,192) 1 150 0 300 150
      if ($2 == Window) {
        :win
        drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 10 Caption:
        drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 35 Options:
        rrgui.obj CheckBox @rrge.Properties 1 220 35 95 20 Center Win
        rrgui.obj CheckBox @rrge.Properties 1 320 35 105 20 Center Caption
        rrgui.makegroup Win
        rrgui.obj RadioButton @rrge.Properties 1 220 60 95 20 Win No TitleBar
        rrgui.obj RadioButton @rrge.Properties 1 220 85 95 20 Win No Buttons
        rrgui.obj RadioButton @rrge.Properties 1 320 60 95 20 Win Close Button
        rrgui.obj RadioButton @rrge.Properties 1 320 85 95 20 Win All Buttons
        set %rrge.properties.win.caption $readini $scriptdirrrge.ini Window Titlebar
        set %rrge.properties.win.pos $readini $scriptdirrrge.ini Window Pos
        set %rrge.properties.win.size $readini $scriptdirrrge.ini Window Size
        rrgui.obj TextBox @rrge.Properties 1 220 5 200 20 $gettok(%rrge.properties.win.caption,3-,32)
        if ($gettok(%rrge.properties.win.pos,3,32)) { rrgui.obj CheckBox @rrge.Properties 2 220 35 85 20 }
        if ($gettok(%rrge.properties.win.caption,2,32)) { rrgui.obj CheckBox @rrge.Properties 2 320 35 85 20 }
        if ($gettok(%rrge.properties.win.caption,1,32) == 0) { rrgui.obj RadioButton @rrge.Properties 2 220 60 85 20 }
        if ($gettok(%rrge.properties.win.caption,1,32) == 1) { rrgui.obj RadioButton @rrge.Properties 2 220 85 85 20 }
        if ($gettok(%rrge.properties.win.caption,1,32) == 2) { rrgui.obj RadioButton @rrge.Properties 2 320 60 85 20 }
        if ($gettok(%rrge.properties.win.caption,1,32) == 3) { rrgui.obj RadioButton @rrge.Properties 2 320 85 85 20 }
        rrgui.obj TextBox @rrge.Properties 3 100 5 30 20 $gettok(%rrge.properties.win.pos,1,32)
        rrgui.obj TextBox @rrge.Properties 3 100 30 30 20 $gettok(%rrge.properties.win.pos,2,32)
        rrgui.obj TextBox @rrge.Properties 3 100 55 30 20 $gettok(%rrge.properties.win.size,1,32)
        rrgui.obj TextBox @rrge.Properties 3 100 80 30 20 $gettok(%rrge.properties.win.size,2,32)
      }
      else {
        remini $scriptdirrrgui2.ini rrge.properties
        rrgui.obj TextBox @rrge.Properties 3 100 5 30 20 $3
        rrgui.obj TextBox @rrge.Properties 3 100 30 30 20 $4
        rrgui.obj TextBox @rrge.Properties 3 100 55 30 20 $5
        rrgui.obj TextBox @rrge.Properties 3 100 80 30 20 $6
        if ($2 == Button) || ($2 == RealButton) || ($2 == ToolButton) || ($2 == TextBox) {
          set %rrge.properties.captxt Caption:
          if ($2 == TextBox) { set %rrge.properties.captxt Text: }
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 10 %rrge.properties.captxt 
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 35 Command:
          rrgui.obj TextBox @rrge.Properties 1 220 5 200 20 $7-
          rrgui.obj TextBox @rrge.Properties 1 220 30 200 20 $readini $scriptdirrrge.ini Commands $1
        }
        elseif ($2 == RadioButton) || ($2 == CheckBox) {
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 10 Caption:
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 35 Command:
          rrgui.obj TextBox @rrge.Properties 1 220 30 200 20 $readini $scriptdirrrge.ini Commands $1
          if ($2 == RadioButton) { 
            drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 60 Group:
            drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 85 Checked
            rrgui.obj TextBox @rrge.Properties 1 220 5 200 20 $9-
            rrgui.obj TextBox @rrge.Properties 1 220 55 200 20 $8
            rrgui.obj CheckBox @rrge.Properties 1 220 85 12 12
            if ($7) { rrgui.obj CheckBox @rrge.Properties 2 220 85 12 12 }
          }
          else {
            drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 60 Checked
            rrgui.obj TextBox @rrge.Properties 1 220 5 200 20 $8-
            rrgui.obj CheckBox @rrge.Properties 1 220 60 12 12
            if ($7) { rrgui.obj CheckBox @rrge.Properties 2 220 60 12 12 }
          }
        }
        elseif ($2 == DropDown) {
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 10 Default Line:
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 35 Command:
          rrgui.obj DropDown @rrge.Properties 1 220 5 200 20 $7-
          set %rrge.drop.num 1
          :dropgo
          set %rrge.drop.txt $readini $scriptdirrrge.ini Ext [ $+ [ $1 ] ] %rrge.drop.num 
          if (%rrge.drop.txt == $null) { goto dropdone }
          rrgui.droplines @rrge.Properties 220.5.200.20 %rrge.drop.num %rrge.drop.txt 
          inc %rrge.drop.num 1
          goto dropgo
          :dropdone
          unset %rrge.drop.*
          rrgui.obj TextBox @rrge.Properties 1 220 30 200 20 $readini $scriptdirrrge.ini Commands $1
          rrgui.obj RealButton @rrge.Properties 1 220 60 200 40 Add, Edit or Remove Lines
        }
        elseif ($2 == Box) { drawtext -nro @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 225 10 This object has no properties }
        elseif ($2 == rIcon) { 
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 10 Icon:
          rrgui.obj textbox @rrge.Properties 1 240 5 30 20 $7
          rrgui.obj realbutton @rrge.Properties 1 210 5 20 20 \/
          rrgui.obj realbutton @rrge.Properties 1 280 5 20 20 /\
          rrgui.obj button @rrge.Properties 3 237 40 36 36
          drawrect -rf @rrge.Properties $rgb(255,255,255) 1 239 42 32 32
          rrgui.icon $7 @rrge.Properties 239 42
          set %rrge.icon.num $7
        }
        elseif ($2 == rText) { 
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 10 Text:
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 35 Font:
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 60 Size
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 85 Color:
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 310 85 r,g,b
          rrgui.obj TextBox @rrge.Properties 1 220 5 200 20 $10-
          rrgui.obj TextBox @rrge.Properties 1 220 30 200 20 $replace($7,',$chr(32))
          rrgui.obj TextBox @rrge.Properties 1 220 55 80 20 $8
          rrgui.obj TextBox @rrge.Properties 1 220 80 80 20 $9
        }
        elseif ($2 == Place) { 
          drawtext -nro @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 260 10 Place Object
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 25 Click the mouse where you want the object, then drag it to the
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 40 size you would like it to have. Check the properties bar for the
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 55 current position and size, or singleclick to add it with the defualt
          drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 70 size. For more help about this, Press the help button to the rifght.
        }
        else { 
          set %rrge.handleobj $readini $scriptdirrrgui.ini Objects $2 $+ .properties
          if ($isalias(%rrge.handleobj)) { %rrge.handleobj draw $1- }
          else {
            drawtext -nro @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 250 10 Unsupported Object
            drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 25 The visual editor doesn't recognize this object, therefore you will
            drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 40 not be able to edit any of it's properties except position and size.
            drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 55 If you want to be able to do that, please refer to the extensions
            drawtext -nr @rrge.Properties $rgb(0,0,0) "Ms Sans Serif" 14 150 70 section of the help array. (The help button will take you there.)
          }
        }
      }
    }
    set %rrge.properties.last $2
    set %rrge.properties.last2 $rrgui.parmdot($3,$4,$5,$6)
    if ($2 == $null) { set %rrge.properties.last Window }
  }
  drawdot @rrge.Properties
}
alias rrge.Properties.objects {
  if ($inrect($1,$2,5,5,18,97)) { return Titlebar }
  if (%rrge.file.open == Yes) { 
    if ($1 >= 100) && ($1 <= 130) {
      if ($inrect($1,$2,100,5,30,20)) { return TextBox 100 5 30 20 }
      if ($inrect($1,$2,100,30,30,20)) { return TextBox 100 30 30 20 }
      if ($inrect($1,$2,100,55,30,20)) { return TextBox 100 55 30 20 }
      if ($inrect($1,$2,100,80,30,20)) { return TextBox 100 80 30 20 }
    }
    if ($1 >= 480) {
      if ($inrect($1,$2,480,5,100,25)) { return RealButton 480 5 100 25 }
      if ($inrect($1,$2,480,40,100,25)) { return RealButton 480 40 100 25 }
      if ($inrect($1,$2,480,75,100,25)) { return RealButton 480 75 100 25 }
    }
  }
  if (%rrge.properties.last == Window) {
    if ($inrect($1,$2,220,35,85,20)) { return CheckBox 220 35 95 20 }
    if ($inrect($1,$2,320,35,85,20)) { return CheckBox 320 35 105 20 }
    if ($inrect($1,$2,220,60,85,20)) { return RadioButton 220 60 95 20 }
    if ($inrect($1,$2,220,85,85,20)) { return RadioButton 220 85 95 20 }
    if ($inrect($1,$2,320,60,85,20)) { return RadioButton 320 60 95 20 }
    if ($inrect($1,$2,320,85,85,20)) { return RadioButton 320 85 95 20 }
    if ($inrect($1,$2,220,5,200,20)) { return TextBox 220 5 200 20 }
  }
  if (%rrge.properties.last == Button) || (%rrge.properties.last == RealButton) || (%rrge.properties.last == ToolButton) || (%rrge.properties.last == TextBox) || (%rrge.properties.last == RadioButton) || (%rrge.properties.last == CheckBox) {
    if ($inrect($1,$2,220,5,200,20)) { return TextBox 220 5 200 20 }
    if ($inrect($1,$2,220,30,200,20)) { return TextBox 220 30 200 20 }
    if (%rrge.properties.last == RadioButton) { 
      if ($inrect($1,$2,220,55,200,20)) { return TextBox 220 55 200 20 }
      if ($inrect($1,$2,220,85,12,12)) { return CheckBox 220 85 12 12 }
    }
    if (%rrge.properties.last == Checkbox) { 
      if ($inrect($1,$2,220,60,12,12)) { return CheckBox 220 60 12 12 }
    }
  }
  if (%rrge.properties.last == DropDown) { 
    if ($inrect($1,$2,220,5,200,20)) { return DropDOwn 220 5 200 20 }
    if ($inrect($1,$2,220,30,200,20)) { return TextBox 220 30 200 20 }
    if ($inrect($1,$2,220,60,200,40)) { return RealButton 220 60 200 40 }
  }
  if (%rrge.properties.last == rIcon) { 
    if ($inrect($1,$2,240,5,30,20)) { return TextBox 240 5 30 20 }
    if ($inrect($1,$2,210,5,20,20)) { return RealButton 210 5 20 20 }
    if ($inrect($1,$2,280,5,20,20)) { return RealButton 280 5 20 20 }
  }
  if (%rrge.properties.last == rText) { 
    if ($inrect($1,$2,220,5,200,20)) { return TextBox 220 5 200 20 }
    if ($inrect($1,$2,220,30,200,20)) { return TextBox 220 30 200 20 }
    if ($inrect($1,$2,220,55,80,20)) { return TextBox 220 55 80 20 }
    if ($inrect($1,$2,220,80,80,20)) { return TextBox 220 80 80 20 }
  }
  if (%rrge.properties.last !isin *Button*RealButton*ToolButton*CheckBox*RadioButton*TextBox*DropDown*Box) {
    set %rrge.handleobj $readini $scriptdirrrgui.ini Objects %rrge.properties.last $+ .properties
    if ($isalias(%rrge.handleobj)) { 
      set %rrge.handleobj.tmp %rrge.handleobj $+ ( $+ $replace(objects [ $1- ] ,$chr(32),$chr(44)) $+ ) 
      set -u1 %rrge.handleobj.tmp $ [ $+ [ %rrge.handleobj.tmp ] ]
      return %rrge.handleobj.tmp
    }
  }
}
alias rrge.Properties.do {
  set %rrge.file.change Yes
  if (%rrge.properties.last == Window) {
    set %rrge.properties.win.pos $readini $scriptdirrrge.ini Window Pos
    set %rrge.properties.win.size $readini $scriptdirrrge.ini Window Size
    set %rrge.properties.win.caption $readini $scriptdirrrge.ini Window Titlebar
    if ($inrect($1,$2,100,5,30,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Window Pos $3 $gettok(%rrge.properties.win.pos,2-,32) }
    if ($inrect($1,$2,100,30,30,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Window Pos $gettok(%rrge.properties.win.pos,1,32) $3 $gettok(%rrge.properties.win.pos,3,32) }
    if ($inrect($1,$2,100,55,30,20)) && ($3 != $null) { 
      writeini $scriptdirrrge.ini Window Size $3 $gettok(%rrge.properties.win.size,2,32) 
      window -p +fs @rrge 160 10 $3 $gettok(%rrge.properties.win.size,2,32)
    }
    if ($inrect($1,$2,100,80,30,20)) && ($3 != $null) { 
      writeini $scriptdirrrge.ini Window Size $gettok(%rrge.properties.win.size,1,32) $3 
      window -p +fs @rrge 160 10 $gettok(%rrge.properties.win.size,1,32) $3 
    }
    if ($inrect($1,$2,220,5,200,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Window Titlebar $gettok(%rrge.properties.win.caption,1-2,32) $3- }
    if ($inrect($1,$2,220,35,85,20)) { writeini $scriptdirrrge.ini Window Pos $gettok(%rrge.properties.win.pos,1-2,32) $3 }
    if ($inrect($1,$2,320,35,85,20)) { writeini $scriptdirrrge.ini Window Titlebar $gettok(%rrge.properties.win.caption,1,32) $3 $gettok(%rrge.properties.win.caption,3-,32) }
    if ($inrect($1,$2,220,60,85,20)) { writeini $scriptdirrrge.ini Window Titlebar 0 $gettok(%rrge.properties.win.caption,2-,32) }
    if ($inrect($1,$2,220,85,85,20)) { writeini $scriptdirrrge.ini Window Titlebar 1 $gettok(%rrge.properties.win.caption,2-,32) }
    if ($inrect($1,$2,320,60,85,20)) { writeini $scriptdirrrge.ini Window Titlebar 2 $gettok(%rrge.properties.win.caption,2-,32) }
    if ($inrect($1,$2,320,85,85,20)) { writeini $scriptdirrrge.ini Window Titlebar 3 $gettok(%rrge.properties.win.caption,2-,32) }
    if ($readini $scriptdirrrgui.ini Editor 5) {
      rrge.update
      drawdot @rrge
    }
  }
  else {
    if ($inrect($1,$2,100,5,30,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-2,32) $3 $gettok(%rrge.active.obj,4-,32) }
    if ($inrect($1,$2,100,30,30,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-3,32) $3 $gettok(%rrge.active.obj,5-,32) }
    if ($inrect($1,$2,100,55,30,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-4,32) $3 $gettok(%rrge.active.obj,6-,32) }
    if ($inrect($1,$2,100,80,30,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-5,32) $3 $gettok(%rrge.active.obj,7-,32) }
    if (%rrge.properties.last == RealButton) || (%rrge.properties.last == Button) || (%rrge.properties.last == TextBox) { 
      if ($inrect($1,$2,220,5,200,20)) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-6,32) $3- }
      if ($inrect($1,$2,220,30,200,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Commands $gettok(%rrge.active.obj,1,32) $3- }
      if ($inrect($1,$2,220,30,200,20)) && ($3 == $null) { remini $scriptdirrrge.ini Commands $gettok(%rrge.active.obj,1,32) }
    }
    if (%rrge.properties.last == RadioButton) { 
      if ($inrect($1,$2,220,30,200,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Commands $gettok(%rrge.active.obj,1,32) $3- }
      if ($inrect($1,$2,220,30,200,20)) && ($3 == $null) { remini $scriptdirrrge.ini Commands $gettok(%rrge.active.obj,1,32) }
      if ($inrect($1,$2,220,5,200,20)) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-8,32) $3- }
      if ($inrect($1,$2,220,55,200,20)) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-7,32) $3 $gettok(%rrge.active.obj,9-,32) }
      if ($inrect($1,$2,220,85,12,12)) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-6,32) $3 $gettok(%rrge.active.obj,8-,32) }      
    }
    elseif (%rrge.properties.last == Checkbox) { 
      if ($inrect($1,$2,220,30,200,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Commands $gettok(%rrge.active.obj,1,32) $3- }
      if ($inrect($1,$2,220,30,200,20)) && ($3 == $null) { remini $scriptdirrrge.ini Commands $gettok(%rrge.active.obj,1,32) }
      if ($inrect($1,$2,220,5,200,20)) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-7,32) $3- }
      if ($inrect($1,$2,220,60,12,12)) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-6,32) $3 $gettok(%rrge.active.obj,8-,32) }
          }
    elseif (%rrge.properties.last == DropDown) { 
      if ($inrect($1,$2,220,5,200,20)) { 
        writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-7,32) $3- 
        rrgui.obj DropDown @rrge.Properties 1 220 5 200 20 $gettok(%rrge.active.obj,7,32) $3-
        .timer 1 0 drawdot @rrge.Properties
      }
      if ($inrect($1,$2,220,30,200,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Commands $gettok(%rrge.active.obj,1,32) $3- }
      if ($inrect($1,$2,220,30,200,20)) && ($3 == $null) { remini $scriptdirrrge.ini Commands $gettok(%rrge.active.obj,1,32) }
      if ($inrect($1,$2,220,60,200,40)) { rrge.droplines Ext $+ $gettok(%rrge.active.obj,1,32) | halt }
    }
    elseif (%rrge.properties.last == rIcon) { 
      if ($inrect($1,$2,210,5,30,20)) { 
        dec %rrge.icon.num 1
        if (%rrge.icon.num < 1) { set %rrge.icon.num 90 }
      }
      if ($inrect($1,$2,240,5,20,20)) { 
        set %rrge.icon.num $3
        if ($3 < 1) { set %rrge.icon.num 1 }
        if ($3 > 90) { set %rrge.icon.num 90 }
      }
      if ($inrect($1,$2,280,5,20,20)) { 
        inc %rrge.icon.num 1
        if (%rrge.icon.num > 90) { set %rrge.icon.num 1 }
      }
      set %rrge.active.obj $gettok(%rrge.active.obj,1,32) $readini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1,32)
      rrgui.obj TextBox @rrge.Properties 3 240 5 30 20 %rrge.icon.num 
      drawrect -rfn @rrge.Properties $rgb(255,255,255) 1 239 42 32 32
      rrgui.icon %rrge.icon.num @rrge.Properties 239 42
      drawdot @rrge.Properties 
      writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-6,32) %rrge.icon.num 
    }
    elseif (%rrge.properties.last == rText) { 
      if ($inrect($1,$2,220,5,200,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-9,32) $3- }
      if ($inrect($1,$2,220,30,200,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-6,32) $replace($3-,$chr(32),') $gettok(%rrge.active.obj,8-,32) }
      if ($inrect($1,$2,220,55,80,20)) && ($3 != $null) { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-7,32) $3 $gettok(%rrge.active.obj,9-,32) }
      if ($inrect($1,$2,220,80,80,20)) && ($3 != $null) {
        if ($gettok($3,1,44) > 255) || $gettok($3,2,44) > 255) || $gettok($3,3,44) > 255) || ($gettok($3,1,44) < 0) || ($gettok($3,2,44) < 0) || ($gettok($3,3,44) < 0) || ($remove($3,$chr(44)) !isnum) { 
          rrgui.dialog oko 130 Center Error 32 Invalid color format.~The syntax is r,g,b where r, g and~b is numbers between 0 and 255.
          editbox @gui.textbox Error
          halt
        }
        else { writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1-8,32) $3 $gettok(%rrge.active.obj,10-,32) }
      }
    }
    if ($1 < 480) && ($readini $scriptdirrrgui.ini Editor 5) {
      rrge.update
      set %rrge.active.obj $gettok(%rrge.active.obj,1,32) $readini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1,32)
      set %rrge.active.last %rrge.active.obj 
      drawrect -rin @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32)-3) $calc($gettok(%rrge.active.obj,4,32)-3) $calc($gettok(%rrge.active.obj,5,32)+6) $calc($gettok(%rrge.active.obj,6,32)+6) 
      drawrect -rifn @rrge $rgb(0,0,0) 1 $calc($gettok(%rrge.active.obj,3,32) + $gettok(%rrge.active.obj,5,32) -5) $calc($gettok(%rrge.active.obj,4,32) + $gettok(%rrge.active.obj,6,32) -5) 7 7
      drawdot @rrge
    }
  }
  if ($inrect($1,$2,480,5,100,25)) { rrge.objorder }
  if ($inrect($1,$2,480,40,100,25)) { 
    if ($gettok(%rrge.active.obj,1,32) < 1) { rrgui.dialog oko 130 Center Error 32 No object selected.~Use the close button to close the~project window. }
    else {
      writeini $scriptdirrrge.ini Objects $gettok(%rrge.active.obj,1,32) Empty
      rrge.update
      unset %rrge.active.obj %rrge.active.last
      drawdot @rrge
      rrge.properties 0 Window
      rrge.objorder auto
    }
  }
  if ($inrect($1,$2,480,75,100,25)) { 
    if ($isalias(rrgui.help)) { rrgui.help working.htm }
    else { rrgui.dialog oko 130 Center Error 31 This requires the config panel.~Whish is not installed. }
  }
  if (%rrge.properties.last !isin *Button*RealButton*ToolButton*CheckBox*RadioButton*TextBox*DropDown*Box) {
    set %rrge.handleobj $readini $scriptdirrrgui.ini Objects %rrge.properties.last $+ .properties
    if ($isalias(%rrge.handleobj)) { %rrge.handleobj do $1- }
  }
}
