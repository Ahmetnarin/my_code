library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control_matr_mult is
port
(
    clk : in std_logic;

    to_C11 : out integer;
    to_C12 : out integer;
    to_C13 : out integer;
    
    to_C21 : out integer;
    to_C22 : out integer;
    to_C23 : out integer;
    
    to_C31 : out integer;
    to_C32 : out integer;
    to_C33 : out integer;
    


    to_C11_en     : out std_logic;
    to_C12_en     : out std_logic;
    to_C13_en     : out std_logic;
    
    to_C21_en     : out std_logic;
    to_C22_en     : out std_logic;
    to_C23_en     : out std_logic;
    
    to_C31_en     : out std_logic;
    to_C32_en     : out std_logic;
    to_C33_en     : out std_logic;
    
    

    RAM_46_ccMM : out integer;
    RAM_47_ccMM : out integer;
    RAM_48_ccMM : out integer;
    RAM_49_ccMM : out integer;
    RAM_50_ccMM : out integer;
    RAM_51_ccMM : out integer;
    RAM_52_ccMM : out integer;
    RAM_53_ccMM : out integer;
    RAM_54_ccMM : out integer;
   

    c_data_out : out integer;
    c_addr_out : out integer;
    c_enable_out : out std_logic
);
end control_matr_mult;

architecture Behavioral of control_matr_mult is
    component controller is 
    port
    (
        clk         : in std_logic;
        c_data      : in integer;
        c_addr      : in integer;
        c_enable   : in std_logic;

        -- To A inputs
        to_A0       : out integer;
        to_A1       : out integer;
        to_A2       : out integer;
        

        to_A_en     : out std_logic_vector(0 to 2);

        -- To B inputs
        to_B0       : out integer;
        to_B1       : out integer;
        to_B2       : out integer;
        

        to_B_en     : out std_logic_vector(0 to 2);

        RAM_46      : out integer;
        RAM_47      : out integer;
        RAM_48      : out integer;
        RAM_49      : out integer;
        RAM_50      : out integer;
        RAM_51      : out integer;
        RAM_52      : out integer;
        RAM_53      : out integer;
        RAM_54      : out integer
    );
    end component;

    component MACC_to_register is 
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
        C33_en     : out std_logic
    );
end component;

component delayControl is 
    port
    (
        clk : in std_logic;
        C11_data : in integer;
        C11_en : in std_logic;

        C12_data : in integer;
        C12_en : in std_logic;

        C13_data : in integer;
        C13_en : in std_logic;
        

        C21_data : in integer;
        C21_en : in std_logic;

        C22_data : in integer;
        C22_en : in std_logic;

        C23_data : in integer;
        C23_en : in std_logic;


        C31_data : in integer;
        C31_en : in std_logic;

        C32_data : in integer;
        C32_en : in std_logic;

        C33_data : in integer;
        C33_en : in std_logic;

        c_final_data : out integer;
        c_final_addr : out integer;
        c_final_en : out std_logic
    );
    end component;


    signal A0_wire      : integer;
    signal A1_wire      : integer;
    signal A2_wire      : integer;
    
    signal A_en         : std_logic_vector(0 to 2);

    signal B0_wire      : integer;
    signal B1_wire      : integer;
    signal B2_wire      : integer;
    
    signal B_en         : std_logic_vector(0 to 2);


    signal C11_wire     : integer;
    signal C12_wire     : integer;
    signal C13_wire     : integer;
    
    signal C21_wire     : integer;
    signal C22_wire     : integer;
    signal C23_wire     : integer;
    
    signal C31_wire     : integer;
    signal C32_wire     : integer;
    signal C33_wire     : integer;

    signal C11_con     : integer;
    signal C12_con     : integer;
    signal C13_con     : integer;
    
    signal C21_con     : integer;
    signal C22_con     : integer;
    signal C23_con     : integer;
    
    signal C31_con     : integer;
    signal C32_con     : integer;
    signal C33_con     : integer;

    signal C11_con_en     : std_logic;
    signal C12_con_en     : std_logic;
    signal C13_con_en     : std_logic;
    
    signal C21_con_en     : std_logic;
    signal C22_con_en     : std_logic;
    signal C23_con_en     : std_logic;
    
    signal C31_con_en     : std_logic;
    signal C32_con_en     : std_logic;
    signal C33_con_en     : std_logic;
    

    signal RAM_46_sig : integer;
    signal RAM_47_sig : integer;
    signal RAM_48_sig : integer;
    signal RAM_49_sig : integer;
    signal RAM_50_sig : integer;
    signal RAM_51_sig : integer;
    signal RAM_52_sig : integer;
    signal RAM_53_sig : integer;
    signal RAM_54_sig : integer;

    

    signal c_data : integer;
    signal c_addr : integer;
    signal c_enable : std_logic;
    
