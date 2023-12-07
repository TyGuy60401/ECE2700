----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2023 03:08:42 PM
-- Design Name: 
-- Module Name: micro3controller - Behavioral
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

entity micro3controller is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rd : out STD_LOGIC;
           wr : out STD_LOGIC;
           addr : out STD_LOGIC_VECTOR (7 downto 0);
           data : inout STD_LOGIC_VECTOR (7 downto 0));
end micro3controller;

architecture Behavioral of micro3controller is
    component micro2 is
        port ( clk, rst, rd, wr, fetch, ld_pc, ld_mar, inc_pc : in std_logic;
               op : in std_logic_vector (2 downto 0);
               addr : out std_logic_vector (7 downto 0);
               data : inout std_logic_vector (7 downto 0));
    end component;

    -- op codes
    constant alu_add  : std_logic_vector(2 downto 0) := "000";
    constant alu_addc : std_logic_vector(2 downto 0) := "001";
    constant alu_xor  : std_logic_vector(2 downto 0) := "010";
    constant alu_load : std_logic_vector(2 downto 0) := "011";
    constant alu_hold : std_logic_vector(2 downto 0) := "100";

    -- mem codes
    constant op_halt:  std_logic_vector(7 downto 0) := X"00"; -- Halt
	constant op_jmp:   std_logic_vector(7 downto 0) := X"01"; -- Jump
	constant op_jc:    std_logic_vector(7 downto 0) := X"02"; -- Jump if Carry
	constant op_jnc:   std_logic_vector(7 downto 0) := X"03"; -- Jump if No Carry
	constant op_ldi:   std_logic_vector(7 downto 0) := X"10"; -- Load Immediate
	constant op_addi:  std_logic_vector(7 downto 0) := X"11"; -- Add Immediate
	constant op_adci:  std_logic_vector(7 downto 0) := X"12"; -- Add Immediate with Carry
	constant op_xori:  std_logic_vector(7 downto 0) := X"13"; -- Exclusive-Or Immediate
	constant op_ldm:   std_logic_vector(7 downto 0) := X"20"; -- Load Memory
	constant op_addm:  std_logic_vector(7 downto 0) := X"21"; -- Add Memory
	constant op_adcm:  std_logic_vector(7 downto 0) := X"22"; -- Add Memory with Carry
	constant op_xorm:  std_logic_vector(7 downto 0) := X"23"; -- Exclusive-Or Memory
	constant op_stm:   std_logic_vector(7 downto 0) := X"30"; -- Store Memory

    -- signals and types
    type Tstate is (
        fet,
        ldi,
        addi,
        adci,

        ldm_0,
        ldm_1,

        addm_0,
        addm_1,

        adcm_0,
        adcm_1,

        xori,

        xorm_0,
        xorm_1,

        jmp
    );
    signal state: Tstate;
    signal next_state: Tstate;

    signal debug: std_logic_vector (7 downto 0);
    signal fetch, inc_pc, ld_pc, ld_mar, rd_int, wr_int: std_logic;
    signal op: std_logic_vector (2 downto 0);
    signal int_bus: std_logic_vector (7 downto 0);
begin

    process (clk, rst)
    begin
        if rst = '1' then
            state <= fet;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    process (state, data, )
    begin
        -- default values same as 'fet' state
        fetch <= '1';
        inc_pc <= '1';
        ld_pc <= '0';
        ld_mar <= '0';
        rd_int <= '1';
        wr_int <= '0';
        op <= alu_hold;
        next_state <= fet;
        case state is
            when fet =>
                case data is
                    when op_ldi  => next_state <= ldi;
                    when op_addi => next_state <= addi;
                    when op_adci => next_state <= adci;
                    when op_ldm  => next_state <= ldm_0;
                    when op_addm => next_state <= addm_0;
                    when op_adcm => next_state <= adcm_0;
                    when op_xori => next_state <= xori;
                    when op_xorm => next_state <= xorm_0;
                    when op_jmp  => next_state <= jmp;
                    when others => next_state <= fet;
                end case;
            
            when ldi => op <= alu_load;
            when addi => op <= alu_add;
            when adci => op <= alu_addc;

            when ldm_0 =>
                ld_mar <= '1';
                next_state <= ldm_1;
            when ldm_1 =>
                fetch <= '0';
                inc_pc <= '0';
                op <= alu_load;
            
            when addm_0 =>
                ld_mar <= '1';
                next_state <= addm_1;
            when addm_1 => 
                fetch <= '0';
                op <= alu_add;
                inc_pc <= '0';
            
            when adcm_0 =>
                ld_mar <= '1';
                next_state <= adcm_1;
            when adcm_1 =>
                fetch <= '0';
                op <= alu_addc;
                inc_pc <= '0';

            when xori => op <= alu_xor;

            when xorm_0 =>
                ld_mar <= '1';
                next_state <= xorm_1;
            when xorm_1 =>
                fetch <= '0';
                inc_pc <= '0';
                op <= alu_xor;
            
            when jmp =>
                ld_pc <= '1';
                inc_pc <= '0';

                



        end case;
    end process;
    rd <= rd_int;
    wr <= wr_int;

    micro2_inst: micro2 port map(
        data => data,
        clk => clk,
        rst => rst,
        fetch => fetch,
        rd => rd_int,
        wr => wr_int,
        op => op,
        ld_pc => ld_pc,
        ld_mar => ld_mar,
        inc_pc => inc_pc,
        addr => addr
    );

end Behavioral;
