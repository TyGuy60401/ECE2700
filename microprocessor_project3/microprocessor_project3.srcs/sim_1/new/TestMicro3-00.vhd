----------------------------------------------------------------------------------
-- Company: Weber State University
-- Engineer: Fon Brown
-- 
-- Create Date: 08/02/2023 02:43:25 PM
-- Module Name: TestMicro3 - Behavioral
-- Description: Simple microprocessor test bench for Project 3

-- Revision:
-- Revision 0.01 - File Created
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TestMicro3Small is
--  Port ( );
end TestMicro3Small;

architecture Behavioral of TestMicro3Small is
    component micro3controller is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rd  : out STD_LOGIC;
           wr  : out STD_LOGIC;
           addr : out STD_LOGIC_VECTOR (7 downto 0);
           data : inout STD_LOGIC_VECTOR (7 downto 0));
    end component;

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

    type ram_type is array (0 to 255) of std_logic_vector (7 downto 0);
    signal ram: ram_type := (
    op_ldi,  X"9E",
    op_addi, X"AA",
    op_ldm,  X"A2",
    op_ldi,  X"05",
    op_addm, X"01",
    op_adci, X"60",
    op_adci, X"10",
    op_ldi,  X"80",
    op_adcm, X"0F",
    op_ldi,  X"A0",
    op_xori, X"B0",
    op_xorm, X"05",
    op_jmp,  X"02",
    others=>X"FF" );





	
	signal rd, wr, rst, clk: std_logic;
	signal addr, data: std_logic_vector(7 downto 0);

begin
    -- unit under test
    uut: micro3controller port map(clk=>clk, rst=>rst, rd=>rd, wr=>wr, addr=>addr, data=>data);
    
    -- model memory
	process (clk)
	begin
	  if rising_edge(clk) then
	    if wr = '1' then
	      ram(to_integer(unsigned(addr)))<=data;
	    end if;
	  end if;
	end process;

	data <= ram(to_integer(unsigned(addr))) when rd = '1' else "ZZZZZZZZ";
	
	-- clock and reset stimulus
	process
	begin
	  rst<='1'; clk<='0';
	  wait for 10ns;
	  rst<='0';
	  for i in 1 to 135 loop
	    wait for 10 ns;
	    clk <= '1';
	    wait for 10 ns;
	    clk <= '0';
	  end loop;
	  wait;
	end process;

end Behavioral;
