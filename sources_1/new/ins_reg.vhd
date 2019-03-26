library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity ins_reg is
  Port  (
            db: in std_logic_vector(7 downto 0);
            clk, reset: in std_logic;
            ins: out std_logic
        );
end ins_reg;

architecture arch of ins_reg is

begin


end arch;