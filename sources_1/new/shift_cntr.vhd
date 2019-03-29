

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shift_cntr is
  Port (clk : in STD_LOGIC;
  		load_N : in STD_LOGIC;
  		load_N_5 : in STD_LOGIC; -- I hate this
  		N : in STD_LOGIC_VECTOR(7 downto 0);
  		decr : in STD_LOGIC; incr : in STD_LOGIC;
  		shift_cntr_s_tick : out STD_LOGIC);
end shift_cntr;

architecture arch of shift_cntr is

--signal N_val : unsigned(7 downto 0);
signal cnt_reg, cnt_next : unsigned(7 downto 0);

begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			cnt_reg <= cnt_next;
		end if;
	end process;

	process(load_n, incr, decr, load_N_5)
	begin
		shift_cntr_s_tick <= '0';
		if (rising_edge(load_N)) then
			cnt_next <= unsigned(N);
		elsif (rising_edge(load_N_5)) then
			cnt_next <= x"05";
		elsif (rising_edge(incr)) then
			cnt_next <= cnt_reg+1;
		elsif (rising_edge(decr)) then
			cnt_next <= cnt_reg-1;
		end if;
		if (cnt_reg = 0) then
			shift_cntr_s_tick <= '1';
		end if;
	end process;
end arch;
