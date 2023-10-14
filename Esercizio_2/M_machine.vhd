library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M is
	port(
		input : in STD_LOGIC_VECTOR (7 downto 0);
		output: out STD_LOGIC_VECTOR (3 downto 0);
	);
end M;

architecture structural of M is

	signal z : STD_LOGIC_VECTOR (1 downto 0);
	alias op_code : STD_LOGIC_VECTOR (1 downto 0) is input(1 downto 0);
	alias values : STD_LOGIC_VECTOR (1 downto 0) is input (3 downto 2);
	alias nibble : STD_LOGIC_VECTOR (3 downto 0) is input(7 downto 4);

	component mux_2_1
		port(
				a0 	: in STD_LOGIC;
				a1 	: in STD_LOGIC;
				s 	: in STD_LOGIC;
				y 	: out STD_LOGIC
		);
	end component;
	
	begin
	
	-- values inversion network
	inv0: mux_2_1 port map(values(0),values(1),op_code(0),z(0));
	inv1: mux_2_1 port map(values(1),values(0),op_code(0),z(1));

	-- nibble selection network
	
	m_all: for i in 0 to 3 generate
	
		LSB : if (i < 2) generate
				m: mux_2_1 port map(z(i),nibble(i),op_code(1),output(i));
		end generate LSB;
		MSB : if (i >= 2) generate 
				m: mux_2_1 port map(nibble(i),z(i mod 2),op_code(1),output(i));
		end generate MSB;
		
	end generate m_all;

end structural;