----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2023 08:24:21 PM
-- Design Name: 
-- Module Name: ADDR_MUX - Behavioral
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

entity ADDR_MUX is --Data address multiplexer
Port (STORE, COUNT: in std_logic_vector(3 downto 0);
        SEL: in std_logic;
        ADDR_OUT: out std_logic_vector(3 downto 0) );
end ADDR_MUX;

architecture Behavioral of ADDR_MUX is

begin

ADDR_OUT <= COUNT when SEL = '0' else STORE;

end Behavioral;
