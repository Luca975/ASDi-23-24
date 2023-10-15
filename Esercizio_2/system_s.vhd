library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity system_s is
    port(
    s_in      : in std_logic_vector(3 downto 0);
    s_bus_out : out std_logic_vector(7 downto 0);
    s_out     : out std_logic_vector(3 downto 0) 
    );
end system_s;

architecture structural of system_s is
    signal s_bus : std_logic_vector(7 downto 0) := (others => 'U');
    
    component ROM
        port(
            address : in  std_logic_vector(3 downto 0);
            d_out   : out std_logic_vector(7 downto 0)
        );
     end component;
     
     component M 
        port(
            input : in  STD_LOGIC_VECTOR (7 downto 0);
		    output: out STD_LOGIC_VECTOR (3 downto 0)
        );
     end component;
     
     
     begin
        ROM_s: ROM port map(s_in,s_bus);
        M_s  : M port map(s_bus,s_out);
        s_bus_out <= s_bus;   
     
end structural;