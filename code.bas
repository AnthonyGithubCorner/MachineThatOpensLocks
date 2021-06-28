'The purpose of this program is to unlock a lock knowing its combination using a stepper motor
'This program was written by : Anthony Lazar

'Pin C.0 connects to switch one. (SW1)
'Pin C.1 connects to switch one. (SW2)
'Pin C.2 connects to switch one. (SW3)
'Pin B.0 to B.3 connects to transistors that connect to stepper motor coils.
'Pin B.4 connects to Green LED

symbol LED = B.4 'Rename output B.4 ‘LED’
symbol flashcount = b0 ' Renames b0 to flashcount
symbol counter = b1 ' Renames b1 to counter
symbol stepcw = b2 ' Renames b2 to stepcw
symbol stepccw = b3 ' Renames b3 to stepccw
let dirsc=%00000000 'Assigns all port C pins as inputs
let dirsb=%11111111 'Assigns all port B pins as outputs

main: ' make a label called ‘main’
if pinC.0 = 1 then gosub ccw
if pinC.1 = 1 then gosub cw
if pinC.2 = 1 then gosub options

' jump if the input is on
goto main ' else loop back around

options: 'choose which version of the program will run
pause 500 'button de-bounce
if pinC.0 = 1 then gosub flash1
if pinC.1 = 1 then gosub flash2
if pinC.2 = 1 then gosub flash3
goto options 'loop until option selected

'make 3 separte versions of flash to be run when the appropriate input is chosen
      
flash1: ' 35,28,9 is the combination
for flashcount = 1 to 3 ' start a for...next loop
high B.4 ' switch output 4 on
pause 500 ' pause for 1⁄2 a second
low B.4 ' switch output 4 off
pause 500 ' pause for 1⁄2 a second
next flashcount ' counting the three flashes
high B.4

for counter = 1 to 35 'Loops through the program 35 times.
gosub cw
next counter

for counter = 1 to 30 'Loops through the program 35 times.
gosub ccw
next counter

for counter = 1 to 9 'Loops through the program 35 times.
gosub cw
next counter

goto main 'end unlocking

flash2: ' 40,30,3 is the combination
for flashcount = 1 to 3 ' start a for...next loop
high B.4 ' switch output 4 on
pause 500 ' pause for 1⁄2 a second
low B.4 ' switch output 4 off
pause 500 ' pause for 1⁄2 a second
next flashcount ' counting the three flashes
high B.4

for counter = 1 to 32 'Loops through the program 35 times.
gosub cw
next counter

for counter = 1 to 8 'Loops through the program 35 times.
gosub ccw
next counter

for counter = 1 to 28 'Loops through the program 35 times.
gosub cw
next counter

goto main 'end unlocking

flash3: ' 3,34,45 is the combination
for flashcount = 1 to 3 ' start a for...next loop
high B.4 ' switch output 4 on
pause 500 ' pause for 1⁄2 a second
low B.4 ' switch output 4 off
pause 500 ' pause for 1⁄2 a second
next flashcount ' counting the three flashes
high B.4

for counter = 1 to 3 'Loops through the program 35 times.
gosub cw
next counter

for counter = 1 to 30 'Loops through the program 35 times.
gosub ccw
next counter

for counter = 1 to 50 'Loops through the program 35 times.
gosub cw
next counter

goto main 'end unlocking

ccw: 'set up label counter clockwise to be used to move the stepper motor counter clockwise

if stepccw = 0 or stepccw = 4 then
stepcw = 0
low b.3
low b.2
low b.1
low b.0
'10 'Using out pins b.3, b.2, b.1 and b.0 sends
high b.3 'out binary 1010 or 10 decimal.
low b.2
high b.1
low b.0
pause 100
if stepccw = 4 then
let stepccw = 1
return
endif
stepccw = stepccw + 1
return
endif

if stepccw = 1 then
'9
high b.3 'Using out pins b.3, b.2, b.1 and b.0 sends
low b.2 'out binary 1001 or 9 decimal.
low b.1
high b.0
pause 100
stepccw = stepccw + 1
return
endif


if stepccw = 2 then
'5
low b.3 'Using out pins b.3, b.2, b.1 and b.0 sends
high b.2 'out binary 0101 or 5 decimal.
low b.1
high b.0
pause 100
stepccw = stepccw + 1
return
endif

if stepccw = 3 then
'6
low b.3 'Using out pins b.3, b.2, b.1 and b.0 sends
high b.2 'out binary 0110 or 6 decimal.
high b.1
low b.0
pause 100
stepccw = stepccw + 1
return
endif


cw: 'set up label clockwise to be used to move the stepper motor clockwise

if stepcw = 0 or stepcw = 4 then
stepccw = 0
low b.3
low b.2
low b.1
low b.0
'6
low b.3 'Using out pins b.3, b.2, b.1 and b.0 sends
high b.2 'out binary 0110 or 6 decimal.
high b.1
low b.0
pause 100
if stepcw = 4 then
let stepcw = 1
return
endif
stepcw = stepcw + 1
return
endif

if stepcw = 1 then
'5
low b.3 'Using out pins b.3, b.2, b.1 and b.0 sends
high b.2 'out binary 0101 or 5 decimal.
low b.1
high b.0
pause 100
stepcw = stepcw + 1
return
endif

if stepcw = 2 then
'9
high b.3 'Using out pins b.3, b.2, b.1 and b.0 sends
low b.2 'out binary 1001 or 9 decimal.
low b.1
high b.0
pause 100
stepcw = stepcw + 1
return
endif

if stepccw = 3 then
'10 'Using out pins b.3, b.2, b.1 and b.0 sends
high b.3 'out binary 1010 or 10 decimal.
low b.2
high b.1
low b.0
pause 100
stepcw = stepcw + 1
return
endif

end
