library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MACC_to_register is
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
    

    R1_en   :   out std_logic;
    R2_en   :   out std_logic;
    R3_en   :   out std_logic;
    R4_en   :   out std_logic;
    R5_en   :   out std_logic;
    R6_en   :   out std_logic;
    R7_en   :   out std_logic;
    R8_en   :   out std_logic;
    R9_en   :   out std_logic;
    R10_en  :   out std_logic;
    R11_en  :   out std_logic;
    R12_en  :   out std_logic;
   
 


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
end MACC_to_register;

architecture Behavioral of MACC_to_register is
    component processing_elementTL is
        port
    (
        -- inputs
        a_in        : in integer;
        a_enable    : in std_logic;
        b_in        : in integer;
        b_enable    : in std_logic;
    
        clk         : in std_logic;
        --reset       : in std_logic;
    
        
        
        -- outputs
        --reset_out   : out std_logic;
        a_out       : out integer;
        a_enable_out: out std_logic;
        b_out       : out integer;
        b_enable_out: out std_logic;

        a_en_sim : out std_logic;
        b_en_sim : out std_logic;


    
        c_out       : out integer;
        sum_out     : out integer;
        c_enable    : out std_logic
    );

    end component processing_elementTL;

    component my_register is 
    port
    (
        clk                 : in std_logic;
        register_input      : in integer;
        register_enable     : in std_logic;
        register_output     : out integer;
        register_enable_out : out std_logic;
        register_sim        : out integer;
        register_enable_sim : out std_logic
    );
    end component my_register;

    -- ROW 1 
    signal R1_L : integer ;
    signal R1_R : integer ;
    signal R2_L : integer ;
    signal R2_R : integer ;

    -- ROW 2
    signal R6_L : integer;
    signal R6_R : integer;
    signal R7_L : integer;
    signal R7_R : integer;

    -- ROW 3
    signal R11_L : integer;
    signal R11_R : integer;
    signal R12_L : integer;
    signal R12_R : integer;

    -- COL 1
    signal R3_T : integer;
    signal R3_B : integer;
    signal R4_T : integer;
    signal R4_B : integer;   
    signal R5_T : integer;
    signal R5_B : integer;

    -- COL 2
    signal R8_T : integer;
    signal R8_B : integer;
    signal R9_T : integer;
    signal R9_B : integer;   
    signal R10_T : integer;
    signal R10_B : integer;

    --enable wires
    -- ROW 1
    signal R1_L_en : std_logic ;
    signal R1_R_en : std_logic ;
    signal R2_L_en : std_logic ;
    signal R2_R_en : std_logic ;

    --ROW 2
    signal R6_L_en : std_logic;
    signal R6_R_en : std_logic;
    signal R7_L_en : std_logic;
    signal R7_R_en : std_logic;

    --ROW 3
    signal R11_L_en : std_logic;
    signal R11_R_en : std_logic;
    signal R12_L_en : std_logic;
    signal R12_R_en : std_logic;

    -- COL 1
    signal R3_T_en : std_logic;
    signal R3_B_en : std_logic;
    signal R4_T_en : std_logic;
    signal R4_B_en : std_logic;   
    signal R5_T_en : std_logic;
    signal R5_B_en : std_logic;

    --COL 2
    signal R8_T_en : std_logic;
    signal R8_B_en : std_logic;
    signal R9_T_en : std_logic;
    signal R9_B_en : std_logic;   
    signal R10_T_en : std_logic;
    signal R10_B_en : std_logic;

    



 
