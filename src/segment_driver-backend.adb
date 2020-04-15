pragma Ada_2012;
package body Segment_Driver.Backend is

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      for Pin of Pins loop
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

   procedure Show (Value : Nibble) is

      type Value_Array is array (Index'Range) of GPIO.Value;

      Values : Value_Array;
   begin
      Values (1) := (if Value in 0 | 2 | 3 | 5 | 6 | 7 | 8 | 9 | 10 | 12 | 14
                      | 15
                    then
                       GPIO.High
                    else
                       GPIO.Low); --  A
      Values (2) := (if Value in 0 | 1 | 2 | 3 | 4 | 7 | 8 | 9 | 10 | 13
                    then
                       GPIO.High
                    else
                       GPIO.Low); --  B
      Values (3) := (if Value in 0 | 1 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11
                       | 13
                      then
                       GPIO.High
                    else
                       GPIO.Low); --  C
      Values (4) := (if Value in 0 | 2 | 3 | 5 | 6 | 8 | 9 | 11 | 12 | 13 | 14
                    then
                       GPIO.High
                    else
                       GPIO.Low); --  D
      Values (5) := (if Value in 0 | 2 | 6 | 8 | 10 | 11 | 12 | 13 | 14 | 15
                    then
                       GPIO.High
                    else
                       GPIO.Low); --  E
      Values (6) := (if Value in 0 | 4 | 5 | 6 | 8 | 9 | 10 | 11 | 12 | 14
                      | 15
                    then
                       GPIO.High
                    else
                       GPIO.Low); -- F
      Values (7) := (if Value in 2 | 3 | 4 | 5 | 6 | 8 | 9 | 10 | 11 | 13
                      | 14 | 15
                    then
                       GPIO.High
                    else
                       GPIO.Low); -- G

      for I in Index'Range loop
         GPIO.Write (Pins (I), Values (I));
      end loop;
   end Show;

end Segment_Driver.Backend;
