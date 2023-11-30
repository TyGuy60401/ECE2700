----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2023 07:19:25 PM
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

entity MUX_B is
  Port (DB_BUFF: inout std_logic_vector(7 downto 0);
        IB: out std_logic_vector(7 downto 0);
        R: in std_logic_vector(7 downto 0);
        WR: in std_logic);
end MUX_B;

architecture Behavioral of MUX_B is

begin
    DB_BUFF <= "ZZZZZZZZ" when WR = '0' else R;
    IB <= DB_BUFF;

end Behavioral;