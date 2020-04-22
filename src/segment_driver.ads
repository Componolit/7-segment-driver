with Componolit.Runtime.Drivers.GPIO;

package Segment_Driver with
SPARK_Mode
is

   package GPIO renames Componolit.Runtime.Drivers.GPIO;
   type Nibble is range 16#0# .. 16#F#;

end Segment_Driver;
