library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity fsm is
--  Port ( );
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
                TMS0_2, TMS1_2, 
                RST_2, NTCK_2, SHF_2, SCFCP_2, 
                SSO00_2, SSO01_2, SSO10_2, SSO11_2,
                WSI00_2, WSI01_2, WSI10_2, WSI11_2, 
                HALT_2
            );

begin




end arch;
