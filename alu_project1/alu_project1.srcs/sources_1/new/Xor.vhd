----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 03:45:11 PM
-- Design Name: 
-- Module Name: Xor - Behavioral
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

entity Xorr is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0);
           Cout : out STD_LOGIC);
end Xorr;

architecture Behavioral of Xorr is
    component xor_single is
        port (A, B : in std_logic;
              Y : out std_logic );
    end component;
begin
G1 : for i in 7 downto 0 generate
    xor_gate : xor_single
        port map ( A => A(i),
                   B => B(i),
                   Y => Y(i));
    end generate G1;
    Cout <= Cin;
end Behavioral;
