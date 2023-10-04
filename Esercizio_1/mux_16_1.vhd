library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_16_1 is 
	port(
		input : in STD_LOGIC_VECTOR(0 to 15);
		sel : in STD_LOGIC_VECTOR(3 downto 0);
		output: out STD_LOGIC
		);
end mux_16_1;

architecture structural of mux_16_1 is
	
	signal u : STD_LOGIC_VECTOR(0 to 3);
	component mux_4_1
		port(
		b0 : in STD_LOGIC;
		b1 : in STD_LOGIC;
		b2 : in STD_LOGIC;
		b3 : in STD_LOGIC;
		s0 : in STD_LOGIC;
		s1 : in STD_LOGIC;
		y0 : out STD_LOGIC
		);
	end component;
	
	begin
		mux_1: mux_4_1
			port map(
				b0 => input(0),
				b1 => input(1),
				b2 => input(2),
				b3 => input(3),
				s0 => sel(3),
				s1 => sel(2),
				y0 => u(0)
			);
		mux_2: mux_4_1
			port map(
				b0 => input(4),
				b1 => input(5),
				b2 => input(6),
				b3 => input(7),
				s0 => sel(3),
				s1 => sel(2),
				y0 => u(1)
			);			
		mux_3: mux_4_1
			port map(
				b0 => input(8),
				b1 => input(9),
				b2 => input(10),
				b3 => input(11),
				s0 => sel(3),
				s1 => sel(2),
				y0 => u(2)
			);
		mux_4: mux_4_1
			port map(
				b0 => input(12),
				b1 => input(13),
				b2 => input(14),
				b3 => input(15),
				s0 => sel(3),
				s1 => sel(2),
				y0 => u(3)
			);
		mux_5: mux_4_1
			port map(
				b0 => u(0),
				b1 => u(1),
				b2 => u(2),
				b3 => u(3),
				s0 => sel(1),
				s1 => sel(0),
				y0 => output
			);			
end structural;