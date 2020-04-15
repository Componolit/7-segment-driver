pragma Ada_2012;

package body Segment_Driver.Frontend is

   procedure Initialize is
   begin
      GPIO.Configure (Bit_0, GPIO.Port_In);
      GPIO.Configure (Bit_1, GPIO.Port_In);
      GPIO.Configure (Bit_2, GPIO.Port_In);
      GPIO.Configure (Bit_3, GPIO.Port_In);
   end Initialize;

   procedure Read (Value : out Nibble) is

      Nibble_0 : Nibble;
      Nibble_1 : Nibble;
      Nibble_2 : Nibble;
      Nibble_3 : Nibble;
      Value_0  : GPIO.Value;
      Value_1  : GPIO.Value;
      Value_2  : GPIO.Value;
      Value_3  : GPIO.Value;
   begin
      GPIO.Read (Bit_0, Value_0);
      GPIO.Read (Bit_1, Value_1);
      GPIO.Read (Bit_2, Value_2);
      GPIO.Read (Bit_3, Value_3);

      case Value_0 is
         when GPIO.High =>
            Nibble_0 := 1;
         when GPIO.Low =>
            Nibble_0 := 0;
      end case;

      case Value_1 is
         when GPIO.High =>
            Nibble_1 := 2;
         when GPIO.Low =>
            Nibble_1 := 0;
      end case;

      case Value_2 is
         when GPIO.High =>
            Nibble_2 := 4;
         when GPIO.Low =>
            Nibble_2 := 0;
      end case;

      case Value_3 is
         when GPIO.High =>
            Nibble_3 := 8;
         when GPIO.Low =>
            Nibble_3 := 0;
      end case;

      Value := Nibble_0 + Nibble_1 + Nibble_2 + Nibble_3;
   end Read;

end Segment_Driver.Frontend;
