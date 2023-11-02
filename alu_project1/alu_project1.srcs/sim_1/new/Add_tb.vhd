----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 03:03:20 PM
-- Design Name: 
-- Module Name: Add_tb - Behavioral
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

entity Add_tb is
--  Port ( );
end Add_tb;

architecture Behavioral of Add_tb is
    component Add is 
        Port ( A    : in std_logic_vector (7 downto 0);
               B    : in std_logic_vector (7 downto 0);
               Y    : out std_logic_vector (7 downto 0);
               Cout : out std_logic);
    end component;

    -- Input signal declaration
    signal A, B : std_logic_vector (7 downto 0) := "00000000";
    
    -- Output signal declaration
    signal Y : std_logic_vector (7 downto 0);
    signal Cout : std_logic;

begin
    -- do the uut
    uut: Add port map (A => A, B => B, Y => Y, Cout => Cout);

    -- Stimulus process
    process
    begin
        A <= "11111111";
        wait for 20 ns;
        B <= "00000001";
        wait for 20 ns;
        A <= "00000000";
        wait for 20 ns;
        B <= "01010101";
        wait for 20 ns;
        A <= "11111111";
        wait for 20 ns;
        B <= "11111111";
        wait;
    end process;



end Behavioral;
