generic
   Bit_0 : GPIO.Pin;
   Bit_1 : GPIO.Pin;
   Bit_2 : GPIO.Pin;
   Bit_3 : GPIO.Pin;
package Segment_Driver.Frontend with
   SPARK_Mode
is
   pragma Unevaluated_Use_Of_Old (allow);
   use type GPIO.Mode;

   procedure Read (Value : out Nibble) with
     Pre    => (for all P in GPIO.Pin => GPIO.Valid (P))
               and then GPIO.Pin_Mode (Bit_0) = GPIO.Port_In
               and then GPIO.Pin_Mode (Bit_1) = GPIO.Port_In
               and then GPIO.Pin_Mode (Bit_2) = GPIO.Port_In
               and then GPIO.Pin_Mode (Bit_3) = GPIO.Port_In,
     Post   => (for all P in GPIO.Pin => GPIO.Valid (P))
               and then (for all P in GPIO.Pin => GPIO.Pin_Modes (P) = GPIO.Pin_Modes'Old (P)),
     Global => (Input => GPIO.GPIO_State,
              Proof_In => GPIO.Shadow_Configuration_State);

   procedure Initialize with
     Pre    => (for all P in GPIO.Pin => GPIO.Valid (P)),
     Post   => (for all P in GPIO.Pin => GPIO.Valid (P))
               and then GPIO.Pin_Mode (Bit_0) = GPIO.Port_In
               and then GPIO.Pin_Mode (Bit_1) = GPIO.Port_In
               and then GPIO.Pin_Mode (Bit_2) = GPIO.Port_In
               and then GPIO.Pin_Mode (Bit_3) = GPIO.Port_In
               and then (for all P in GPIO.Pin =>
                           (if P not in Bit_0 | Bit_1 | Bit_2 | Bit_3
                                then GPIO.Pin_Modes (P) = GPIO.Pin_Modes'Old (P))),
     Global => (In_Out => (GPIO.Shadow_Configuration_State, GPIO.Configuration_State));

end Segment_Driver.Frontend;
