library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux_4to1 is 
    port (in0, in1, in2, in3 : in std_logic_vector(7 downto 0);
          sel : in std_logic_vector(1 downto 0);      

          out0 : out std_logic_vector(7 downto 0));
          
end mux_4to1;

architecture behavioral of mux_4to1 is

begin

    with sel select
        out0 <= in0 when "00",
				in1 when "10",  --Inverted to normal, to follow design specs 
                in2 when "01",  --(why are ALUS 2,3 and 5,6 in the wrong order?)
                in3 when others;  

end behavioral;    

