----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2023 06:56:14 PM
-- Design Name: 
-- Module Name: DFFR - Behavioral
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

entity DFFR is
  Port (clk, d, rst, CE: in std_logic;
        q: out std_logic);
end DFFR;

architecture Behavioral of DFFR is
       
begin
    process(clk, rst)
    begin 
        if rst = '1' then
            q <= '0';
        elsif rising_edge(clk) then
            if CE = '1' then
                q <= d;
            end if;      
        end if;
    end process;    
        

end Behavioral;
