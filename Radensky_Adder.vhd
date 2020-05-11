library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Radensky_Adder is
	port(
		a_add_RADE			: in std_logic_vector (31 downto 0) := x"00000004";
		b_add_RADE			: in std_logic_vector (31 downto 0) := x"00000000";
		out_RADE			: out std_logic_vector(31 downto 0)
	);
end Radensky_Adder;
architecture arch of Radensky_Adder is
begin
	out_RADE <= a_add_RADE + b_add_RADE;
end architecture;