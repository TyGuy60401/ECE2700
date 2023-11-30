----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2023 04:44:57 PM
-- Design Name: 
-- Module Name: MEM_16x8_TB - Behavioral
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

entity MEM_16x8_TB is
--  Port ( );
end MEM_16x8_TB;

architecture Behavioral of MEM_16x8_TB is

component MEM_16x8 is
    port(mem_db : inout std_logic_vector(7 downto 0);
         address_in : in std_logic_vector(3 downto 0);
         clk, rst, mem_wr, mem_rd : in std_logic
         );
end component;

signal mem_db_TB : std_logic_vector(7 downto 0);
signal address_in_TB: std_logic_vector(3 downto 0);
signal clk_TB, rst_TB, mem_wr_TB, mem_rd_TB : std_logic := '0';

begin

    UUT: MEM_16x8 port map (mem_db => mem_db_TB,
                            address_in => address_in_TB,
                            clk => clk_TB,
                            rst => rst_TB,
                            mem_wr => mem_wr_TB,
                            mem_rd => mem_rd_TB);

 CLK_TB <= not CLK_TB after 10ns;
 
 process
 begin
 
 rst_TB <= '1';
 wait for 20ns;
 rst_TB <= '0';
 
 --write 0 to address 0, 1 to address 1, etc. Read after every write and assert.
 for ii in 0 to 15 loop
    mem_rd_TB <= '0';
    mem_wr_TB <= '1';
    mem_db_TB <= std_logic_vector(to_unsigned(ii, mem_db_TB'length));
    address_in_TB <= std_logic_vector(to_unsigned(ii, address_in_TB'length));
    wait for 20ns;
    mem_wr_TB <= '0';
    mem_db_TB <= "ZZZZZZZZ";
    wait for 20ns;
    mem_rd_tb <= '1';
    wait for 20ns;
    assert mem_db_TB = std_logic_vector(to_unsigned(ii, mem_db_TB'length)) report "value didn't stay in memory";
 end loop;
 
 end process;
end Behavioral;
