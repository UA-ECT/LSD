library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FlipFlopD is
		port(clk : in  std_logic;
			  d  	: in  std_logic;
			  q   : out std_logic;
			  En  : in  std_logic
			  );
			  
end FlipFlopD;

architecture Behavioral of FlipFlopD is
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if(En = '1') then
			q <= d;
			end if;
		end if;
	end process;
end Behavioral;