library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MACC_to_register_tb is

end MACC_to_register_tb;

architecture Behavioral of MACC_to_register_tb is

    component MACC_to_register
    port
    (
        clk     : in std_logic;
        A0      : in integer;
        A1      : in integer;
        A2      : in integer;
        A_en    : in std_logic_vector(0 to 2);
        B0      : in integer;
        B1      : in integer;
        B2      : in integer;
        B_en    : in std_logic_vector(0 to 2);
        C11     : out integer;
        C12     : out integer;
        C13     : out integer;
        C21     : out integer;
        C22     : out integer;
        C23     : out integer;
        C31     : out integer;
        C32     : out integer;
        C33     : out integer;

    


        C11_en     : out std_logic;
        C12_en     : out std_logic;
        C13_en     : out std_logic;
        C21_en     : out std_logic;
        C22_en     : out std_logic;
        C23_en     : out std_logic;
        C31_en     : out std_logic;
        C32_en     : out std_logic;
        C33_en     : out std_logic;





        R1_out  :   out integer;
        R2_out  :   out integer;
        R3_out  :   out integer;
        R4_out  :   out integer;
        R5_out  :   out integer;
        R6_out  :   out integer;
        R7_out  :   out integer;
        R8_out  :   out integer;
        R9_out  :   out integer;
        R10_out :   out integer;
        R11_out :   out integer;
        R12_out :   out integer;


        R1_en       :   out std_logic;
        R2_en       :   out std_logic;
        R3_en       :   out std_logic;
        R4_en       :   out std_logic;
        R5_en       :   out std_logic;
        R6_en       :   out std_logic;
        R7_en       :   out std_logic;
        R8_en       :   out std_logic;
        R9_en       :   out std_logic;
        R10_en      :   out std_logic;
        R11_en      :   out std_logic;
        R12_en      :   out std_logic;
        C11_Aen     : out std_logic;
        C12_Aen     : out std_logic;
        C13_Aen     : out std_logic;
        C21_Aen     : out std_logic;
        C22_Aen     : out std_logic;
        C23_Aen     : out std_logic;
        C31_Aen     : out std_logic;
        C32_Aen     : out std_logic;
        C33_Aen     : out std_logic;
        C11_Ben     : out std_logic;
        C12_Ben     : out std_logic;
        C13_Ben     : out std_logic;
        C21_Ben     : out std_logic;
        C22_Ben     : out std_logic;
        C23_Ben     : out std_logic;
        C31_Ben     : out std_logic;
        C32_Ben     : out std_logic;
        C33_Ben     : out std_logic
    
    );
    end component;

    signal clk     : std_logic;
    signal A0      : integer;
    signal A1      : integer;
    signal A2      : integer;
    signal A_en    : std_logic_vector(0 to 2);

    signal B0      : integer;
    signal B1      : integer;
    signal B2      : integer;
    signal B_en    : std_logic_vector(0 to 2);

    signal C11     : integer;
    signal C12     : integer;
    signal C13     : integer;
    signal C21     : integer;
    signal C22     : integer;
    signal C23     : integer;
    signal C31     : integer;
    signal C32     : integer;
    signal C33     : integer;

    signal C11_en     : std_logic;
    signal C12_en     : std_logic;
    signal C13_en     : std_logic;
    signal C21_en     : std_logic;
    signal C22_en     : std_logic;
    signal C23_en     : std_logic;
    signal C31_en     : std_logic;
    signal C32_en     : std_logic;
    signal C33_en     : std_logic;
        
    signal R1_out  : integer;
    signal R2_out  : integer;
    signal R3_out  : integer;
    signal R4_out  : integer;
    signal R5_out  : integer;
    signal R6_out  : integer;
    signal R7_out  : integer;
    signal R8_out  : integer;
    signal R9_out  : integer;
    signal R10_out : integer;
    signal R11_out : integer;
    signal R12_out : integer;


    signal R1_en   : std_logic;
    signal R2_en   : std_logic;
    signal R3_en   : std_logic;
    signal R4_en   : std_logic;
    signal R5_en   : std_logic;
    signal R6_en   : std_logic;
    signal R7_en   : std_logic;
    signal R8_en   : std_logic;
    signal R9_en   : std_logic;
    signal R10_en  : std_logic;
    signal R11_en  : std_logic;
    signal R12_en  : std_logic;


    signal C11_Aen     : std_logic;
    signal C12_Aen     : std_logic;
    signal C13_Aen     : std_logic;
    signal C21_Aen     : std_logic;
    signal C22_Aen     : std_logic;
    signal C23_Aen     : std_logic;
    signal C31_Aen     : std_logic;
    signal C32_Aen     : std_logic;
    signal C33_Aen     : std_logic;
    signal C11_Ben     : std_logic;
    signal C12_Ben     : std_logic;
    signal C13_Ben     : std_logic;
    signal C21_Ben     : std_logic;
    signal C22_Ben     : std_logic;
    signal C23_Ben     : std_logic;
    signal C31_Ben     : std_logic;
    signal C32_Ben     : std_logic;
    signal C33_Ben     : std_logic;


    constant TbPeriod : time := 5 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

    type ram is array (0 to 18) of integer;
    signal matrix : ram :=
    (
        --matrix A
        1,2,3,
        4,5,6,
        7,8,9,

        --matrix B
        1,2,3,
        4,5,6,
        7,8,9
    );



