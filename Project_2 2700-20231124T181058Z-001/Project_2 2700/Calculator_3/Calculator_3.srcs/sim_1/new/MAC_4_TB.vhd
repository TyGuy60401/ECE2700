----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2023 06:50:49 PM
-- Design Name: 
-- Module Name: MAC_4_TB - Behavioral
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

entity MAC_4_TB is
--  Port ( );
end MAC_4_TB;

architecture Behavioral of MAC_4_TB is

component MAC_4 is --4-bit Memory Address Counter
    port(inc, dec, rst, clk : in std_logic;
         load_val : in std_logic_vector(3 downto 0);
         count : out std_logic_vector(3 downto 0));
end component;
    
signal inc_TB, dec_TB, rst_TB, clk_TB : std_logic;
signal load_val_TB, count_TB : std_logic_vector (3 downto 0);
signal count_int_TB: integer range 0 to 15 := 0;
        
begin

UUT : MAC_4 port map (inc => inc_TB,
                      dec => dec_TB,
                      rst => rst_TB,
                      clk => clk_TB,
                      load_val => load_val_TB,
                      count => count_TB
                      );

count_int_TB <= to_integer(unsigned(count_TB));

process
begin

rst_TB <= '0';

for ii in 0 to 32 loop
    clk_TB <= '0';    --Not sure how to make clock, loop manually reassigns clk every other wait statement
    wait for 5ns;
    inc_TB <= '1'; --data values change in between clk changes (after every odd numbered wait statement)
    wait for 5ns;
    clk_TB <= '1';
    wait for 5ns;
    assert count_int_TB = ii report "Count doesn't match loop index.";
    wait for 5ns;
end loop;

rst_TB <= '1';
wait for 5ns;
assert count_int_TB = 0 report "Reset asserted but value not 0";

end process;



end Behavioral;

