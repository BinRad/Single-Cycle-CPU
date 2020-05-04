library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity Radensky_ALU is
  generic(N : integer := 32);
  port(
	  opcode_RADE         		: in std_logic_vector(5 downto 0);
	  input_a_RADE				   : in std_logic_vector(N-1 downto 0);
	  input_b_RADE					: in std_logic_vector(N-1 downto 0);
	  function_RADE       		: in std_logic_vector(5 downto 0);
	  shift_RADE          		: in std_logic_vector(4 downto 0);
	  execute_RADE		 	 		: in std_logic;
	  output_RADE					: out std_logic_vector(31 downto 0);
	  write_enable					: out std_logic := '0'
	);
end Radensky_ALU;
architecture arch of Radensky_ALU is
	signal out_sig				: std_logic_vector(31 downto 0);
	signal temp_sign			: std_logic;
	signal STL_OUTPUT			: std_logic_vector(31 downto 0);
	begin
		Radensky_STL : entity work.Radensky_STL
			port map(
			a				=> input_a_RADE,
			b				=> input_b_RADE,
			sign_RADE 	=> temp_sign,
			result		=> STL_OUTPUT
			);
process(execute_RADE, out_sig, STL_OUTPUT)
begin
if rising_edge(execute_RADE) then
  if opcode_RADE = "000000" then
		write_enable <= '1';
		 if function_RADE = "100100" then     --and x24
			out_sig <= input_a_RADE and input_b_RADE;
		 elsif function_RADE = "100101" then  --OR x25
			out_sig <= input_a_RADE or input_b_RADE;
		 elsif function_RADE = "100111" then  --NOR x27
			out_sig <= input_a_RADE nor input_b_RADE;
		 elsif function_RADE = "101010" then  --stl signed x2a
			temp_sign <= '1';
			out_sig <= STL_OUTPUT;
		 elsif function_RADE = "101011" then  -- stl unsigned x2b
			temp_sign <= '0';
			out_sig <= STL_OUTPUT;
		 elsif function_RADE = "000000" then  --shl logicl x00
			out_sig <= to_stdlogicvector(to_bitvector(input_a_RADE) sll to_integer(unsigned(shift_RADE)));
		 elsif function_RADE = "000010" then  --shr logicl 0x2
			out_sig <= to_stdlogicvector(to_bitvector(input_a_RADE) srl to_integer(unsigned(shift_RADE)));
		 elsif function_RADE = "000011" then  --shr arithmetic x3
			out_sig <= to_stdlogicvector(to_bitvector(input_a_RADE) sra to_integer(unsigned(shift_RADE)));
		 elsif function_RADE = "000100" then  --rotate left x4
			out_sig <= to_stdlogicvector(to_bitvector(input_a_RADE) rol to_integer(unsigned(shift_RADE)));
		 elsif function_RADE = "000101" then  --rotate right x5
			out_sig <= to_stdlogicvector(to_bitvector(input_a_RADE) ror to_integer(unsigned(shift_RADE)));
		 end if;
	  elsif opcode_RADE = "001100" then --and imm x0c
			write_enable <= '1';
			out_sig <= input_a_RADE and input_b_RADE;
	  elsif opcode_RADE = "001101" then --or immediate x0d
			write_enable <= '1';
			out_sig <= input_a_RADE or input_b_RADE;
	  elsif opcode_RADE = "001001" then --stl immediate x0a
			write_enable <= '1';
			temp_sign <= '1';
			out_sig <= STL_OUTPUT;
	  elsif opcode_RADE = "001010" then --stl unsigned imm x0b
			write_enable <= '1';
			temp_sign <= '0';
			out_sig <= STL_OUTPUT;
	  elsif opcode_RADE = "000100" then ---Branch on Equal
			write_enable <= '0';
			if input_a_RADE = input_b_RADE then 
				out_sig <= (others => '1');
			else 
				out_sig <= (others => '0');
			end if;
		elsif opcode_RADE = "000101" then ---Branch not Equal
			write_enable <= '0';
			if input_a_RADE /= input_b_RADE then 
				out_sig <= (others => '1');
			else 
				out_sig <= (others => '0');
			end if;
		else
			write_enable <= '1';
			out_sig <= (others => '1');
	end if;
 end if;
 output_RADE <= out_sig;
end process;
end architecture;