begin

    -- device under unit 
    dut : MACC_to_register 
    port map
    (

        clk    =>clk    ,
        A0     =>A0     ,
        A1     =>A1     ,
        A2     =>A2     ,
        A_en   =>A_en   ,

        B0     =>B0     ,
        B1     =>B1     ,
        B2     =>B2     ,
        B_en   =>B_en   ,

        C11    =>C11    ,
        C12    =>C12    ,
        C13    =>C13    ,

        C21    =>C21    ,
        C22    =>C22    ,
        C23    =>C23    ,

        C31    =>C31    ,
        C32    =>C32    ,
        C33    =>C33    ,

        C11_en =>C11_en ,
        C12_en =>C12_en ,
        C13_en =>C13_en ,

        C21_en =>C21_en ,
        C22_en =>C22_en ,
        C23_en =>C23_en ,

        C31_en =>C31_en ,
        C32_en =>C32_en ,
        C33_en =>C33_en ,

        R1_out =>R1_out ,
        R2_out =>R2_out ,
        R3_out =>R3_out ,
        R4_out =>R4_out ,
        R5_out =>R5_out ,
        R6_out =>R6_out ,
        R7_out =>R7_out ,
        R8_out =>R8_out ,
        R9_out =>R9_out ,
        R10_out=>R10_out,
        R11_out=>R11_out,
        R12_out=>R12_out,

        R1_en  =>R1_en  ,
        R2_en  =>R2_en  ,
        R3_en  =>R3_en  ,
        R4_en  =>R4_en  ,
        R5_en  =>R5_en  ,
        R6_en  =>R6_en  ,
        R7_en  =>R7_en  ,
        R8_en  =>R8_en  ,
        R9_en  =>R9_en  ,
        R10_en =>R10_en ,
        R11_en =>R11_en ,
        R12_en =>R12_en ,

        C11_Aen=>C11_Aen,
        C12_Aen=>C12_Aen,
        C13_Aen=>C13_Aen,

        C21_Aen=>C21_Aen,
        C22_Aen=>C22_Aen,
        C23_Aen=>C23_Aen,

        C31_Aen=>C31_Aen,
        C32_Aen=>C32_Aen,
        C33_Aen=>C33_Aen,

        C11_Ben=>C11_Ben,
        C12_Ben=>C12_Ben,
        C13_Ben=>C13_Ben,

        C21_Ben=>C21_Ben,
        C22_Ben=>C22_Ben,
        C23_Ben=>C23_Ben,

        C31_Ben=>C31_Ben,
        C32_Ben=>C32_Ben,
        C33_Ben=>C33_Ben


    );

    clock_proc : process
    begin
        clk <= '0';
        wait for TbPeriod / 2;
        clk <= '1';
        wait for TbPeriod / 2;
    end process;

    stim_proc : process 
    variable bOffset : integer := 20;
    begin 

    -- Initialize
    A_en  <= "000";
    B_en  <= "000";

    A0 <= 0;
    B0 <= 0;

    
    A1 <= 0;
    B1 <= 0;


    -- TbPeriod = clk_period
    wait for TbPeriod/2;

    A0 <= matrix(0);
    A_en <= "100";

    B0 <= matrix(9);
    B_en <= "100";
    wait for TbPeriod/2;

    A1 <= matrix(3);
    A_en <= "010";

    B1 <= matrix(12);
    B_en <= "010";
    wait for TbPeriod/2;

    A2 <= matrix(6);
    A_en <= "001";

    B2 <= matrix(15);
    B_en <= "001";
    wait for TbPeriod/2;

    -------------------------------------
    
    A0 <= matrix(1);
    A_en <= "100";

    B0 <= matrix(10);
    B_en <= "100";
    wait for TbPeriod/2;

    A1 <= matrix(4);
    A_en <= "010";

    B1 <= matrix(13);
    B_en <= "010";
    wait for TbPeriod/2;

    A2 <= matrix(7);
    A_en <= "001";

    B2 <= matrix(16);
    B_en <= "001";
    wait for TbPeriod/2;

    ---------------------------------

    
    A0 <= matrix(2);
    A_en <= "100";

    B0 <= matrix(4);
    B_en <= "100";
    wait for TbPeriod/2;

    A1 <= matrix(5);
    A_en <= "010";

    B1 <= matrix(14);
    B_en <= "010";
    wait for TbPeriod/2;

    A2 <= matrix(8);
    A_en <= "001";

    B2 <= matrix(17);
    B_en <= "001";
    wait for TbPeriod/2;

    --wait;
    end process;
    
end Behavioral;
