			RR GUI Configuration Panel by EAE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This script was created by Emil A Eklund (EAE) If you have any questions and/or comments
feel free to E-Mail me, eae@eae.net, or find me as EAE on DALnet, my ICQ Uin is 2473022.
Feel free to include this addon in your own script(-s) as long as you're giving me credits for it. 
Check ReadMe array for more information.				         EAE

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias rrgui.config {
  set %rrgui.config.radio 1
  rrgui.window @rrgui.config 350 230 4 Center RR-Gui Configuration
  rrgui.obj box @rrgui.config 2 5 25 70 150
  rrgui.obj box @rrgui.config 2 80 25 255 150
  rrgui.makegroup conf
  rrgui.obj radiobutton @rrgui.config 1 10 30 60 11 conf 12 Titlebar
  rrgui.obj radiobutton @rrgui.config 1 10 50 60 11 conf 12 Objects
  rrgui.obj radiobutton @rrgui.config 1 10 70 60 11 conf 12 Colors
  rrgui.obj radiobutton @rrgui.config 1 10 90 60 11 conf 12 Files
  rrgui.obj radiobutton @rrgui.config 1 10 110 60 11 conf 12 Editor
  rrgui.obj radiobutton @rrgui.config 1 10 130 60 11 conf 12 Help
  rrgui.obj radiobutton @rrgui.config 2 10 30 10 10
  rrgui.obj realbutton @rrgui.config 1 90 185 70 30 OK
  rrgui.obj realbutton @rrgui.config 1 180 185 70 30 Default
  rrgui.config.options %rrgui.config.radio
  drawdot @rrgui.config
}
alias rrconfig.color {
  set %rrgui.color $readini $scriptdirrrgui.ini Titlebar $1
  return $rgb($gettok(%rrgui.color,1,44),$gettok(%rrgui.color,2,44),$gettok(%rrgui.color,3,44))
}
alias rrgui.config.options {
  drawrect -rf @rrgui.config $rrgui.color(1) 1 82 27 250 145
  if ($1 == 1) {
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 30 Active
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 50 Inactive
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 70 Text
    rrgui.obj box @rrgui.config 1 150 30 25 15
    rrgui.obj box @rrgui.config 1 180 30 115 15
    rrgui.obj box @rrgui.config 1 300 30 25 15
    rrgui.obj box @rrgui.config 1 150 50 25 15
    rrgui.obj box @rrgui.config 1 180 50 115 15
    rrgui.obj box @rrgui.config 1 300 50 25 15
    rrgui.obj box @rrgui.config 1 150 70 25 15
    rrgui.fade @rrgui.config 1 182 32 111 11
    rrgui.fade @rrgui.config 2 182 52 111 11
    rrgui.fade @rrgui.config 1 105 110 200 17
    rrgui.fade @rrgui.config 2 105 135 200 17
    rrgui.txt2 @rrgui.config 105 109 200 15 18 Sample
    rrgui.txt2 @rrgui.config 105 134 200 15 18 Sample
    drawrect -rfn @rrgui.config $rrconfig.color(1) 1 152 32 21 11
    drawrect -rfn @rrgui.config $rrconfig.color(2) 1 302 32 21 11
    drawrect -rfn @rrgui.config $rrconfig.color(3) 1 152 52 21 11
    drawrect -rfn @rrgui.config $rrconfig.color(4) 1 302 52 21 11
    drawrect -rfn @rrgui.config $rrgui.color(6) 1 152 72 21 11
  }
  if ($1 == 2) {
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 10 90 30 Button
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 10 90 45 RealButton
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 10 90 60 ToolButton
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 10 90 75 CheckBox
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 10 90 90 RadioButton
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 10 90 105 TextBox
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 10 90 120 DropDown
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 10 90 135 Box
    rrgui.obj Button @rrgui.config 1 88 152 240 17 12 Add / Edit Custom Objects
    rrgui.config.objtype
  }
  if ($1 == 3) {
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 30 Background Color
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 50 Button Shadow 1
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 70 Button Shadow 2
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 90 Button Shadow 3
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 110 Text
    rrgui.obj box @rrgui.config 1 200 30 25 15
    rrgui.obj box @rrgui.config 1 200 50 25 15
    rrgui.obj box @rrgui.config 1 200 70 25 15
    rrgui.obj box @rrgui.config 1 200 90 25 15
    rrgui.obj box @rrgui.config 1 200 110 25 15
    rrgui.obj realbutton @rrgui.config 1 120 140 80 25 Sample
    rrgui.obj realbutton @rrgui.config 3 220 140 80 25 Sample
    drawrect -rfn @rrgui.config $rrgui.color(1) 1 202 32 21 11
    drawrect -rfn @rrgui.config $rrgui.color(2) 1 202 52 21 11
    drawrect -rfn @rrgui.config $rrgui.color(3) 1 202 72 21 11
    drawrect -rfn @rrgui.config $rrgui.color(4) 1 202 92 21 11
    drawrect -rfn @rrgui.config $rrgui.color(5) 1 202 112 21 11
  }
  if ($1 == 4) {
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 33 Icon File
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 58 Color File
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 83 Visual Editor File
    rrgui.obj TextBox @rrgui.config 1 200 33 125 20 $rrgui.file(Icon)
    rrgui.obj TextBox @rrgui.config 1 200 58 125 20 $rrgui.file(Color)
    rrgui.obj TextBox @rrgui.config 1 200 83 125 20 $rrgui.file(Editor)
  }
  if ($1 == 5) {
    if ($isalias(rrge)) {
      rrgui.obj CheckBox @rrgui.config 1 90 33 235 12 12 Update Properties While Draging *
      rrgui.obj CheckBox @rrgui.config 1 90 53 235 12 12 Confirm on New, Close and Load if changed.
      rrgui.obj CheckBox @rrgui.config 1 90 73 235 12 12 Confirm on Exit
      rrgui.obj CheckBox @rrgui.config 1 90 93 235 12 12 Start with last open project
      rrgui.obj CheckBox @rrgui.config 1 90 113 235 12 12 Update on Properties change *
      drawtext -rn @rrgui.config $rgb(0,0,0) "Ms San Serif" 12 90 133 * Disable those to gain speed.
      if ($rrge.options(1) == $true) { rrgui.obj CheckBox @rrgui.config 2 90 33 235 12 }
      if ($rrge.options(2) == $true) { rrgui.obj CheckBox @rrgui.config 2 90 53 235 12 }
      if ($rrge.options(3) == $true) { rrgui.obj CheckBox @rrgui.config 2 90 73 235 12 }
      if ($rrge.options(4) == $true) { rrgui.obj CheckBox @rrgui.config 2 90 93 235 12 }
      if ($rrge.options(5) == $true) { rrgui.obj CheckBox @rrgui.config 2 90 113 235 12 }
    }
    else { drawtext -ron @rrgui.config $rgb(0,0,0) "Ms San Serif" 14 105 30 The Visual Editor is not installed. }
  }
  if ($1 == 6) {
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 33 I want to access the help array
    set %rrgui.help.tmp $readini $scriptdirrrgui.ini Help Path
    rrgui.makegroup help
    rrgui.obj RadioButton @rrgui.config 1 110 53 235 12 help 12 over the internet.
    rrgui.obj RadioButton @rrgui.config 1 110 73 235 12 help 12 from my local hardrive. (specify path below)
    set %rrgui.help.status %rrgui.help.tmp 
    if (%rrgui.help.tmp == Online) {
      rrgui.obj RadioButton @rrgui.config 2 110 53 235 12 
      set %rrgui.help.tmp -
    }
    else { rrgui.obj RadioButton @rrgui.config 2 110 73 235 12 }
    drawtext -rn @rrgui.config $rrgui.color(5) "Ms Sans Serif" 12 90 103 Path (only if local)
    rrgui.obj TextBox @rrgui.config 1 110 120 200 20 %rrgui.help.tmp
    unset %rrgui.help.tmp
  }
  drawdot @rrgui.config 
}
alias rrgui.config.objtype {
  drawtext -rbcn @rrgui.config $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 10 160 30 150 18 $readini $scriptdirrrgui.ini Objects Button $str($chr(160),500)
  drawtext -rbcn @rrgui.config $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 10 160 45 150 18 $readini $scriptdirrrgui.ini Objects RealButton $str($chr(160),500)
  drawtext -rbcn @rrgui.config $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 10 160 60 150 18 $readini $scriptdirrrgui.ini Objects ToolButton $str($chr(160),500)
  drawtext -rbcn @rrgui.config $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 10 160 75 150 18 $readini $scriptdirrrgui.ini Objects CheckBox $str($chr(160),500)
  drawtext -rbcn @rrgui.config $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 10 160 90 150 18 $readini $scriptdirrrgui.ini Objects RadioButton $str($chr(160),500)
  drawtext -rbcn @rrgui.config $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 10 160 105 150 18 $readini $scriptdirrrgui.ini Objects TextBox $str($chr(160),500)
  drawtext -rbcn @rrgui.config $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 10 160 120 150 18 $readini $scriptdirrrgui.ini Objects DropDown $str($chr(160),500)
  drawtext -rbcn @rrgui.config $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 10 160 135 150 18 $readini $scriptdirrrgui.ini Objects Box $str($chr(160),500)
  drawdot @rrgui.config
}
alias rrgui.config.objects {
  if ($inrect($1,$2,0,2,350,13)) {
    if ($inrect($1,$2,0,0,292,13)) { return Titlebar }
    if ($inrect($1,$2,292,2,15,13)) { return ToolButton 292 2 15 13 }
    if ($inrect($1,$2,308,2,15,13)) { return ToolButton 308 2 15 13 }
    if ($inrect($1,$2,326,2,15,13)) { return ToolButton 326 2 15 13 }
  }
  if ($inrect($1,$2,10,30,60,11)) { return RadioButton 10 30 60 11 }
  if ($inrect($1,$2,10,50,60,11)) { return RadioButton 10 50 60 11 }
  if ($inrect($1,$2,10,70,60,11)) { return RadioButton 10 70 60 11 }
  if ($inrect($1,$2,10,90,60,11)) { return RadioButton 10 90 60 11 }
  if ($inrect($1,$2,10,110,60,10)) { return RadioButton 10 110 60 11 }
  if ($inrect($1,$2,10,130,60,10)) { return RadioButton 10 130 60 11 }
  if ($inrect($1,$2,90,185,70,30)) { return RealButton 90 185 70 30 }
  if ($inrect($1,$2,180,185,70,30)) { return RealButton 180 185 70 30 }
  if (%rrgui.config.radio == 2) {
    if ($inrect($1,$2,88,30,240,13)) { return Button 88 30 240 13 }
    if ($inrect($1,$2,88,45,240,13)) { return Button 88 45 240 13 }
    if ($inrect($1,$2,88,60,240,13)) { return Button 88 60 240 13 }
    if ($inrect($1,$2,88,75,240,13)) { return Button 88 75 240 13 }
    if ($inrect($1,$2,88,90,240,13)) { return Button 88 90 240 13 }
    if ($inrect($1,$2,88,105,240,13)) { return Button 88 105 240 13 }
    if ($inrect($1,$2,88,120,240,13)) { return Button 88 120 240 13 }
    if ($inrect($1,$2,88,135,240,13)) { return Button 88 135 240 13 }
    if ($inrect($1,$2,88,152,240,17)) { return Button 88 152 240 17 }
  }
  if (%rrgui.config.radio == 4) {
    if ($inrect($1,$2,200,33,125,20)) { return TextBox 200 33 125 20 }
    if ($inrect($1,$2,200,58,125,20)) { return TextBox 200 58 125 20 }
    if ($inrect($1,$2,200,83,125,20)) { return TextBox 200 83 125 20 }
  }
  if (%rrgui.config.radio == 5) {
    if ($inrect($1,$2,90,33,235,12)) { return CheckBox 90 33 235 12 }
    if ($inrect($1,$2,90,53,235,12)) { return CheckBox 90 53 235 12 }
    if ($inrect($1,$2,90,73,235,12)) { return CheckBox 90 73 235 12 }
    if ($inrect($1,$2,90,93,235,12)) { return CheckBox 90 93 235 12 }
    if ($inrect($1,$2,90,113,235,12)) { return CheckBox 90 113 235 12 }
  }
  if (%rrgui.config.radio == 6) {
    if ($inrect($1,$2,110,53,235,12)) { return RadioButton 110 53 235 12 }
    if ($inrect($1,$2,110,73,235,12)) { return RadioButton 110 73 235 12 }
    if ($inrect($1,$2,110,120,200,20)) { return TextBox 110 120 200 20 }
  }
}
alias rrgui.config.do {
  if ($inrect($1,$2,0,2,350,13)) {
    if ($inrect($1,$2,292,2,15,13)) { window -n @rrgui.config }
    if ($inrect($1,$2,308,2,15,13)) { rrgui.dialog oko 130 Center Error 31 You can not maximize RR-Gui~Windows. Check Help array for~more information. }
    if ($inrect($1,$2,326,2,15,13)) { unset %rrgui.config.* %rrcolor.* | rrgui.close @rrgui.config }
  }
  if ($inrect($1,$2,10,30,10,10)) { set %rrgui.config.radio 1 | rrgui.config.options 1 }
  if ($inrect($1,$2,10,50,10,10)) { set %rrgui.config.radio 2 | rrgui.config.options 2 }
  if ($inrect($1,$2,10,70,10,10)) { set %rrgui.config.radio 3 | rrgui.config.options 3 }
  if ($inrect($1,$2,10,90,10,10)) { set %rrgui.config.radio 4 | rrgui.config.options 4 }
  if ($inrect($1,$2,10,110,10,10)) { set %rrgui.config.radio 5 | rrgui.config.options 5 }
  if ($inrect($1,$2,10,130,10,10)) { set %rrgui.config.radio 6 | rrgui.config.options 6 }
  if ($inrect($1,$2,90,185,70,30)) { unset %rrgui.config.* %rrcolor.* | rrgui.close @rrgui.config }
  if ($inrect($1,$2,180,185,70,30)) { 
    if ($isalias(rrge) == $false) { halt }
    if (%rrgui.config.radio == 2) { 
      if ($?!="Warning, this will delete all custom objects. $+ $lf $+ Are you sure you want to continue?" == $false) { halt }
    }
    else {
      if ($?!="Warning, this will reset your custom settings. $+ $lf $+ Are you sure you want to continue?" == $false) { halt }
    }
    if (%rrgui.config.radio == 1) { remini $scriptdirrrgui.ini Titlebar }
    if (%rrgui.config.radio == 2) { remini $scriptdirrrgui.ini Objects }
    if (%rrgui.config.radio == 3) { remini $scriptdirrrgui.ini Colors }
    if (%rrgui.config.radio == 4) { remini $scriptdirrrgui.ini Files }
    if (%rrgui.config.radio == 5) { remini $scriptdirrrgui.ini Editor }
    rrgui.createini
    if (%rrgui.config.radio == 1) {
      rrgui.fade init 5 $readini $scriptdirrrgui.ini Titlebar 1 $readini $scriptdirrrgui.ini Titlebar 2 @rrgui.config 182 32 112 11
      rrgui.fade init 106 $readini $scriptdirrrgui.ini Titlebar 3 $readini $scriptdirrrgui.ini Titlebar 4 @rrgui.config 182 52 112 11 
    }
    rrgui.config.options %rrgui.config.radio 
  }
  if (%rrgui.config.radio == 2) {
    if ($inrect($1,$2,88,30,240,13)) { rrgui.config.objwrite Button }
    if ($inrect($1,$2,88,45,240,13)) { rrgui.config.objwrite RealButton }
    if ($inrect($1,$2,88,60,240,13)) { rrgui.config.objwrite ToolButton }
    if ($inrect($1,$2,88,75,240,13)) { rrgui.config.objwrite CheckBox }
    if ($inrect($1,$2,88,90,240,13)) { rrgui.config.objwrite RadioButton }
    if ($inrect($1,$2,88,105,240,13)) { rrgui.config.objwrite TextBox }
    if ($inrect($1,$2,88,120,240,13)) { rrgui.config.objwrite DropDown }
    if ($inrect($1,$2,88,135,240,13)) { rrgui.config.objwrite Box }
    if ($inrect($1,$2,88,152,240,17)) { rrgui.config.objwrite $$?="Please enter the name of the object you want to add or edit. If you do not want to add or edit any object, press the Cancel button." }
  }
  if (%rrgui.config.radio == 4) {
    if ($inrect($1,$2,200,33,1255,20)) && ($3 != $null) { writeini $scriptdirrrgui.ini Files IconFile $3- }
    if ($inrect($1,$2,200,58,1255,20)) && ($3 != $null) { writeini $scriptdirrrgui.ini Files ColorFile $3- }
    if ($inrect($1,$2,200,83,1255,20)) && ($3 != $null) { writeini $scriptdirrrgui.ini Files EditorFile $3- }
  }
  if (%rrgui.config.radio == 5) {
    if ($inrect($1,$2,90,33,235,12)) { writeini $scriptdirrrgui.ini Editor 1 $3 }
    if ($inrect($1,$2,90,53,235,12)) { writeini $scriptdirrrgui.ini Editor 2 $3 }
    if ($inrect($1,$2,90,73,235,12)) { writeini $scriptdirrrgui.ini Editor 3 $3 }
    if ($inrect($1,$2,90,93,235,12)) { writeini $scriptdirrrgui.ini Editor 4 $3 }
    if ($inrect($1,$2,90,113,235,12)) { writeini $scriptdirrrgui.ini Editor 5 $3 }
  }
  if (%rrgui.config.radio == 6) {
    if ($inrect($1,$2,110,53,235,12)) { set %rrgui.help.status Online }
    if ($inrect($1,$2,110,73,235,12)) { set %rrgui.help.status $scriptdir }
    if ($inrect($1,$2,110,120,200,20)) && ($3 != $null) { set %rrgui.help.status $3- }
    writeini $scriptdirrrgui.ini Help Path %rrgui.help.status
    rrgui.obj TextBox @rrgui.config 3 110 120 200 20 %rrgui.help.status
    drawdot @rrgui.config 
    unset %rrgui.help.status
  }
}

