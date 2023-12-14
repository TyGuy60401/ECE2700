----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2023 08:13:58 PM
-- Design Name: 
-- Module Name: sequence_finder_tb - Behavioral
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

entity sequence_finder_tb is
--  Port ( );
end sequence_finder_tb;

architecture Behavioral of sequence_finder_tb is
    component sequence_finder is
        port ( CLK, SIG, RST : in STD_LOGIC;
               Found : out STD_LOGIC);
    end component;

    signal clk, sig, found, rst : std_logic;

begin

    uut: sequence_finder port map (
        CLK => clk,
        SIG => sig,
        RST => rst,
        Found => found
    );

    process
    begin
    rst <= '1';
    clk <= '0';
    wait for 10 ns;
    rst <= '0';
        for i in 1 to 40 loop
            wait for 10 ns;
            clk <= not clk;
        end loop;
        wait;
    end process;

    process
    begin
    wait for 18 ns;
        sig <= '1';
        wait for 25 ns;
        sig <= '1';
        wait for 20 ns;
        sig <= '1';
        wait for 20 ns;
        sig <= '0';
        wait for 20 ns;
        sig <= '1';
        wait for 20 ns;
        sig <= '1';
        wait for 20 ns;
        sig <= '0';
        wait for 20 ns;
        sig <= '1';
        wait for 20 ns;
        sig <= '0';
        wait for 20 ns;
        sig <= '0';
        wait for 20 ns;
        sig <= '1';
        wait for 20 ns;
        sig <= '1';
        wait for 20 ns;
        sig <= '0';
        wait for 20 ns;
        sig <= '0';
        wait for 20 ns;
        sig <= '1';
        wait for 20 ns;
        sig <= '1';
        wait for 20 ns;
        sig <= '0';
        wait for 20 ns;
    wait;
    end process;

end Behavioral;
