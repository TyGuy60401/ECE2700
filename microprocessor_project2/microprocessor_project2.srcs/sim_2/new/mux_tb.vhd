----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2023 09:50:54 PM
-- Design Name: 
-- Module Name: mux_tb - Behavioral
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

entity mux_tb is
--  Port ( );
end mux_tb;

architecture Behavioral of mux_tb is
    component Mux is
        Port ( fetch : in std_logic;
               data_MAR : in std_logic_vector (7 downto 0);
               data_PC  : in std_logic_vector (7 downto 0);
               data_out : out std_logic_vector (7 downto 0));
    end component;

    signal fetch : std_logic;
    signal data_MAR, data_PC, data_out : std_logic_vector (7 downto 0);

begin
    uut: Mux port map (
        fetch => fetch,
        data_MAR => data_MAR,
        data_PC => data_PC,
        data_out => data_out
    );

    process
    begin
        fetch <= '1';
        data_MAR <= "11010100";
        data_PC  <= "01011001";
        wait for 10 ns;

        fetch <= '0';
        wait for 10 ns;

        data_MAR <= "01001101";
        wait for 10 ns;

        data_MAR <= "00111011";
        wait for 10 ns;

        fetch <= '1';

        data_PC  <= "00111101";
        wait for 10 ns;

        data_MAR <= "11111110";
        wait;
    end process;

end Behavioral;
