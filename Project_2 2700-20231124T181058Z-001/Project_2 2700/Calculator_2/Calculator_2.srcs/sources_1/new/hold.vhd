library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Hold is
   Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
          cin : in STD_LOGIC;
          output_h : out STD_LOGIC_VECTOR (7 downto 0);
          cout : out STD_LOGIC);
end Hold;


architecture Behavioral of Hold is
begin
   output_h <= A;
   cout <= cin;
end Behavioral;