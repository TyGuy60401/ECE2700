----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 02:38:55 PM
-- Design Name: 
-- Module Name: Add - Behavioral
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

entity Addc is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in std_logic;
           Y : out STD_LOGIC_VECTOR (7 downto 0);
           Cout : out STD_LOGIC);
end Addc;

architecture Behavioral of Addc is
component full_add is
    port (A, B, Cin : in std_logic;
          Y, Cout: out std_logic );
end component;

signal C: std_logic_vector (6 downto 0);
begin

A0 : full_add port map (A=>A(0),
                        B=>B(0),
                        Cin=>Cin,
                        Y=>Y(0),
                        Cout=>C(0));
A1 : full_add port map (A=>A(1),
                        B=>B(1),
                        Cin=>C(0),
                        Y=>Y(1),
                        Cout=>C(1));
A2 : full_add port map (A=>A(2),
                        B=>B(2),
                        Cin=>C(1),
                        Y=>Y(2),
                        Cout=>C(2));
A3 : full_add port map (A=>A(3),
                        B=>B(3),
                        Cin=>C(2),
                        Y=>Y(3),
                        Cout=>C(3));
A4 : full_add port map (A=>A(4),
                        B=>B(4),
                        Cin=>C(3),
                        Y=>Y(4),
                        Cout=>C(4));
A5 : full_add port map (A=>A(5),
                        B=>B(5),
                        Cin=>C(4),
                        Y=>Y(5),
                        Cout=>C(5));
A6 : full_add port map (A=>A(6),
                        B=>B(6),
                        Cin=>C(5),
                        Y=>Y(6),
                        Cout=>C(6));
A7 : full_add port map (A=>A(7),
                        B=>B(7),
                        Cin=>C(6),
                        Y=>Y(7),
                        Cout=>Cout);
end Behavioral;
