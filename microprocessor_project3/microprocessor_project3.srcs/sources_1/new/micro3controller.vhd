----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2023 03:08:42 PM
-- Design Name: 
-- Module Name: micro3controller - Behavioral
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

entity micro3controller is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rd : out STD_LOGIC;
           wr : out STD_LOGIC;
           addr : out STD_LOGIC_VECTOR (7 downto 0);
           data : inout STD_LOGIC_VECTOR (7 downto 0));
end micro3controller;

architecture Behavioral of micro3controller is
    component micro2 is
        port ( clk, rst, rd, wr, fetch, ld_pc, ld_mar, inc_pc : in std_logic;
               op : in std_logic_vector (2 downto 0);
               addr : out std_logic_vector (7 downto 0);
               data : inout std_logic_vector (7 downto 0));
    end component;

begin


end Behavioral;
