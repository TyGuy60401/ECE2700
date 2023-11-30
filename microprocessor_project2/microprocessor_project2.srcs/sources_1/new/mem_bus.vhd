----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2023 01:24:28 PM
-- Design Name: 
-- Module Name: mem_bus - Behavioral
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

entity mem_bus is
    Port ( wr : in STD_LOGIC;
           rd : in STD_LOGIC;
           acc_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_bus : inout STD_LOGIC_VECTOR (7 downto 0);
           int_bus : out STD_LOGIC_VECTOR (7 downto 0));
end mem_bus;

architecture Behavioral of mem_bus is
    signal data_out : std_logic_vector (7 downto 0);
    signal data_int : std_logic_vector (7 downto 0);

begin
    process (wr, rd, acc_in)
    begin
        if wr = '1' then
            data_out <= acc_in;
        else
            data_out <= (others => 'Z');
        end if;
    end process;
    data_bus <= data_out;
    int_bus <= data_bus;


end Behavioral;
