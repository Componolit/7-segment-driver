
with Componolit.Runtime.Drivers.GPIO;
with Componolit.Runtime.Drivers.RCC;
with Segment_Driver.Backend;
with Segment_Driver;
with Segment_Driver.Frontend;

procedure Main
is
   package GPIO renames Componolit.Runtime.Drivers.GPIO;
   package RCC renames Componolit.Runtime.Drivers.RCC;
   LD3   : constant GPIO.Pin := GPIO.PC8;
   LD4   : constant GPIO.Pin := GPIO.PC9;
   Input : Segment_Driver.Nibble;
   I     : Integer;

   package Driver_Left is new Segment_Driver.Backend (GPIO.PD2, GPIO.PB3,
                                                      GPIO.PC13, GPIO.PB7,
                                                      GPIO.PB5, GPIO.PB6,
                                                      GPIO.PB4);

   package Driver_Right is new Segment_Driver.Backend (GPIO.PC5, GPIO.PB2,
                                                       GPIO.PB10, GPIO.PB11,
                                                       GPIO.PB12, GPIO.PB0,
                                                       GPIO.PB1);

   package Driver_Numbers is new Segment_Driver.Frontend (GPIO.PC7, GPIO.PC6,
                                                          GPIO.PB15, GPIO.PB14);
begin
   RCC.Set (RCC.IOPC, True);
   RCC.Set (RCC.IOPB, True);
   RCC.Set (RCC.IOPD, True);
   GPIO.Configure (LD3, GPIO.Port_Out);
   GPIO.Configure (LD4, GPIO.Port_Out);
   GPIO.Write (LD3, GPIO.High);
   GPIO.Write (LD4, GPIO.High);
   Driver_left.Initialize;
   Driver_right.Initialize;
   Driver_Numbers.Initialize;

   loop
      for N in Segment_Driver.Nibble range
        Segment_Driver.Nibble'First .. Segment_Driver.Nibble'Last loop
         Driver_left.Show (N);
         I := 0;

         while I < 1000000 loop
            I := I + 1;
            pragma Inspection_Point (I);
         end loop;

         Driver_Numbers.Read (Input);
         Driver_right.Show (Input);
      end loop;
   end loop;

end Main;
