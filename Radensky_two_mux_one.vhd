library ieee;
use ieee.std_logic_1164.all;

entity Radensky_two_mux_one is
port(
		sel_RADE		: in std_logic := '0';
		a_RADE		: in std_logic_vector(31 downto 0) := x"00000000";
		b_RADE		: in std_logic_vector(31 downto 0) := x"00000000";
		out_RADE		: out std_logic_vector(31 downto 0):= x"00000000"
	);
end Radensky_two_mux_one;

architecture arch of Radensky_two_mux_one is
begin
out_RADE <= a_RADE when (sel_RADE = '0') else
				b_RADE;
end architecture;