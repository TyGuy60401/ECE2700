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
    signal not_Q : std_logic_vector (1 downto 0);

    signal not_RST : std_logic;
    signal in1 : std_logic;
    signal in0 : std_logic;


begin
    not_RST <= not RST;
    q1_ls74: ls74 port map (
        CLK => CLK,
        RST_L => not_RST,
        SET_L => '1',
        D => in1,
        Q_H => Q(1),
        Q_L => not_Q(1)
    );

    q0_ls74: ls74 port map (
        CLK => CLK,
        RST_L => not_RST,
        SET_L => '1',
        D => in0,
        Q_H => Q(0),
        Q_L => not_Q(0)
    );

    -- in1 <= Q(0) and SIG;
    -- in1 <= (not_Q(0) nor not SIG);
    -- in1 <= (Q(0) and SIG) or (Q(0) and Q(1));
    -- in1 <= Q(0) and (SIG or Q(1));
    -- in1 <= not_Q(0) nand (SIG nor Q(1));
    -- in1 <= not_Q(0) nand (not SIG nor not_Q(1));
    -- in1 <= not_Q(0) nor (SIG nand Q(1));
    -- in1 <= not (Q(0) nor Q(0))
    -- in1 <= Q(0) nand (SIG nor Q(1));
    -- in1 <= not_Q(0) nand (SIG nor Q(1));
    -- in1 <= not_Q(0) nor (not SIG and not_Q(1));
    in1 <= not_Q(0) nor (SIG nor Q(1));

    in0 <= SIG;
    
    
    -- Found <= Q(1) and not_Q(0);
    Found <= not_Q(1) nor Q(0);


    -- process (CLK)
    -- begin
    --     if rising_edge(CLK) then
        --     Found <= not_Q(1) nor SIG;
        --     Found <= Q(1) and not SIG;
        -- end if;
    -- end process;

    -- process (CLK)
    -- begin
    --     if rising_edge(CLK) then
    --         Q <= next_Q;
    --     end if;
    -- end process;
    
end Behavioral;
