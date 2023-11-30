----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2023 07:48:46 PM
-- Design Name: 
-- Module Name: ALU_ACC - Behavioral
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

entity ALU_ACC is
  Port (UI: in std_logic_vector(7 downto 0);
        SEL, WR_SEL: in std_logic;
        OP_ALU: in std_logic_vector(2 downto 0);
        RESULT: out std_logic_vector(7 downto 0) );
end ALU_ACC;


architecture Behavioral of ALU_ACC is
component DFFR_9 is
  Port (d : in std_logic_vector(8 downto 0);
        q : out std_logic_vector(8 downto 0);
        clk, rst, CE : in std_logic
         );
end component;

component UI_MUX is
  Port (DB, UI: in std_logic_vector(7 downto 0);
        SEL: in std_logic;
        UI_OUT: out std_logic_vector(7 downto 0) );
end component;

component MUX_B is
  Port (DB: inout std_logic_vector(7 downto 0);
        IB: out std_logic_vector(7 downto 0);
        R: in std_logic_vector(9 downto 0);
        WR: in std_logic);
end component;

component ALU is
    port (opcode : in std_logic_vector(3 downto 0);
          A, B: in std_logic_vector(7 downto 0); 
          Cin : in std_logic;
          result : out std_logic_vector(8 downto 0)
          );
end component;

signal op_alu_ui: std_logic_vector(2 downto 0);
signal in_sel, clk_s, rst_s, wr_s, CE: std_logic;
signal alu_r, q_out: std_logic_vector(8 downto 0);
signal ui_out_s, ib_out, db_out: std_logic_vector (7 downto 0); 

begin
U1: ALU port map(A => q_out(7 downto 0),
                  B => ui_out_s,
                  Cin => q_out(8),
                  result => alu_r,
                  opcode => op_alu );
              
U2: DFFR_9 port map(q => q_out,
                    d => alu_r,
                    clk => clk_s,
                    rst => rst_s,
                    CE => CE);
                    
U3: MUX_B port map(DB => db_out,
                    IB => ib_out,
                    R => q_out,
                    WR => wr_s);
                                              
U4: UI_MUX port map(DB => ib_out,
                    UI => UI,
                    SEL => in_sel,
                    UI_OUT => ui_out_s);


end Behavioral;
