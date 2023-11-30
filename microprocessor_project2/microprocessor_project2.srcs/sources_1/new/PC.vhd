----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2023 12:44:23 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ld_pc : in STD_LOGIC;
           inc_pc : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end PC;

architecture Behavioral of PC is
    signal data : std_logic_vector (7 downto 0);

begin
    process (clk, rst)
    begin
        if rst = '0' then
            data <= (others => '0');
        elsif rising_edge(clk) then
            if ld_pc = '1' then
                data <= data_in;
            elsif inc_pc = '1' then
                data <= std_logic_vector(unsigned(data) + 1);
            end if;
        end if;
    end process;

    data_out <= data;
end Behavioral;
