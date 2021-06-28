;The purpose of this program is to...
;This program was written by : Donald Duck and Minnie Mouse
;Date :
;Pin C.0 connects to switch one. (SW1)
;Pin C.1 connects to switch one. (SW2)
;Pin C.2 connects to switch one. (SW3)
;Pin B.0 to B.3 connects to transistors that connect to stepper motor coils.
;Pin B.4 connects to Green LED
symbol LED = B.4 ; Rename output B.4 ‘LED’
symbol flashcount = b0 ; Renames b0 to flashcount
symbol counter =b1 ; Renames b1 to counter
let dirsc=%00000000 ;Assigns all port C pins as inputs
let dirsb=%11111111 ;Assigns all port B pins as outputs

main: ; make a label called ‘main’
if pinC.3 = 1 then flash ; jump if the input is on
goto main ; else loop back around

flash: ; make a label called ‘flash’
for flashcount = 1 to 3 ; start a for...next loop
high B.4 ; switch output 4 on
pause 500 ; pause for 1⁄2 a second
low B.4 ; switch output 4 off
pause 500 ; pause for 1⁄2 a second
next flashcount ; counting the three flashes
for counter = 1to 15 ;Loops through the program 15 times.

;10 ;Using out pins b.3, b.2, b.1 and b.0 sends
high b.3 ;out binary 1010 or 10 decimal.
low b.2
high b.1
low b.0
pause 1000
;9
high b.3 ;Using out pins b.3, b.2, b.1 and b.0 sends
low b.2 ;out binary 1001 or 9 decimal.
low b.1
high b.0
pause 1000
;5
low b.3 ;Using out pins b.3, b.2, b.1 and b.0 sends
high b.2 ;out binary 0101 or 5 decimal.
low b.1
high b.0
wait 1
;6
low b.3 ;Using out pins b.3, b.2, b.1 and b.0 sends
high b.2 ;out binary 0110 or 6 decimal.
high b.1
low b.0
pause 1000
next counter ;Back to the top.
end ;Stop program.