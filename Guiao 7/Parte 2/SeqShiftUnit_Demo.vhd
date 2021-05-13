library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity SeqShiftUnit_Demo is 
	port(LEDR : out std_logic_vector(7 downto 0);
			SW : in std_logic_vector(17 downto 0);
			KEY : in std_logic_vector(0 downto 0)
			);
end SeqShiftUnit_Demo;

architecture Shell of SeqShiftUnit_Demo is
begin
u1 :	entity work.SeqShiftUnit(Behavioral)
			port map(clk => KEY(0),
						dataIn => SW(7 downto 0),
						siLeft => SW(9),
						siRight => SW(8),
						loadEn => SW(17),
						rotate => SW(15),
						dirLeft => SW(16),
						shArith => SW(14),
						dataOut => LEDR
						);
end Shell;