----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2023 08:44:51 PM
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2023 06:45:00 PM
-- Design Name: 
-- Module Name: ALU_TB - Behavioral
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

entity ALU_TB is
--  Port ( );
end ALU_TB;

architecture Behavioral of ALU_TB is
    
    component ALU is
        port (Opcode: in std_logic_vector(2 downto 0);
              A, B: in std_logic_vector(7 downto 0);
              cin: in std_logic;
              result: out std_logic_vector(8 downto 0));
    end component;
    
    --Setting up internal testbench signals
    signal opcode_TB : std_logic_vector(2 downto 0);
    signal a_TB, b_TB: std_logic_vector(7 downto 0); 
    signal cin_TB : std_logic;
    signal result_TB : std_logic_vector(8 downto 0);
    signal index : integer:= 0;
              
    
    --Setting up constants for input values so I only have to write the 8-bit numbers once
    --constant a_tc0 : std_logic_vector(7 downto 0) := "00000000";
    --constant a_tc1 : std_logic_vector(7 downto 0) := "01111111";
    --constant a_tc2 : std_logic_vector(7 downto 0) := "10011010";
    --constant a_tc3 : std_logic_vector(7 downto 0) := "01101011";
    --constant b_tc0 : std_logic_vector(7 downto 0) := "00000000";
    --constant b_tc1 : std_logic_vector(7 downto 0) := "10000001";
    --constant b_tc2 : std_logic_vector(7 downto 0) := "01100101";
    --constant b_tc3 : std_logic_vector(7 downto 0) := "10001111";

    --Copied opcode constants from mux5 component
    constant op_addc : std_logic_vector(2 downto 0) := "000";
    constant op_add : std_logic_vector(2 downto 0) := "001";
    constant op_xor : std_logic_vector(2 downto 0) := "010";
    constant op_hold : std_logic_vector(2 downto 0) := "011";
    constant op_load : std_logic_vector(2 downto 0) := "101";
    
    --Array of carry-in values to be iterated through together with A and B inputs below
    type cin_array is array(0 to 3) of std_logic;
    constant cin_test: cin_array:=(
    '1', '0', '1', '1'
    );
    
    
    --Vector arrays holding input values for A and B to iterate through
    type input_vector_array is array(0 to 3) of std_logic_vector(7 downto 0);
    constant A_test_vectors: input_vector_array:=(
    "00000000", "01111111", "10011010", "01101011"
    );
    constant B_test_vectors: input_vector_array:=(
    "00000000", "10000001", "01100101", "10001111"                                            
    );
    
    --Array of opcode constants
    type opcode_vector_array is array(0 to 4) of std_logic_vector(2 downto 0);
    constant opcode_test_vectors: opcode_vector_array:=(
    op_addc, op_add, op_xor, op_hold, op_load
    );
    
    --Vector array of expected values to compare against
    type output_vector_array is array (0 to 19) of std_logic_vector(8 downto 0);
    constant test_result_vectors: output_vector_array:=(
    "000000001", "100000000", "100000000", "011111011",
    "000000000", "100000000", "011111111", "011111010", 
    "100000000", "011111110", "111111111", "111100100", 
    "100000000", "001111111", "110011010", "101101011", 
    "100000000", "010000001", "101100101", "110001111"
    ); 
    
    
begin
   --mapping ALU ports to test bench signals
    UUT: ALU port map (Opcode => opcode_TB,
                       A => a_TB,
                       B => b_TB,
                       cin => cin_TB,
                       result => result_TB
                       );
                  
process
begin

    --outer loop switches opcode
    for ii in 0 to 4 loop
        opcode_TB <= opcode_test_vectors(ii);
        --inner loop switches test case
        for jj in 0 to 3 loop
            a_TB <= a_test_vectors(jj);
            b_TB <= b_test_vectors(jj);
            cin_TB <= cin_test(jj);
            wait for 1ns;
            
            assert result_TB = test_result_vectors(index) report "answers don't match";
            wait for 1ns;
            
            if index<19 then
                index <= index+1;
            else
                index <= index;
           end if;
           wait for 8ns;
       end loop;
   end loop;
   wait;
end process;
                  


end Behavioral;