begin

    ctl : controller port map
    (
        clk     => clk,
        c_data  => c_data,
        c_addr  => c_addr,
        c_enable    => c_enable,
        to_A0   => A0_wire,
        to_A1   => A1_wire,
        to_A2   => A2_wire,
    
        to_A_en => A_en,
                                
        to_B0   => B0_wire,
        to_B1   => B1_wire,
        to_B2   => B2_wire,
        
        to_B_en => B_en,

        RAM_46 => RAM_46_sig,
        RAM_47 => RAM_47_sig,
        RAM_48 => RAM_48_sig,
        RAM_49 => RAM_49_sig,
        RAM_50 => RAM_50_sig,
        RAM_51 => RAM_51_sig,
        RAM_52 => RAM_52_sig,
        RAM_53 => RAM_53_sig,
        RAM_54 => RAM_54_sig

    );

    sys_array_mat_mult : MACC_to_register port map
    (
        clk => clk,
        A0 => A0_wire,
        A1 => A1_wire,
        A2 => A2_wire,
        
        A_en => A_en,
                                
        B0 => B0_wire,
        B1 => B1_wire,
        B2 => B2_wire,
        
        B_en => B_en,

        C11 => C11_con,
        C12 => C12_con,
        C13 => C13_con,
        
        C21 => C21_con,
        C22 => C22_con,
        C23 => C23_con,
        
        C31 => C31_con,
        C32 => C32_con,
        C33 => C33_con,
        

        C11_en => C11_con_en, 
        C12_en => C12_con_en,
        C13_en => C13_con_en,
        
        C21_en => C21_con_en,
        C22_en => C22_con_en,
        C23_en => C23_con_en,
        
        C31_en => C31_con_en,
        C32_en => C32_con_en,
        C33_en => C33_con_en

    );


    c_data_out <= c_data;
    c_addr_out <= c_addr;
    c_enable_out <= c_enable;

    to_C11 <= C11_con;
    to_C12 <= C12_con;
    to_C13 <= C13_con;
    
    to_C21 <= C21_con;
    to_C22 <= C22_con;
    to_C23 <= C23_con;
    
    to_C31 <= C31_con;
    to_C32 <= C32_con;
    to_C33 <= C33_con;

    to_C11_en <= C11_con_en;
    to_C12_en <= C12_con_en;
    to_C13_en <= C13_con_en;
    
    to_C21_en <= C21_con_en;
    to_C22_en <= C22_con_en;
    to_C23_en <= C23_con_en;
    
    to_C31_en <= C31_con_en;
    to_C32_en <= C32_con_en;
    to_C33_en <= C33_con_en;

    RAM_46_ccMM <= RAM_46_sig; 
    RAM_47_ccMM <= RAM_47_sig; 
    RAM_48_ccMM <= RAM_48_sig; 
    RAM_49_ccMM <= RAM_49_sig; 
    RAM_50_ccMM <= RAM_50_sig; 
    RAM_51_ccMM <= RAM_51_sig; 
    RAM_52_ccMM <= RAM_52_sig; 
    RAM_53_ccMM <= RAM_53_sig; 
    RAM_54_ccMM <= RAM_54_sig; 

DC : delayControl port map
    (
        clk => clk, 
        C11_data =>  C11_con,
        C11_en => C11_con_en,

        
        C12_data =>  C12_con,
        C12_en => C12_con_en,

        C13_data =>  C13_con,
        C13_en   =>  C13_con_en,

    

        C21_data =>  C21_con,
        C21_en   =>  C21_con_en,

        C22_data =>  C22_con,
        C22_en   =>  C22_con_en,

        C23_data =>  C23_con,
        C23_en   =>  C23_con_en,


        C31_data =>  C31_con,
        C31_en   =>  C31_con_en,

        C32_data =>  C32_con,
        C32_en   =>  C32_con_en,

        C33_data =>  C33_con,
        C33_en   =>  C33_con_en,

        c_final_data => c_data,
        c_final_addr => c_addr,
        c_final_en => c_enable
    );




end Behavioral;
