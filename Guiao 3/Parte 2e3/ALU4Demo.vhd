library ieee;
use ieee.std_logic_1164.all;

entity AlU4Demo is
	port (SW   : in std_logic_vector(17 downto 0);
			LEDR : out std_logic_vector(7 downto 0);
			HEX1 : out std_logic_vector(6 downto 0);
			HEX0 : out std_logic_vector(6 downto 0)
			);
end AlU4Demo;

architecture shell of AlU4Demo is
	signal s_r, s_m : std_logic_vector(3 downto 0);
begin

u1:	entity work.ALU4(Behavioral)
			port map(a 	=> SW(3 downto 0),
						b 	=> SW(7 downto 4),
						op => SW(17 downto 15),
						r 	=>	s_r,
						m	=> s_m
						);

u2:	entity work.Bin7SegDecoder(Behavioral)
			port map(binInput => s_r,
						decOut_n => HEX0
						);
						
u3:	entity work.Bin7SegDecoder(Behavioral)
			port map(binInput => s_m,
						decOut_n => HEX1
						);									
end shell;