library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Radensky_Data_Memory is
  port(
  Write_Enable_RADE        : in std_logic;
  Clock_Data_RADE                    : in std_logic;
  Data_In_RADE                    : in std_logic_vector(31 downto 0);
  Address_RADE                  : in std_logic_vector(31 downto 0);
  Data_Out_RADE                  : out std_logic_vector(31 downto 0)
  );
end Radensky_Data_Memory;
architecture arch of Radensky_Data_Memory is
  type Data_RADE is array (0 to 31) of std_logic_vector(31 downto 0); --array of 32 32 bit vectors
  signal DATA_RADE_I : Data_RADE := (x"00000001", x"00000002", x"00000003", x"00000004",
  x"00000005", others => x"00000000");
begin
  process(Clock_Data_RADE, Write_Enable_RADE)
  begin
    if rising_edge(Clock_Data_RADE) and Write_Enable_RADE = '1' then
			DATA_RADE_I(to_integer(unsigned(Address_RADE(4 downto 0)))) <= Data_In_RADE;
	  end if;
  end process;
  Data_Out_RADE <= DATA_RADE_I(to_integer(unsigned(Address_RADE(4 downto 0))));
end architecture;
