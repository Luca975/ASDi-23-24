library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity seq_finder is
	port(
		A : in std_logic;
		input :	in	std_logic_vector(1 downto 0); -- d = input(0) | M = input(1)
		y :	out	std_logic;
	);
end seq_finder;

architecture behavioural of seq_finder is

type state is (q0,q1,q2,q1n,q2n);
signal cur_state :	state := q0;
signal next_state :	state;

compute_state_y : process (cur_state,input)
	begin
	
	case cur_state is
		when q0 =>
					case input is
						when "-1" =>
									next_state <= q1;
									y <= '0';
						when "00" =>
									next_state <= q1neg;
									y <= '0';
						when others =>
									next_state <= q0;
									y <= '0';
					end case;
		when q1 =>
					case input is
						when "-0" =>
									next_state <= q2;
									y <= '0';
						when "01" =>
									next_state <= q2neg;
									y <= '0';
						when "11" =>
									next_state <= q1;
									y <= '0';
						when others =>
									--next_state <= q0;
									next_state <= q1;
									y <= '0';
					end case;
		when q2 =>
					case input is
						when "-1" =>
									next_state <= q0;
									y <= '1';
						when "00" =>
									next_state <= q0;
									y <= '0';
						when "10" =>
									next_state <= q2;
									y <= '0';
						when others =>
									--next_state <= q0;
									next_state <= q2;
									y <= '0';
					end case;
		when q1n =>
					case input is
						when "0-" =>
									next_state <= q2n;
									y <= '0';
						when "10" =>
									next_state <= q0;
									y <= '0';
						when "11" =>
									next_state <= q1;
									y <= '0';
						when others =>
									--next_state <= q0;
									next_state <= q1n;
									y <= '0';
					end case;
		when q2n =>
					case input is
						when "0-" =>
									next_state <= q0;
									y <= '0';
						when "10" =>
									next_state <= q1n;
									y <= '0';
						when "11" =>
									next_state <= q1;
									y <= '0';
						when others =>
									--next_state <= q0;
									next_state <= q2n;
									y <= '0';
					end case;
		when others =>
					next_state <= q0;
					y <= '0';
	end case;
end process;

mem : process (A)
	
	begin
		if (A'event and A = '1') then
			cur_state <= next_state;
		end if;
end process;

end behavioural;
