
with Componolit.Runtime.Drivers.GPIO;
with Componolit.Runtime.Drivers.RCC;
with Segment_Driver.Backend;
with Segment_Driver;

procedure Main
is
   package GPIO renames Componolit.Runtime.Drivers.GPIO;
   package RCC renames Componolit.Runtime.Drivers.RCC;
   LD3 : constant GPIO.Pin := GPIO.PC8;
   LD4 : constant GPIO.Pin := GPIO.PC9;
   package Driver_left is new Segment_Driver.Backend (GPIO.PD2, GPIO.PB3,
                                                      GPIO.PC13, GPIO.PB7,
                                                      GPIO.PB5, GPIO.PB6,
                                                      GPIO.PB4);

   package Driver_right is new Segment_Driver.Backend (GPIO.PC5, GPIO.PB2,
                                                       GPIO.PB10, GPIO.PB11,
                                                       GPIO.PB12, GPIO.PB0,
                                                       GPIO.PB4);
   i : Integer := 0;
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

   loop
      for N in Segment_Driver.Nibble range
        Segment_Driver.Nibble'First .. Segment_Driver.Nibble'Last loop
         Driver_left.Show (N);
         i := 0;

         while i < 1000000 loop
            i := i + 1;
            pragma Inspection_Point (i);
         end loop;
      end loop;

      Driver_right.Circle;
   end loop;
end Main;
