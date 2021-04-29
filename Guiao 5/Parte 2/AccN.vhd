library ieee;
use ieee.std_logic_1164.all;

entity AccN is
	generic(K : positive := 4);
	port (clk : in std_logic;
			enable :in std_logic;
			reset : in std_logic;
			dataIn : in std_logic_vector(K - 1 downto 0);
			dataOut : out std_logic_vector(K - 1 downto 0)
			);
end AccN;

architecture v1 of AccN is
	signal s_regOut : std_logic_vector(K -1 downto 0);
	signal s_adderOut : std_logic_vector(K -1 downto 0);	
begin 

u1: entity work.AdderN(v1)
		generic map(N => K)
		port map(op0 => dataIn,
					op1 => s_regOut,
					res => s_adderOut
					);

u2: entity work.RegN(v1)
		generic map(N => K)
		port map(clk => clk,
					enable => enable,
					reset => reset,
					dataIn => s_adderOut,
					dataOut => s_regOut
					);
	dataOut <= s_regOut;

end v1;