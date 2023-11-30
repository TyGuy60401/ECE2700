----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2023 10:33:21 PM
-- Design Name: 
-- Module Name: micro2 - Behavioral
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

entity micro2 is
    Port ( clk    : in STD_LOGIC;
           rst    : in STD_LOGIC;
           rd     : in STD_LOGIC;
           wr     : in STD_LOGIC;
           fetch  : in STD_LOGIC;
           ld_pc  : in STD_LOGIC;
           ld_mar : in STD_LOGIC;
           inc_pc : in STD_LOGIC;
           op     : in STD_LOGIC_VECTOR (2 downto 0);
           addr   : out STD_LOGIC_VECTOR (7 downto 0);
           data   : inout STD_LOGIC_VECTOR (7 downto 0));
end micro2;

architecture Structural of micro2 is

begin


end Structural;
