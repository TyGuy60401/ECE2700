----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2023 10:33:21 PM
-- Design Name: 
-- Module Name: micro2 - Behavioral
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

entity micro2 is
    Port ( clk    : in STD_LOGIC;
           rst    : in STD_LOGIC;
           rd     : in STD_LOGIC;
           wr     : in STD_LOGIC;
           fetch  : in STD_LOGIC;
           ld_pc  : in STD_LOGIC;
           ld_mar : in STD_LOGIC;
           inc_pc : in STD_LOGIC;
           op     : in STD_LOGIC_VECTOR (2 downto 0);
           addr   : out STD_LOGIC_VECTOR (7 downto 0);
           data   : inout STD_LOGIC_VECTOR (7 downto 0));
end micro2;

architecture Structural of micro2 is
    -- signal declarations
    signal carry_sig, ALU_Cout : std_logic;
    signal internal_bus, acc_bus, ALU_Y, MAR_out, PC_out : std_logic_vector (7 downto 0);
    -- signal acc_bus : std_logic_vector (7 downto 0);

    component ALU is
        port ( A, B : in std_logic_vector (7 downto 0);
               Cin : in std_logic;
               Op : in std_logic_vector (2 downto 0);
               Y : out std_logic_vector (7 downto 0);
               Cout : out std_logic  );
    end component;

    component reg8 is 
        port ( clk : in std_logic;
               data_in : in std_logic_vector (7 downto 0);
               data_out : out std_logic_vector (7 downto 0) );
    end component;

    component DFF is
        port (clk : in std_logic;
              data_in : in std_logic;
              data_out : out std_logic);
    end component;

    component PC is
        port (clk : in std_logic;
              rst : in std_logic;
              ld_pc : in std_logic;
              inc_pc : in std_logic;
              data_in : in std_logic_vector (7 downto 0);
              data_out : out std_logic_vector (7 downto 0));
    end component;

    component MUX is
        port ( fetch : in std_logic;
               data_MAR : in std_logic_vector (7 downto 0);
               data_PC : in std_logic_vector (7 downto 0);
               data_out : out std_logic_vector (7 downto 0));
    end component;

    component mem_bus is
        port ( wr : in std_logic;
               rd : in std_logic;
               acc_in : in std_logic_vector (7 downto 0);
               data_bus : inout std_logic_vector (7 downto 0);
               int_bus : out std_logic_vector (7 downto 0));
    end component;
begin
    ALU_inst : ALU port map (
        A => acc_bus,
        B => internal_bus,
        Cin => carry_sig,
        Op => op,
        Y => ALU_Y,
        Cout => ALU_Cout
    );

    Acc_inst : reg8 port map (
        clk => clk,
        data_in => ALU_Y,
        data_out => acc_bus
    );

    Carry_flag_inst : DFF port map (
        clk => clk,
        data_in => ALU_Cout,
        data_out => carry_sig
    );

    MAR_inst : reg8 port map (
        clk => clk,
        data_in => internal_bus,
        data_out => MAR_out
    );

    PC_inst : PC port map (
        clk => clk,
        rst => rst,
        ld_pc => ld_pc,
        inc_pc => inc_pc,
        data_in => internal_bus,
        data_out => PC_out
    );

    MUX_inst : MUX port map (
        data_MAR => MAR_out,
        data_PC => PC_out,
        fetch => fetch,
        data_out => addr
    );

    Mem_bus_inst : mem_bus port map (
        wr => wr,
        rd => rd,
        acc_in => acc_bus,
        data_bus => data,
        int_bus => internal_bus
    );
end Structural;
