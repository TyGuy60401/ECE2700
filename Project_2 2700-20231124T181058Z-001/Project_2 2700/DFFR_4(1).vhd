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

entity DFFR_4 is
  Port (d : in std_logic_vector(3 downto 0);
        q : out std_logic_vector(3 downto 0);
        clk, rst, CE : in std_logic
         );
end DFFR_4;

architecture Structural of DFFR_4 is

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
                    


end Structural;
