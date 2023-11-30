----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 12:07:01 PM
-- Design Name: 
-- Module Name: Calculator - Behavioral
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

entity Calculator is
  Port (UI: in std_logic_vector(7 downto 0);
        UI_ADDR, CMD: in std_logic_vector(3 downto 0);
        E, RST, CLK: in std_logic;
        ACC_OUT: OUT std_logic_vector(7 downto 0) );
end Calculator;

architecture Behavioral of Calculator is

component Calc_Datapath is
  Port (CLK_DP, RST, CE : in std_logic;
        UI: in std_logic_vector(7 downto 0);
        INPUT_SEL, WR_SEL: in std_logic;
        OP_ALU: in std_logic_vector(2 downto 0);
        DB: inout std_logic_vector(7 downto 0);
        ADDR_IN : in std_logic_vector(3 downto 0);
        ADDR_OUT : out std_logic_vector(3 downto 0);
        STORE_ADDR, ADDR_INC, ADDR_LOAD, ADDR_SEL, RST_MEM, RST_COUNT : in std_logic;
        ACC_OUT : out std_logic_vector(7 downto 0));

end component;

component MEM_16x8 is --8-bit memory with 16 addresses
    port(mem_db : inout std_logic_vector(7 downto 0);
         address_in : in std_logic_vector(3 downto 0);
         clk, rst, mem_wr, mem_rd : in std_logic
         );
end component;

component calc_controller_moore is
  Port (cmd: in std_logic_vector(3 downto 0);
        E, clk, rst: in std_logic );
end component;

component debouncer is
  Port (d_in, d_clk, d_rst: in std_logic; 
        d_out: out std_logic);
end component;

signal IN_SEL_S, WR_SEL_S, STORE_ADDR_S, ADDR_INC_S, ADDR_LOAD_S, ADDR_SEL_S, E_S: std_logic; 
signal OP_ALU_S: std_logic_vector(2 downto 0);
signal DB_S, ACC_OUT_S: std_logic_vector(7 downto 0);
signal ADDR_OUT_S: std_logic_vector(3 downto 0);
signal RD_S: std_logic;

begin

U0: Calc_Datapath port map(CLK_DP => CLK,
                          UI => UI,
                          RST => RST,
                          CE => '1',
                          INPUT_SEL => IN_SEL_S,
                          WR_SEL => WR_SEL_S,
                          OP_ALU => OP_ALU_S,
                          DB => DB_S,
                          ADDR_IN => UI_ADDR,
                          ADDR_OUT => ADDR_OUT_S,
                          STORE_ADDR => STORE_ADDR_S,
                          ADDR_INC => ADDR_INC_S,
                          ADDR_LOAD => ADDR_LOAD_S,
                          ADDR_SEL => ADDR_SEL_S,
                          RST_MEM => RST,
                          RST_COUNT => RST,
                          ACC_OUT => ACC_OUT_S
                          );
ACC_OUT <= ACC_OUT_S;
                  
U1: MEM_16x8 port map(mem_db => DB_S,
                      address_in => ADDR_OUT_S,
                      clk => CLK,
                      rst => RST,
                      mem_wr => WR_SEL_S,
                      mem_rd => RD_S
                      );
 RD_S <= NOT WR_SEL_S;
 
 U2: calc_controller_moore port map(cmd => CMD,
                                    E => E_S,
                                    clk => CLK,
                                    rst => RST
                                    );
                                                     
U3: debouncer port map(d_in => E,
                       d_clk => CLK,
                       d_rst => RST,
                       d_out => E_S
                       ); 
end Behavioral;
