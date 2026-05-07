--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;


entity top_basys3 is
    port(
        -- inputs
        clk     :   in std_logic; -- native 100MHz FPGA clock
        sw      :   in std_logic_vector(7 downto 0); -- operands and opcode
        btnU    :   in std_logic; -- reset
        btnC    :   in std_logic; -- fsm cycle
        btnL    :   in std_logic; -- clock divider button for TDM4
        
        -- outputs
        led :   out std_logic_vector(15 downto 0);
        -- 7-segment display segments (active-low cathodes)
        seg :   out std_logic_vector(6 downto 0);
        -- 7-segment display active-low enables (anodes)
        an  :   out std_logic_vector(3 downto 0)
    );
end top_basys3;

architecture top_basys3_arch of top_basys3 is 
  
	-- declare components and signals
  signal w_o_cycle : std_logic_vector(3 downto 0); -- 4 cycles/states 
  signal w_clk : std_logic;
  signal w_clk_reset: std_logic;
  
  signal a_val : std_logic_vector(7 downto 0);
  signal b_val : std_logic_vector(7 downto 0);
  signal register_sw : std_logic_vector(7 downto 0);
    
  signal w_o_result : std_logic_vector(7 downto 0);
  signal w_decoder_hex: std_logic_vector(3 downto 0); -- seven seg decoder 
  
  
  --tdm 4 signals
  signal w_o_sign : std_logic;
  signal w_i_bin : std_logic_vector(7 downto 0);
  signal w_o_hund :  std_logic_vector(3 downto 0);
  signal w_o_tens :  std_logic_vector(3 downto 0);
  signal w_o_ones :  std_logic_vector(3 downto 0);
  signal w_an :  std_logic_vector(3 downto 0);
  
  signal w_o_sign_mux :  std_logic_vector(6 downto 0); -- output signal of negative sign
  signal w_i_bin_mux :  std_logic_vector(7 downto 0); --
  
  signal w_seg_mux :  std_logic_vector(6 downto 0);
  signal w_seg :  std_logic_vector(6 downto 0);
  
  signal w_clearDisp :  std_logic_vector(3 downto 0);

  signal w_i_adv : std_logic;


  
  
begin
	-- PORT MAPS ----------------------------------------

	-- ALU inst, wire the swtiches for i_op (sw 2:0)
	-- make a signal for the ALU result (w_o_result : std_logic_vector(7 downto 0))
	-- o_flags => led(15 downto 12)
	
	-- seven seg (111110)
	-- CONCURRENT STATEMENTS ----------------------------
	
	-- signal w_sign_mux <= "1111111" when o_sign = '0' else
--	                        "1111110";
	-- seven seg mux  <= w_sign_mux when (w_sel = "0111") else
	--                   w_seg;
	
	-- clear display mux "1111" when (w_o_cycle = "0001") else
	--                    "0000";
	
	-- sw <= reg_sw;
	
	--- process (w_o_cycle(1)
--	begin
--	if btnU = '1';
--	reg_a_val = "00000000" <= (w_o_cycle(1 then
--	reg_a_val <= reg_sw'
--	end if 
--	end process;
end top_basys3_arch;
