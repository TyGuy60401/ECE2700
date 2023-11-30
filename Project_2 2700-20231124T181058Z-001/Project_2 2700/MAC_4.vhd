----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2023 07:35:12 PM
-- Design Name: 
-- Module Name: MAC_4 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAC_4 is --4-bit Memory Address Counter
    port(inc, dec, rst, clk : in std_logic;
         load_val : in std_logic_vector(3 downto 0);
         count : out std_logic_vector(3 downto 0));
end MAC_4;

architecture Behavioral of MAC_4 is

    signal count_int : integer range 0 to 15 := 0;

begin
    
    count <= std_logic_vector(to_unsigned(count_int, count'length));

process(clk, rst)
begin
    if rst = '1' then
        count_int <= 0;
    elsif rising_edge(clk) then
        if inc = '1' and dec = '1' then
            count_int <= to_integer(unsigned(load_val));
        elsif inc = '1' then
            count_int <= count_int +1;
        elsif dec = '1' then
            count_int <= count_int -1;
        end if;
    end if;
            
end process;
            

end Behavioral;
