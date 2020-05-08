library ieee;
use ieee.std_logic_1164.all;

entity Radensky_RegDst_mux is
port(
		sel_RADE		: in std_logic;
		a_RADE		: in std_logic_vector(4 downto 0);
		b_RADE		: in std_logic_vector(4 downto 0);
		out_RADE		: out std_logic_vector(4 downto 0)
	);
end Radensky_RegDst_mux;

architecture arch of Radensky_RegDst_mux is
begin
out_RADE <= a_RADE when (sel_RADE = '0') else
				b_RADE;
end architecture;