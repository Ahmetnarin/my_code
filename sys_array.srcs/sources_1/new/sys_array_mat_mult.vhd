library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sys_array_mat_mult is
port
(
    clk , rst   : in std_logic;
    A0          : in integer;
    A1          : in integer;
    B0          : in integer;
    B1          : in integer;

    C11         : out integer;
    C11_sum     : out integer;
    C11_en      : out std_logic;

    C12         : out integer;
    C12_sum     : out integer;
    C12_en      : out std_logic;

    C21         : out integer;
    C21_sum     : out integer;
    C21_en      : out std_logic;

    C22         : out integer;
    C22_sum     : out integer;
    C22_en      : out std_logic;

    a11_12      : out integer;
    b11_21      : out integer;

    a21_22      : out integer;
    b12_22      : out integer
);
end sys_array_mat_mult;

architecture Behavioral of sys_array_mat_mult is

    component processing_element is
    port
    (
        -- inputs
        a_in        : in integer;
        b_in        : in integer;

        clk         : in std_logic;
        rst         : in std_logic;

        
        
        -- outputs
        rst_out   : out std_logic;
        a_out       : out integer;
        b_out       : out integer;
        c_out       : out integer;
        sum_out     : out integer;
        c_enable    : out std_logic
    );
    end component processing_element;

    component processing_elementTL is
        port
        (-- inputs
            a_in        : in integer;
            b_in        : in integer;
            rst       : in std_logic;        
            rst_out   : out std_logic;        
            clk         : in std_logic;
            a_out       : out integer;
            b_out       : out integer;
            
            c_out       : out integer;
            sum_out     : out integer;
            c_enable    : out std_logic
        );
        end component;

    component processing_elementT is 
    port
    (
        a_in        : in integer;
        b_in        : in integer;
        clk         : in std_logic;
        rst       : in std_logic;
        rst_out   : out std_logic;
        a_out       : out integer;
        b_out       : out integer;
        c_out       : out integer;
        sum_out     : out integer;
        c_enable    : out std_logic
    );
    end component;

    component processing_elementL is 
    port
    (
        a_in        : in integer;
        b_in        : in integer;

        clk         : in std_logic;
        rst       : in std_logic;        
        rst_out   : out std_logic;
        a_out       : out integer;
        b_out       : out integer;
        c_out       : out integer;
        sum_out     : out integer;
        c_enable    : out std_logic
    );
    end component;

    signal a11_a12 : integer;
    signal b11_b21 : integer;

    signal a21_a22 : integer;
    signal b12_b22 : integer;

    signal rst_1 : std_logic;
    signal rst_2 : std_logic;

    
begin

    PE11 : processing_elementTL port map(
        -- inputs
        a_in        => A0,
        b_in        => B0,
        a_out       => a11_a12,
        b_out       => b11_b21,   
        c_out       => C11,
        c_enable        => C11_en,
        sum_out     => C11_sum,
        clk         => clk,
        rst => rst,
        rst_out  =>  rst_1
    );

    PE12 :processing_elementT port map(
        a_in => a11_a12,
        b_in => B1,
        b_out => b12_22,
        c_out => C12,
        c_enable => C12_en,
        sum_out => C12_sum, 
        clk => clk,
        rst => rst_1

    );

    PE21 : processing_elementL port map
    (
        a_in    => A1,
        b_in    => b11_b21,
        b_out   => a21_a22,
        c_out   => C21,
        c_enable=> C21_en,
        sum_out => C21_sum, 
        clk     => clk,
        rst   => rst_1,
        rst_out   => rst_2

    );

    PE22 : processing_element port map
    (
        a_in    => a21_a22,
        b_in    => b12_b22,
        c_out   => C22,
        c_enable    => C22_en,
        sum_out => C22_sum, 
        clk     => clk,
        rst   => rst_2

    );

    a11_a12 <= a11_a12;
    b11_b21 <= b11_b21;
    a21_a22 <= a21_a22;
    b12_b22 <= b12_b22;



end Behavioral;
