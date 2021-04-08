library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity ALU4 is
	port(a, b  : in  std_logic_vector(3 downto 0);
			op   : in  std_logic_vector(2 downto 0);
			r, m : out std_logic_vector(3 downto 0));
end ALU4;

architecture Behavioral of ALU4 is 
	signal s_a, s_b, s_r : signed(3downto 0);
	signal s_m           : signed(7downto 0);
begin
	-- passa os valores das portas de entrada para um valor binário 
	s_a <= signed(a);
	s_b <= signed(b);
	
	s_m <= s_a * s_b;
	
	with op select
		s_r <= s_a  +  s_b 	  when "000",--soma
				 s_a  -  s_b 	  when "001",--subtração
				 s_m(3 downto 0) when "010",--multiplicação
				 s_a  /  s_b	  when "011",--divisão
				 s_a rem s_b     when "100",--resto da divisão
				 s_a and s_b     when "101",-- and logico
				 s_a or  s_b     when "110",-- or logico
				 s_a xor s_b     when "111";-- xor logico
	
	r <= std_logic_vector(s_r);
	
	m <= std_logic_vector(s_m(7 downto 4)) when (op = "010") else
			(others => '0');
end Behavioral;