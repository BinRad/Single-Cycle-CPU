library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Radensky_Immediate_Processor is
	port(
		opcode_RADE         		: in std_logic_vector(5 downto 0);	
		RD_adr_RADE				   : in std_logic_vector(4 downto 0);
		shift_RADE          		: in std_logic_vector(4 downto 0);
		function_RADE       		: in std_logic_vector(5 downto 0);	
		RT_Passthrough_RADE		: in std_logic_vector(31 downto 0);	
		clock_RADE			 	 	: in std_logic;
		Output_RADE					: out std_logic_vector(31 downto 0)
	);
end Radensky_Immediate_Processor;
architecture arch of Radensky_Immediate_Processor is
	begin
	process(clock_RADE)
		variable immediate_field : std_logic_vector(31 downto 0) := (others => '0');
	begin
	if rising_edge(clock_RADE) then
		immediate_field(31 downto 16) := (others => '0');
		immediate_field(15 downto 0) := RD_adr_RADE & shift_RADE & function_RADE;
		if opcode_RADE = ("000000" or "000100" or "000101") then --its not immediate
		  Output_RADE <= RT_Passthrough_RADE;
		elsif opcode_RADE = "001001" then --stl immediate x0a
			immediate_field(31 downto 16) := (others => immediate_field(15));
			output_RADE <= immediate_field;
		else
			output_RADE <= immediate_field;
	  end if;
	end if;
end process;
end architecture;