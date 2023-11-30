library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity load is
   Port ( B : in STD_LOGIC_VECTOR (7 downto 0);
          cin : in STD_LOGIC;
          output : out STD_LOGIC_VECTOR (7 downto 0);
          cout : out STD_LOGIC);
end Load;


architecture Behavioral of Load is
begin
   output <= B;
   cout <= cin;
end Behavioral;
