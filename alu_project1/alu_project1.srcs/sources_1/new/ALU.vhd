----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 04:15:28 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           Op : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
           Cout : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
    component Add is
        port (A, B : in std_logic_vector (7 downto 0);
              Cin : in std_logic;
              Y : out std_logic_vector (7 downto 0);
              Cout: out std_logic);
    end component;
    component Addc is
        port (A, B : in std_logic_vector (7 downto 0);
              Cin : in std_logic;
              Y : out std_logic_vector (7 downto 0);
              Cout : out std_logic);
    end component;
    component Xorr is
        port (A, B : in std_logic_vector (7 downto 0);
              Cin : in std_logic;
              Y : out std_logic_vector (7 downto 0);
              Cout : out std_logic);
    end component;
    component Load is
        port (A, B : in std_logic_vector (7 downto 0);
              Cin : in std_logic;
              Y : out std_logic_vector (7 downto 0);
              Cout : out std_logic);
    end component;
    component Hold is
        port (A, B : in std_logic_vector (7 downto 0);
              Cin : in std_logic;
              Y : out std_logic_vector (7 downto 0);
              Cout : out std_logic);
    end component;

    signal Result, Y0, Y1, Y2, Y3, Y4 : std_logic_vector (8 downto 0);
begin
    m_Add : Add port map (
        A => A,
        B => B,
        Cin => Cin,
        Y => Y0 (7 downto 0),
        Cout => Y0 (8)
    );
    m_Addc : Addc port map (
        A => A,
        B => B,
        Cin => Cin,
        Y => Y1 (7 downto 0),
        Cout => Y1 (8)
    );
    m_Xorr : Xorr port map (
        A => A,
        B => B,
        Cin => Cin,
        Y => Y2 (7 downto 0),
        Cout => Y2 (8)
    );
    m_Load : Load port map (
        A => A,
        B => B,
        Cin => Cin,
        Y => Y3 (7 downto 0),
        Cout => Y3 (8)
    );
    m_Hold : Hold port map (
        A => A,
        B => B,
        Cin => Cin,
        Y => Y4 (7 downto 0),
        Cout => Y4 (8)
    );

Result <= Y0 when Op = "000" else
    Y1 when Op = "001" else
    Y2 when Op = "010" else
    Y3 when Op = "011" else
    Y4;
Y <= Result (7 downto 0);
Cout <= Result (8);

end Behavioral;
