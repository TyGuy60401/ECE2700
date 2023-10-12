----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2023 02:23:15 PM
-- Design Name: 
-- Module Name: full_add_test - Behavioral
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

entity full_add_test is
--  Port ( );
end full_add_test;

architecture Behavioral of full_add_test is
    component full_add is
        port ( X    : in STD_LOGIC;
               Y    : in STD_LOGIC;
               Cin  : in STD_LOGIC;
               Cout : out STD_LOGIC;
               sum  : out STD_LOGIC);
    end component;
    -- Input signal declarations
    signal X, Y, Cin : std_logic := '0';
    -- Output signal declarations
    signal Cout, sum : std_logic;
    
begin
    -- Instantiate the Unit Under Test
    uut: full_add port map (X => X, Y => Y, Cin => Cin, Cout => Cout, sum => sum);
    -- Stimulus process
    process
    begin
        for i in std_logic range '0' to '1' loop
            for j in std_logic range '0' to '1' loop
                for k in std_logic range '0' to '1' loop
                    X <= i;
                    Y <= j;
                    Cin <= k;
                    
                    wait for 100ns;
                end loop;
            end loop;
        end loop;
    wait;
    end process;

end Behavioral;
