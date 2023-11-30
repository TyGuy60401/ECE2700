----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 01:34:33 PM
-- Design Name: 
-- Module Name: Calculator_TB - Behavioral
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

entity Calculator_TB is
--  Port ( );
end Calculator_TB;

architecture Behavioral of Calculator_TB is

component Calculator is
    port(UI : in std_logic_vector(7 downto 0);
         UI_ADDR : in std_logic_vector(3 downto 0);
         CMD : in std_logic_vector(3 downto 0);
         E : in std_logic;
         RST : in std_logic;
         CLK : in std_logic;
         ACC_OUT : out std_logic_vector(7 downto 0));
end component;

signal UI_TB, ACC_OUT_TB: std_logic_vector(7 downto 0);
signal E_TB, CLK_TB : std_logic := '0';
signal RST_TB : std_logic := '1'; 
signal UI_ADDR_TB, CMD_TB : std_logic_vector(3 downto 0);

--command constants
constant ld_m : std_logic_vector(3 downto 0) := "0000";
constant ld_ui : std_logic_vector(3 downto 0) := "0001";
constant stm : std_logic_vector(3 downto 0) := "0010";
constant stm_ui : std_logic_vector(3 downto 0) := "0011";
constant add_ui : std_logic_vector(3 downto 0) := "0100";
constant addwc_ui : std_logic_vector(3 downto 0) := "0101";
constant add_m : std_logic_vector(3 downto 0) := "0110";
constant addwc_m : std_logic_vector(3 downto 0) := "0111";



begin

UUT: Calculator port map (UI => UI_TB,
                          UI_ADDR => UI_ADDR_TB,
                          CMD => CMD_TB,
                          E => E_TB,
                          RST => RST_TB,
                          CLK => CLK_TB,
                          ACC_OUT => ACC_OUT_TB);

--clock generation
CLK_TB <= not CLK_TB after 10ns;

process
begin

wait for 20ns; --Wait one period with reset initialized to 1 before setting it to 0
RST_TB <= '0';

UI_ADDR_TB <= "0000";

--load 7 from ui
UI_TB <= "00000111";
CMD_TB <= ld_ui;
E_TB <= '1';
wait for 80ns;
E_TB <= '0';
wait for 80ns; --total of 8 clock periods waited, not sure how much time it needs for all states + debouncer
assert ACC_OUT_TB = "00000111" report "acc didn't load 7 from ui";

--add 5 from ui
UI_TB <= "00000101";
CMD_TB <= add_ui;
E_TB <= '1';
wait for 80ns;
E_TB <= '0';
wait for 80ns;
assert ACC_OUT_TB = "00001100" report "acc didn't add 5 to 7";

end process;

end Behavioral;
