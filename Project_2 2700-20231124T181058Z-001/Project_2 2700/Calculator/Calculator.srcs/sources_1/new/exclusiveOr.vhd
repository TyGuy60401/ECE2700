library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ExclusiveOr is
   Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
          B : in STD_LOGIC_VECTOR (7 downto 0);
          xor_result : out STD_LOGIC_VECTOR (8 downto 0);
          cin : in STD_LOGIC);
end ExclusiveOr;


architecture Behavioral of ExclusiveOr is
signal xor_1:std_logic_vector(7 downto 0);
begin
   xor_1 <= A xor B;
   xor_result <= cin & xor_1;
end Behavioral;