library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is 
    port(
        address : in  std_logic_vector(3 downto 0);
        d_out   : out std_logic_vector(7 downto 0)
        );
end entity ROM;

architecture RTL of ROM is
    type MEMORY_16_8 is array(0 to 15) of std_logic_vector(7 downto 0);
    constant ROM_16_8: MEMORY_16_8 :=(
     x"00",
     x"81",
     x"02",
     x"13",
     x"04",
     x"05",
     x"26",
     x"07",
     x"28",
     x"09",
     x"5a",
     x"5b",
     x"0c",
     x"3d",
     x"0e",
     x"0f"
    );
    begin
     main : process(address)
     begin
        d_out <= ROM_16_8(to_integer(unsigned(address)));
     end process main;
end architecture RTL;
