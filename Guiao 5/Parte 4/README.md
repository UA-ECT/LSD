# Nesta parte do guião era preciso alterar o ficheiro BasicWatch.vhd para que o relogio fica-se a funcionar corretamente
### As alterações ao clock
 na linha 68 estava 1250000 e devia de estar 12500000 (faltava um zero)
> a fpga tem um clock de 50MHz e nós queremos que o clock funcione com 4Hz entao para fazer a conversão 50000000/x = 4

 
### As alterações a mudança de dia(o relogio nao parava nos 23:59:59 pasava para 24:00:00 em vez de fazer reset)
 adicionado 2 sinais nas linhas 53 e 54 para ("s_currentTime"  e "s_newDay")
 >  signal s_currentTime : std_logic_vector(23 downto 0);  
 >  signal s_newDay : std_logic;

 logica dos sinais
 > s_currentTime	<= s_hTensBin & s_hUnitsBin & s_mTensBin & s_mUnitsBin & s_sTensBin & s_sUnitsBin; 
 > s_newDay <= '1' when s_currentTime = X"235959" else '0';
  
 adicionado à logica do sinal "s_globalRst" o sinal que indica um novo dia "s_newDay"
 > s_globalRst	<= SW(0) or s_newDay;
 
