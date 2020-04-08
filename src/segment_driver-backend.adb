pragma Ada_2012;
package body Segment_Driver.Backend is

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      for Pin of Arr loop
         GPIO.Configure (Pin, GPIO.Port_Out);
      end loop;
   end Initialize;

   ------------
   -- Circle --
   ------------

   procedure Circle is

      i : Integer := 0;
   begin

         for Pin of Arr loop

            GPIO.Write (Pin, GPIO.High);
            i := 0;

            while i < 100000 loop
               i := i + 1;
               pragma Inspection_Point (i);
            end loop;

            GPIO.Write (Pin, GPIO.Low);
         end loop;
   end Circle;

end Segment_Driver.Backend;
