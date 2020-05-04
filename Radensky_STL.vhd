library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Radensky_STL is
  generic(N : integer := 32);
  port(
    a         		 : in std_logic_vector(N-1 downto 0);
    b	         	 : in std_logic_vector(N-1 downto 0);
	 sign_RADE		 : in std_logic;
    result   		 : out std_logic_vector(N-1 downto 0)
  );
end Radensky_STL;

architecture arch of Radensky_STL is
  begin
  process(sign_RADE, a,b)
begin
	if(sign_RADE = '0') then
		if(a < b) then
			result <= (result'range => '1');
		else
			result <= (result'range => '0');
			end if;
	else
		if(a(N-1) > b(N-1)) then
			result <= (others => '1');
		elsif(a(N-1) = b(N-1)) then
			if(a(N-2 downto 0) < b(N-2 downto 0)) then
				result <= (result'range => '1');
			else
				result <= (result'range => '0');
			end if;
		else
			result <= (result'range => '0');
		end if;
	end if;
end process;
end architecture;