begin

    ----------FIRST ROW------------------------

    PE11 : processing_elementTL port map
    (
         
        a_in         => A0, 
        a_enable     => A_en(0),
        b_in         => B0,
        b_enable     => B_en(0),
        clk          => clk,
        a_out        => R1_L,
        a_enable_out => R1_L_en, 
        b_out        => R3_T,
        b_enable_out => R3_T_en,
        c_out        => C11,
        c_enable     => C11_en,

        a_en_sim     => C11_Aen,
        b_en_sim     => C11_Ben
    );

    R1 : my_register port map
    (
        clk                 => clk,
        register_input      => R1_L,
        register_enable     => R1_L_en,
        register_output     => R1_R,
        register_enable_out => R1_R_en,

        ----------------------------------
        register_sim        => R1_out,
        register_enable_sim => R1_en
    );

    R3 : my_register port map
    (
        clk                 => clk,
        register_input      => R3_T,
        register_enable     => R3_T_en,
        register_output     => R3_B,
        register_enable_out => R3_B_en,

        ----------------------------------
        register_sim        => R3_out,
        register_enable_sim => R3_en
    );

    PE12 : processing_elementTL port map
    (
        a_in         => R1_R,
        a_enable     => R1_R_en,
        b_in         => B1,
        b_enable     => B_en(1),
        clk          => clk,
        a_out        => R2_L,
        a_enable_out => R2_L_en,
        b_out        => R4_t,
        b_enable_out => R4_t_en,
        c_out        => C12,
        c_enable     => C12_en,

        ---------------
        a_en_sim     => C12_Aen,
        b_en_sim     => C12_Ben
    );

    R2 :my_register port map
    (
        clk                 => clk, 
        register_input      => R2_L,
        register_enable     => R2_L_en,
        register_output     => R2_R,
        register_enable_out => R2_R_en,

        register_sim        => R2_out,
        register_enable_sim => R2_en        
    );

    R4 :my_register port map
    (
        clk                 => clk, 
        register_input      => R4_T,
        register_enable     => R4_T_en,
        register_output     => R4_B,
        register_enable_out => R4_B_en,

        register_sim        => R4_out,
        register_enable_sim => R4_en        
    );

    PE13 : processing_elementTL port map
    (
        a_in         => R2_R,
        a_enable     => R2_R_en,
        b_in         => B2,
        b_enable     => B_en(2),
        clk          => clk,
        --a_out        => R3_L,
        --a_enable_out => R3_L_en,
        b_out        => R5_T,
        b_enable_out => R5_T_en,
        c_out        => C13,
        c_enable     => C13_en,

        a_en_sim     => C13_Aen,
        b_en_sim     => C13_Ben
    );

      R5 :my_register port map
    (
        clk                 => clk, 
        register_input      => R5_T,
        register_enable     => R5_T_en,
        register_output     => R5_B,
        register_enable_out => R5_B_en,

        register_sim        => R5_out,
        register_enable_sim => R5_en        
    );

    ----------FIRST ROW------------------------


    ----------SECOND ROW-----------------------

    PE21 : processing_elementTL port map
    (
         
        a_in         => A1, 
        a_enable     => A_en(1),
        b_in         => R3_B,
        b_enable     => R3_B_en,
        clk          => clk,
        a_out        => R6_L,
        a_enable_out => R6_L_en, 
        b_out        => R8_T,
        b_enable_out => R8_T_en,
        c_out        => C21,
        c_enable     => C21_en,

        a_en_sim     => C21_Aen,
        b_en_sim     => C21_Ben
    );

    R6 : my_register port map
    (
        clk                 => clk,
        register_input      => R6_L,
        register_enable     => R6_L_en,
        register_output     => R6_R,
        register_enable_out => R6_R_en,

        ----------------------------------
        register_sim        => R6_out,
        register_enable_sim => R6_en
    );

    R8 : my_register port map
    (
        clk                 => clk,
        register_input      => R8_T,
        register_enable     => R8_T_en,
        register_output     => R8_B,
        register_enable_out => R8_B_en,

        ----------------------------------
        register_sim        => R8_out,
        register_enable_sim => R8_en
    );

    PE22 : processing_elementTL port map
    (
        a_in         => R6_R,
        a_enable     => R6_R_en,
        b_in         => R4_B,
        b_enable     => R4_B_en,
        clk          => clk,
        a_out        => R7_L,
        a_enable_out => R7_L_en,
        b_out        => R9_T,
        b_enable_out => R9_T_en,
        c_out        => C22,
        c_enable     => C22_en,

        ---------------
        a_en_sim     => C22_Aen,
        b_en_sim     => C22_Ben
    );

    R7 : my_register port map
    (
        clk                 => clk,
        register_input      => R7_L,
        register_enable     => R7_L_en,
        register_output     => R7_R,
        register_enable_out => R7_R_en,

        ----------------------------------
        register_sim        => R7_out,
        register_enable_sim => R7_en
    );

    R9 : my_register port map
    (
        clk                 => clk,
        register_input      => R9_T,
        register_enable     => R9_T_en,
        register_output     => R9_B,
        register_enable_out => R9_B_en,

        ----------------------------------
        register_sim        => R9_out,
        register_enable_sim => R9_en
    );


    PE23 : processing_elementTL port map
    (
        a_in         => R7_R,
        a_enable     => R7_R_en,
        b_in         => R5_B,
        b_enable     => R5_B_en,
        clk          => clk,
        --a_out        => ..,
        --a_enable_out => ..,
        b_out        => R10_T,
        b_enable_out => R10_T_en,
        c_out        => C23,
        c_enable     => C23_en,

        a_en_sim     => C23_Aen,
        b_en_sim     => C23_Ben
    );

    R10 : my_register port map
    (
        clk                 => clk,
        register_input      => R10_T,
        register_enable     => R10_T_en,
        register_output     => R10_B,
        register_enable_out => R10_B_en,

        ----------------------------------
        register_sim        => R10_out,
        register_enable_sim => R10_en
    );

    ----------SECOND ROW-----------------------

    ----------THIRD ROW------------------------

    PE31 : processing_elementTL port map
    (
         
        a_in         => A2, 
        a_enable     => A_en(2),
        b_in         => R8_B,
        b_enable     => R8_B_en,
        clk          => clk,
        a_out        => R11_L,
        a_enable_out => R11_L_en, 
        --b_out        => R8_T,
        --b_enable_out => R8_T_en,
        c_out        => C31,
        c_enable     => C31_en,

        a_en_sim     => C31_Aen,
        b_en_sim     => C31_Ben
    );

    R11 : my_register port map
    (
        clk                 => clk,
        register_input      => R11_L,
        register_enable     => R11_L_en,
        register_output     => R11_R,
        register_enable_out => R11_R_en,

        ----------------------------------
        register_sim        => R11_out,
        register_enable_sim => R11_en
    );


    PE32 : processing_elementTL port map
    (
        a_in         => R11_R,
        a_enable     => R11_R_en,
        b_in         => R9_B,
        b_enable     => R9_B_en,
        clk          => clk,
        a_out        => R12_L,
        a_enable_out => R12_L_en,
        --b_out        => R9_T,
        --b_enable_out => R9_T_en,
        c_out        => C32,
        c_enable     => C32_en,

        ---------------
        a_en_sim     => C32_Aen,
        b_en_sim     => C32_Ben
    );

    R12 : my_register port map
    (
        clk                 => clk,
        register_input      => R12_L,
        register_enable     => R12_L_en,
        register_output     => R12_R,
        register_enable_out => R12_R_en,

        ----------------------------------
        register_sim        => R12_out,
        register_enable_sim => R12_en
    );

    PE33 : processing_elementTL port map
    (
        a_in         => R12_R,
        a_enable     => R12_R_en,
        b_in         => R10_B,
        b_enable     => R10_B_en,
        clk          => clk,
        --a_out        => R12_L,
        --a_enable_out => R12_L_en,
        --b_out        => R9_T,
        --b_enable_out => R9_T_en,
        c_out        => C33,
        c_enable     => C33_en,

        ---------------
        a_en_sim     => C33_Aen,
        b_en_sim     => C33_Ben
    );

end Behavioral;
