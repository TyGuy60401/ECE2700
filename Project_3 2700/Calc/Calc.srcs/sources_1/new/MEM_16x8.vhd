----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 11:53:38 AM
-- Design Name: 
-- Module Name: MEM_16x8 - Behavioral
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

entity MEM_16x8 is --8-bit memory with 16 addresses
    port(mem_db : inout std_logic_vector(7 downto 0);
         address_in : in std_logic_vector(3 downto 0);
         clk, rst, mem_wr, mem_rd : in std_logic
         );
end MEM_16x8;

architecture Behavioral of MEM_16x8 is

type mem_array is array (0 to 15) of std_logic_vector(7 downto 0);
signal mem_signal : mem_array;

begin

process(clk, rst)
begin
    if rst = '1' then
        mem_signal <= (OTHERS => "00000000");
    elsif rising_edge(clk) then
        if mem_wr = '1' then
            mem_signal(to_integer(unsigned(address_in))) <= mem_db;
        end if;
    end if;
end process;

mem_db <= mem_signal(to_integer(unsigned(address_in))) when mem_rd = '1' else "ZZZZZZZZ";

end Behavioral;
