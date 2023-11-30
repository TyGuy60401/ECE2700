----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2023 07:32:27 PM
-- Design Name: 
-- Module Name: DFFR_9_TB - Behavioral
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

entity DFFR_9_TB is
--  Port ( );
end DFFR_9_TB;

architecture Structural of DFFR_9_TB is

component DFFR_9 is
  Port (d : in std_logic_vector(8 downto 0);
        q : out std_logic_vector(8 downto 0);
        clk, rst, CE : in std_logic
         );
end component;

signal d_TB, q_TB : std_logic_vector(8 downto 0);
signal clk_TB, rst_TB, CE_TB : std_logic;

type memtest_array is array (0 to 3) of std_logic_vector(8 downto 0); --arbitrary test values
constant test_vals : memtest_array:=(
"010101010", "101010101", "000000000", "111111111"
);

begin
UUT : DFFR_9 port map (d => d_TB,
                        q => q_TB,
                        clk => clk_TB,
                        rst => rst_TB,
                        CE => CE_TB
                        );

process

begin


rst_TB <= '0'; --Reset is 0 and enable is 1, so memory should change at each rising edge.
CE_TB <= '1';
for ii in 0 to 3 loop
    clk_TB <= '0';    --Not sure how to make clock, loop manually reassigns clk every other wait statement
    wait for 5ns;
    d_TB <= test_vals(ii); --data values change in between clk changes (after every odd numbered wait statement)
    wait for 5ns;
    clk_TB <= '1';
    wait for 5ns;
    assert q_TB = test_vals(ii) report "Memory didn't change but was supposed to.";
    wait for 5ns;
end loop;

rst_TB <= '0'; --Reset is 0 and enable is 0, memory should stay at its last value from previous loop (1ff)
CE_TB <= '0';
for ii in 0 to 3 loop
    clk_TB <= '0';
    wait for 5ns;
    d_TB <= test_vals(ii);
    wait for 5ns;
    clk_TB <= '1';
    wait for 5ns;
    assert q_TB = test_vals(3) report "Memory changed but wasn't supposed to (Clock enable not set).";
    wait for 5ns;
end loop;

rst_TB <= '1'; --Reset is 0, so all outputs should be zeros.
CE_TB <= '1';
for ii in 0 to 3 loop
    clk_TB <= '0';
    wait for 5ns;
    d_TB <= test_vals(ii);
    wait for 5ns;
    clk_TB <= '1';
    wait for 5ns;
    assert q_TB = test_vals(2) report "Memory changed but wasn't supposed to (Reset triggered)";
    wait for 5ns;
end loop;

end process;

end Structural;
