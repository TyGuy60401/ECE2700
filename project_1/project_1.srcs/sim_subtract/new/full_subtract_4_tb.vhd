----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2023 09:39:21 PM
-- Design Name: 
-- Module Name: full_subtract_4_tb - Behavioral
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

entity full_subtract_4_tb is
--  Port ( );
end full_subtract_4_tb;

architecture Behavioral of full_subtract_4_tb is
    component full_subtract_4 is
        Port ( A    : in STD_LOGIC_VECTOR (3 downto 0);
               B    : in STD_LOGIC_VECTOR (3 downto 0);
               Bi   : in STD_LOGIC;
               D    : out STD_LOGIC_VECTOR (3 downto 0);
               Bo   : out STD_LOGIC);
    end component;
    
    -- Input signal declaration
    signal A, B : std_logic_vector(3 downto 0) := "0000";
    signal Bi : std_logic := '0';

    -- Output signal declaration
    signal D : std_logic_vector(3 downto 0);
    signal Bo : std_logic;
begin
    -- Instantiate the Unit Under Test
    uut: full_subtract_4 port map (A => A, B => B, Bi => Bi, Bo => Bo, D => D);

    -- Stimulus process
    process
        variable test: unsigned(8 downto 0);
        variable diff: unsigned(4 downto 0);
    begin
        A <= "1100";
        B <= "0000";
        Bi <= '0';
        assert (D = "1100" AND Bo = '0') report "error";
        wait for 100 ns;
        A <= "0110";
        B <= "0110";
        Bi <= '1';
        assert (D = "1111" AND Bo = '1') report "error";
        wait for 100 ns;
        A <= "0101";
        B <= "1010";
        Bi <= '1';
        assert (D = "1010" AND Bo = '1') report "error";
        wait for 100 ns;
        A <= "0011";
        B <= "1111";
        Bi <= '0';
        assert (D = "0100" AND Bo = '1') report "error";
        wait for 100 ns;
        A <= "1110";
        B <= "1011";
        Bi <= '1';
        assert (D = "0010" AND Bo = '0') report "error";
        wait for 100 ns;
        A <= "1101";
        B <= "1100";
        Bi <= '1';
        assert (D = "0000" AND Bo = '0') report "error";
        wait;
    end process;

end Behavioral;
