library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package alulib is

component full_adder_8bit is
    port (a_8bit, b_8bit: in std_logic_vector(7 downto 0);
		  c_in : in std_logic;
			 
          sum : out std_logic_vector(7 downto 0);
		  c_out : out std_logic);

end component;

component mux_4to1 is 
    port (in0, in1, in2, in3 : in std_logic_vector(7 downto 0);
          sel : in std_logic_vector(1 downto 0);      

          out0 : out std_logic_vector(7 downto 0));

end component;

component mux_2to1 is 
    port (in0, in1 : in std_logic_vector(7 downto 0);
          sel : in std_logic;      

          out0 : out std_logic_vector(7 downto 0));

end component;

end alulib;    