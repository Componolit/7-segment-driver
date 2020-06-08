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

   pragma Unevaluated_Use_Of_Old (Allow);

   use type GPIO.Mode;

   type Index is range 1 .. 7;

   type Segment_Array is array (Index'Range) of GPIO.Pin;

   Pins : constant Segment_Array := (A, B, C, D, E, F, G);

   procedure Show (Value : Nibble) with
     Pre    => (for all P in GPIO.Pin => GPIO.Valid (P))
               and then (for all P of Pins => GPIO.Configured (P))
               and then (for all P of Pins => GPIO.Pin_Mode (P) = GPIO.Port_Out),
     Post   => (for all P in GPIO.Pin => GPIO.Valid (P))
               and then (for all P of Pins => GPIO.Pin_Mode (P) = GPIO.Port_Out)
               and then (for all P in GPIO.Pin => GPIO.Pin_Modes (P) = GPIO.Pin_Modes'Old (P))
               and then (for all P in GPIO.Pin => GPIO.Pins_Configured (P) = GPIO.Pins_Configured'Old (P)),
     Global => (In_Out  => GPIO.GPIO_State,
               Proof_In => GPIO.Shadow_Configuration_State);

   procedure Initialize with
     Pre    => (for all P in GPIO.Pin => GPIO.Valid (P)),
     Post   => (for all P in GPIO.Pin => GPIO.Valid (P))
               and then (for all P of Pins => GPIO.Pin_Mode (P) = GPIO.Port_Out)
               and then (for all P of Pins => GPIO.Configured (P))
               and then (for all P in GPIO.Pin =>
                           (if P not in A | B | C | D | E | F | G
                                then GPIO.Pin_Modes (P) = GPIO.Pin_Modes'Old (P)))
               and then (for all P in GPIO.Pin =>
                           (if P not in A | B | C | D | E | F | G
                                then GPIO.Pins_Configured (P) = GPIO.Pins_Configured'Old (P))),
     Global => (In_Out => (GPIO.Shadow_Configuration_State, GPIO.Configuration_State));

end Segment_Driver.Backend;
