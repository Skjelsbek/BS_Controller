library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bs_controller is
    port
    (
        load: in std_logic;        
        ab: in std_logic_vector(2 downto 0);
        ins: out std_logic_vector(7 downto 0)   
    );
end bs_controller;

architecture arch of bs_controller is        
    
    component rom
        port
        (
            ab: in std_logic_vector(2 downto 0);
            db: out std_logic_vector(7 downto 0)
    
        );
    end component rom;
    
    component ins_reg
        port
        (       
            load:   in std_logic;
            db:     in std_logic_vector(7 downto 0);                    
            ins:    out std_logic_vector(7 downto 0)
        );
    end component ins_reg;
    
    signal s_ab: std_logic_vector(2 downto 0);
    signal s_db: std_logic_vector(7 downto 0);
    
begin

    c_rom: rom
        port map
        (
            ab => s_ab,
            db => s_db
        );
    
    c_ins_reg: ins_reg
        port map
        (
            load => load,
            db => s_db,
            ins => ins
        );
        
    s_ab <= ab;
end arch;
