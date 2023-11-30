----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2023 07:06:54 PM
-- Design Name: 
-- Module Name: ALU_ACC_TB - Behavioral
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

entity ALU_ACC_TB is
--  Port ( );
end ALU_ACC_TB;

architecture Behavioral of ALU_ACC_TB is 

component ALU_ACC is --Arithmetic Logic Unit with Accumulator
  Port (CLK_ALU, RST, CE : in std_logic;
          UI: in std_logic_vector(7 downto 0);
          INPUT_SEL, WR_SEL: in std_logic;
          OP_ALU: in std_logic_vector(2 downto 0);
          DB: inout std_logic_vector(7 downto 0));
end component;

    signal UI_TB: std_logic_vector(7 downto 0);
    signal INPUT_SEL_TB, WR_SEL_TB, RST_TB, CE_TB: std_logic;
    signal OP_ALU_TB: std_logic_vector(2 downto 0);
    signal DB_TB: std_logic_vector(7 downto 0);
    signal CLK_TB : std_logic := '0';
    
    --Copied opcode constants from mux5 component
    constant op_addc : std_logic_vector(2 downto 0) := "000";
    constant op_add : std_logic_vector(2 downto 0) := "001";
    constant op_xor : std_logic_vector(2 downto 0) := "010";
    constant op_hold : std_logic_vector(2 downto 0) := "011";
    constant op_load : std_logic_vector(2 downto 0) := "101";
    
    --opcode constant array copied from ALU testbench
    type opcode_vector_array is array(0 to 4) of std_logic_vector(2 downto 0);
    constant opcode_test_vectors: opcode_vector_array:=(
    op_addc, op_add, op_xor, op_hold, op_load
    );
    
    --Adding constants for user input and data bus input to test UI_MUX in a more readable way
    --constant B_user_input : std_logic_vector(7 downto 0) := "11111110";
    --constant B_from_memory: std_logic_vector(7 downto 0) := "00000001";
    --didn't end up using these, other tests include sufficient switching of UI_MUX
    
    --Adding constants for both multiplexers so I don't have to remember which input is 1 and which is 0
    constant MuxBuffer_WRITE : std_logic := '1';
    constant MuxBuffer_LOAD : std_logic := '0';
    constant InputMux_UI : std_logic := '0';
    constant InputMux_BUS : std_logic := '1';
    
    --test vectors copied from ALU testbench
    type input_vector_array is array(0 to 3) of std_logic_vector(7 downto 0);
    constant A_test_vectors: input_vector_array:=(
    "00000000", "01111111", "10011010", "01101011"
    );
    constant B_test_vectors: input_vector_array:=(
    "00000000", "10000001", "01100101", "10001111"                                            
    );
    
    --vectors of expected values copied from ALU testbench
    type result_vector_array is array (0 to 3) of std_logic_vector(7 downto 0);
    constant xor_result_vectors: result_vector_array:=(
    "00000000", "11111110", "11111111", "11100100"
    );
    constant add_carry_result_vectors: result_vector_array:=(
    "00000001", "00000001", "00000000", "11111011"
    );
    constant add_result_vectors: result_vector_array:=(
    "00000000", "00000000", "11111111", "11111010"
    );
    
begin
    
    UUT : ALU_ACC port map (CLK_ALU => CLK_TB,
                            RST => RST_TB,
                            CE => CE_TB,
                            UI => UI_TB,
                            INPUT_SEL => INPUT_SEL_TB,
                            WR_SEL => WR_SEL_TB,
                            OP_ALU => OP_ALU_TB,
                            DB => DB_TB);
    
    CLK_TB <= not CLK_TB after 10ns; --using 50MHz clock same as before, but with clk generation described in P2
    
    process
    begin
        
        wait for 5ns; --offset entire process by 5ns to simulate setup/hold time
        RST_TB <= '1'; --setting signals to initial values
        INPUT_SEL_TB <= InputMux_UI;
        WR_SEL_TB <= MuxBuffer_WRITE;
        CE_TB <= '1';
        wait for 20ns;
        RST_TB <= '0';
         
        --test 1/5, load from memory
            OP_ALU_TB <= op_load;
            INPUT_SEL_TB <= InputMux_BUS; --hold and load show input from internal bus. add, addc, and xor take from UI.
            UI_TB <= "11111111"; --setting value for user input; this test shouldn't ever take from this
            for ii in 0 to 3 loop
                WR_SEL_TB <= MuxBuffer_LOAD;
                DB_TB <= A_test_vectors(ii);
                wait for 20ns;
                DB_TB <= (OTHERS => 'Z');
                WR_SEL_TB <= MuxBuffer_WRITE;
                assert DB_TB = A_test_vectors(ii) report "Data didn't stay in memory";
            end loop;
        
        --test 2/5, hold value in accumulator
        OP_ALU_TB <= op_hold;
         --same loop as before, but with B test vectors. 
         --It shouldn't load anything and should stay at the last value of the previous loop
        for ii in 0 to 3 loop 
                WR_SEL_TB <= MuxBuffer_LOAD;
                DB_TB <= B_test_vectors(ii);
                wait for 20ns;
                DB_TB <= (OTHERS => 'Z');
                WR_SEL_TB <= MuxBuffer_WRITE;
                wait for 20ns;
                assert DB_TB = A_test_vectors(3) report "Data didn't stay in memory";
            end loop;
        
        --test 3/5, exclusive or
        RST_TB <= '1';
        wait for 20ns; --resetting and waiting 1 clock cycle
        RST_TB <= '0';
        OP_ALU_TB <= op_xor;
        INPUT_SEL_TB <= InputMux_UI; --taking from UI instead of DB this time
        WR_SEL_TB <= MuxBuffer_WRITE;
        for ii in 0 to 3 loop
            UI_TB <= A_test_vectors(ii); --clock first value into accumulator
            wait for 20ns;
            UI_TB <= B_test_vectors(ii); --second value
            wait for 20ns;
            assert DB_TB = xor_result_vectors(ii) report "xor operation - unexpected value";
            RST_TB <= '1';
            wait for 20ns;
            RST_TB <= '0';
        end loop;
        
        --test 4/5, add without carry
        OP_ALU_TB <= op_add; --already reset from previous op
        for ii in 0 to 3 loop
            UI_TB <= "10000000"; --set UI to 80 and wait 2 clock cycles, this will set the carry bit to 1 before every test.
            wait for 40ns;
            
            UI_TB <= A_test_vectors(ii);
            wait for 20ns;
            UI_TB <= B_test_vectors(ii);
            wait for 20ns;
            assert DB_TB = add_result_vectors(ii) report "add operation - unexpected value";
            RST_TB <= '1';
            wait for 20ns;
            RST_TB <= '0';
        end loop;
        
        --test 5/5, add with carry
        OP_ALU_TB <= op_addc; --already reset from previous op
        for ii in 0 to 3 loop
            UI_TB <= "10000000"; --set UI to 80 and wait 2 clock cycles, this will set the carry bit to 1 before every test.
            wait for 40ns;
            
            UI_TB <= A_test_vectors(ii);
            wait for 20ns;
            UI_TB <= B_test_vectors(ii);
            wait for 20ns;
            assert DB_TB = add_carry_result_vectors(ii) report "add with carry operation - unexpected value";
            RST_TB <= '1';
            wait for 20ns;
            RST_TB <= '0';
        end loop;
        

    end process;

end Behavioral;
