----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2023 07:24:01 PM
-- Design Name: 
-- Module Name: CDD - Behavioral
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

entity CDD is
--  Port ( );
end CDD;

architecture Behavioral of CDD is

component dffreg9 is
  Port (d : in std_logic_vector(8 downto 0);
        q : out std_logic_vector(8 downto 0);
        clk, rst, CE : in std_logic
         );
end component;

component ALU is
    port (opcode : in std_logic_vector(3 downto 0);
          A, B: in std_logic_vector(7 downto 0); 
          Cin : in std_logic;
          result : out std_logic_vector(8 downto 0)
          );
end component;
begin


end Behavioral;
