library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(a, b, cin : in std_logic;
			s, cout : out std_logic);
			
end FullAdder;

architecture Behavioral of FullAdder is
begin

	s    <= cin xor (a xor b);
	cout <= (a and b) or (cin and (a xor b));

end Behavioral;	