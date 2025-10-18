			RR GUI 3.0 Visual Editor by EAE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This script was created by Emil A Eklund (EAE) If you have any questions and/or comments
feel free to E-Mail me, eae@eae.net, or find me as EAE on DALnet, my ICQ Uin is 2473022.
Feel free to include this addon in your own script(-s) as long as you're giving me credits for it. 
Check ReadMe array for more information.				         EAE

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias rrge.exit {
  if ($readini $scriptdirrrgui.ini Editor 3) {
    rrgui.dialog yn 130 Center Question 33 Are you sure you want to exit?
    set %rrgui.dialog.do1 rrge.exit2
  }
  else { rrge.exit2 }
}
alias rrge.exit2 {
  rrge.close2
  unset %rrge.*
  .timer 1 0 rrgui.close @rrge
  .timer 1 0 rrgui.close @rrge.Toolbar
  .timer 1 0 rrgui.close @rrge.Properties
}
alias rrge.load {
  if (%rrge.file.change == Yes) && ($readini $scriptdirrrgui.ini Editor 2) {
    rrgui.dialog yn 130 Center Question 33 The current project has not been~saved. Are you sure you want to~load another one?
    set %rrgui.dialog.do1 rrge.load2
  }
  else { rrge.load2 }
}
alias rrge.load2 {
  if ($exists($scriptdirrrge.ini)) { .remove $scriptdirrrge.ini }
  set %rrge.load.fullpath $$dir="Select .rrg File to Open" $scriptdir*.rrg 
  .copy %rrge.load.fullpath $scriptdirrrge.ini
  set %rrge.file.open Yes
  unset %rrge.file.change
  rrge.update Load
  set %rrge-lastprj %rrge.load.fullpath
  unset %rrge.load.fullpath
}
alias rrge.save {
  if (%rrge.file.open != Yes) { 
    rrgui.dialog oko 130 Center Error 31 There's no open project. 
    halt
  }
  set %rrge.save.fullpath $$dir="Select Path and Filename" $scriptdir*.rrg
  if ($exists(%rrge.save.fullpath )) { 
    rrgui.dialog yn 130 Center Question 33 The selected file alredy exists.~Overwrite it?
    set %rrgui.dialog.do1 rrge.save2
  }
  else { 
    .copy $scriptdirrrge.ini %rrge.save.fullpath 
    set %rrge-lastprj %rrge.save.fullpath 
  }
}
alias rrge.save2 {
  .remove %rrge.save.fullpath
  .copy $scriptdirrrge.ini %rrge.save.fullpath
  unset %rrge.file.change
  set %rrge-lastprj %rrge.save.fullpath 
}
alias rrge.new {
  if (%rrge.file.change == Yes) && ($readini $scriptdirrrgui.ini Editor 2) {
    rrgui.dialog yn 130 Center Question 33 The current project has not been~saved. Are you sure you want to~create a new one?
    set %rrgui.dialog.do1 rrge.new2
  }
  else { rrge.new2 }
}
alias rrge.new2 {
  if ($exists($scriptdirrrge.ini)) { .remove $scriptdirrrge.ini }
  set %rrge.file.open Yes
  unset %rrge.file.change
  window -c @rrge
  rrge.update New
}
alias rrge.close {
  if (%rrge.file.open != Yes) { 
    rrgui.dialog oko 130 Center Error 31 There's no open project. 
    halt
  }
  if (%rrge.file.change == Yes) && ($readini $scriptdirrrgui.ini Editor 2) {
    rrgui.dialog yn 130 Center Question 33 The current project has not been~saved. Are you sure you want to~close it?
    set %rrgui.dialog.do1 rrge.close2
  }
  else { rrge.close2 }
}
on 1:close:@rrge: rrge.close2
alias rrge.close2 {
  if ($window(@rrge) != $null) { window -c @rrge }
  if ($window(@rrge.tbar) != $null) { window -c @rrge.tbar }
  if ($window(@rrge.obj) != $null) { window -c @rrge.obj }
  if ($window(@rrge.compile) != $null) { window -c @rrge.compile }
  if ($exists($scriptdirrrge.ini)) { .remove $scriptdirrrge.ini }
  unset %rrge.file.open %rrge.file.change
  remini $scriptdirrrgui2.ini rrge
  remini $scriptdirrrgui2.ini $true
  remini $scriptdirrrgui2.ini $false
  drawrect -rf @rrge.Toolbar $rgb(192,192,192) 1 0 25 150 232
  rrge.properties noOpen
}
alias rrge.objbutt {
  rrgui.realbutton @rrge.Toolbar 1 5 27 130 20 Button
  rrgui.realbutton @rrge.Toolbar 1 5 49 130 20 3D Button
  rrgui.realbutton @rrge.Toolbar 1 5 71 130 20 Frame
  rrgui.realbutton @rrge.Toolbar 1 5 93 130 20 CheckBox
  rrgui.realbutton @rrge.Toolbar 1 5 115 130 20 RadioButton
  rrgui.realbutton @rrge.Toolbar 1 5 137 130 20 TextBox
  rrgui.realbutton @rrge.Toolbar 1 5 159 130 20 DropDown Menu
  rrgui.realbutton @rrge.Toolbar 1 5 181 63 20 Text
  rrgui.realbutton @rrge.Toolbar 1 72 181 63 20 Icon
  rrgui.realbutton @rrge.Toolbar 1 5 203 130 20 Other Objects
  rrgui.realbutton @rrge.Toolbar 1 5 237 130 20 Generate Code
}
alias rrge.objorder {
  window -c @rrge.objorder 
  window $iif($1,-phl30,-pl30) +f @rrge.objorder $rrgui.center(300,142) Ms Sans Serif 12
  if ($exists($scriptdirrrge2.ini)) { .remove $scriptdirrrge2.ini }
  .copy $scriptdirrrge.ini $scriptdirrrge2.ini
  drawrect -rfn @rrge.objorder $rgb(192,192,192) 1 0 0 100 142
  rrgui.obj RealButton @rrge.objorder 1 5 5 50 20 12 Up
  rrgui.obj RealButton @rrge.objorder 1 5 30 50 20 12 Down
  rrgui.obj RealButton @rrge.objorder 1 5 80 50 20 12 Help
  rrgui.obj RealButton @rrge.objorder 1 5 110 50 20 12 Close
  drawdot @rrge.objorder 
  set %rrge.objorder.num 1
  :go
  set %rrge.objorder.txt $readini $scriptdirrrge.ini Objects %rrge.objorder.num 
  if (%rrge.objorder.txt == $null) { goto done }
  if (%rrge.objorder.txt != Empty) {
    aline -l @rrge.objorder %rrge.objorder.txt 
    writeini $scriptdirrrge2.ini OldNum $replace($gettok(%rrge.objorder.txt,2-5,32),$chr(32),$chr(44)) %rrge.objorder.num 
  }
  inc %rrge.objorder.num 1
  goto go
  :done
  if ($1) { rrge.objorder.save }
}
alias rrge.objorder.objects {
  if ($inrect($1,$2,5,5,50,20)) { return RealButton 5 5 50 20 }
  if ($inrect($1,$2,5,30,50,20)) { return RealButton 5 30 50 20 }
  if ($inrect($1,$2,5,80,50,20)) { return RealButton 5 80 50 20 }
  if ($inrect($1,$2,5,110,50,20)) { return RealButton 5 110 50 20 }
}
alias rrge.objorder.do {
  if ($inrect($1,$2,5,5,50,20)) {
    set %rrge.objorder.num $sline(@rrge.objorder,1).ln 
    if (%rrge.objorder.num == 1) { halt }
    set %rrge.objorder.num2 $calc(%rrge.objorder.num -1)
    set %rrge.objorder.txt $sline(@rrge.objorder,1)
    dline -l @rrge.objorder %rrge.objorder.num 
    iline -l @rrge.objorder %rrge.objorder.num2 %rrge.objorder.txt 
    sline -l @rrge.objorder %rrge.objorder.num2 
  }
  if ($inrect($1,$2,5,30,50,20)) { 
    set %rrge.objorder.num $sline(@rrge.objorder,1).ln 
    if (%rrge.objorder.num == $line(@rrge.objorder,0,1)) { halt }
    set %rrge.objorder.num2 $calc(%rrge.objorder.num +1)
    set %rrge.objorder.txt $sline(@rrge.objorder,1)
    dline -l @rrge.objorder %rrge.objorder.num 
    iline -l @rrge.objorder %rrge.objorder.num2 %rrge.objorder.txt 
    sline -l @rrge.objorder %rrge.objorder.num2 
  }
  if ($inrect($1,$2,5,80,50,20)) { echo help goes here }
  if ($inrect($1,$2,5,110,50,20)) { rrge.objorder.save }
}
alias rrge.objorder.save {
  remini $scriptdirrrge.ini Objects
  remini $scriptdirrrge.ini Commands
  set %rrge.objorder.num 1
  :go
  if (%rrge.objorder.num > $line(@rrge.objorder,0,1)) { goto done }
  set %rrge.objorder.tmp $line(@rrge.objorder,%rrge.objorder.num,1)) 
  writeini $scriptdirrrge.ini Objects %rrge.objorder.num %rrge.objorder.tmp
  set %rrge.objorder.oldnum $readini $scriptdirrrge2.ini OldNum $replace($gettok(%rrge.objorder.tmp,2-5,32),$chr(32),$chr(44))
  set %rrge.objorder.command $readini $scriptdirrrge2.ini Commands %rrge.objorder.oldnum
  if (%rrge.objorder.command) { writeini $scriptdirrrge.ini Commands %rrge.objorder.num %rrge.objorder.command }
  unset %rrge.objorder.ext 
  set %rrge.objorder.ext $readini $scriptdirrrge2.ini Ext $+ %rrge.objorder.oldnum 1
  if (%rrge.objorder.ext) { 
    set %rrge.objorder.subnum 1
    remini $scriptdirrrge.ini Ext $+ %rrge.objorder.oldnum
    :subgo
    set %rrge.objorder.subtxt $readini $scriptdirrrge2.ini Ext $+ %rrge.objorder.oldnum %rrge.objorder.subnum
    if (%rrge.objorder.subtxt) { writeini $scriptdirrrge.ini Ext $+ %rrge.objorder.num %rrge.objorder.subnum %rrge.objorder.subtxt }
    else { goto subdone }
    inc %rrge.objorder.subnum 1
    goto subgo
    :subdone
  }
  inc %rrge.objorder.num 1
  goto go
  :done
  unset %rrge.objorder.*
  .remove $scriptdirrrge2.ini 
  rrgui.close @rrge.objorder 
}
menu @rrge.objorder {
  sclick rrgui.handle sclick @rrge.objorder
  mouse rrgui.handle mouse @rrge.objorder
  uclick rrgui.handle uclick @rrge.objorder
}
alias rrge.droplines {
  window -pl30 +f @rrge.droplines $rrgui.center(300,142) Ms Sans Serif 12
  drawrect -rfn @rrge.droplines $rgb(192,192,192) 1 0 0 100 142
  rrgui.obj RealButton @rrge.droplines 1 5 5 50 20 12 Up
  rrgui.obj RealButton @rrge.droplines 1 5 30 50 20 12 Add
  rrgui.obj RealButton @rrge.droplines 1 5 55 50 20 12 Del
  rrgui.obj RealButton @rrge.droplines 1 5 80 50 20 12 Down
  rrgui.obj RealButton @rrge.droplines 1 5 110 50 20 12 Close
  drawdot @rrge.droplines 
  set %rrge.drop.num 1
  :go
  set %rrge.drop.txt $readini $scriptdirrrge.ini $1 %rrge.drop.num 
  if (%rrge.drop.txt == $null) { goto done }
  aline -l @rrge.droplines %rrge.drop.txt
  inc %rrge.drop.num 1
  goto go
  :done    
  set %rrge.drop.section $1
}
alias rrge.droplines.objects {
  if ($inrect($1,$2,5,5,50,20)) { return RealButton 5 5 50 20 }
  if ($inrect($1,$2,5,30,50,20)) { return RealButton 5 30 50 20 }
  if ($inrect($1,$2,5,55,50,20)) { return RealButton 5 55 50 20 }
  if ($inrect($1,$2,5,80,50,20)) { return RealButton 5 80 50 20 }
  if ($inrect($1,$2,5,110,50,20)) { return RealButton 5 110 50 20 }
}
alias rrge.droplines.do {
  if ($inrect($1,$2,5,5,50,20)) {
    set %rrge.drop.num $sline(@rrge.droplines,1).ln 
    if (%rrge.drop.num == 1) { halt }
    set %rrge.drop.num2 $calc(%rrge.drop.num -1)
    set %rrge.drop.txt $sline(@rrge.droplines,1)
    dline -l @rrge.droplines %rrge.drop.num 
    iline -l @rrge.droplines %rrge.drop.num2 %rrge.drop.txt 
    sline -l @rrge.droplines %rrge.drop.num2 
  }
  if ($inrect($1,$2,5,30,50,20)) { 
    if ($sline(@rrge.droplines,1) == $null) { aline -l @rrge.droplines $$?="Please enter the line you would like to add:"  }
    else { iline -l @rrge.droplines $calc($sline(@rrge.droplines,1).ln +1) $$?="Please enter the line you would like to add:"  }
  }
  if ($inrect($1,$2,5,55,50,20)) { 
    set %rrge.sline.num $sline(@rrge.droplines,1).ln
    dline -l @rrge.droplines $sline(@rrge.droplines,1).ln 
    sline -l @rrge.droplines %rrge.sline.num 
  }
  if ($inrect($1,$2,5,80,50,20)) {
    set %rrge.drop.num $sline(@rrge.droplines,1).ln 
    if (%rrge.drop.num == $line(@rrge.droplines,0,1)) { halt }
    set %rrge.drop.num2 $calc(%rrge.drop.num +1)
    set %rrge.drop.txt $sline(@rrge.droplines,1)
    dline -l @rrge.droplines %rrge.drop.num 
    iline -l @rrge.droplines %rrge.drop.num2 %rrge.drop.txt 
    sline -l @rrge.droplines %rrge.drop.num2 
  }
  if ($inrect($1,$2,5,110,50,20)) { 
    remini $scriptdirrrge.ini %rrge.drop.section 
    set %rrge.drop.num 1
    :go
    if (%rrge.drop.num > $line(@rrge.droplines,0,1)) { goto done }
    writeini $scriptdirrrge.ini %rrge.drop.section %rrge.drop.num $line(@rrge.droplines,%rrge.drop.num,1)) 
    inc %rrge.drop.num 1
    goto go
    :done
    set %rrge.drop.tmp $readini $scriptdirrrge.ini Objects $remove(%rrge.drop.section,ext)
    writeini $scriptdirrrge.ini Objects $remove(%rrge.drop.section,ext) $gettok(%rrge.drop.tmp,1-5,32) $line(@rrge.droplines,0,1) $line(@rrge.droplines,1,1)
    set %rrge.drop.tmp $readini $scriptdirrrge.ini Objects $remove(%rrge.drop.section,ext)
unset %rrge.properties.last
    rrge.properties $remove(%rrge.drop.section,ext) %rrge.drop.tmp
    unset %rrge.drop.*
    rrgui.close @rrge.droplines 
  }
}
menu @rrge.droplines {
  sclick rrgui.handle sclick @rrge.droplines 
  mouse rrgui.handle mouse @rrge.droplines 
  uclick rrgui.handle uclick @rrge.droplines 
}
menu @rrge.Toolbar {
  sclick rrgui.handle sclick @rrge.Toolbar
  mouse rrgui.handle mouse @rrge.Toolbar
  uclick rrgui.handle uclick @rrge.Toolbar
  dclick rrgui.handle sclick @rrge.Toolbar
  Remember Position
  .This Window:set %rrge-pos.obj $window(@rrge.Toolbar).x $window(@rrge.Toolbar).y
  .All Windows:set %rrge-pos.obj $window(@rrge.Toolbar).x $window(@rrge.Toolbar).y | set %rrge-pos.prj $window(@rrge).x $window(@rrge).y | set %rrge-pos.pro $window(@rrge.Properties).x $window(@rrge.Properties).y
  Reset Position
  .This Window:set %rrge-pos.obj 5 5
  .All Windows:set %rrge-pos.obj 5 5 | set %rrge-pos.prj 155 5 | set %rrge-pos.pro 5 358
  -
  Update Positions:rrge.updpos
}
menu @rrge.Properties {
  sclick rrgui.handle sclick @rrge.Properties
  mouse rrgui.handle mouse @rrge.Properties
  uclick rrgui.handle uclick @rrge.Properties
  dclick rrgui.handle sclick @rrge.Properties
  Remember Position
  .This Window:set %rrge-pos.pro $window(@rrge.Properties).x $window(@rrge.Properties).y
  .All Windows:set %rrge-pos.obj $window(@rrge.Toolbar).x $window(@rrge.Toolbar).y | set %rrge-pos.prj $window(@rrge).x $window(@rrge).y | set %rrge-pos.pro $window(@rrge.Properties).x $window(@rrge.Properties).y
  Reset Position
  .This Window:set %rrge-pos.pro 5 358
  .All Windows:set %rrge-pos.obj 5 5 | set %rrge-pos.prj 155 5 | set %rrge-pos.pro 5 358
  -
  Update Positions:rrge.updpos
}
alias rrge.updpos {
  window @rrge.Toolbar %rrge-pos.obj $window(@rrge.Toolbar).w $window(@rrge.Toolbar).h 
  if ($window(@rrge) != $null) { window @rrge %rrge-pos.prj $window(@rrge).w $window(@rrge).h }
  window @rrge.Properties %rrge-pos.pro $window(@rrge.Properties).w $window(@rrge.Properties).h
}
