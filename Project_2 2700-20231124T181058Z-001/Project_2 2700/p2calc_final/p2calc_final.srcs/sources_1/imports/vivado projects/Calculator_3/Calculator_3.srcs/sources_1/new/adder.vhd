library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
  		Port (X, Y, Cin : in std_logic;
       		Cout, sum : out std_logic );
end adder;

architecture Behavioral of adder is

begin
    sum <= ((not X) and (not Y) and Cin) or ((not X) and (Y) and (not Cin)) or ((X) and (not Y) and (not Cin)) or ((X) and (Y) and Cin);
    Cout <= (Y and Cin) or (X and Y) or (X and Cin);

end Behavioral;