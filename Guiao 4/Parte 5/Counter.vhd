library ieee;
use ieee.std_logic_1164.all;

entity Counter is 
	port(clkIn    : in  std_logic; -- clock input
		  upDown   : in  std_logic; -- contagem crescente ou decrescente
		  reset    : in  std_logic; -- reset
		  decOut_n : out std_logic_vector(6 downto 0)
			);
end Counter;

architecture Shell of Counter is

signal clk : std_logic;
signal count : std_logic_vector(3 downto 0);

begin
-- dive a frequencia para 1Hz
FreqDivider : entity work.freqDivider(Behavioral)
							port map(clkIn => clkIn,
										clkOut => clk
										);
-- Conta
Counter : entity work.CounterUpDown4(Behavioral)
							port map(clk  	 => clk,
										upDown => upDown,
										reset  => reset,
										count	 => count
										);

-- Passa a contagem para o display
Display : entity work.Bin7SegDecoder(Behavioral)
							port map(binInput => count,
										decOut_n => decOut_n
										);

end Shell;