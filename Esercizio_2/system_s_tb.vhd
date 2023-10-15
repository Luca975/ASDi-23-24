library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity system_s_tb is
end system_s_tb;

architecture structural of system_s_tb is
    signal tb_in  : std_logic_vector(3 downto 0) := (others => 'U');
    signal tb_bus : std_logic_vector(7 downto 0) := (others => 'U');   
    signal tb_out : std_logic_vector(3 downto 0) := (others => 'U');
    
    component system_s
        port(
            s_in  : in std_logic_vector(3 downto 0);
            s_bus_out : out std_logic_vector(7 downto 0);
            s_out : out std_logic_vector(3 downto 0) 
        );
    end component;
   
     begin
        utt: system_s port map(tb_in,tb_bus,tb_out);  
             
        stim_proc : process
        begin
            wait for 50 ns;
            tb_in <= "1000";
            wait for 10 ns;
            tb_in <= "1010";
            wait for 10 ns;
            
            wait;
        end process;

end;