----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 04:15:28 PM
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
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           Op : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
           Cout : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
    component Addc is
        port (A_Addc, B_Addc, Cin_Addc : in std_logic;
              Y_Addc, Cout_Addc: out std_logic);
    end component;
    component Add is
        port (A_Add, B_Add, Cin_Add : in std_logic;
              Y_Add, Cout_Add: out std_logic);
    end component;
    component Xorr is
        port (A_Xorr, B_Xorr, Cin_Xorr : in std_logic;
              Y_Xorr, Cout_Xorr: out std_logic);
    end component;
    component Load is
        port (A_Load, B_Load, Cin_Load : in std_logic;
              Y_Load, Cout_Load: out std_logic);
    end component;
    component Hold is
        port (A_Hold, B_Hold, Cin_Hold : in std_logic;
              Y_Hold, Cout_Hold: out std_logic);
    end component;
begin
Y <= "00001111";
process is 
begin
     if Op(2) = '0' then
         Y <= "11111111";
     else
         Y <= "00000000";
     end if;
     wait;
end process;

end Behavioral;
