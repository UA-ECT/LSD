library ieee;
use ieee.std_logic_1164.all;

entity wtv is
	port( a  : in std_logic_vector(9 downto 0);
			b  : in std_logic_vector(9 downto 0);
			eq : out std_logic
			);
end wtv;

architecture v1 of wtv is
begin

u1: entity work.CmpN(Behavioral)
		generic map(N => 10)
		port map(input0     => a,
					input1     => b,
					equal      => eq,
					notEqual   => open,
					ltSigned   => open,
					ltUnsigned => open
					);
end v1;