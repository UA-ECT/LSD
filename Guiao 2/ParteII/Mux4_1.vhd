library ieee;
use ieee.std_logic_1164.all;

entity Mux4_1 is

	port(
			dataIn : in std_logic_vector(3 downto 0);
			sel : in std_logic_vector(1 downto 0);
			dataOut : out std_logic
			);

end Mux4_1;

architecture Behavioral of Mux4_1 is
begin

	dataOut <= 	(not sel(1) and not sel(0) and dataIn(0)) or 
					(not sel(1) and     sel(0) and dataIn(1)) or
					(	  sel(1) and not sel(0) and dataIn(2)) or
					(	  sel(1) and     sel(0) and dataIn(3));
					
end Behavioral;