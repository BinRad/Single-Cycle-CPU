library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity Radensky_control_unit is
  port(
	  opcode_RADE         			: in std_logic_vector(5 downto 0);
	  RegDst_RADE						: out std_logic;
	  ALUsrc_RADE						: out std_logic;
	  MemtoReg_RADE					: out std_logic;
	  RegWrite_RADE					: out std_logic;
	  MemWrite_RADE					: out std_logic;
	  PCSrc_RADE						: out std_logic;
	  ExtOp_RADE						: out std_logic;
	  ALUctrl_RADE						: out std_logic_vector(2 downto 0)
	);
end Radensky_control_unit;
architecture arch of Radensky_control_unit is
begin
process(opcode_RADE)
	if opcode_RADE = "000000" then
		RegDst_RADE 	<= '1';
		ALUsrc_RADE 	<= '0';
		MemtoReg_RADE 	<= '0';
		RegWrite_RADE	<= '1';
		MemWrite_RADE	<= '0';
		PCSrc_RADE		<= '0';
		ExtOp_RADE		<= '0';
		ALUctrl_RADE	<= '100';
	elsif opcode_RADE = "001101" then --or immediate x0d
		RegDst_RADE		<= '0';
		ALUsrc_RADE		<= '1';
		MemtoReg_RADE	<= '0';
		RegWrite_RADE	<= '1';
		MemWrite_RADE	<= '0';
		PCSrc_RADE		<= '0';
		ExtOp_RADE		<= '0';
		ALUctrl_RADE	<= '010';
	elsif opcode_RADE = "000100" then ---Branch on Equal
		RegDst_RADE		<= '0';
		ALUsrc_RADE		<= '0';
		MemtoReg_RADE	<= '0';
		RegWrite_RADE	<= '0';
		MemWrite_RADE	<= '0';
		PCSrc_RADE		<= '1'; --how does it decide?
		ExtOp_RADE		<= '1'; --gets imm?
		ALUctrl_RADE	<= '001'; --subtract
	elsif opcode_RADE = "100011" then -- load word
		RegDst_RADE 	<= '0';
		ALUsrc_RADE		<= '1';
		MemtoReg_RADE	<= '1';
		RegWrite_RADE	<= '1';
		MemWrite_RADE	<= '0';
		PCSrc_RADE		<= '0';
		ExtOp_RADE		<= '1';
		ALUctrl_RADE	<= '000'; --add
	elsif opcode_RADE = "101011" then -- store word
		RegDst_RADE		<= '0';
		ALUsrc_RADE		<= '1';
		MemtoReg_RADE	<= '0';
		RegWrite_RADE	<= '0';
		MemWrite_RADE	<= '1';
		PCSrc_RADE		<= '0';
		ExtOp_RADE		<= '1';
		ALUctrl_RADE	<= '000'; --add
	-- elsif opcode_RADE = "000101" then ---Branch not Equal
	-- 	RegDst_RADE
	-- 	ALUsrc_RADE
	-- 	MemtoReg_RADE
	-- 	RegWrite_RADE
	-- 	MemWrite_RADE
	-- 	PCSrc_RADE
	-- 	ExtOp_RADE
	-- 	ALUop_RADE
	-- elsif opcode_RADE = "001001" then --stl immediate x0a
	-- 	RegDst_RADE
	-- 	ALUsrc_RADE
	-- 	MemtoReg_RADE
	-- 	RegWrite_RADE
	-- 	MemWrite_RADE
	-- 	PCSrc_RADE
	-- 	ExtOp_RADE
	-- 	ALUop_RADE
	-- elsif opcode_RADE = "001010" then --stl unsigned imm x0b
	-- 	RegDst_RADE
	-- 	ALUsrc_RADE
	-- 	MemtoReg_RADE
	-- 	RegWrite_RADE
	-- 	MemWrite_RADE
	-- 	PCSrc_RADE
	-- 	ExtOp_RADE
	-- 	ALUop_RADE
		-- elsif opcode_RADE = "001100" then --and imm x0c
		-- RegDst_RADE
		-- ALUsrc_RADE
		-- MemtoReg_RADE
		-- RegWrite_RADE
		-- MemWrite_RADE
		-- PCSrc_RADE
		-- ExtOp_RADE
		-- ALUctrl_RADE	<= '
	end if;
 end process;
end architecture;
