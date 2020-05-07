library ieee;
use ieee.std_logic_1164.all;

entity Radensky_alu_control_unit is
  port(
	  func_RADE         			: in std_logic_vector(5 downto 0);
	  in_ALUctrl_RADE				: in std_logic_vector(2 downto 0);
	  out_ALUctr_RADE				: out std_logic_vector(2 downto 0)
	);
end Radensky_alu_control_unit;
architecture arch of Radensky_alu_control_unit is
	signal ans : std_logic_vector(2 downto 0);
begin
process(func_RADE, in_ALUctrl_RADE)
begin
	case in_ALUctrl_RADE is
		when "100" =>
			case func_RADE is
				when "100000" => ans <= "000";
				when "100010" => ans <= "001";
				when "100101" => ans <= "010";
				when others => ans <= "000";
				end case;
			when others => ans <= in_ALUctrl_RADE;
			end case;
	out_ALUctr_RADE <= ans;

	-- if in_ALUctrl_RADE = "100" then --then its an R type, use func
	-- 	if func_RADE = "100000" then
	-- 		out_ALUctr_RADE <= "000"; --add
	-- 	elsif func_RADE <= "100010" then
	-- 		out_ALUctr_RADE <= "001"; --sub
	-- 	elsif func_RADE = "100101" then  --OR
	-- 		out_ALUctr_RADE <= "010";
	-- 	end if;
	-- else
	-- 	out_ALUctr_RADE <= in_ALUctrl_RADE;
	-- 	end if;
end process;
end architecture;
