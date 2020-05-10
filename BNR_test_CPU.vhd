library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BNR_test_CPU is
end BNR_test_CPU;

architecture arch of BNR_test_CPU is
  component Radensky_Single_Cycle_CPU
    port(
		clock :  IN  STD_LOGIC := '0';
		adder : in std_LOGIC_VECTOR(31 downto 0);
		out1_RADE :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
  end component;
  signal badder : std_LOGIC_VECTOR(31 downto 0) := x"00000004";
  signal error  : std_logic := '0';
  signal clock1	: std_logic;
  signal output : std_logiC_VECTOR(31 downto 0);

begin
  uut :  Radensky_Single_Cycle_CPU port map (
  clock =>clock1,
  adder => badder,
  out1_RADE => output
  );
  process is
  begin
  badder <= x"00000000";
		clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
badder <= x"00000004";
wait for 50 ns;
 clock1 <= '0';
 badder <= x"00000004";
wait for 50 ns;
clock1 <= '1';
 badder <= x"00000008";
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
 badder <= x"00000012";
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
 badder <= x"00000016";
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
 clock1 <= '0';
  badder <= x"00000020";
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
 clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
  clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
  clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
  clock1 <= '0';
wait for 50 ns;
clock1 <= '1';
wait for 50 ns;
clock1 <= '0';

	if(error = '0') then
	  report "No errors detected. Simulation successful" severity failure;
	else
	  report "Error detected" severity failure;
	end if;
	end process;
 end arch;