
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processing_elementL is
port
(
    -- inputs
    a_in        : in integer;
    b_in        : in integer;

    clk         : in std_logic;
    reset       : in std_logic;

    
    
    -- outputs
    reset_out   : out std_logic;
    a_out       : out integer;
    b_out       : out integer;
    c_out       : out integer;
    sum_out     : out integer;
    c_enable    : out std_logic
);
end processing_elementL;

architecture Behavioral of processing_elementL is
    signal A        :   integer := 0;
    signal B        :   integer := 0;
    signal sum      :   integer := 0;

begin
    MAC : process( b_in , reset )
    variable count : integer := 0;
    variable cycle : integer := 2;


    begin
        if (reset = '0') then
            count := count + 1;
            sum <= sum + (a_in*b_in);
            A <= a_in ;
            B<= b_in;

            a_out <= A;
            b_out <= B;

            if (count > cycle) then
                c_out <= sum;
                sum <= 0;
                c_enable <= '1';
                count := 0;
            else
                c_out <= 0;
                c_enable <='0';
                
            end if ;
        
        elsif reset = '1' then 
            A <= a_in;
            B <= b_in;

            a_out <= A;
            b_out <= B;
            
            --A <= 0;
            --B <= 0;  
        end if ;
    end process ; -- MAC
    reset_out <= reset;
    sum_out <= sum;
end Behavioral;
