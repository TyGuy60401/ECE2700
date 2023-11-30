----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 11:47:19 AM
-- Design Name: 
-- Module Name: debouncer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
  Port (d_in, d_clk, d_rst: in std_logic; 
        d_out: out std_logic);
end debouncer;

architecture Behavioral of debouncer is
component DFF is
  Port (clk, d: in std_logic;
        q: out std_logic);
end component;
signal q1, q2 : std_logic;
begin
U0 : DFF port map (d => d_in,
                    q => q1,
                    clk => d_clk
                    );
                    
U1 : DFF port map (d => q1,
                    q => q2,
                    clk => d_clk
                    );
d_out <= q1 and not q2;
end Behavioral;

