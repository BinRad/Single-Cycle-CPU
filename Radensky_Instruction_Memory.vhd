library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Radensky_Instruction_Memory is
  port(
	  Address_RADE                  			: in std_logic_vector(31 downto 0);
	  Instruction_Out_RADE                 : out std_logic_vector(31 downto 0)
  );
end Radensky_Instruction_Memory;
architecture arch of Radensky_Instruction_Memory is
  type Data_RADE is array (0 to 127) of std_logic_vector(7 downto 0); --array of 32 32 bit vectors
  signal DATA_RADE_g : Data_RADE := (
  x"00",
  x"00",
  x"00",
  x"00",
  x"00",
  x"00",
  x"00",
  x"00",
  x"00",
  x"00",
  x"00",
  x"00",
  x"8c",
  x"09",
  x"00",
  x"04", --lw $t1,4  #5 in t1
  x"35",
  x"30",
  x"00",
  x"21", --ori $s0, $t1, 33
  x"12",
  x"09",
  x"00",
  x"01", --beq $s0, $t1, skip
  x"01",
  x"08",
  x"40",
  x"2a", --slt $t0, $t0, $t0
  x"01",
  x"30",
  x"80",
  x"22", --sub $s0, $t1,$s0
  x"11",
  x"09",
  x"00",
  x"01", --beq $t0, $t1, jump
  x"02",
  x"09",
  x"40",
  x"24", --and $t0,$s0,$
  x"29",
  x"08",
  x"00",
  x"01", --slti $t0, $t0, 1
  --
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"00",
  -- x"8c", --first instruction
  -- x"08",
  -- x"00",
  -- x"00", --lw $8, 0
  -- x"8c",
  -- x"09",
  -- x"00",
  -- x"01", --lw $9, 1
  -- x"01",
  -- x"09",
  -- x"80",
  -- x"20", --add $16, $8, $9
  -- x"ac",
  -- x"10",
  -- x"00",
  -- x"05", --sw $16, 5
  -- x"8c",
  -- x"08",
  -- x"00",
  -- x"02", --lw $8, 2
  -- x"8c",
  -- x"09",
  -- x"00",
  -- x"05", --lw $9, 5
  -- x"01",
  -- x"09",
  -- x"80",
  -- x"20", --add $16, $8, $9
  -- x"ac",
  -- x"10",
  -- x"00",
  -- x"05", --sw $16, 5
  -- x"8c",
  -- x"08",
  -- x"00",
  -- x"03", --lw $8, 3
  -- x"8c",
  -- x"09",
  -- x"00",
  -- x"05", --lw $9, 5
  -- x"01",
  -- x"09",
  -- x"80",
  -- x"20", --add $16, $8, $9
  -- x"ac",
  -- x"10",
  -- x"00",
  -- x"05", --sw $16, 5
  -- x"8c",
  -- x"08",
  -- x"00",
  -- x"04", --lw $8, 4
  -- x"8c",
  -- x"09",
  -- x"00",
  -- x"05", --lw $9, 5
  -- x"01",
  -- x"09",
  -- x"80",
  -- x"20", --add $16, $8, $9
  -- x"ac",
  -- x"10",
  -- x"00",
  -- x"05", --sw $16, 5
  -- x"8c",
  -- x"09",
  -- x"00",
  -- x"05", --lw $9, 5
  others => x"00");
begin
  Instruction_Out_RADE <= DATA_RADE_g(to_integer(unsigned(Address_RADE)))
		&  DATA_RADE_g(to_integer(unsigned(Address_RADE))+1)
		&  DATA_RADE_g(to_integer(unsigned(Address_RADE))+2)
		&  DATA_RADE_g(to_integer(unsigned(Address_RADE))+3);
end architecture;
