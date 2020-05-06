
with Componolit.Runtime.Drivers.GPIO;
with Segment_Driver.Backend;
with Segment_Driver;
with Segment_Driver.Frontend;

procedure Main with
  SPARK_Mode
is
   package GPIO renames Componolit.Runtime.Drivers.GPIO;
   LD3         : constant GPIO.Pin := GPIO.PC8;
   LD4         : constant GPIO.Pin := GPIO.PC9;
   Input_Right : Segment_Driver.Nibble;
   Input_Left  : Segment_Driver.Nibble;
   package Driver_Left is new Segment_Driver.Backend (GPIO.PD2,  GPIO.PB3,
                                                      GPIO.PC13, GPIO.PB7,
                                                      GPIO.PB5,  GPIO.PB6,
                                                      GPIO.PB4);
   package Driver_Right is new Segment_Driver.Backend (GPIO.PC5,  GPIO.PB2,
                                                       GPIO.PB10, GPIO.PB11,
                                                       GPIO.PB12, GPIO.PB0,
                                                       GPIO.PB1);
   package Driver_Numbers_Right is new Segment_Driver.Frontend (GPIO.PC7,
                                                                GPIO.PC6,
                                                                GPIO.PB15,
                                                                GPIO.PB14);
   package Driver_Numbers_Left is new Segment_Driver.Frontend (GPIO.PC14,
                                                               GPIO.PC15,
                                                               GPIO.PC0,
                                                               GPIO.PC1);
begin
   GPIO.Initialize;
   GPIO.Configure (LD3, GPIO.Port_Out);
   GPIO.Configure (LD4, GPIO.Port_Out);
   GPIO.Write (LD3, GPIO.High);
   GPIO.Write (LD4, GPIO.High);
   Driver_Right.Initialize;
   Driver_Left.Initialize;
   Driver_Numbers_Right.Initialize;
   Driver_Numbers_Left.Initialize;
   loop
      Driver_Numbers_Right.Read (Input_Right);
      Driver_Numbers_Left.Read (Input_Left);
      Driver_Right.Show (Input_Right);
      Driver_Left.Show (Input_Left);
   end loop;
end Main;
