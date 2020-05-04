library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Radensky_Instruction_Register is
	port(
		input_instruction			: in std_logic_vector(31 downto 0);
		opcode_RADE         		: out std_logic_vector(5 downto 0);
		RS_adr_RADE					: out std_logic_vector(4 downto 0);
		RT_adr_RADE					: out std_logic_vector(4 downto 0);	
		RD_adr_RADE				   : out std_logic_vector(4 downto 0);
		shift_RADE          		: out std_logic_vector(4 downto 0);
		function_RADE       		: out std_logic_vector(5 downto 0);		
		clock_RADE			 	 	: in std_logic
	);
end Radensky_Instruction_Register;

architecture arch of Radensky_Instruction_Register is
	begin
	process(clock_RADE)
	variable store_instruction : std_logic_vector(31 downto 0);
	begin
	if rising_edge(clock_RADE) then
		store_instruction := input_instruction;
		opcode_RADE <= store_instruction(31 downto 26);
		RS_adr_RADE <= store_instruction(25 downto 21);
		RT_adr_RADE <= store_instruction(20 downto 16);
		RD_adr_RADE <= store_instruction(15 downto 11);
		shift_RADE	<= store_instruction(10 downto 6);
		function_RADE <= store_instruction(5 downto 0);
	end if;
end process;
end architecture;
