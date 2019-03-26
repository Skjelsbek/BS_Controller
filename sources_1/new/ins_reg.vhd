library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity ins_reg is
  Port  (
            db:     in std_logic_vector(7 downto 0);
            clk:    in std_logic;
            load:   in std_logic;
            ins:    out std_logic_vector(7 downto 0)
        );
end ins_reg;

architecture arch of ins_reg is
    
    signal s_ins: std_logic_vector(7 downto 0);
    
begin
    
    process (clk, s_ins, load)
    begin
        if (rising_edge(clk) and load = '1') then
            ins <= s_ins;            
        end if;
    end process;    
    
    s_ins <= db;
end arch;