


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
    type state_of_fsm is (clearDisp, LoadA, LoadB, dispResult);
    signal f_Q, f_Q_next : state_of_fsm;

signal w_o_cycle : STD_LOGIC_VECTOR (3 downto 0);

begin

f_Q_next <= LoadA when (f_Q = clearDisp) else
            LoadB when (f_Q = LoadA) else
            dispResult when (f_Q = LoadB) else
            clearDisp when (f_Q = dispResult);

with f_Q select
    o_cycle <= "0001" when clearDisp,
                "0010" when LoadA,
                "0100" when LoadB,
                "1000" when dispResult;
                
process(i_adv)
	begin
		if i_reset = '1' then
			f_Q <= clearDisp;
		elsif rising_edge(i_adv) then
			f_Q <= f_Q_next;
		end if;
	end process;
	
end FSM;
