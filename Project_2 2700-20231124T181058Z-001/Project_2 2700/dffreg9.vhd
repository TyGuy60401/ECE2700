----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2023 07:00:45 PM
-- Design Name: 
-- Module Name: dffreg9 - Structural
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

entity dffreg9 is
  Port (d : in std_logic_vector(8 downto 0);
        q : out std_logic_vector(8 downto 0);
        clk, rst, CE : in std_logic
         );
end dffreg9;

architecture Structural of dffreg9 is

component DFFR is
    port (clk, d, rst, CE : in std_logic;
          q : out std_logic);
end component;

begin

U0 : DFFR port map (d => d(0),
                    q => q(0),
                    clk => clk,
                    rst => rst,
                    CE => CE);
                    
U1 : DFFR port map (d => d(1),
                    q => q(1),
                    clk => clk,
                    rst => rst,
                    CE => CE);
                    
U2 : DFFR port map (d => d(2),
                    q => q(2),
                    clk => clk,
                    rst => rst,
                    CE => CE);
                    
U3 : DFFR port map (d => d(3),
                    q => q(3),
                    clk => clk,
                    rst => rst,
                    CE => CE);
                    
U4 : DFFR port map (d => d(4),
                    q => q(4),
                    clk => clk,
                    rst => rst,
                    CE => CE);
                    
U5 : DFFR port map (d => d(5),
                    q => q(5),
                    clk => clk,
                    rst => rst,
                    CE => CE);
                    
U6 : DFFR port map (d => d(6),
                    q => q(6),
                    clk => clk,
                    rst => rst,
                    CE => CE);
                    
U7 : DFFR port map (d => d(7),
                    q => q(7),
                    clk => clk,
                    rst => rst,
                    CE => CE);
                    
U8 : DFFR port map (d => d(8),
                    q => q(8),
                    clk => clk,
                    rst => rst,
                    CE => CE);


end Structural;
