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
            -- shift counter
            load_sh_cntr : out std_logic;
            decr_sh_cntr : out std_logic;
            incr_sh_cntr : out std_logic;
            s_tick_sh_cntr : in std_logic;
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

    component shift_cntr is
    Port (  clk : in STD_LOGIC;
            load_N : in STD_LOGIC;
            N : in STD_LOGIC_VECTOR(7 downto 0);
            decr : in STD_LOGIC; incr : in STD_LOGIC;
            shift_cntr_s_tick : out std_logic);
    end component shift_cntr;
    
    signal s_ab, s_pc: std_logic_vector(2 downto 0);
    signal s_db, s_ins: std_logic_vector(7 downto 0);    
    signal s_inc_pc, s_load: std_logic;
    signal load_shift_cntr : std_logic;
    signal decr_shift_cntr, incr_shift_cntr : std_logic;
    signal shift_cntr_s_tick : std_logic;
    
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
            load_sh_cntr => load_shift_cntr,
            decr_sh_cntr => decr_shift_cntr,
            incr_sh_cntr => incr_shift_cntr,
            s_tick_sh_cntr => shift_cntr_s_tick,
            MTMS => MTMS,
            MTCK => MTCK
        );

    c_shift_cntr: shift_cntr
        port map
        (
            clk => clk,
            load_N => load_shift_cntr,
            N => s_db,
            decr => decr_shift_cntr, incr => incr_shift_cntr,
            shift_cntr_s_tick => shift_cntr_s_tick
        );


end arch;
