----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2023 07:06:54 PM
-- Design Name: 
-- Module Name: ALU_ACC_TB - Behavioral
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

entity ALU_ACC_TB is
--  Port ( );
end ALU_ACC_TB;

architecture Behavioral of ALU_ACC_TB is

component ALU_ACC is
  Port (UI: in std_logic_vector(7 downto 0);
        SEL, WR_SEL: in std_logic;
        OP_ALU: in std_logic_vector(2 downto 0);
        RESULT: out std_logic_vector(7 downto 0) );
end component;
    signal UI_TB: std_logic_vector(7 downto 0);
    signal SEL_TB, WR_SEL_TB: std_logic;
    signal OP_ALU_TB: std_logic_vector(2 downto 0);
    signal RESULT_TB: std_logic_vector(7 downto 0);
    
    
    
begin


end Behavioral;
