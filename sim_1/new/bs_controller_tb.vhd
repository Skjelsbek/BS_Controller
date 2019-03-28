library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bs_controller_tb is
--  Port ( );
end bs_controller_tb;

architecture arch of bs_controller_tb is
    
    component bs_controller
        port
        (
            load: in std_logic;
            ab: in std_logic_vector(2 downto 0);
            ins: out std_logic_vector(7 downto 0)
        );
    end component bs_controller;
    
    signal clk: std_logic := '0';
    
    signal s_load: std_logic;
    signal s_ab: std_logic_vector(2 downto 0) := (others => '0');
    signal s_ins: std_logic_vector(7 downto 0);    
    
begin
    
    UUT: bs_controller
        port map
        (
            load => s_load,
            ab => s_ab,
            ins => s_ins
        );
    
    clk <= not clk after 5ns;
    
    process(clk)
    begin
        if (rising_edge(clk)) then
            if (unsigned(s_ab) < 2**(s_ab'Length) - 1) then              
                s_ab <= std_logic_vector(unsigned(s_ab) + 1);
            end if;
        end if;
    end process;
    
    s_load <= '1' when unsigned(s_ab) mod 8 = 0 else '0';
end arch;
