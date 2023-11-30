----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2023 07:23:32 PM
-- Design Name: 
-- Module Name: UI_MUX - Behavioral
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

entity UI_MUX is
  Port (DB, UI: in std_logic_vector(7 downto 0);
        SEL: in std_logic;
        UI_OUT: out std_logic_vector(7 downto 0) );
end UI_MUX;

architecture Behavioral of UI_MUX is

begin

    UI_OUT <= UI when SEL = '0' else DB;
    
end Behavioral;
