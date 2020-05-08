library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Radensky_Immediate_Processor is
	port(
		in_RADE			: in std_logic_vector (15 downto 0);
		Ext_RADE			: in std_logic;
		out_RADE			: out std_logic_vector(31 downto 0)
	);
end Radensky_Immediate_Processor;
architecture arch of Radensky_Immediate_Processor is
	begin
		out_RADE(15 downto 0) 	<= in_RADE;
		out_RADE(31 downto 16)	<= (others => '0') when (in_RADE(15) = '0' or Ext_RADE = '0') else
											(others => '1');
end architecture;