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
use IEEE.NUMERIC_STD.ALL;

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
        variable test: unsigned(2 downto 0);
    begin
        for i in 0 to 4 loop
            test := to_unsigned(i, 3);
            Op <= std_logic_vector(test(2 downto 0));
            A <= "00000000";
            B <= "00000000";
            Cin <= '1';
            wait for 20 ns;
            A <= "01111111";
            B <= "10000001";
            Cin <= '0';
            wait for 20 ns;
            A <= "10011010";
            B <= "01100101";
            Cin <= '1';
            wait for 20 ns;
            A <= "01101011";
            B <= "10001111";
            Cin <= '1';
            wait for 20 ns;
        end loop;
        wait;
    
    end process;


end Behavioral;
