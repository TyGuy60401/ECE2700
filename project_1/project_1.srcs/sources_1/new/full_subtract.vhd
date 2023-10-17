----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2023 09:33:31 PM
-- Design Name: 
-- Module Name: full_subtract - Behavioral
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

entity full_subtract is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Bi : in STD_LOGIC;
           D : out STD_LOGIC;
           Bo : out STD_LOGIC);
end full_subtract;

architecture Behavioral of full_subtract is

begin
    Bo <= (NOT A AND B) OR (NOT A AND Bi) OR (B AND Bi);
    D  <= (NOT A AND NOT B AND Bi) OR (NOT A AND B AND NOT Bi) OR (A AND B AND Bi) OR (A AND NOT B AND NOT Bi);
end Behavioral;
