----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2023 07:44:24 AM
-- Design Name: 
-- Module Name: signed_subtractor8_tb - Behavioral
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

entity signed_subtractor8_tb is
--  Port ( );
end signed_subtractor8_tb;

architecture Behavioral of signed_subtractor8_tb is
    component signed_subtractor8 is 
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               Diff : out STD_LOGIC_VECTOR (7 downto 0);
               Overflow : out STD_LOGIC);
    end component;

    --Input signal declarations
    signal A, B : std_logic_vector(7 downto 0) := "00000000";
    --Output signal declarations
    signal Diff : std_logic_vector(7 downto 0);
    signal Overflow : std_logic;

begin
    -- Instantiate the Unit Under Test
    uut: signed_subtractor8 port map (A => A, B => B, Diff => Diff, Overflow => Overflow);
    -- Stimulu process
    process
        variable test: unsigned(15 downto 0);
    begin
        for i in 0 to 65535 loop
            test := to_unsigned(i, 16);
            A <= std_logic_vector(test(7 downto 0));
            B <= std_logic_vector(test(15 downto 8));
            wait for 1 ns;
        end loop;
        wait;
    end process;


end Behavioral;
