library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.alulib.all;

entity alu is
generic (n : integer := 8);
port  ( ac      : in std_logic_vector(n-1 downto 0);
        db      : in std_logic_vector(n-1 downto 0);
        alus    : in std_logic_vector(7 downto 1);
        dout    : out std_logic_vector(n-1 downto 0);
        c_flag  : out std_logic);
end alu ;

architecture behavioral of alu is

signal mux_to_add_1, mux_to_add_2, mux_to_mux, add_to_mux: std_logic_vector(n-1 downto 0);

begin

        ac_mux: mux_2to1 port map(in0 => (others => '0'),
                                  in1 => ac,
                                  sel => alus(1),
                                  out0 => mux_to_add_1);

        bus_mux: mux_4to1 port map(in0 => (others => '0'),
                                   in1 => db,
                                   in2 => not db,
                                   in3 => (others => '0'),
                                   sel => alus(3 downto 2),
                                   out0 => mux_to_add_2);        

        logic_mux: mux_4to1 port map(in0 => ac and db,
                                   in1 => ac or db,
                                   in2 => ac xor db,
                                   in3 => not ac,
                                   sel => alus(6 downto 5),
                                   out0 => mux_to_mux);       
                                   
        adder: full_adder_8bit port map(a_8bit => mux_to_add_1,
                                        b_8bit => mux_to_add_2,
                                        c_in => alus(4),
                                        sum => add_to_mux,
                                        c_out => c_flag);

        out_mux: mux_2to1 port map(in0 => add_to_mux,
                                   in1 => mux_to_mux,
                                   sel => alus(7),
                                   out0 => dout);
                                   
end architecture;