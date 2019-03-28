library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom is
    port
    (
        ab: in std_logic_vector(2 downto 0);
        db: out std_logic_vector(7 downto 0)

    );
end rom;

architecture arch of rom is
    
    -- Sizes
    constant ABW: integer := 3;
    constant DBW: integer := 8;
    
    -- Instructions
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
        
    type rom_type is array(0 to (2**ABW) - 1) of std_logic_vector(DBW - 1 downto 0);
    constant rom: rom_type :=
    (
        TMS1,
        TMS0,
        --SHF,   -- addr 00
        --x"0F",  -- addr 01
        x"31",  -- addr 02
        x"F0",  -- addr 03
        x"5E",  -- addr 04
        x"97",  -- addr 05
        x"A8",  -- addr 06
        x"2B"   -- addr 07   
    );

begin

    db <= rom(to_integer(unsigned(ab)));
end arch;
