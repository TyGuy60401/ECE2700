----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2023 06:53:30 PM
-- Design Name: 
-- Module Name: ls74 - Behavioral
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

entity ls74 is
    Port ( CLK : in STD_LOGIC;
           RST_L : in STD_LOGIC;
           SET_L : in STD_LOGIC;
D : in STD_LOGIC;
Q_H : out STD_LOGIC;
Q_L : out STD_LOGIC);
end ls74;
architecture Behavioral of ls74 is
begin
process (CLK, RST_L, SET_L)
begin
if RST_L = '0' and SET_L = '0' then
Q_H <= 'X'; Q_L <= 'X';
elsif RST_L = '0' then
Q_H <= '0'; Q_L <= '1';
elsif SET_L = '0' then
Q_H <= '1'; Q_L <= '0';
elsif CLK'event and CLK = '1' then
Q_H <= D; Q_L <= not D;
end if;
end process;
end Behavioral;
