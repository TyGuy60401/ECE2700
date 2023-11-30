----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2023 04:19:39 PM
-- Design Name: 
-- Module Name: Calc_Datapath - Structural
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

entity Calc_Datapath is

  Port (CLK_DP, RST, CE : in std_logic;
        UI: in std_logic_vector(7 downto 0);
        INPUT_SEL, WR_SEL: in std_logic;
        OP_ALU: in std_logic_vector(2 downto 0);
        DB: inout std_logic_vector(7 downto 0);
        ADDR_IN : in std_logic_vector(3 downto 0);
        ADDR_OUT : out std_logic_vector(3 downto 0);
        STORE_ADDR, ADDR_INC, ADDR_LOAD, ADDR_SEL, RST_MEM, RST_COUNT : in std_logic);

end Calc_Datapath;

architecture Structural of Calc_Datapath is

component ALU_ACC is --Arithmetic Logic Unit with Accumulator
  Port (CLK_ALU, RST, CE : in std_logic;
        UI: in std_logic_vector(7 downto 0);
        INPUT_SEL, WR_SEL: in std_logic;
        OP_ALU: in std_logic_vector(2 downto 0);
        DB: inout std_logic_vector(7 downto 0));
end component;

component AM_4 is --4 bit Address controller Module
    port(ADDR_IN : in std_logic_vector(3 downto 0);
         ADDR_OUT : out std_logic_vector(3 downto 0);
         STORE_ADDR, ADDR_INC, ADDR_LOAD, ADDR_SEL, CLK_AM, RST_MEM, RST_COUNT : in std_logic);
         
end component;

begin

U1: ALU_ACC port map (CLK_ALU => CLK_DP, 
                      RST  => RST, 
                      CE => CE,
                      UI => UI,
                      INPUT_SEL => INPUT_SEL, 
                      WR_SEL => WR_SEL,
                      OP_ALU => OP_ALU,
                      DB => DB);



U2: AM_4 port map (ADDR_IN => ADDR_IN,
                   ADDR_OUT => ADDR_OUT,
                   STORE_ADDR => STORE_ADDR, 
                   ADDR_INC => ADDR_INC, 
                   ADDR_LOAD => ADDR_LOAD, 
                   ADDR_SEL => ADDR_SEL, 
                   CLK_AM => CLK_DP, 
                   RST_MEM => RST_MEM, 
                   RST_COUNT => RST_COUNT);

end Structural;
