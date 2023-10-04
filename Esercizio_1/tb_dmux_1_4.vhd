-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 4.10.2023 16:13:49 UTC

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_dmux_1_4 is
end tb_dmux_1_4;

architecture tb of tb_dmux_1_4 is

    component dmux_1_4
        port (x   : in std_logic;
              sel : in unsigned (1 downto 0);
              y   : out std_logic_vector (0 to 3));
    end component;

    signal x   : std_logic;
    signal sel : unsigned (1 downto 0);
    signal y   : std_logic_vector (0 to 3);

begin

    dut : dmux_1_4
    port map (x   => x,
              sel => sel,
              y   => y);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        wait for 100 ns;
		x <= '1';
        sel <= (others => '0');
		wait for 10 ns;
		sel <= "01";
		wait for 5 ns;
		x <= '0';
		sel <= "11";
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_dmux_1_4 of tb_dmux_1_4 is
    for tb
    end for;
end cfg_tb_dmux_1_4;