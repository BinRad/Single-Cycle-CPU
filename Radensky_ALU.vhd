library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
entity Radensky_ALU is
  port(
		busA_RADE					: in std_logic_vector(31 downto 0);
		busB_RADE					: in std_logic_vector(31 downto 0);
		ALUctr_RADE					: in std_logic_vector(2 downto 0);
		ALU_out_RADE				: out std_logic_vector(31 downto 0);
		zero_RADE					: out std_logic
	);
end Radensky_ALU;
architecture arch of Radensky_ALU is
signal answer : std_logic_vector(31 downto 0);
begin
process(busA_RADE, busB_RADE, ALUctr_RADE)
begin
case ALUctr_RADE is
	when "000" => answer <= busA_RADE + busB_RADE;
	when "001" => answer <= busA_RADE - busB_RADE;
	when "010" => answer <= busA_RADE or busB_RADE;
	when others => answer <= (others => '0');
	end case;
end process;
ALU_out_RADE <= answer;
zero_RADE	<= '1' when (answer = "0") else
					'0';


end architecture;