library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity FreqDivider is 
	port(clkIn  : in  std_logic;
		  debug  : out std_logic_vector(31 downto 0);
		  clkOut : out std_logic
		  );
end FreqDivider;

architecture Behavioral of FreqDivider is
	signal s_count   : unsigned(31 downto 0);
	signal s_k 		  : unsigned(31 downto 0) := "00000000101111101011110000100000"; 
	signal s_halfWay : unsigned(31 downto 0);
begin
	
	--s_k <= unsigned(k);
	s_halfWay <= s_k / 2 - 1;
	
	process(clkIn)
	begin
		if (rising_edge(clkIn)) then
			if (s_count >= s_k - 1) then    -- se for maior que a contagem
				s_count <= (others => '0');  -- contagem passa a 0
				clkOut <= '0';               -- clock dá reset
			elsif(s_count < s_halfWay) then -- se estiver antes do meio da contagem
				s_count <= s_count + 1;		  -- adiciona 1 á contagem
				clkOut <= '0';					  -- clock passa a 0
			else									  --se nao (s_count >= s_halfWay and s_count < s_k - 1)
				s_count <= s_count + 1;		  --adiciona 1 á contagem
				clkOut <= '1';					  --clock passa a 1
			end if;
		end if;
	end process;
	debug <= std_logic_vector(s_count);
end Behavioral;