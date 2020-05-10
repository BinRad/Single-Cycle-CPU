-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Sun May 10 12:43:10 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Radensky_Single_Cycle_CPU IS 
	PORT
	(
		clock :  IN  STD_LOGIC;
		Signed :  IN  STD_LOGIC;
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
END Radensky_Single_Cycle_CPU;

ARCHITECTURE bdf_type OF Radensky_Single_Cycle_CPU IS 

COMPONENT radensky_alu
	PORT(ALUctr_RADE : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 busA_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 busB_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 zero_RADE : OUT STD_LOGIC;
		 ALU_out_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_two_mux_one
	PORT(sel_RADE : IN STD_LOGIC;
		 a_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 b_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 out_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_adder
	PORT(a_add_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000004";
		 b_add_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0):= x"00000000";
		 out_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_pcext
	PORT(in_RADE : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_register_file
	PORT(Write_Enable_RADE : IN STD_LOGIC;
		 Clock_RADE : IN STD_LOGIC;
		 RD_Addr_RADE : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 RS_Addr_RADE : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 RT_Addr_RADE : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Write_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Read_RS_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Read_RT_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_data_memory
	PORT(Write_Enable_RADE : IN STD_LOGIC;
		 Clock_Data_RADE : IN STD_LOGIC;
		 Address_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Data_In_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Data_Out_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_instruction_memory
	PORT(Address_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Instruction_Out_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_regdst_mux
	PORT(sel_RADE : IN STD_LOGIC;
		 a_RADE : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 b_RADE : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 out_RADE : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT withcompl
	PORT(Signed : IN STD_LOGIC;
		 b0 : IN STD_LOGIC;
		 b1 : IN STD_LOGIC;
		 b2 : IN STD_LOGIC;
		 b3 : IN STD_LOGIC;
		 b4 : IN STD_LOGIC;
		 b5 : IN STD_LOGIC;
		 b6 : IN STD_LOGIC;
		 b7 : IN STD_LOGIC;
		 Radensky_RBin : IN STD_LOGIC := '0';
		 Radensky_RBout : OUT STD_LOGIC;
		 a1 : OUT STD_LOGIC;
		 a2 : OUT STD_LOGIC;
		 a3 : OUT STD_LOGIC;
		 a4 : OUT STD_LOGIC;
		 a5 : OUT STD_LOGIC;
		 a6 : OUT STD_LOGIC;
		 a7 : OUT STD_LOGIC;
		 n1 : OUT STD_LOGIC;
		 n2 : OUT STD_LOGIC;
		 n3 : OUT STD_LOGIC;
		 n4 : OUT STD_LOGIC;
		 n5 : OUT STD_LOGIC;
		 n6 : OUT STD_LOGIC;
		 n7 : OUT STD_LOGIC;
		 d1 : OUT STD_LOGIC;
		 d2 : OUT STD_LOGIC;
		 c1 : OUT STD_LOGIC;
		 d3 : OUT STD_LOGIC;
		 c2 : OUT STD_LOGIC;
		 d4 : OUT STD_LOGIC;
		 c3 : OUT STD_LOGIC;
		 d5 : OUT STD_LOGIC;
		 c4 : OUT STD_LOGIC;
		 d6 : OUT STD_LOGIC;
		 c5 : OUT STD_LOGIC;
		 d7 : OUT STD_LOGIC;
		 c6 : OUT STD_LOGIC;
		 c7 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT radensky_control_unit
	PORT(opcode_RADE : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 RegDst_RADE : OUT STD_LOGIC;
		 ALUsrc_RADE : OUT STD_LOGIC;
		 MemtoReg_RADE : OUT STD_LOGIC;
		 RegWrite_RADE : OUT STD_LOGIC;
		 MemWrite_RADE : OUT STD_LOGIC;
		 PCSrc_RADE : OUT STD_LOGIC;
		 ExtOp_RADE : OUT STD_LOGIC;
		 ALUctrl_RADE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_alu_control_unit
	PORT(func_RADE : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 in_ALUctrl_RADE : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 out_ALUctr_RADE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_instruction_register
	PORT(input_instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 function_RADE : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 immed_RADE : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 opcode_RADE : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 RD_adr_RADE : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 RS_adr_RADE : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 RT_adr_RADE : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 shift_RADE : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_immediate_processor
	PORT(Ext_RADE : IN STD_LOGIC;
		 in_RADE : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT radensky_program_counter
	PORT(clock : IN STD_LOGIC;
		 Addr_in_RADE : IN STD_LOGIC_VECTOR(31 DOWNTO 0):= x"00000000";
		 Addr_out_RADE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	out_RADE :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 
out1_RADE <= SYNTHESIZED_WIRE_40;



b2v_inst : radensky_alu
PORT MAP(ALUctr_RADE => SYNTHESIZED_WIRE_0,
		 busA_RADE => SYNTHESIZED_WIRE_1,
		 busB_RADE => SYNTHESIZED_WIRE_2,
		 zero_RADE => SYNTHESIZED_WIRE_21,
		 ALU_out_RADE => SYNTHESIZED_WIRE_36);


b2v_inst1 : radensky_two_mux_one
PORT MAP(sel_RADE => SYNTHESIZED_WIRE_3,
		 a_RADE => SYNTHESIZED_WIRE_36,
		 b_RADE => SYNTHESIZED_WIRE_5,
		 out_RADE => out_RADE);


b2v_inst10 : radensky_adder
PORT MAP(a_add_RADE => SYNTHESIZED_WIRE_37,
		 b_add_RADE => SYNTHESIZED_WIRE_7,
		 out_RADE => SYNTHESIZED_WIRE_34);


b2v_inst11 : radensky_pcext
PORT MAP(in_RADE => SYNTHESIZED_WIRE_38,
		 out_RADE => SYNTHESIZED_WIRE_7);


b2v_inst12 : radensky_register_file
PORT MAP(Write_Enable_RADE => SYNTHESIZED_WIRE_9,
		 Clock_RADE => clock,
		 RD_Addr_RADE => SYNTHESIZED_WIRE_10,
		 RS_Addr_RADE => SYNTHESIZED_WIRE_11,
		 RT_Addr_RADE => SYNTHESIZED_WIRE_39,
		 Write_RADE => out_RADE,
		 Read_RS_RADE => SYNTHESIZED_WIRE_1,
		 Read_RT_RADE => SYNTHESIZED_WIRE_40);


b2v_inst13 : radensky_data_memory
PORT MAP(Write_Enable_RADE => SYNTHESIZED_WIRE_13,
		 Clock_Data_RADE => clock,
		 Address_RADE => SYNTHESIZED_WIRE_36,
		 Data_In_RADE => SYNTHESIZED_WIRE_40,
		 Data_Out_RADE => SYNTHESIZED_WIRE_5);


b2v_inst14 : radensky_instruction_memory
PORT MAP(Address_RADE => SYNTHESIZED_WIRE_41,
		 Instruction_Out_RADE => SYNTHESIZED_WIRE_25);


b2v_inst15 : radensky_regdst_mux
PORT MAP(sel_RADE => SYNTHESIZED_WIRE_17,
		 a_RADE => SYNTHESIZED_WIRE_39,
		 b_RADE => SYNTHESIZED_WIRE_19,
		 out_RADE => SYNTHESIZED_WIRE_10);


SYNTHESIZED_WIRE_32 <= SYNTHESIZED_WIRE_20 AND SYNTHESIZED_WIRE_21;


b2v_inst17 : withcompl
PORT MAP(Signed => Signed,
		 b0 => out_RADE(0),
		 b1 => out_RADE(1),
		 b2 => out_RADE(2),
		 b3 => out_RADE(3),
		 b4 => out_RADE(4),
		 b5 => out_RADE(5),
		 b6 => out_RADE(6),
		 b7 => out_RADE(7),
		 Radensky_RBout => Radensky_RBout,
		 a1 => a1,
		 a2 => a2,
		 a3 => a3,
		 a4 => a4,
		 a5 => a5,
		 a6 => a6,
		 a7 => a7,
		 n1 => n1,
		 n2 => n2,
		 n3 => n3,
		 n4 => n4,
		 n5 => n5,
		 n6 => n6,
		 n7 => n7,
		 d1 => d1,
		 d2 => d2,
		 c1 => c1,
		 d3 => d3,
		 c2 => c2,
		 d4 => d4,
		 c3 => c3,
		 d5 => d5,
		 c4 => c4,
		 d6 => d6,
		 c5 => c5,
		 d7 => d7,
		 c6 => c6,
		 c7 => c7);


b2v_inst2 : radensky_control_unit
PORT MAP(opcode_RADE => SYNTHESIZED_WIRE_22,
		 RegDst_RADE => SYNTHESIZED_WIRE_17,
		 ALUsrc_RADE => SYNTHESIZED_WIRE_28,
		 MemtoReg_RADE => SYNTHESIZED_WIRE_3,
		 RegWrite_RADE => SYNTHESIZED_WIRE_9,
		 MemWrite_RADE => SYNTHESIZED_WIRE_13,
		 PCSrc_RADE => SYNTHESIZED_WIRE_20,
		 ExtOp_RADE => SYNTHESIZED_WIRE_26,
		 ALUctrl_RADE => SYNTHESIZED_WIRE_24);


b2v_inst3 : radensky_alu_control_unit
PORT MAP(func_RADE => SYNTHESIZED_WIRE_23,
		 in_ALUctrl_RADE => SYNTHESIZED_WIRE_24,
		 out_ALUctr_RADE => SYNTHESIZED_WIRE_0);


b2v_inst4 : radensky_instruction_register
PORT MAP(input_instruction => SYNTHESIZED_WIRE_25,
		 function_RADE => SYNTHESIZED_WIRE_23,
		 immed_RADE => SYNTHESIZED_WIRE_38,
		 opcode_RADE => SYNTHESIZED_WIRE_22,
		 RD_adr_RADE => SYNTHESIZED_WIRE_19,
		 RS_adr_RADE => SYNTHESIZED_WIRE_11,
		 RT_adr_RADE => SYNTHESIZED_WIRE_39);


b2v_inst5 : radensky_immediate_processor
PORT MAP(Ext_RADE => SYNTHESIZED_WIRE_26,
		 in_RADE => SYNTHESIZED_WIRE_38,
		 out_RADE => SYNTHESIZED_WIRE_30);


b2v_inst6 : radensky_two_mux_one
PORT MAP(sel_RADE => SYNTHESIZED_WIRE_28,
		 a_RADE => SYNTHESIZED_WIRE_40,
		 b_RADE => SYNTHESIZED_WIRE_30,
		 out_RADE => SYNTHESIZED_WIRE_2);


b2v_inst7 : radensky_program_counter
PORT MAP(clock => clock,
		 Addr_in_RADE => SYNTHESIZED_WIRE_31,
		 Addr_out_RADE => SYNTHESIZED_WIRE_41);


b2v_inst8 : radensky_two_mux_one
PORT MAP(sel_RADE => SYNTHESIZED_WIRE_32,
		 a_RADE => SYNTHESIZED_WIRE_37,
		 b_RADE => SYNTHESIZED_WIRE_34,
		 out_RADE => SYNTHESIZED_WIRE_31);


b2v_inst9 : radensky_adder
PORT MAP(b_add_RADE => SYNTHESIZED_WIRE_41,
		 out_RADE => SYNTHESIZED_WIRE_37);


END bdf_type;