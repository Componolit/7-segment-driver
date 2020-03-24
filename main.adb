
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
begin
   RCC.Set (RCC.IOPC, True);
   GPIO.Configure (LD3, GPIO.Port_Out);
   GPIO.Configure (LD4, GPIO.Port_Out);
   GPIO.Configure (RD, GPIO.Port_In, GPIO.Low);
   GPIO.Write (LD3, GPIO.High);
   GPIO.Write (LD4, GPIO.Low);
   loop
      GPIO.Read (RD, RDV);
      GPIO.Write (LD4, RDV);
   end loop;
end Main;
