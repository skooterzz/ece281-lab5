----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:50:18 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( i_A : in STD_LOGIC_VECTOR (7 downto 0);
           i_B : in STD_LOGIC_VECTOR (7 downto 0);
           i_op : in STD_LOGIC_VECTOR (2 downto 0); -- ALU control
           o_result : out STD_LOGIC_VECTOR (7 downto 0);
           o_flags : out STD_LOGIC_VECTOR (3 downto 0)); -- n z c v
end ALU;

architecture Behavioral of ALU is

component ripple_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end component ripple_adder;

-- declare signals w_i_B
signal w_i_B : std_logic_vector(7 downto 0);
signal w_ALU_result : std_logic_vector(7 downto 0);

begin
-- port maps -- 
    Port(
    w_i_B <= i_B;
    
    );


w_i_B <= when (i_op(0) = '0') else not i_B;

--flags
o_flags(0) <= not(w_ALU_result(7) or w_ALU_result(6) or w_ALU_result(5) or w_ALU_result(4) or w_ALU_result(3) or w_ALU_result(2) or w_ALU_result(1) or w_ALU_result(0));  
-- negative flag -> look @ MSB to see if its 1 or 0 (neg or pos)
end Behavioral;
