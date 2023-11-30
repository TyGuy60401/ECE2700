----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2023 06:52:03 PM
-- Design Name: 
-- Module Name: AM_4 - Behavioral
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

entity AM_4 is --4 bit Address controller Module
    port(ADDR_IN : in std_logic_vector(3 downto 0);
         ADDR_OUT : out std_logic_vector(3 downto 0);
         STORE_ADDR, ADDR_INC, ADDR_LOAD, ADDR_SEL, CLK_AM, RST_MEM, RST_COUNT : in std_logic);
         
end AM_4;

architecture Behavioral of AM_4 is

component MAC_4 is --4-bit Memory Address Counter
    port(inc, dec, rst, clk : in std_logic;
         load_val : in std_logic_vector(3 downto 0);
         count : out std_logic_vector(3 downto 0));
end component;

component DFFR_4 is --4-bit D Flip-Flop Register
    Port (d : in std_logic_vector(3 downto 0);
          q : out std_logic_vector(3 downto 0);
          clk, rst, CE : in std_logic);
end component;

component ADDR_MUX is --Data address multiplexer
    Port (STORE, COUNT: in std_logic_vector(3 downto 0);
          SEL: in std_logic;
          ADDR_OUT: out std_logic_vector(3 downto 0));
end component;

signal FROM_REGISTER : std_logic_vector(3 downto 0);
signal FROM_COUNTER : std_logic_vector(3 downto 0);
signal INC_HI : std_logic;

begin

INC_HI <= (ADDR_INC or ADDR_LOAD);

R0: DFFR_4 port map (d => ADDR_IN,
                     q => FROM_REGISTER,
                     CE => STORE_ADDR,
                     clk => CLK_AM,
                     rst => RST_MEM);
                     
C0: MAC_4 port map (load_val => ADDR_IN,
                    count => FROM_COUNTER,
                    inc => INC_HI,
                    dec => ADDR_LOAD,
                    clk => CLK_AM,
                    rst => RST_COUNT);
                    
M0: ADDR_MUX port map (STORE => FROM_REGISTER,
                       COUNT => FROM_COUNTER,
                       SEL => ADDR_SEL,
                       ADDR_OUT => ADDR_OUT);


end Behavioral;
