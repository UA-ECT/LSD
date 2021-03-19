library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DisplayDemoVDHL is 

	port(SW : in  std_logic_vector(3 downto 0);
		  HEX: out std_logic_vector(6 downto 0));

end DisplayDemoVDHL;

architecture Behavioral of DisplayDemoVDHL is
begin 
		system_core : entity work.Bin7SegDecoder(Behavioral)
								port map(binInput => SW,
											decOut_n => HEX
											);

end Behavioral;