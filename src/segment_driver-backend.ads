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

private

   type Index is range 1 .. 7;

   type Segment_Array is array (Index'Range) of GPIO.Pin;

   Pins : constant Segment_Array := (A, B, C, D, E, F, G);

end Segment_Driver.Backend;
