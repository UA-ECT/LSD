library ieee;
use ieee.std_logic_1164.all;

entity RightShifterN is
	generic(N : positive := 4);
	port(clk     : in std_logic;
		  load    : in std_logic;
		  siz      : in std_logic;
		  dataIn  : in std_logic_vector(N-1 downto 0);
		  dataOut : out std_logic_vector(N-1 downto 0);
		  so      : out std_logic);
end RightShifterN;

architecture v1 of RightShifterN is
	signal s_data : std_logic_vector(N-1 downto 0);
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(load = '1') then
				s_data <= dataIn;
			else
				s_data <= si & s_data(N-1 downto 1);
			end if;
		end if;
	end process;
	so <= s_data(0);
	dataOut <= s_data;
end v1;