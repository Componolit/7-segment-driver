generic
   Bit_0 : GPIO.Pin;
   Bit_1 : GPIO.Pin;
   Bit_2 : GPIO.Pin;
   Bit_3 : GPIO.Pin;
package Segment_Driver.Frontend with
   SPARK_Mode
is

   procedure Read (Value : out Nibble);

   procedure Initialize;

end Segment_Driver.Frontend;
