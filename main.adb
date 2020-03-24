
with Componolit.Runtime.Drivers.GPIO;
with Componolit.Runtime.Drivers.RCC;

procedure Main
is
   package GPIO renames Componolit.Runtime.Drivers.GPIO;
   package RCC renames Componolit.Runtime.Drivers.RCC;
   procedure Wait;
   procedure Wait
   is
   begin
      for I in Integer range 0 .. 100000 loop
         null;
      end loop;
   end Wait;
   LD3 : constant GPIO.Pin := GPIO.PC8;
   LD4 : constant GPIO.Pin := GPIO.PC9;
begin
   RCC.Set (RCC.IOPC, True);
   GPIO.Configure (LD3, GPIO.Port_Out);
   GPIO.Configure (LD4, GPIO.Port_Out);
   loop
      GPIO.Write (LD3, GPIO.High);
      Wait;
      GPIO.Write (LD4, GPIO.High);
      GPIO.Write (LD3, GPIO.Low);
      Wait;
      GPIO.Write (LD4, GPIO.Low);
   end loop;
end Main;
