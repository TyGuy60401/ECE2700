----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2023 03:29:40 PM
-- Design Name: 
-- Module Name: full_add_4_tb - Behavioral
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

entity full_add_4_tb is
--  Port ( );
end full_add_4_tb;

architecture Behavioral of full_add_4_tb is
    component full_add_4 is
        Port ( X    : in STD_LOGIC_VECTOR (3 downto 0);
               Y    : in STD_LOGIC_VECTOR (3 downto 0);
               Cin  : in STD_LOGIC;
               Sum  : out STD_LOGIC_VECTOR (3 downto 0);
               Cout : out STD_LOGIC);
    end component;

    -- Input signal declaration
    signal X, Y : std_logic_vector(3 downto 0) := "0000";
    signal Cin : std_logic := '0';

    -- Output signal declaration
    signal S : std_logic_vector(3 downto 0);
    signal Cout : std_logic;

begin
    -- Instantiate the Unit Under Test
    uut: full_add_4 port map (X => X, Y => Y, Cin => Cin, Cout => Cout, Sum => S);

    -- Stimulus process
    process
        variable test: unsigned(8 downto 0);
        variable sum: unsigned(4 downto 0);
    begin
        for i in 0 to 511 loop
            test := to_unsigned(i,9);
            X <= std_logic_vector(test(3 downto 0));
            Y <= std_logic_vector(test(7 downto 4));
            Cin <= test(8);
            wait for 2 ns;
            sum := to_unsigned(i mod 16 + (i/16) mod 16 + i/256, 5);
            assert S = std_logic_vector(sum(3 downto 0)) report "bad sum";
            assert Cout = sum(4) report "bad carry-out";
        
        end loop;
    wait;
    end process;



end Behavioral;
