----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2023 07:48:46 PM
-- Design Name: 
-- Module Name: ALU_ACC - Behavioral
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

entity ALU_ACC is
  Port (UI: in std_logic_vector(7 downto 0);
        SEL, WR_SEL: in std_logic;
        OP_ALU: in std_logic_vector(2 downto 0);
        RESULT: out std_logic_vector(7 downto 0) );
end ALU_ACC;


architecture Behavioral of ALU_ACC is
component DFFR_9 is
  Port (d : in std_logic_vector(8 downto 0);
        q : out std_logic_vector(8 downto 0);
        clk, rst, CE : in std_logic
         );
end component;

component UI_MUX is
  Port (DB, UI: in std_logic_vector(7 downto 0);
        SEL: in std_logic;
        UI_OUT: out std_logic_vector(7 downto 0) );
end component;

component MUX_B is
  Port (DB: inout std_logic_vector(7 downto 0);
        IB: out std_logic_vector(7 downto 0);
        R: in std_logic_vector(9 downto 0);
        WR: in std_logic);
end component;
begin


end Behavioral;
