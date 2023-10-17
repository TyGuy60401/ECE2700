----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2023 09:37:10 PM
-- Design Name: 
-- Module Name: full_subtract_4 - Behavioral
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

entity full_subtract_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Bi : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0);
           Bo : out STD_LOGIC);
end full_subtract_4;

architecture Behavioral of full_subtract_4 is
component full_subtract is
    port (A, B, Bi : in std_logic;
          D, Bo : out std_logic );
end component;
signal C1, C2, C3: std_logic;
begin
A0 : full_subtract port map (A=>A(0),
                        B=>B(0),
                        Bi=>Bi,
                        D=>D(0),
                        Bo=>C1);         
                        
A1 : full_subtract port map (A=>A(1),
                        B=>B(1),
                        Bi=>C1,
                        D=>D(1),
                        Bo=>C2);                                                                        
                        
A2 : full_subtract port map (A=>A(2),
                        B=>B(2),
                        Bi=>C2,
                        D=>D(2),
                        Bo=>C3);                         

A3 : full_subtract port map (A=>A(3),
                        B=>B(3),
                        Bi=>C3,
                        D=>D(3),
                        Bo=>Bo); 



end Behavioral;
