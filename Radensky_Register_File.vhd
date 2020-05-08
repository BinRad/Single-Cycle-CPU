library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Radensky_Register_File is
  port(
  Write_Enable_RADE        	  : in std_logic;
  Clock_RADE                    : in std_logic;
  Write_RADE                    : in std_logic_vector(31 downto 0);
  RS_Addr_RADE                  : in std_logic_vector(4 downto 0);
  RT_Addr_RADE                  : in std_logic_vector(4 downto 0);
  RD_Addr_RADE                  : in std_logic_vector(4 downto 0);
  Read_RS_RADE                  : out std_logic_vector(31 downto 0);
  Read_RT_RADE                  : out std_logic_vector(31 downto 0)
  );
end Radensky_Register_File;
architecture arch of Radensky_Register_File is
  type Register_RADE is array (0 to 31) of std_logic_vector(31 downto 0); --array of 32 32 bit vectors
  signal Reg_RADE             : Register_RADE := (others => x"00000000");   --instantiation
begin
  process(Clock_RADE, Write_Enable_RADE)
  begin
    if rising_edge(Clock_RADE) and Write_Enable_RADE = '1' then

      Reg_RADE(to_integer(unsigned(RD_Addr_RADE)))<= Write_RADE;
	 end if;
  end process;
		Read_RS_RADE <= Reg_RADE(to_integer(unsigned(RS_Addr_RADE)));
		Read_RT_RADE <= Reg_RADE(to_integer(unsigned(RT_Addr_RADE)));
end architecture;
