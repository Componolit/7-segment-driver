
with Componolit.Runtime.Drivers.GPIO;
with Componolit.Runtime.Drivers.RCC;

procedure Main
is
   package GPIO renames Componolit.Runtime.Drivers.GPIO;
   package RCC renames Componolit.Runtime.Drivers.RCC;
   LD3 : constant GPIO.Pin := GPIO.PC8;
   LD4 : constant GPIO.Pin := GPIO.PC9;
   RD  : constant GPIO.Pin := GPIO.PC0;
   RDV : GPIO.Value;
   procedure Enable_Segment (Pin : GPIO.Pin);
   procedure Enable_Segment (Pin : GPIO.Pin)
   is
   begin
      GPIO.Configure (Pin, GPIO.Port_Out);
      GPIO.Write (Pin, GPIO.High);
   end Enable_Segment;
begin
   RCC.Set (RCC.IOPC, True);
   RCC.Set (RCC.IOPB, True);
   GPIO.Configure (LD3, GPIO.Port_Out);
   GPIO.Configure (LD4, GPIO.Port_Out);
   GPIO.Configure (RD, GPIO.Port_In, GPIO.Low);
   GPIO.Write (LD3, GPIO.High);
   GPIO.Write (LD4, GPIO.Low);
   Enable_Segment (GPIO.PB4);
   Enable_Segment (GPIO.PC5);
   Enable_Segment (GPIO.PB0);
   Enable_Segment (GPIO.PB1);
   Enable_Segment (GPIO.PB2);
   Enable_Segment (GPIO.PB10);
   Enable_Segment (GPIO.PB11);
   Enable_Segment (GPIO.PB12);
   loop
      GPIO.Read (RD, RDV);
      GPIO.Write (LD4, RDV);
   end loop;
end Main;
