----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2023 08:56:18 AM
-- Design Name: 
-- Module Name: vend_machine - Behavioral
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

entity vend_machine is
    Port ( clk, reset: in std_logic;
           nickel, dime, quarter: in std_logic;
           vend, refund_5, refund_10: out std_logic);
end vend_machine;

architecture Behavioral of vend_machine is
    type vend_state_type is (idle, credit_5, owe_10);
    signal current_state, next_state: vend_state_type;


begin
    -- model the state register
    process (reset, clk)
    begin
        if reset = '1' then
            current_state <= idle;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
    
    -- model the next-state decoder for the vend machine
    process (current_state, nickel, dime, quarter)
    begin
        case current_state is
            when idle =>
                if nickel = '1' then
                    next_state <= credit_5;
                elsif quarter = '1' then
                    next_state <= owe_10;
                else
                    next_state <= idle;
                end if;
            when credit_5 =>
                if (dime = '1' or nickel = '1') then
                    next_state <= idle;
                elsif quarter = '1' then
                    next_state <= owe_10;
                else
                    next_state <= credit_5;
                end if;
            when owe_10 =>
                next_state <= idle;
        end case;
    end process;
    
    -- model the output decoder for the vend machine
    process (current_state, nickel, dime, quarter)
    begin
        case current_state is
            when idle =>
                vend <= dime or quarter;
                refund_5 <= quarter;
            when credit_5 =>
                vend <= nickel or dime or quarter;
                refund_5 <= dime;
                refund_10 <= quarter;
            when owe_10 =>
                refund_10 <= '1';
        end case;  
    end process;
end Behavioral;
