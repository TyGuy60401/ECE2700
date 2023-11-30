----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2023 07:47:57 PM
-- Design Name: 
-- Module Name: mux_buffer - Behavioral
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

entity mux_buffer is
  Port (DB: inout std_logic_vector(7 downto 0);
        IB: out std_logic_vector(7 downto 0);
        WR: in std_logic);
end mux_buffer;

architecture Behavioral of mux_buffer is

begin
    DB <= "zzzzzzzz" when WR = '0' else ;
    IB <= DB;

end Behavioral;
