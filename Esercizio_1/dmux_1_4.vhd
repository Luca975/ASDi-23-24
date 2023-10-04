library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity dmux_1_4 is
	port (
		x : in STD_LOGIC;
		sel : in UNSIGNED (1 downto 0);
		y : out STD_LOGIC_VECTOR (0 to 3)
	);
end dmux_1_4;

architecture dataflow of dmux_1_4 is
	
	begin
		y <= x&"000" when sel = "00" else
			'0'&x&"00" when sel = "01" else
			"00"&x&'0' when sel = "10" else
			"000"&x when sel = "11" else
			"----";
end dataflow;