


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller_fsm is
    Port ( i_reset : in STD_LOGIC;
           i_adv : in STD_LOGIC;
           o_cycle : out STD_LOGIC_VECTOR (3 downto 0));
end controller_fsm;

architecture FSM of controller_fsm is

signal w_o_cycle : STD_LOGIC_VECTOR (3 downto 0);

begin

adv_process : process(i_adv)
	begin
		if i_reset = '1' then
			w_o_cycle <= "0001";
		elsif rising_edge(i_clk) then
			W_o_cycle <= o_cycle_next;
		end if;
	end process adv_process;
	
end FSM;
