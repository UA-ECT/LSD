library ieee;
use ieee.std_logic_1164.all;

entity AccN_Demo is
	generic(N : positive := 8);
	port (SW   : in std_logic_vector(17 downto 0);
			KEY  : in std_logic_vector(3 downto 0);
			LEDR : out std_logic_vector(17 downto 0)
			);
end AccN_Demo;

architecture Shell of AccN_Demo is	
begin

u1 : entity work.AccN(v1)
	generic map(K => N)
	port map(clk     => not KEY(0),
				enable  => SW(17),
				reset   => SW(16),
				dataIn  => SW(N-1 downto 0),
				dataOut => LEDR(N-1 downto 0)
				);
	
end Shell;