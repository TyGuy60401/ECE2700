----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 04:25:53 PM
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is
    component ALU is
        Port ( A : in std_logic_vector (7 downto 0);
               B : in std_logic_vector (7 downto 0);
               Cin : in std_logic;
               Op : in std_logic_vector (2 downto 0);
               Y : out std_logic_vector (7 downto 0);
               Cout : out std_logic);
    end component;

    -- Input signal declaration
    signal A, B : std_logic_vector (7 downto 0) := "00000000";
    signal Op : std_logic_vector (2 downto 0) := "000";
    signal Cin : std_logic := '0';

    -- Output singal declarations
    signal Y : std_logic_vector (7 downto 0);
    signal Cout : std_logic;

begin
    uut: ALU port map (A => A, B => B, Cin => Cin, Op => Op, Y => Y, Cout => Cout);

    -- Stimulus process
    process
    begin
        A <= "11111111";
        Op <= "111";
        wait for 100 ns;
        Op <= "101";
        wait for 100 ns;
        Op <= "011";
        wait for 100 ns;
        Op <= "000";
        wait;
    
    end process;


end Behavioral;
