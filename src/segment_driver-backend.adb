package body Segment_Driver.Backend with
   SPARK_Mode
is

   procedure Initialize is
   begin
      for Pin of Pins loop
         GPIO.Configure (Pin, GPIO.Port_Out);
      end loop;
   end Initialize;

   procedure Show (Value : Nibble) is
      type Value_Array is array (Index'Range) of GPIO.Value;
      Values : Value_Array;
   begin
      Values := (1 => (if Value in 0 | 2 |  3 |  5 |  6 |  7 |
                                   8 | 9 | 10 | 12 | 14 | 15
                       then
                          GPIO.High
                       else
                          GPIO.Low), --  A
                 2 => (if Value in 0 | 1 | 2 | 3 | 4 | 7 | 8 | 9 | 10 | 13
                       then
                          GPIO.High
                       else
                          GPIO.Low), --  B
                 3 => (if Value in 0 | 1 | 3 |  4 |  5 |  6 |
                                   7 | 8 | 9 | 10 | 11 | 13
                       then
                          GPIO.High
                       else
                          GPIO.Low), --  C
                 4 => (if Value in 0 | 2 | 3 | 5 | 6 | 8 | 9 | 11 | 12 | 13 | 14
                       then
                          GPIO.High
                       else
                          GPIO.Low), --  D
                 5 => (if Value in 0 | 2 | 6 | 8 | 10 | 11 | 12 | 13 | 14 | 15
                       then
                          GPIO.High
                       else
                          GPIO.Low), --  E
                 6 => (if Value in 0 |  4 |  5 |  6 |  8 | 9 |
                                  10 | 11 | 12 | 14 | 15
                       then
                          GPIO.High
                       else
                          GPIO.Low), --  F
                 7 => (if Value in 2 |  3 |  4 |  5 |  6 |  8 |
                                   9 | 10 | 11 | 13 | 14 | 15
                       then
                          GPIO.High
                       else
                          GPIO.Low)); --  G
      for I in Index'Range loop
         GPIO.Write (Pins (I), Values (I));
      end loop;
   end Show;

end Segment_Driver.Backend;
