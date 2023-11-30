----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2023 06:26:09 PM
-- Design Name: 
-- Module Name: calc_controller - Behavioral
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

entity calc_controller is
  Port (cmd: in std_logic_vector(3 downto 0);
        E, clk, rst: in std_logic );
end calc_controller;

architecture Behavioral of calc_controller is

--opcodes
    constant op_addc : std_logic_vector(2 downto 0) := "000";
    constant op_add : std_logic_vector(2 downto 0) := "001";
    constant op_xor : std_logic_vector(2 downto 0) := "010";
    constant op_hold : std_logic_vector(2 downto 0) := "011";
    constant op_load : std_logic_vector(2 downto 0) := "101";

--cmd arguments
    constant ld_m : std_logic_vector(3 downto 0) := "0000";
    constant ld_ui : std_logic_vector(3 downto 0) := "0001";
    constant stm : std_logic_vector(3 downto 0) := "0010";
    constant stm_ui : std_logic_vector(3 downto 0) := "0011";
    constant add_ui : std_logic_vector(3 downto 0) := "0100";
    constant addwc_ui : std_logic_vector(3 downto 0) := "0101";
    constant add_m : std_logic_vector(3 downto 0) := "0110";
    constant addwc_m : std_logic_vector(3 downto 0) := "0111";

type Tstate is (idle, load_ui, addui_wc, addui_0, add_m_0, add_m_1, addwc_m_1, addwc_m_0, stm_0, stm_1, stm_ui_0, stm_ui_1, ld_m_0, ld_m_1);
signal state: Tstate;
signal next_state: Tstate;
signal input_sel, wr_sel, addr_inc, addr_load, addr_sel, addr_st: std_logic;
signal op_code: std_logic_vector(2 downto 0);

begin

process(clk, rst)
begin
    if rst = '1' then
        state <= idle;
    elsif rising_edge (clk) then
        state <= next_state;
    end if;
end process;

process(E, cmd, state)
begin
    case state is
        when idle =>
            if E <= '1' then
                case cmd is 
                    when stm =>
                        next_state <= stm_0;
                        wr_sel <= '1';   
                    when stm_ui => 
                        next_state <= stm_ui_0;
                        addr_load <= '1';
                        addr_sel <= '1';
                        op_code <= op_load;
                    when ld_m =>
                        next_state <= ld_m_0;
                        addr_sel <= '0';
                        addr_st <= '1';
                    when addwc_m =>
                        next_state <= addwc_m_0;
                        addr_sel <= '0';
                        addr_st <= '1';
                    when ld_ui =>
                        op_code <= op_load;
                    when add_ui =>
                        op_code <= op_add;
                    when addwc_ui =>
                        op_code <= op_addc;
                    when add_m_0 => 
                        next_state => add_m_1;
                        addr_sel <= '0';
                        addr_st <= '1';
                           
                end case;
            end if;  
         when stm_0 =>
            next_state <= stm_1;
            addr_inc <= '1';
         when stm_ui_0 =>
            next_state <= stm_ui_1;
            wr_sel <= '1';  
        when ld_m_0 =>
            next_state <= ld_m_1;
            addr_sel <= '0';
            op_code <= op_load;
        when addwc_m_0 =>
            next_state <= addwc_m_1;
            input_sel <= '1';
            addr_sel <= '0';
            op_code <= op_addc;
        when add_m_0 =>
            next_state <= add_m_1;
            input_sel <= '0';
            addr_sel <= '0';
            op_code <= op_add;
        when others => 
            next_state <= idle;
            input_sel <= '0';
            op_code <= op_hold;
            wr_sel <= '0';
            addr_inc <= '0';
            addr_load <= '0';
            addr_sel <= '1';
            addr_st <= '0';
            
    end case;
            
end process;
end Behavioral;
