library ieee;
use ieee.std_logic_1164.all;

entity SeqDetFSM_Demo is
	port(clock_50   : in  std_logic;
		  SW : in std_logic_vector(17 downto 17);
		  KEY : in std_logic_vector(1 downto 0);
		  LEDG  : out std_logic_vector(7 downto 7)
			);

end SeqDetFSM_Demo;

architecture Shell of seqDetFSM_Demo is
	signal s_pulse : std_logic;
begin
Debouncer : entity work.DebounceUnit(Behavioral)
			port map(refClk	=> clock_50,
						dirtyIn	=> KEY(0),
						pulsedOut => s_pulse);

seqDetector : entity work.SeqDetFSM(MooreArch)
			port map(Xin   => SW(17),
						clk   => s_pulse,
						reset =>	not KEY(1),
						Yout  => LEDG(7)
						);

end Shell;