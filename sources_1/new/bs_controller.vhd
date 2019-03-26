library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bs_controller is
--  Port ( );
end bs_controller;

architecture Behavioral of bs_controller is
    
    signal s_ab: std_logic_vector(2 downto 0);
    signal s_db: std_logic_vector(7 downto 0);
    
begin

    rom_c: entity work.rom(arch)
        port map
        (
            ab => s_ab,
            db => s_db
        );

end Behavioral;
