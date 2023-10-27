-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 27.10.2023 09:04:15 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_seq_finder is
end tb_seq_finder;

architecture tb of tb_seq_finder is

    component seq_finder
        port (A     : in std_logic;
              input : in std_logic_vector (1 downto 0);
              y     : out std_logic);
    end component;

    signal A     : std_logic;
    signal input : std_logic_vector (1 downto 0);
    signal y     : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here (100 MHz)
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : seq_finder
    port map (A     => A,
              input => input,
              y     => y);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    A <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        --A <= '0';
        input <= (others => '0');
		
        -- EDIT Add stimuli here
        wait for 100000000 * TbPeriod; -- 1 s
		
		input <= "10";
		wait for 100000000 * TbPeriod;
		input <= "11";
		wait for 100000000 * TbPeriod;		
		input <= "10";
		wait for 100000000 * TbPeriod;
		input <= "01";
		wait for 100000000 * TbPeriod;
		
		input <= "00";
		wait for 100000000 * TbPeriod;
		input <= "00";
		wait for 100000000 * TbPeriod;
		input <= "10";
		wait for 100000000 * TbPeriod;
		input <= "11";
		wait for 100000000 * TbPeriod;
		input <= "00";
		wait for 100000000 * TbPeriod;
		input <= "01";
		wait for 100000000 * TbPeriod;		
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;