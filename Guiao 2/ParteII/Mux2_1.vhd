library ieee;
use ieee.std_logic_1164.all;

entity Mux2_1 is

	port(
			dataIn0 : in std_logic;
			dataIn1 : in std_logic;
			sel : in std_logic;
			dataOut : out std_logic
			);

end Mux2_1;

architecture Behavioral of Mux2_1 is
begin

	dataOut <= (not sel and dataIn0) or (sel and dataIn1); 

end Behavioral;