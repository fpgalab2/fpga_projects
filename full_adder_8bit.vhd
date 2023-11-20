library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity full_adder_8bit is  
    port (a_8bit, b_8bit: in std_logic_vector(7 downto 0);
			 c_in : in std_logic;
			 
          sum : out std_logic_vector(7 downto 0);
			 c_out : out std_logic);
	 end full_adder_8bit;
	 
architecture structural of full_adder_8bit is

component adder1bit is
    port(a, b, cin :in std_logic;  
		   s, cout : out std_logic);

end component;	

signal c_int0, c_int1, c_int2, c_int3, c_int4, c_int5, c_int6: std_logic;

begin	

	adder_1: adder1bit port map(a => a_8bit(0),
								b => b_8bit(0),
								cin => c_in,
								s => sum(0),
                                cout => c_int0);
													 
	adder_2: adder1bit port map(a => a_8bit(1),
								b => b_8bit(1),
								cin => c_int0,
								s => sum(1),
                                cout => c_int1);
													 
	adder_3: adder1bit port map(a => a_8bit(2),
								b => b_8bit(2),
								cin => c_int1,
								s => sum(2),
                                cout => c_int2);
													 
	adder_4: adder1bit port map(a => a_8bit(3),
								b => b_8bit(3),
								cin => c_int2,
								s => sum(3),
                                cout => c_int3);
													 
	adder_5: adder1bit port map(a => a_8bit(4),
								b => b_8bit(4),
								cin => c_int3,
								s => sum(4),
                                cout => c_int4);
													 
	adder_6: adder1bit port map(a => a_8bit(5),
								b => b_8bit(5),
								cin => c_int4,
								s => sum(5),
                                cout => c_int5);
													 
	adder_7: adder1bit port map(a => a_8bit(6),
								b => b_8bit(6),
								cin => c_int5,
								s => sum(6),
                                cout => c_int6);

	adder_8: adder1bit port map(a => a_8bit(7),
								b => b_8bit(7),
								cin => c_int6,
								s => sum(7),
                                cout => c_out);			
			
end structural;			