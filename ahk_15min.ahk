#NoEnv 
SendMode Input
SetWorkingDir %A_ScriptDir%

Coordmode, mouse, client
CoordMode, ToolTip, Screen

; basic training vars
bas_x = 240
bas_y = 45
basp_x = 840
basp_y = 140
; boss variables
boss_x = 240
boss_y = 75
nuke_x = 630
nuke_y = 150
stop_x = 630
stop_y = 205
fight_x = 630
fight_y = 260
; pit vars
pit_x = 240
pit_y = 100
hole_x = 600
hole_y = 240
day_x = 825
day_y = 240
spin_x = 720
spin_y = 560
;adventure variables
adv_x = 240
adv_y = 135
next_x = 925
next_y = 220
bef_x = 335
bef_y = 220
ito_x = 400
ito_y = 225
itoopt_x = 705
itoopt_y = 210
itogo_x = 630
itogo_y = 300
advdrop_x = 800
advdrop_y = 210
advdrop1_x = 800
advdrop1_y = 235
; inventory variables
inv_x = 240
inv_y = 165
fequip_x = 475
fequip_y = 65
line1_x = 350
line1_y = 330
line2_x = 350
line2_y = 380
line3_x = 350
line3_y = 430
; aug variables
aug_x = 240
aug_y = 195
sci_x = 540
sci_y = 265
scia_x = 540
scia_y = 290
milk_x = 540
milk_y = 330
shoulder_x = 540
shoulder_y = 460
buster_x = 540
buster_y = 525
; time machine vats
time_x = 240
time_y = 255
timepe_x = 535
timepe_y = 233
timepm_x = 535
timepm_y = 333
;blood vars
blood_x = 240
blood_y = 285
bloodcast_x = 400
bloodcast_y = 115
bloodauto_x = 510
bloodauto_y = 220
bloodiron_x = 740
bloodiron_y = 220
bloodc_x = 570
bloodc1_y = 225
bloodc2_y = 265
bloodc3_y = 300
bloodc4_y = 330
; wandoos vars
wand_x = 240
wand_y = 315
wandpe_x = 555
wandpe_y = 250
wandpm_x = 555
wandpm_y = 350
; Ygg variables
ygg_x = 240
ygg_y = 375
killtree_x = 825
killtree_y = 490
actluck_x = 770
actluck_y = 275
actpwrb_x = 350
actpwrb_y = 370
; ngu buttons
ngu_x = 240
ngu_y = 345
ngup_x = 520
ngup_y = 240
; dig buttons
dig_x = 240
dig_y = 405
digoff_x = 850
digoff_y = 110
digstat_x = 550
digstat_y = 375
digwand_x = 865
digwand_y = 185
ngupag1_x = 345
ngupag1_y = 110
ngupag2_x = 405
ngupag2_y = 110
digngu_x = 545
digngu_y = 185
; rebirth buttons
rebirth1_x = 90
rebirth1_y = 425
challenge_x = 700
challenge_y = 520
rebirth2_x = 550
rebirth2_y = 520
yeah_x = 435
yeah_y = 320
; challenge
basic_challenge_x = 385
basic_challenge_y = 185
; toggles vars
tv_block = 1
tv_mini = 0
tv_trans = 0

