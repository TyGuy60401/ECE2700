----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2023 11:39:10 AM
-- Design Name: 
-- Module Name: mux5 - Behavioral
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

entity mux5 is
    port (opcode : in std_logic_vector(2 downto 0);
          I0, I1, I2, I3, I4: in std_logic_vector(8 downto 0); 
          result : out std_logic_vector(8 downto 0));
end mux5;

architecture Behavioral of mux5 is

--assigning our operational codes to 3-bit vectors
constant op_addc : std_logic_vector(2 downto 0) := "000";
constant op_add : std_logic_vector(2 downto 0) := "001";
constant op_xor : std_logic_vector(2 downto 0) := "010";
constant op_hold : std_logic_vector(2 downto 0) := "011";
constant op_load : std_logic_vector(2 downto 0) := "101";

begin 
-- assigning our I0 though I4 signals to different opcodes
result <= I0 when opcode = op_addc else
    I1 when opcode = op_add else
    I2 when opcode = op_xor else
    I3 when opcode = op_hold else
    I4 when opcode = op_load;
    
end Behavioral;