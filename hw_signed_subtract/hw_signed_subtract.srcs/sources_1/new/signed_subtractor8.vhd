----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2023 10:10:05 PM
-- Design Name: 
-- Module Name: signed_subtractor8 - Behavioral
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

entity signed_subtractor8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Diff : out STD_LOGIC_VECTOR (7 downto 0);
           Overflow : out STD_LOGIC);
end signed_subtractor8;

architecture Behavioral of signed_subtractor8 is

begin
    process (A, B)
        variable Bo: std_logic_vector (0 to 8);
    begin
        Bo(0) := '0';
        for i in 0 to 7 loop
            Diff(i) <= A(i) xor B(i) xor Bo(i);
            Bo(i+1) := (not A(i) and B(i)) or (not A(i) and Bo(i)) or (B(i) and Bo(i));
        end loop;
        Overflow <= Bo(8) xor Bo(7);
        
    end process;

end Behavioral;
