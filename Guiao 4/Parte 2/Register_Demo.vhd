library ieee;
use ieee.std_logic_1164.all;

entity Register_Demo is
	port(SW   : in  std_logic_vector(8 downto 0);
		  KEY  : in  std_logic_vector(0 downto 0);
		  LEDG : out std_logic_vector(7 downto 0)
			);

end Register_Demo;

architecture shell of Register_Demo is
begin
r : entity work.Register8(Behavioral)
				port map(clk     => KEY(0),
							dataIn  => SW(7 downto 0),
							dataOut => LedG,
							wrEn => SW(8)
				);

end shell;