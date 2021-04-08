library ieee;
use ieee.std_logic_1164.all;

entity AlU4Demo is
	port (SW   : in std_logic_vector(17 downto 0);
			LEDR : out std_logic_vector(7 downto 0);

			--	Displays do r
			HEX1, HEX0 : out std_logic_vector(6 downto 0);
			
			-- Displays do m
			HEX2, HEX3 : out std_logic_vector(6 downto 0)
			);
end AlU4Demo;

architecture shell of AlU4Demo is
	signal s_rbin, s_mbin : std_logic_vector(3 downto 0);
	signal s_rBCD, s_mBCD : std_logic_vector(7 downto 0);
	
begin

-- pega nos valores dos interruptores e passa-os para o objeto alu4 para obter um resultado
u1:	entity work.ALU4(Behavioral)
			port map(a 	=> SW(3 downto 0),
						b 	=> SW(7 downto 4),
						op => SW(17 downto 15),
						r 	=>	s_rbin,
						m	=> s_mbin
						);
-- pega nos valores vindos do alu4 e passa-os para BCD (r)
u2:	entity work.Bin2BCD(Behavioral)
			port map(binInput => s_rbin, 
						BCDOut => s_rBCD
						);
						
-- pega nos valores vindos do alu4 e passa-os para BCD (m)
u3:	entity work.Bin2BCD(Behavioral)
			port map(binInput => s_mbin, 
						BCDOut => s_mBCD
						);

-- Passa os valores para os displays
	-- Displays 0 e 1 para o r 
d0:	entity work.Bin7SegDecoder(Behavioral)
			port map(binInput => s_rBCD(3 downto 0),--unidades
						decOut_n => HEX0
						);
						
d1:	entity work.Bin7SegDecoder(Behavioral)--dezenas
			port map(binInput => s_rBCD(7 downto 4),
						decOut_n => HEX1
						);
						
	-- Displays 2 e 3 para o m 
d2:	entity work.Bin7SegDecoder(Behavioral)--unidades
			port map(binInput => s_mBCD(3 downto 0),
						decOut_n => HEX2
						);
						
d3:	entity work.Bin7SegDecoder(Behavioral)--dezenas
			port map(
						binInput => s_mBCD(7 downto 4),
						decOut_n => HEX3
						);
						
end shell;