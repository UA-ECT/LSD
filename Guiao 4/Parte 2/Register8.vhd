library ieee;
use ieee.std_logic_1164.all;

entity Register8 is
	port (clk     : in  std_logic;
			dataIn  : in  std_logic_vector(7 downto 0);
			dataOut : out std_logic_vector(7 downto 0);
			wrEn 	  : in std_logic
			);
end Register8;

architecture Behavioral of register8 is
begin
r0 : entity work.FlipFlopD(Behavioral)
				port map(clk => clk,
							d => dataIn(0),
							q => dataOut(0),
							En => wrEn
							);

r1 : entity work.FlipFlopD(Behavioral)
				port map(clk => clk,
							d => dataIn(1),
							q => dataOut(1),
							En => wrEn
							);	

r2 : entity work.FlipFlopD(Behavioral)
				port map(clk => clk,
							d => dataIn(2),
							q => dataOut(2),
							En => wrEn
							);
							
r3 : entity work.FlipFlopD(Behavioral)
				port map(clk => clk,
							d => dataIn(3),
							q => dataOut(3),
							En => wrEn
							);	
							
r4 : entity work.FlipFlopD(Behavioral)
				port map(clk => clk,
							d => dataIn(4),
							q => dataOut(4),
							En => wrEn
							);
							
r5 : entity work.FlipFlopD(Behavioral)
				port map(clk => clk,
							d => dataIn(5),
							q => dataOut(5),
							En => wrEn
							);
							
r6 : entity work.FlipFlopD(Behavioral)
				port map(clk => clk,
							d => dataIn(6),
							q => dataOut(6),
							En => wrEn
							);
							
r7 : entity work.FlipFlopD(Behavioral)
				port map(clk => clk,
							d => dataIn(7),
							q => dataOut(7),
							En => wrEn
							);
end Behavioral;