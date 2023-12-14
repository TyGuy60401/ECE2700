----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2023 07:17:46 PM
-- Design Name: 
-- Module Name: sequence_finder - Behavioral
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

entity sequence_finder is
    Port ( CLK : in STD_LOGIC;
           SIG : in STD_LOGIC;
           RST : in STD_LOGIC;
           Found : out STD_LOGIC);
end sequence_finder;

architecture Behavioral of sequence_finder is
    component ls74 is
        port ( CLK, RST_L, SET_L, D : in std_logic;
               Q_H, Q_L : out std_logic );
    end component;

    signal Q : std_logic_vector (1 downto 0);
    signal next_Q : std_logic_vector (1 downto 0);


begin
    q1_ls74: ls74 port map (
        CLK => CLK,
        RST_L =>  not RST,
        SET_L => '0',
        D => Q(1),
        Q_H => next_Q(1),
        Q_L => open
    );

    q2_ls74: ls74 port map (
        CLK => CLK,
        RST_L => not RST,
        SET_L => '0',
        D => Q(0),
        Q_H => next_Q(0),
        Q_L => open
    );

    Q(1) <= Q(0) and SIG;
    Q(0) <= SIG;

    Found <= Q(1) and not SIG;

    process (CLK)
    begin
        if rising_edge(CLK) then
            Q <= next_Q;
        end if;
    end process;
    
end Behavioral;
