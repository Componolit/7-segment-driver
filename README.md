# 7-segment-driver
Driver for 7 segment displays based on the STM32F0 Discovery board.

This driver is intended for the easy debugging with GPIO pins at the start of developing on a new board with no on board debugger.  There are only 7 output pins and 4 input pins needed for each side. The driver then outputs a hexadecimal number on the segments according to its input on the 4 input pins.

We are using two 7-segment displays which are mapped as follows:
```
         --A--
       /     /   
      F     B   
     /     /   
     --G--
   /     /   
  E     C   
 /     /   
 --D--
```

For displaying input on each of the segments, there are input pins, numbered 
from left to right from 1 to 14. 
Now each segment, left and right, is mapped onto one of those pins.  
In the following table the segments are assigned to their input pins with AL representing the left display and AR the right and so on. 
```
 1 - CL
 2 - DL
 3 - FL
 4 - EL
 5 - GL
 6 - BL
 7 - AL
 -------
 8 - AR
 9 - FR
10 - GR
11 - BR
12 - CR
13 - DR
14 - ER
```
Now each segment is mapped onto the representing output pin on the circuit board:
```
AL - PD2 
AR - PC5
BL - PB3
BR - PB2
CL - PB13
CR - PB10
DL - PB7
DR - PB0
EL - PB5 
ER - PB12
FL - PB6
FR - PB0
GL - PB4
GR - PB1
```
With an input of a 8-Bit binary number, the first 4 Bits will be shown on the left segment and the last 4 on the right. 

These Bits each have their own input pins on the circuit board. So for representing numbers the following 8 pins of the board have to have an input as follows: 
```
0 - PC14 
1 - PC15 
2 - PC0 
3 - PC1 
4 - PC7
5 - PC6
6 - PB15
7 - PB14
```