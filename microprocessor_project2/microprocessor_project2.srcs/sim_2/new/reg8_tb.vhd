----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2023 09:20:09 PM
-- Design Name: 
-- Module Name: reg8_tb - Behavioral
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

entity reg8_tb is
--  Port ( );
end reg8_tb;

architecture Behavioral of reg8_tb is
    component reg8 is
        Port ( clk      : in std_logic;
               data_in  : in STD_LOGIC_VECTOR (7 downto 0);
               data_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal test_in : std_logic_vector (7 downto 0);
    signal test_out : std_logic_vector (7 downto 0);
    signal test_clk : std_logic := '0';

begin
    uut: reg8 port map (
        data_in => test_in,
        data_out => test_out,
        clk => test_clk
    );
    process
    begin
        for i in 0 to 10 loop
            test_clk <= NOT test_clk;
            wait for 10 ns;
        end loop;
    end process;
    
    process
    begin
        test_in <= "00000101";
        wait for 15 ns;
        test_in <= "10111101";
        wait for 13 ns;
        test_in <= "10101110";
        wait for 10 ns;
        test_in <= "01101010";
        wait for 15 ns;
        test_in <= "11101001";
        wait;
    end process;

end Behavioral;
