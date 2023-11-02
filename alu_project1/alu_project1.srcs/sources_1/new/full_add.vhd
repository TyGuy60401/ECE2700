----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 02:43:14 PM
-- Design Name: 
-- Module Name: full_add - Behavioral
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

entity full_add is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Y : out STD_LOGIC;
           Cout : out STD_LOGIC);
end full_add;

architecture Behavioral of full_add is
begin
    Y <= (A AND NOT B AND NOT Cin) OR (NOT A AND NOT B AND Cin) OR (A AND B AND Cin) OR (NOT A AND B AND NOT Cin);
    Cout <= (B AND Cin) OR (A AND Cin) OR (A AND B);
end Behavioral;
