----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2023 07:44:49 PM
-- Design Name: 
-- Module Name: AM_4_TB - Behavioral
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

entity AM_4_TB is
--  Port ( );
end AM_4_TB;

architecture Behavioral of AM_4_TB is

component AM_4 is --4 bit Address controller Module
    port(ADDR_IN : in std_logic_vector(3 downto 0);
         ADDR_OUT : out std_logic_vector(3 downto 0);
         STORE_ADDR, ADDR_INC, ADDR_LOAD, ADDR_SEL, CLK_AM, RST_MEM, RST_COUNT : in std_logic);
end component;

signal STORE_ADDR_TB, ADDR_INC_TB, ADDR_LOAD_TB, ADDR_SEL_TB, CLK_TB, RST_MEM_TB, RST_COUNT_TB : std_logic;
signal ADDR_IN_TB, ADDR_OUT_TB : std_logic_vector (3 downto 0);

type address_array is array (0 to 15) of std_logic_vector(3 downto 0); --exhaustive test of possible addresses,
constant test_vals : address_array:=(                                  
"0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", 
"1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
);

begin

UUT : AM_4 port map (ADDR_IN => ADDR_IN_TB,
                     ADDR_OUT => ADDR_OUT_TB,
                     STORE_ADDR => STORE_ADDR_TB,
                     ADDR_INC => ADDR_INC_TB,
                     ADDR_LOAD => ADDR_LOAD_TB,
                     ADDR_SEL => ADDR_SEL_TB,
                     CLK_AM => CLK_TB,
                     RST_MEM => RST_MEM_TB,
                     RST_COUNT => RST_COUNT_TB);
                     
process
begin
    
    STORE_ADDR_TB <= '0';
    ADDR_INC_TB <= '0';
    ADDR_LOAD_TB <= '0';
    ADDR_SEL_TB <= '0'; --0 is from counter, 1 is from register
    RST_MEM_TB <= '0';
    RST_COUNT_TB <= '0';
    ADDR_INC_TB <= '1'; --Increment is high, counter should count 0-7
    

    for ii in 0 to 7 loop --first half of possible values for difference between loops
        clk_TB <= '0';    --Using same hacky 50MHz clock from other testbenches
        wait for 5ns;
        ADDR_IN_TB <= test_vals(15); --still using in-between intervals to emulate setup/hold times.
        wait for 5ns;
        clk_TB <= '1';
        wait for 5ns;
        assert ADDR_OUT_TB = test_vals(ii+1) report "Counter didn't match index";
        wait for 5ns;
    end loop;
    
    ADDR_INC_TB <= '0';
    RST_COUNT_TB <= '1'; --Briefly asserting reset on counter to get ready for next loop
    wait for 20ns;       --clock will stop working here but we have async reset anyways
    RST_COUNT_TB <= '0';
   
    
    
    for iii in std_logic range '0' to '1' loop
        ADDR_SEL_TB <= iii; --checking output of both counter and register
        for jj in 8 to 15 loop
            clk_TB <= '0';
            ADDR_LOAD_TB <= '1'; --load and store are 1, counter and register should count 8->15
            STORE_ADDR_TB <= '1';
            wait for 5ns;
            ADDR_IN_TB <= test_vals(jj);
            wait for 5ns;
            clk_TB <= '1';
            wait for 5ns;
            assert ADDR_OUT_TB = test_vals(jj) report "memory didn't load as expected.";
            wait for 5ns;
            clk_TB <= '0';
            ADDR_LOAD_TB <= '0'; --Turning off load inputs and setting input to 0 to check memory
            STORE_ADDR_TB <= '0';
            wait for 5ns;
            ADDR_IN_TB <= test_vals(0);
            wait for 5ns;
            clk_TB <= '1';
            wait for 5ns;
            assert ADDR_OUT_TB = test_vals(jj) report "memory reset to 0 but shouldn't.";
            wait for 5ns;
        end loop;
    end loop;
    
    RST_MEM_TB <= '1'; --testing individual resets while switching mux
    wait for 10ns;
    ADDR_SEL_TB <= '0';
    wait for 10ns;
    RST_COUNT_TB <= '1';
    wait for 10ns;


end process;

end Behavioral;
