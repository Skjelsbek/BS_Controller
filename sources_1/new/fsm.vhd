library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity fsm is
  Port (
            clk, reset: in std_logic;
            -- ROM --
            ab: out std_logic;
            -- instruction register --
            ins: in std_logic_vector(7 downto 0);
            load: out std_logic;
            -- program counter --
            pc: in std_logic;
            inc_pc: out std_logic;
            -- outputs --
            MTMS: out std_logic;
            MTCK: out std_logic
            --SI1: in std_logic;
            --ST2: in std_logic;
         );
end fsm;

architecture arch of fsm is

constant TMS0:  std_logic_vector(7 downto 0):= x"A0";
constant TMS1:  std_logic_vector(7 downto 0):= x"A1";
constant RST:   std_logic_vector(7 downto 0):= x"A2";
constant NTCK:  std_logic_vector(7 downto 0):= x"A3";
constant SHF:   std_logic_vector(7 downto 0):= x"A4";
constant SHFCP: std_logic_vector(7 downto 0):= x"A5";
constant SSO00: std_logic_vector(7 downto 0):= x"A6";
constant SSO01: std_logic_vector(7 downto 0):= x"A7";
constant SSO10: std_logic_vector(7 downto 0):= x"A8";
constant SSO11: std_logic_vector(7 downto 0):= x"A9";
constant WSI00: std_logic_vector(7 downto 0):= x"AA";
constant WSI01: std_logic_vector(7 downto 0):= x"AB";
constant WSI10: std_logic_vector(7 downto 0):= x"AC";
constant WSI11: std_logic_vector(7 downto 0):= x"AD";
constant HALT:  std_logic_vector(7 downto 0):= x"AF";

type state is
            (
                ALL_0, ALL_1,
                TMS0_2, TMS1_2, TMS0_3, TMS1_3,
                RST_2, NTCK_2, SHF_2, SCFCP_2, 
                SSO00_2, SSO01_2, SSO10_2, SSO11_2,
                WSI00_2, WSI01_2, WSI10_2, WSI11_2, 
                HALT_2
            );

signal state_reg: state;
signal state_next: state:= ALL_0;



begin

-- instruction register --
load <= '0';
-- program counter --
inc_pc <= '0';
-- outputs --
MTCK <= '0';
MTMS <= '0';
    

    -- Register
    process (clk, reset)
    begin
        if (reset = '1') then
            state_reg <= ALL_0;
            load <= '0';  
        elsif (rising_edge(clk)) then
            state_reg <= state_next;         
        end if;
    end process;
    
    
    -- Next state logic
    process(state_reg)
        begin
        
        case(state_reg) is
        
        when ALL_0 =>
            ab <= pc;
            load <= '1';
            inc_pc <= '1';
            state_next <= ALL_1;
        when ALL_1 =>    
            if    (ins = TMS0)  then
                state_next <= TMS0_2;
            elsif (ins = TMS1)  then
                state_next <= TMS1_2;
            elsif (ins = RST)   then
            elsif (ins = NTCK)  then
            elsif (ins = SHF)   then
            elsif (ins = SHFCP) then
            elsif (ins = SSO00) then
            elsif (ins = SSO01) then
            elsif (ins = SSO10) then
            elsif (ins = SSO11) then
            elsif (ins = WSI00) then
            elsif (ins = WSI01) then
            elsif (ins = WSI10) then
            elsif (ins = WSI11) then
            else
                state_next <= TMS0_2;
            end if;
            
        when TMS0_2 =>
            MTMS <= '0';
            state_next <= TMS0_3;
        when TMS1_2 =>
            MTMS <= '1';
            state_next <= TMS1_3;
        when TMS0_3 =>
            MTMS <= '0';
            MTCK <= '1';
            state_next <= ALL_0;
        when TMS1_3 =>
            MTMS <= '1';
            MTCK <= '1';
            state_next <= ALL_0;
            
        end case;
        
        end
    process;



end arch;