Gui, add, text,, Check if:`n-auto blood number ON `n-filter everything in adv (no item support)`n-run as admin if you want blockinput to work
Gui, add, text,, time until next iron pill HOURS and MINS (round up):
Gui, add, edit, vcurhour, 12
Gui, add, edit, vcurmin, 00
Gui, add, button, Default w80, direct
Gui, add, button, w80, rebirthit
Gui, show ,, Rebirth Script Pre-conditions

Menu, Tray, Add
Menu, Tray, Add, Menu, menushow
return

buttonrebirthit:
gosub checkwindow
gosub runrebirth

Buttondirect:
Gui, Submit
Gui, Destroy

if (curhour>12)
	msgbox wtfyo hour>12
if (curmin>60)
	msgbox wtfyo min>60

ironcount := curhour*4 + ceil(curmin/15)

; during loop gui window
Gui, add, checkbox, gtog_block checked, Block imput during work
Gui, add, checkbox, gtog_trans, Make transparent during work
Gui, add, checkbox, gtog_mini, Minimize after work
Gui, show,, In-script toggles

Loop 
{
gosub checkwindow
gosub runnuke
gosub runadv8
gosub runtime
sleepy(60000) ; 1min
gosub checkwindow
gosub runitopod
gosub runtime
sleepy(60000) ; +1min=2m
gosub checkwindow
gosub runtime
sleepy(60000) ; +1min=3m
gosub checkwindow
gosub runnuke
gosub runtime
sleepy(360000) ; +6min = 9min
gosub checkwindow
gosub runnuke
send, t
send, r
gosub runsci
gosub runblood3
gosub runtime
sleepy(120000) ; +2min = 11min
gosub checkwindow
gosub runnuke
send, r
gosub runscia
sleepy(120000) ; +2min = 13m
gosub checkwindow
gosub runnuke
send, r
send, t
gosub runwand
gosub rundigwand
sleepy(120000) ; +2min = 15m
gosub checkwindow
if (ironcount = 0)
{
	send, r
	send, t
	gosub runngu
	gosub rundigngu
	gosub runblood4
	gosub runtime
	gosub runblood_tog
	gosub rundigoff
	sleepy(900000) ;15min++
	gosub checkwindow
	gosub iron_pill
	ironcount=49
}

gosub runpit
gosub rundigstat
gosub runnukestop

ironcount -= 1
gosub runrebirth
}

menushow:
Gui, show
return

runpit:
mouseclick, left, %pit_x%, %pit_y%
sleep 250
mouseclick, left, %hole_x%, %hole_y%
sleep 250
mouseclick, left, %yeah_x%, %yeah_y%
sleep 250
mouseclick, left, %day_x%, %day_y%
sleep 250
mouseclick, left, %spin_x%, %spin_y%
sleep 250
return

rundigstat:
mouseclick, left, %dig_x%, %dig_y%
sleep 250
mouseclick, left, %digoff_x%, %digoff_y%
sleep 250
mouseclick, left, %ngupag1_x%, %ngupag1_y%
sleep 250
mouseclick, left, %digstat_x%, %digstat_y%
sleep 250
return

rundigwand:
mouseclick, left, %dig_x%, %dig_y%
sleep 250
mouseclick, left, %digoff_x%, %digoff_y%
sleep 250
mouseclick, left, %ngupag1_x%, %ngupag1_y%
sleep 250
mouseclick, left, %digwand_x%, %digwand_y%
sleep 250
return

rundigngu:
mouseclick, left, %dig_x%, %dig_y%
sleep 250
mouseclick, left, %digoff_x%, %digoff_y%
sleep 250
mouseclick, left, %ngupag2_x%, %ngupag2_y%
sleep 250
mouseclick, left, %digngu_x%, %digngu_y%
sleep 250
return

rundigoff:
mouseclick, left, %dig_x%, %dig_y%
sleep 250
mouseclick, left, %digoff_x%, %digoff_y%
sleep 250
return

runngu:
mouseclick, left, %ngu_x%, %ngu_y%
sleep 250
mouseclick, left, %ngup_x%, %ngup_y%
sleep 250
return

killtrees:
mouseclick, left, %ygg_x%, %ygg_y%
sleep 250
mouseclick, left, %killtree_x%, %killtree_y%
sleep 250
return

runplantygg:
mouseclick, left, %ygg_x%, %ygg_y%
sleep 250
mouseclick, left, %actluck_x%, %actluck_y%
sleep 250
mouseclick, left, %actpwrb_x%, %actpwrb_y%
sleep 250
return

runtime:
mouseclick, left, %time_x%, %time_y% ;aba blood
sleep 250
mouseclick, left, %timepe_x%, %timepe_y% ;plus
sleep 250
mouseclick, left, %timepm_x%, %timepm_y% ;plus
sleep 250
return

runwand:
mouseclick, left, %wand_x%, %wand_y% ;aba blood
sleep 250
mouseclick, left, %wandpe_x%, %wandpe_y% ;plus
sleep 250
mouseclick, left, %wandpm_x%, %wandpm_y% ;plus
sleep 250
return

runblood3:
mouseclick, left, %blood_x%, %blood_y% ;aba blood
sleep 250
mouseclick, left, %bloodc_x%, %bloodc1_y% ;cap1
sleep 250
mouseclick, left, %bloodc_x%, %bloodc2_y% ;cap2
sleep 250
mouseclick, left, %bloodc_x%, %bloodc3_y% ;cap3
sleep 250
mouseclick, left, %bloodc_x%, %bloodc3_y% ;cap4
sleep 250
return

runblood4:
mouseclick, left, %blood_x%, %blood_y% ;aba blood
sleep 250
mouseclick, left, %bloodc_x%, %bloodc3_y% ;cap3
sleep 250
mouseclick, left, %bloodc_x%, %bloodc4_y% ;cap4
sleep 250
return

runblood_tog:
mouseclick, left, %blood_x%, %blood_y% ;aba blood
sleep 250
mouseclick, left, %bloodcast_x%, %bloodcast_y% ;aba cast
sleep 250
mouseclick, left, %bloodauto_x%, %bloodauto_y% ;tog auto
sleep 250
return

iron_pill:
mouseclick, left, %blood_x%, %blood_y% ;aba blood
sleep 250
mouseclick, left, %bloodcast_x%, %bloodcast_y% ;aba cast
sleep 250
mouseclick, left, %bloodiron_x%, %bloodiron_y% ;iron
sleep 250
mouseclick, left, %bloodauto_x%, %bloodauto_y% ;tog auto
sleep 250
return

runsci:
mouseclick, left, %aug_x%, %aug_y% ;aba aug
sleep 250
mouseclick, left, %sci_x%, %sci_y% ;scissors+
sleep 250
return

runscia:
mouseclick, left, %aug_x%, %aug_y% ;aba aug
sleep 250
mouseclick, left, %scia_x%, %scia_y% ;scissors upgrade +
sleep 250
return

runnuke:
mouseclick, left, %boss_x%, %boss_y% ;aba fight boss
sleep 250
mouseclick, left, %nuke_x%, %nuke_y% ;nuka
sleep 1000
mouseclick, left, %fight_x%, %fight_y%
sleep 250
return

runnukestop:
mouseclick, left, %boss_x%, %boss_y% ;aba fight boss
sleep 250
mouseclick, left, %nuke_x%, %nuke_y% ;nuka
sleep 1000
mouseclick, left, %fight_x%, %fight_y%
sleep 2000
mouseclick, left, %stop_x%, %stop_y%
sleep 250
return

runadv8:
mouseclick, left, %adv_x%, %adv_y% ;aba adv
sleep 250
Loop, 10 {
mouseclick, left, %bef_x%, %bef_y% ;bef
sleep 50
}
Loop, 8 {
mouseclick, left, %next_x%, %next_y% ;next
sleep 150
}
return

runadv6:
mouseclick, left, %adv_x%, %adv_y% ;aba adv
sleep 250
Loop, 15 {
mouseclick, left, %bef_x%, %bef_y% ;bef
sleep 50
}
Loop, 6 {
mouseclick, left, %next_x%, %next_y% ;next
sleep 150
}
return

runitopod:
mouseclick, left, %adv_x%, %adv_y% ;aba adv
sleep 250
mouseclick, left, %ito_x%, %ito_y% ;next
sleep 250
mouseclick, left, %itoopt_x%, %itoopt_y% ;next
sleep 250
mouseclick, left, %itogo_x%, %itogo_y% ;next
sleep 250
return

runitopodoff:
mouseclick, left, %adv_x%, %adv_y% ;aba adv
sleep 250
mouseclick, left, %advdrop_x%, %advdrop_y% ;next
sleep 250
mouseclick, left, %advdrop1_x%, %advdrop1_y% ;next
sleep 250
return


runrebirth:
mouseclick, left, %rebirth1_x%, %rebirth1_y% ;aba rebirth
sleep 250
mouseclick, left, %rebirth2_x%, %rebirth2_y% ;clicar rebirt2
sleep 250
mouseclick, left, %yeah_x%, %yeah_y%
sleep 250
return

checkwindow:
WinActivate, NGU Idle
WinWaitActive, NGU Idle, , 2
if ErrorLevel
{
    MsgBox, WinWait timed out.
    Exitapp
}
return

tog_block:
tv_block:=!tv_block
return

tog_trans:
tv_trans:=!tv_trans
return

tog_mini:
tv_mini:=!tv_mini
return

sleepy(a)
{
	global reb, tv_block, tv_trans, tv_mini, ironcount
	BlockInput, Off
	WinSet, Transparent , Off, NGU Idle
	if tv_mini
		WinMinimize, NGU Idle
	; main func stuffs tooltip on top left showing loops till bloodpil/sleepstart/sleepend/sleepduration
	b := a/60000
  b := round(b)
	future_time = %A_Now%
	EnvAdd, future_time, %b%, m
	FormatTime, future_time1, %future_time%, HH:mm:ss
	FormatTime, now_time, %A_Now%, HH:mm:ss
	Tooltip, %ironcount% loops`nstart:%now_time%`nstop:%future_time1%`nduration:%b%mins, 0,0
	sleep %a%
	tooltip
	;______
	
	if tv_block
		BlockInput, On
	if tv_trans
		WinSet, Transparent , 100, NGU Idle
}
