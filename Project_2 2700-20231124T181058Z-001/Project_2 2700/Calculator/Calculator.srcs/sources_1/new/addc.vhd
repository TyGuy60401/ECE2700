library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_8 is
  		Port (X, Y : in std_logic_vector(7 downto 0);
			Cin : in std_logic;
			Sum : out std_logic_vector(7 downto 0);
       			Cout: out std_logic );
end add_8;


architecture Behavioral of add_8 is

component adder is
  		Port (X, Y, Cin : in std_logic;
       		Cout, sum : out std_logic );
end component;

signal C1, C2, C3, C4, C5, C6, C7: std_logic;

begin

U0 : adder port map (X => X(0),
                        Y => Y(0),
                        Cin => Cin,
                        sum => sum(0),
                        Cout => C1);

U1 : adder port map (X => X(1),
                        Y => Y(1),
                        Cin => C1,
                        sum => sum(1),
                        Cout => C2);
                        
U2 : adder port map (X => X(2),
                        Y => Y(2),
                        Cin => C2,
                        sum => sum(2),
                        Cout => C3);
                        
U3 : adder port map (X => X(3),
                        Y => Y(3),
                        Cin => C3,
                        sum => sum(3),
                        Cout => C4 );
  
U4 : adder port map (X => X(4),
                        Y => Y(4),
                        Cin => C4,
                        sum => sum(4),
                        Cout => C5 );
                    
U5 : adder port map (X => X(5),
                        Y => Y(5),
                        Cin => C5,
                        sum => sum(5),
                        Cout => C6 );

U6 : adder port map (X => X(6),
                        Y => Y(6),
                        Cin => C6,
                        sum => sum(6),
                        Cout => C7 );
                        
U7 : adder port map (X => X(7),
                        Y => Y(7),
                        Cin => C7,
                        sum => sum(7),
                        Cout => Cout );

                        
                        


end Behavioral;