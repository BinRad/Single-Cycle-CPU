library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BNR_test_CPU is
end BNR_test_CPU;

architecture arch of BNR_test_CPU is
  component Radensky_Single_Cycle_CPU
    port(
		clock :  IN  STD_LOGIC := '0';
		Signed :  IN  STD_LOGIC := '0';
		Radensky_RBout :  OUT  STD_LOGIC;
		a1 :  OUT  STD_LOGIC;
		a2 :  OUT  STD_LOGIC;
		a3 :  OUT  STD_LOGIC;
		a4 :  OUT  STD_LOGIC;
		a5 :  OUT  STD_LOGIC;
		a6 :  OUT  STD_LOGIC;
		a7 :  OUT  STD_LOGIC;
		n1 :  OUT  STD_LOGIC;
		n2 :  OUT  STD_LOGIC;
		n3 :  OUT  STD_LOGIC;
		n4 :  OUT  STD_LOGIC;
		n5 :  OUT  STD_LOGIC;
		n6 :  OUT  STD_LOGIC;
		n7 :  OUT  STD_LOGIC;
		d1 :  OUT  STD_LOGIC;
		d2 :  OUT  STD_LOGIC;
		c1 :  OUT  STD_LOGIC;
		d3 :  OUT  STD_LOGIC;
		c2 :  OUT  STD_LOGIC;
		d4 :  OUT  STD_LOGIC;
		c3 :  OUT  STD_LOGIC;
		d5 :  OUT  STD_LOGIC;
		c4 :  OUT  STD_LOGIC;
		d6 :  OUT  STD_LOGIC;
		c5 :  OUT  STD_LOGIC;
		d7 :  OUT  STD_LOGIC;
		c6 :  OUT  STD_LOGIC;
		c7 :  OUT  STD_LOGIC;
		out1_RADE :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
  end component;
  signal error  : std_logic := '0';
  signal clock1	: std_logic;
  signal output : std_logiC_VECTOR(31 downto 0);

begin
  uut :  Radensky_Single_Cycle_CPU port map (
  clock =>clock1,
  out1_RADE => output
  );
  process is
  begin

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