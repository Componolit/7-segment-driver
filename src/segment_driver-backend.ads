generic
   A : GPIO.Pin;
   B : GPIO.Pin;
   C : GPIO.Pin;
   D : GPIO.Pin;
   E : GPIO.Pin;
   F : GPIO.Pin;
   --  G : GPIO.Pin;

package Segment_Driver.Backend is

   procedure Initialize;
   procedure Circle;
private
   type Index is range 1 .. 6;
   type Segment_Array is array (Index'Range) of GPIO.Pin;
   Arr : constant Segment_Array := (A, B, C, D, E, F);

end Segment_Driver.Backend;
