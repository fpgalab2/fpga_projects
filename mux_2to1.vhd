library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux_2to1 is 
    port (in0, in1 : in std_logic_vector(7 downto 0);
          sel : in std_logic;      

          out0 : out std_logic_vector(7 downto 0));
          
end mux_2to1;

architecture behavioral of mux_2to1 is

begin

    with sel select
        out0 <= in1 when '1',
				in0 when others;  

end behavioral;    