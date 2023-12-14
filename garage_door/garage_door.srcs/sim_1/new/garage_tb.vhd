----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2023 02:43:28 AM
-- Design Name: 
-- Module Name: garage_tb - Behavioral
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

entity garage_tb is
--  Port ( );
end garage_tb;

architecture Behavioral of garage_tb is
    component garage is
    Port (
        RST_L : in STD_LOGIC;
        TOP_L : in std_logic;
        BOTTOM_L : in std_logic;
        SENSOR_L : in std_logic;
        BUTTON_L : in std_logic;
        UP : out std_logic;
        DOWN : out std_logic;
        CLK : in STD_LOGIC
    );
    end component;

    signal rst_l, top_l, bottom_l, sensor_l, button_l, up, down, clk : std_logic;
begin
    uut: garage port map (
        RST_L => rst_l,
        TOP_L => top_l,
        BOTTOM_L => bottom_l,
        SENSOR_L => sensor_l,
        BUTTON_L => button_l,
        UP => up,
        DOWN => down,
        CLK => clk
    );

    process
    begin
        rst_l <= '0';
        clk <= '0';
        wait for 20 ms;
        rst_l <= '1';
        for i in 1 to 30 loop
            wait for 16 ms;
            clk <= not clk;
        end loop;
        wait;
    end process;

    process
    begin
        top_l <= '0';
        bottom_l <= '1';
        sensor_l <= '1'
        button_l <= '1';
        wait for 100 ms;
        button_l <= '0';
        wait for 40 ms;
        button_l <= '1';
        wait;
    end process;


end Behavioral;
