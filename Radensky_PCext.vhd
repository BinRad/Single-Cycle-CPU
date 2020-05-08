library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Radensky_PCext is
	port(
		in_RADE			: in std_logic_vector (15 downto 0);
		out_RADE			: out std_logic_vector(31 downto 0)
	);
end Radensky_PCext;
architecture arch of Radensky_PCext is
	begin
		out_RADE(1 downto 0) <= "00"; 
		out_RADE(17 downto 2) 	<= in_RADE;
		out_RADE(31 downto 18)	<= (others => '0') when (in_RADE(15) = '0') else
											(others => '1');
end architecture;