menu @rrgui.config {
  sclick {
    rrgui.handle sclick @rrgui.config 
    if (%rrgui.config.radio == 1) {
      if ($inrect($mouse.x,$mouse.y,150,30,25,15)) { rrcolor $rgb($rrconfig.color(1)) rrgui.congig.upd 1 }
      if ($inrect($mouse.x,$mouse.y,300,30,25,15)) { rrcolor $rgb($rrconfig.color(2)) rrgui.congig.upd 2 }
      if ($inrect($mouse.x,$mouse.y,150,50,25,15)) { rrcolor $rgb($rrconfig.color(3)) rrgui.congig.upd 3 }
      if ($inrect($mouse.x,$mouse.y,300,50,25,15)) { rrcolor $rgb($rrconfig.color(4)) rrgui.congig.upd 4 }
      if ($inrect($mouse.x,$mouse.y,150,70,25,15)) { rrcolor $rgb($rrgui.color(6)) rrgui.congig.upd text }
    }
    if (%rrgui.config.radio == 3) {
      if ($inrect($mouse.x,$mouse.y,200,30,25,15)) { rrcolor $rgb($rrgui.color(1)) rrgui.congig.upd2 1 }
      if ($inrect($mouse.x,$mouse.y,200,50,25,15)) { rrcolor $rgb($rrgui.color(2)) rrgui.congig.upd2 2 }
      if ($inrect($mouse.x,$mouse.y,200,70,25,15)) { rrcolor $rgb($rrgui.color(3)) rrgui.congig.upd2 3 }
      if ($inrect($mouse.x,$mouse.y,200,90,25,15)) { rrcolor $rgb($rrgui.color(4)) rrgui.congig.upd2 4 }
      if ($inrect($mouse.x,$mouse.y,200,110,25,15)) { rrcolor $rgb($rrgui.color(5)) rrgui.congig.upd2 5 }
    }
  }
  mouse rrgui.handle mouse @rrgui.config 
  uclick rrgui.handle uclick @rrgui.config 
}
alias rrgui.config.objwrite {
  writeini $scriptdirrrgui.ini Objects $1 $$?="Please enter the alias for this object in the box below. If you do not want to change this, press the Cancel button."
  rrgui.config.objtype 
}
alias rrgui.congig.upd {
  if ($1 isnum) { writeini $scriptdirrrgui.ini Titlebar $1 $2 }
  if ($1 == 1) || ($1 == 2) { 
    drawrect -rf @rrgui.config $rrconfig.color(1) 1 152 32 21 11
    drawrect -rf @rrgui.config $rrconfig.color(2) 1 302 32 21 11
    rrgui.fade init 5 $readini $scriptdirrrgui.ini Titlebar 1 $readini $scriptdirrrgui.ini Titlebar 2 @rrgui.config 182 32 112 11 
    rrgui.fade @rrgui.config 1 105 110 200 18
    rrgui.txt2 @rrgui.config 105 109 200 15 18 Sample
  }
  if ($1 == 3) || ($1 == 4) {     
    drawrect -rf @rrgui.config $rrconfig.color(3) 1 152 52 21 11
    drawrect -rf @rrgui.config $rrconfig.color(4) 1 302 52 21 11
    rrgui.fade init 106 $readini $scriptdirrrgui.ini Titlebar 3 $readini $scriptdirrrgui.ini Titlebar 4 @rrgui.config 182 52 112 11 
    rrgui.fade @rrgui.config 2 105 135 200 18
    rrgui.txt2 @rrgui.config 105 134 200 15 18 Sample
  }
  if ($1 == text) {
    writeini $scriptdirrrgui.ini Colors 6 $2
    drawrect -rf @rrgui.config $rrgui.color(6) 1 152 72 21 11
    rrgui.fade @rrgui.config 1 105 110 200 15
    rrgui.fade @rrgui.config 2 105 135 200 15
    rrgui.txt2 @rrgui.config 105 109 200 15 18 Sample
    rrgui.txt2 @rrgui.config 105 134 200 15 18 Sample
  }
  drawdot @rrgui.config
}
alias rrgui.congig.upd2 {
  writeini $scriptdirrrgui.ini Colors $1 $2
  drawrect -rfn @rrgui.config $rrgui.color(1) 1 202 32 21 11
  drawrect -rfn @rrgui.config $rrgui.color(2) 1 202 52 21 11
  drawrect -rfn @rrgui.config $rrgui.color(3) 1 202 72 21 11
  drawrect -rfn @rrgui.config $rrgui.color(4) 1 202 92 21 11
  drawrect -rfn @rrgui.config $rrgui.color(5) 1 202 112 21 11
  rrgui.obj realbutton @rrgui.config 1 120 140 80 25 Sample
  rrgui.obj realbutton @rrgui.config 3 220 140 80 25 Sample
  drawdot @rrgui.config
}
alias rrgui.help {
  set %rrgui.help.tmp $readini $scriptdirrrgui.ini Help Path
  if (%rrgui.help.tmp == Online) { run http://eae.net/rr/gui/tutor/ $+ $1 }
  else {
    if ($righ(%rrgui.help.tmp,1) == \) { set %rrgui.help.tmp2 %rrgui.help.tmp $+ $1 }
    else { set %rrgui.help.tmp2 %rrgui.help.tmp $+ \ $+ $1 }
    if ($exists(%rrgui.help.tmp2)) { run %rrgui.help.tmp2 }
    else { rrgui.dialog oko 130 Center Error 31 Can't find help array, check your~settings in the config panel. }
  }
}

alias rrcolor {
  rrgui.window @rrcolor 300 270 1 Center RR Color Picker
  rrgui.button @rrcolor 3 5 25 176 188
  rrgui.button @rrcolor 3 186 25 10 188
  rrgui.button @rrcolor 3 205 25 40 25
  rrgui.button @rrcolor 3 250 25 40 25
  drawtext -rn @rrcolor $rrgui.color(5) "Ms Sans Serif" 12 215 178 RGB Color:
  rrgui.textbox @rrcolor 1 205 193 80 20 r,g,b
  rrgui.realbutton @rrcolor 1 60 225 70 30 OK
  rrgui.realbutton @rrcolor 1 140 225 70 30 Cancel
  if ($exists($rrgui.file(Color))) { drawpic -n @rrcolor 6 26 $rrgui.file(Color) }
  drawtext -r @rrcolor $rrgui.color(5) "Ms Sans Serif" 12 205 60 R: -
  drawtext -r @rrcolor $rrgui.color(5) "Ms Sans Serif" 12 205 75 G: -
  drawtext -r @rrcolor $rrgui.color(5) "Ms Sans Serif" 12 205 90 B: -
  drawtext -rn @rrcolor $rrgui.color(5) "Ms Sans Serif" 12 250 60 $gettok($1,1,44)
  drawtext -rn @rrcolor $rrgui.color(5) "Ms Sans Serif" 12 250 75 $gettok($1,2,44)
  drawtext -rn @rrcolor $rrgui.color(5) "Ms Sans Serif" 12 250 90 $gettok($1,3,44)
  drawrect -rf @rrcolor $rgb($gettok($1,1,44),$gettok($1,2,44),$gettok($1,3,44))  1 251 26 38 23
  drawdot @rrcolor
  set %rrcolor.to $2-
  rrgui.color.fade 26 255,255,255 $1
  rrgui.color.fade 119 $1 0,0,0  
}
alias rrcolor.objects {
  if ($inrect($1,$2,0,0,300,13)) { return Titlebar }
  if ($inrect($1,$2,205,193,80,20)) { return TextBox 205 193 80 20 }
  if ($inrect($1,$2,60,225,70,30)) { return RealButton 60 225 70 30 }
  if ($inrect($1,$2,140,225,70,30)) { return RealButton 140 225 70 30 }
}
alias rrcolor.do {
  if ($inrect($1,$2,205,193,80,20)) {
    if ($gettok($3,1,44) >= 0) && ($gettok($3,1,44) <= 255) &&  ($gettok($3,2,44) >= 0) && ($gettok($3,2,44) <= 255) &&  ($gettok($3,3,44) >= 0) && ($gettok($3,3,44) <= 255) { 
      drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 250 60 40 12 $gettok($3,1,44) $str($chr(160),100)
      drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 250 75 40 12 $gettok($3,2,44) $str($chr(160),100)
      drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 250 90 40 12 $gettok($3,3,44) $str($chr(160),100)
      drawrect -rf @rrcolor $rgb($gettok($3,1,44),$gettok($3,2,44),$gettok($3,3,44)) 1 251 26 38 23  
      rrgui.color.fade 26 255,255,255 $rgb($rgb($gettok($3,1,44),$gettok($3,2,44),$gettok($3,3,44)))
      rrgui.color.fade 119 $rgb($rgb($gettok($3,1,44),$gettok($3,2,44),$gettok($3,3,44))) 0,0,0
    }
  }
  if ($inrect($1,$2,60,225,70,30)) { 
    %rrcolor.to $rgb($getdot(@rrcolor,255,30))
    unset %rrcolor.* 
    rrgui.close @rrcolor
  }
  if ($inrect($1,$2,140,225,70,30)) { 
    unset %rrcolor.* 
    rrgui.close @rrcolor 
  }
}
menu @rrcolor {
  mouse {
    rrgui.handle mouse $active
    if ($inrect($mouse.x,$mouse.y,6,26,174,186)) || ($inrect($mouse.x,$mouse.y,187,26,10,186)) {
      set %rrcolor.stat WasIn
      drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 205 60 40 12 R: $gettok($rgb($getdot(@rrcolor,$mouse.x,$mouse.y)),1,44) $str($chr(160),100)
      drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 205 75 40 12 G: $gettok($rgb($getdot(@rrcolor,$mouse.x,$mouse.y)),2,44) $str($chr(160),100)
      drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 205 90 40 12 B: $gettok($rgb($getdot(@rrcolor,$mouse.x,$mouse.y)),3,44) $str($chr(160),100)
      drawrect -rf @rrcolor $getdot(@rrcolor,$mouse.x,$mouse.y) 1 206 26 38 23
    }  
    else {
      if (%rrcolor.stat == WasIn) {
        unset %rrcolor.stat WasIn
        drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 205 60 40 12 R: - $str($chr(160),100)
        drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 205 75 40 12 G: - $str($chr(160),100)
        drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 205 90 40 12 B: - $str($chr(160),100)
        drawrect -rf @rrcolor $rrgui.color(1) 1 206 26 38 23
      }
    }
  }
  sclick {
    rrgui.handle sclick $active
    if ($inrect($mouse.x,$mouse.y,6,26,174,186)) || ($inrect($mouse.x,$mouse.y,187,26,10,186)) {
      drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 250 60 40 12 $gettok($rgb($getdot(@rrcolor,$mouse.x,$mouse.y)),1,44) $str($chr(160),100)
      drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 250 75 40 12 $gettok($rgb($getdot(@rrcolor,$mouse.x,$mouse.y)),2,44) $str($chr(160),100)
      drawtext -rbc @rrcolor $rrgui.color(5) $rrgui.color(1) "Ms Sans Serif" 12 250 90 40 12 $gettok($rgb($getdot(@rrcolor,$mouse.x,$mouse.y)),3,44) $str($chr(160),100)
      drawrect -rf @rrcolor $getdot(@rrcolor,$mouse.x,$mouse.y) 1 251 26 38 23  
    }
    if ($inrect($mouse.x,$mouse.y,6,26,174,186)) {
      rrgui.color.fade 26 255,255,255 $rgb($getdot(@rrcolor,$mouse.x,$mouse.y))
      rrgui.color.fade 119 $rgb($getdot(@rrcolor,$mouse.x,$mouse.y)) 0,0,0
    }
  }
  uclick rrgui.handle uclick $active
}
alias rrgui.color.fade {
  set %rrgui.fade.dec1 $calc( $calc( $gettok($2,1,44) - $gettok($3,1,44) ) / 94)
  set %rrgui.fade.dec2 $calc( $calc( $gettok($2,2,44) - $gettok($3,2,44) ) / 94)
  set %rrgui.fade.dec3 $calc( $calc( $gettok($2,3,44) - $gettok($3,3,44) ) / 94)
  set %rrgui.fade.c1 $gettok($2,1,44)
  set %rrgui.fade.c2 $gettok($2,2,44)
  set %rrgui.fade.c3 $gettok($2,3,44)
  set %rrgui.fade.num 0
  :go
  set %rrgui.fade.c1 $calc(%rrgui.fade.c1 - %rrgui.fade.dec1)
  set %rrgui.fade.c2 $calc(%rrgui.fade.c2 - %rrgui.fade.dec2)
  set %rrgui.fade.c3 $calc(%rrgui.fade.c3 - %rrgui.fade.dec3)
  if (%rrgui.fade.num == 94) { goto done }
  drawline -r @rrcolor $rgb(%rrgui.fade.c1,%rrgui.fade.c2,%rrgui.fade.c3) 1 187 $calc($1 + %rrgui.fade.num) 195 $calc($1 + %rrgui.fade.num)
  inc %rrgui.fade.num 1
  goto go
  :done
  unset %rrgui.fade.*
}
alias rrgui.about.go {
  rrgui.window @rrgui.about 370 270 2 Center About
  rrgui.obj Box @rrgui.about 2 3 22 355 195
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 20 35 100 16 Version:
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 130 35 100 16 $rrgui.version ( $+ $rrgui.fullver $+ )
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 20 55 100 16 Date:
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 130 55 100 16 $rrgui.date
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 150 100 100 16 Required
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 250 100 100 16 Your system
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 20 120 100 16 mIRC Version:
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 20 140 100 16 Operative system:
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 20 160 100 16 Screen Resolution:
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 62 180 100 16 For editor:
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 150 120 75 16 5.41
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 150 140 75 16 win95, NT4
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 150 160 75 16 640*480
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 150 180 75 16 800*600
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 250 120 75 16 $version
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 250 140 75 16 win $+ $os
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 250 160 75 16 $window(-1).w $+ * $+ $window(-1).h
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 14 250 180 75 16 $window(-1).w $+ * $+ $window(-1).h
  drawtext -rbc @rrgui.about $rgb(0,0,0) $rgb(192,192,192) "Ms Sans Serif" 12 100 200 150 16 Click a topic for more information.
  rrgui.Icon 1 @rrgui.about 305 34 31 31
  rrgui.obj RealButton @rrgui.about 1 70 225 100 30 Close
  rrgui.obj RealButton @rrgui.about 1 190 225 100 30 Uninstall
  drawdot @rrgui.about
}
alias rrgui.about.objects {
  if ($inrect($1,$2,346,2,15,13)) { return ToolButton 346 2 15 13 }
  if ($inrect($1,$2,0,0,370,13)) { return Titlebar }
  if ($inrect($1,$2,15,118,325,18)) { return Button 15 118 325 18 }
  if ($inrect($1,$2,15,138,325,18)) { return Button 15 138 325 18 }  
  if ($inrect($1,$2,15,158,325,18)) { return Button 15 158 325 18 }  
  if ($inrect($1,$2,15,178,325,18)) { return Button 15 178 325 18 }  
  if ($inrect($1,$2,70,225,100,30)) { return RealButton 70 225 100 30 }
  if ($inrect($1,$2,190,225,100,30)) { return RealButton 190 225 100 30 }
}
alias rrgui.about.do {
  if ($inrect($1,$2,346,2,15,13)) { unset rrgui.about.* | rrgui.close @rrgui.about }
  if ($inrect($1,$2,15,118,325,18)) { rrgui.obj Button @rrgui.about 1 15 118 325 18 | rrgui.dialog oko 130 Center Info 2 You'll need mIRC 5.41 to use~RR-Gui, later versions might work. }
  if ($inrect($1,$2,15,138,325,18)) { rrgui.obj Button @rrgui.about 1 15 138 325 18 | rrgui.dialog oko 150 Center Info 53 RR-Gui requires the font Marlett~which comes with win95, 98 and~NT4 if you use any other version~you'll need to get this font. }
  if ($inrect($1,$2,15,158,325,18)) { rrgui.obj Button @rrgui.about 1 15 158 325 18 | rrgui.dialog oko 150 Center Info 19 If your resolution is less then~640*480 you might have to use~mircs scrollbars in the~configuration panel. }
  if ($inrect($1,$2,15,178,325,18)) { rrgui.obj Button @rrgui.about 1 15 178 325 18 | rrgui.dialog oko 150 Center Info 19 If your resolution is less then~800*600 you'll need to use mircs~scrollbars to access the object~properties window. }
  if ($inrect($1,$2,70,225,100,30)) { unset rrgui.about.* | rrgui.close @rrgui.about }
  if ($inrect($1,$2,190,225,100,30)) { .timer 1 0 rrgui.unload | unset rrgui.about.* | rrgui.close @rrgui.about }
}
menu @rrgui.about {
  sclick rrgui.handle sclick @rrgui.about
  mouse rrgui.handle mouse @rrgui.about
  uclick rrgui.handle uclick @rrgui.about
}
alias rrgui.menu if ($isalias($1)) { return $2- }
