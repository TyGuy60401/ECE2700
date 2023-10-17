----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 07:14:00 AM
-- Design Name: 
-- Module Name: full_subtract_tb - Behavioral
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

entity full_subtract_tb is
--  Port ( );
end full_subtract_tb;

architecture Behavioral of full_subtract_tb is
    component full_subtract is
        port ( A    : in STD_LOGIC;
               B    : in STD_LOGIC;
               Bi   : in STD_LOGIC;
               Bo   : out STD_LOGIC;
               D    : out STD_LOGIC);
    end component;

    -- Input signal declarations
    signal A, B, Bi : std_logic := '0';
    -- Output signal declarations
    signal D, Bo : std_logic;
begin
    -- Instantiate the Unit Under Test
    uut: full_subtract port map (A => A, B => B, Bi => Bi, Bo => Bo, D => D);
    -- Stimulus process
    process
    begin
        for i in std_logic range '0' to '1' loop
            for j in std_logic range '0' to '1' loop
                for k in std_logic range '0' to '1' loop
                    A <= i;
                    B <= j;
                    Bi <= k;
                    
                    
                    wait for 100ns;
                end loop;
            end loop;
        end loop;
    wait;
    end process;

end Behavioral;
