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
            clk, reset: in std_logic;
            MTMS, MTCK: out std_logic
        );
    end component bs_controller;
    
    signal s_clk, s_reset: std_logic := '1';
    signal s_MTMS, s_MTCK: std_logic;
    
begin
    
    UUT: bs_controller
        port map
        (
            clk => s_clk,
            reset => s_reset,
            MTMS => s_MTMS,
            MTCK => s_MTCK
        );
    
    s_clk <= not s_clk after 5ns;
    
    process
    begin
        wait for 10ns;
        s_reset <= '0';
        wait;
    end process;
end arch;
