library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity prog_cntr is
    Generic
    (
            N: integer   := 8
    );

    Port (  rst          : in std_logic;
            inc_from_fsm : in std_logic;
            pc_to_fsm    : out std_logic_vector(N-1 downto 0):= (others => '0'));
end prog_cntr;
  
architecture arch of prog_cntr is
  
signal pc :unsigned(N-1 downto 0) := (others => '0');
  
begin
    
process (inc_from_fsm, rst)
begin
    if rst = '1' then
        pc <= (others => '0');
    elsif inc_from_fsm = '1' then
        pc <= pc + 1;
    end if;
    
    pc_to_fsm <= std_logic_vector(pc);
end process;

end arch;