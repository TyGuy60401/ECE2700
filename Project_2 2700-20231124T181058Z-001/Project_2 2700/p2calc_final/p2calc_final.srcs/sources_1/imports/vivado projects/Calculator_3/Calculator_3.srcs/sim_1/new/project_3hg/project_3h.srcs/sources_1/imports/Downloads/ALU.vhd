----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2023 07:35:37 PM
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
    port (opcode : in std_logic_vector(2 downto 0);
          A, B: in std_logic_vector(7 downto 0); 
          Cin : in std_logic;
          result : out std_logic_vector(8 downto 0)
          );
end entity;


architecture Behavioral of ALU is

--importing components of our ALU
component ExclusiveOr
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
          B : in STD_LOGIC_VECTOR (7 downto 0);
          xor_result : out STD_LOGIC_VECTOR (8 downto 0);
          cin : in STD_LOGIC);
 end component;
   
component Hold 
   Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
          cin : in STD_LOGIC;
          output_h : out STD_LOGIC_VECTOR (7 downto 0);
          cout : out STD_LOGIC);
end component;   

component add_8 is
  		Port (X, Y : in std_logic_vector(7 downto 0);
			Cin : in std_logic;
			Sum : out std_logic_vector(7 downto 0);
       			Cout: out std_logic );
end component;

component  load is
   Port ( B : in STD_LOGIC_VECTOR (7 downto 0);
          cin : in STD_LOGIC;
          output : out STD_LOGIC_VECTOR (7 downto 0);
          cout : out STD_LOGIC);
end component;

component mux5 is
    port (opcode : in std_logic_vector(2 downto 0);
          I0, I1, I2, I3, I4: in std_logic_vector(8 downto 0); 
          result : out std_logic_vector(8 downto 0));
end component;

--signal declarations
signal out_h: std_logic_vector (8 downto 0);
signal out_l: std_logic_vector (8 downto 0);
signal x_result: std_logic_vector (8 downto 0);
signal wc_s: std_logic_vector (8 downto 0);
signal nc_s: std_logic_vector (8 downto 0);
signal cin_h, cin_l: std_logic;

begin

--portmaps of our components 
A1 : add_8 port map (X => A,
                        Y => B,
                        Cin => Cin, --add WITH carry
                        sum => wc_s (7 downto 0),
                        Cout => wc_s(8));
                        
A2 : add_8 port map (X => A,
                        Y => B,
                        Cin => '0', --Add withOUT carry
                        sum => nc_s (7 downto 0),
                        Cout => nc_s(8));
              
X: ExclusiveOr port map(A => A,
                        B => B,
                        Cin => Cin,
                        xor_result => x_result);
                                                        
H: Hold port map(A => A,
                Cin => Cin,
                output_h => out_h(7 downto 0 ),
                cout => out_h(8) );
            
L: Load port map(B => B,
                cin => cin,
                output => out_l(7 downto 0),
                cout => out_l(8));
            
M: mux5 port map(opcode => opcode,
                result => result,
                I0 => wc_s (8 downto 0),
                I1 => nc_s (8 downto 0),
                I2 => x_result,
                I3 => out_h,
                I4 => out_l);
end Behavioral;
