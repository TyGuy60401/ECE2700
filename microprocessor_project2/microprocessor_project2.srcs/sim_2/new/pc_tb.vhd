----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2023 09:34:11 PM
-- Design Name: 
-- Module Name: pc_tb - Behavioral
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

entity pc_tb is
--  Port ( );
end pc_tb;

architecture Behavioral of pc_tb is
    component PC is
        Port ( clk     : in std_logic;
               ld_pc   : in std_logic;
               inc_pc  : in std_logic;
               rst     : in std_logic;
               data_in : in std_logic_vector (7 downto 0);
               data_out : out std_logic_vector (7 downto 0));
    end component;

    signal test_ld, test_inc, clk, rst: std_logic := '0';
    signal data_in, data_out : std_logic_vector (7 downto 0);

begin
    uut: PC port map (
        data_in => data_in,
        data_out => data_out,
        clk => clk,
        rst => rst,
        ld_pc => test_ld,
        inc_pc => test_inc
    );

    process
    begin
        for i in 0 to 10 loop
            clk <= NOT clk;
            wait for 10 ns;
        end loop;
    end process;

    process
    begin
        data_in <= "00000101";
        test_inc <= '1';
        wait for 15 ns;

        data_in  <= "10111101";
        test_inc <= '0';
        test_ld  <= '1';
        wait for 13 ns;

        data_in  <= "10101110";
        wait for 10 ns;

        data_in  <= "01101010";
        test_ld  <= '0';
        test_inc <= '1';
        wait for 15 ns;

        data_in  <= "11101001";
        test_ld  <= '1';
        test_inc <= '0';
        wait for 10 ns;

        data_in <= "00000101";
        test_inc <= '1';
        wait for 15 ns;

        data_in  <= "10111101";
        test_inc <= '0';
        test_ld  <= '1';
        rst <= '1';
        wait for 13 ns;

        data_in  <= "10101110";
        wait for 10 ns;

        data_in  <= "01101010";
        test_ld  <= '0';
        test_inc <= '1';
        rst <= '0';
        wait for 15 ns;

        data_in  <= "11101001";
        test_ld  <= '1';
        test_inc <= '0';
        wait;
    end process;

end Behavioral;
