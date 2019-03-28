library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bs_controller is
    port
    (
        clk, reset: in std_logic;
        MTMS, MTCK: out std_logic
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
    
    component fsm
        port
        (
            clk, reset: in std_logic;
            -- ROM --
            ab: out std_logic_vector(2 downto 0);
            -- instruction register --
            ins: in std_logic_vector(7 downto 0);
            load: out std_logic;
            -- program counter --
            pc: in std_logic_vector(2 downto 0);
            inc_pc: out std_logic;
            -- outputs --
            MTMS: out std_logic;
            MTCK: out std_logic
            --SI1: in std_logic;
            --ST2: in std_logic;
        );   
    end component fsm;
    
    component prog_cntr
        Generic
        (
                N: integer   := 8
        );
    
        Port (  rst          : in std_logic;
                inc_from_fsm : in std_logic;
                pc_to_fsm    : out std_logic_vector(N-1 downto 0));
    end component prog_cntr;
    
    signal s_ab, s_pc: std_logic_vector(2 downto 0);
    signal s_db, s_ins: std_logic_vector(7 downto 0);    
    signal s_inc_pc, s_load: std_logic;
    
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
            load => s_load,
            db => s_db,
            ins => s_ins
        );
        
    c_prog_cntr: prog_cntr
        generic map
        (
            N => 3
        )
        port map
        (
            rst => reset,
            inc_from_fsm => s_inc_pc,
            pc_to_fsm => s_pc
        );
        
    c_fsm: fsm
        port map
        (
            clk => clk,
            reset => reset,
            ab => s_ab,            
            ins => s_ins,
            load => s_load,
            pc => s_pc,
            inc_pc => s_inc_pc,
            MTMS => MTMS,
            MTCK => MTCK
        );
end arch;
