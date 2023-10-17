----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2023 03:19:49 PM
-- Design Name: 
-- Module Name: full_add_4 - Behavioral
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

entity full_add_4 is
    Port ( X    : in STD_LOGIC_VECTOR (3 downto 0);
           Y    : in STD_LOGIC_VECTOR (3 downto 0);
           Cin  : in STD_LOGIC;
           Sum  : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end full_add_4;

architecture Behavioral of full_add_4 is
component full_add is
    port (X, Y, Cin : in std_logic;
    Cout, sum : out std_logic );
end component;
signal C1, C2, C3: std_logic;
begin

A0 : full_add port map (X=>X(0),
                        Y=>Y(0),
                        Cin=>Cin,
                        sum=>sum(0),
                        Cout=>C1);         
                        
A1 : full_add port map (X=>X(1),
                        Y=>Y(1),
                        Cin=>C1,
                        sum=>sum(1),
                        Cout=>C2);                                                                        
                        
A2 : full_add port map (X=>X(2),
                        Y=>Y(2),
                        Cin=>C2,
                        sum=>sum(2),
                        Cout=>C3);                         

A3 : full_add port map (X=>X(3),
                        Y=>Y(3),
                        Cin=>C3,
                        sum=>sum(3),
                        Cout=>Cout); 


end Behavioral;
