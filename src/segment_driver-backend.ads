generic
   A : GPIO.Pin;
   B : GPIO.Pin;
   C : GPIO.Pin;
   D : GPIO.Pin;
   E : GPIO.Pin;
   F : GPIO.Pin;
   G : GPIO.Pin;

package Segment_Driver.Backend with
SPARK_Mode
is

   procedure Show (Value : Nibble);
   procedure Initialize;
   procedure Circle;
private
   type Index_Circle is range 1 .. 6;
   type Segment_Array_Circle is array (Index_Circle'Range) of GPIO.Pin;
   Arr  : constant Segment_Array_Circle := (A, B, C, D, E, F);
   type Index is range 1 .. 7;
   type Segment_Array is array (Index'Range) of GPIO.Pin;
   Pins : constant Segment_Array := (A, B, C, D, E, F, G);

end Segment_Driver.Backend;
