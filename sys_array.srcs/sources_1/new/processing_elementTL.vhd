library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity processing_elementTL is
    port
    (
        -- inputs
        a_in        : in integer;
        a_enable    : in std_logic;
        b_in        : in integer;
        b_enable    : in std_logic;
    
        clk         : in std_logic;
        --rst       : in std_logic;
    
        
        
        -- outputs
        --rst_out   : out std_logic;
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
end processing_elementTL;

architecture Behavioral of processing_elementTL is
    signal sum              : integer := 0;
    signal done             : boolean := false;
    signal sum2             : integer := 0;
    signal enable_signal    : std_logic;

begin

    multiply : process( clk )
    variable count : integer := 0;
    variable cycle : integer := 2;

    begin
        if (rising_edge(clk)) then
            a_out <= a_in;
            b_out <= b_in;
            a_enable_out <= a_enable;
            b_enable_out <= b_enable;

            a_en_sim <= a_enable;
            b_en_sim <= b_enable;

            if (enable_signal = '1') then
                sum <= 0;           -- sum = 0 after additions all element            
            end if ;
            
            if (count > cycle) then
                done <= true;
                count := 0;
            else 
                done <= false;
                if (a_enable = '1' and b_enable = '1' and done = false ) then
                    sum <= sum + (a_in * b_in);
                    count := count + 1 ;
                end if ;
            end if ;
        end if ;
        
    end process ; -- multiply

    process( clk , done )
    begin
        if (done = true) then
            c_out <= sum;
            c_enable <= '1';
            enable_signal <= '1';
        else
            c_out <= 0;
            c_enable <= '0';
            enable_signal <= '0';            
        end if ;
    end process ; 
end Behavioral;
