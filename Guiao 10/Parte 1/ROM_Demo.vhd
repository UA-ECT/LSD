library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity ROM_Demo is
port (CLOCK_50 : in std_logic;
		KEY		: in  std_logic_vector(0 downto 0);
		SW			: in  std_logic_vector(0 downto 0);
		LEDR		: out std_logic_vector(7 downto 0);
		LEDG     : out std_logic_vector(8 downto 0));
end ROM_Demo;

architecture Shell of ROM_Demo is
	signal s_clock : std_logic;
	signal s_count : std_logic_vector(3 downto 0);
begin
FreqDivider :  entity work.ClkDividerN(RTL)
								generic map(k	 => 12500000)
								port map(clkIn  => CLOCK_50,
											clkOut => s_clock);

Counter :  entity work.CounterUpDown4(Behavioral)
								port map(clk  => s_clock,
											upDown => '1',
											reset  => not KEY(0),
											count	=> s_count);

ROM : entity work.ROM_16x8(Behavioral)
						port map(address => s_count,
									dataOut => LEDR);








end Shell;
