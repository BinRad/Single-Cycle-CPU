library ieee;
use ieee.std_logic_1164.all;

entity Radensky_program_counter is
  port(
	 clock 						: in std_logic;
    Addr_in_RADE        	: in std_logic_vector(31 downto 0):= x"00000000";
    Addr_out_RADE    		: out std_logic_vector(31 downto 0)
  );
end Radensky_program_counter;

architecture arch of Radensky_program_counter is
begin
process(clock)
begin
  if(rising_edge(clock)) then
		Addr_out_RADE <= Addr_in_RADE;
	end if;
	end process;
end architecture;