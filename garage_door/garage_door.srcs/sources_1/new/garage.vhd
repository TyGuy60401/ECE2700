----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2023 02:23:56 AM
-- Design Name: 
-- Module Name: garage - Behavioral
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

entity garage is
    Port ( RST_L : in STD_LOGIC;
           TOP_L : in STD_LOGIC;
           BOTTOM_L : in STD_LOGIC;
           SENSOR_L : in STD_LOGIC;
           BUTTON_L : in STD_LOGIC;
           UP : out STD_LOGIC;
           DOWN : out STD_LOGIC;
           CLK : in STD_LOGIC);
end garage;

architecture Behavioral of garage is

    type door_state is (idle_top, idle_bottom, going_down, going_up);

    signal state : door_state;
    signal next_state : door_state;

begin

    process (CLK, RST_L)
    begin
        if RST_L = '0' then
            state <= idle_top;
        elsif rising_edge(CLK) then
            state <= next_state;
        end if;
    end process;

    process (state, BUTTON_L, BOTTOM_L, SENSOR_L)
    begin
        case state is
            when idle_top => 
                if (BUTTON_L = '0' and BOTTOM_L = '1' and SENSOR_L = '1') then
                    next_state <= going_down;
                elsif (BUTTON_L = '0') and (BOTTOM_L = '0' or SENSOR_L = '0') then
                    next_state <= going_up;
                else next_state <= idle_top;
                end if;
            
            when others =>
                next_state <= idle_top;
        end case;
    end process;

    DOWN <= '1' when state = going_down;

end Behavioral;
