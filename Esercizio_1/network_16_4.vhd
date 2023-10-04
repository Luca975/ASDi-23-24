library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity network_16_4 is
	port (
		sources : in STD_LOGIC_VECTOR(0 to 15);
		control : in UNSIGNED (5 downto 0);
		--alias source_sel : UNSIGNED (3 downto 0) is control(5 downto 2);
		--alias dest_sel : UNSIGNED (1 downto 0) is control(1 downto 0);
		dest	: out STD_LOGIC_VECTOR(0 to 3)
	);
end network_16_4;

architecture structural of network_16_4 is

	signal connection : STD_LOGIC;
	
	component mux_16_1
		port(
		input : in STD_LOGIC_VECTOR(0 to 15);
		sel : in STD_LOGIC_VECTOR(3 downto 0);
		output: out STD_LOGIC		
		);
	end component;
	
	component dmux_1_4
		port(
		x : in STD_LOGIC;
		sel : in UNSIGNED (1 downto 0);
		y : out STD_LOGIC_VECTOR (0 to 3)		
		);
	end component;
		
	begin
		mux : mux_16_1
			port map (
				input => sources,
				sel => std_logic_vector(control(5 downto 2)),
				output => connection
			);
		dmux : dmux_1_4
			port map(
			x => connection,
			sel => control(1 downto 0),
			y => dest
			);
end structural;