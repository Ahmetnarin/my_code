library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ram is
    port
    (
        clk : in std_logic;
        a_addr : in integer;
        a_en : in std_logic;
        b_addr :in integer;
        b_en : in std_logic;
        c_addr : in integer;
        c_data : in integer;
        c_enable : in std_logic;
        a_data : out integer;
        b_data : out integer;
        a_en_out : out std_logic;
        b_en_out : out std_logic

    );
end ram;

architecture Behavioral of ram is
    signal a_data_sig : integer;
    signal b_data_sig : integer;
    signal a_en_out_sig : std_logic := '0';
    signal b_en_out_sig : std_logic := '0';
    signal c_data_int : integer;

    type int_arr is array (0 to 26) of integer;
    signal RAM : int_arr :=
    (
        1,2,3,
        4,5,6,
        7,8,9,
        
                            
        1,2,3,
        4,5,6,
        7,8,9,
       
                            
        0  ,  0  , 0 ,  
        0  ,  0  , 0 ,
        0  ,  0  , 0 
       );

begin

    ramProcess : process( clk )
    begin

        if (rising_edge(clk)) then
            if (c_enable = '1') then
                RAM(integer(c_addr)) <= integer(c_data);                
            end if ;
            if (a_en = '1') then
                a_data_sig <= RAM(integer(a_addr));
                a_en_out_sig <= '1';
            elsif (a_en = '0') then
                a_en_out_sig <= '0';                
            end if ;

            if (b_en = '1') then
                b_data_sig <= RAM(integer(b_addr));
                b_en_out_sig <= '1';
            elsif (b_en = '0') then
                b_en_out_sig <= '0';                
            end if ;

            a_data <= a_data_sig;
            b_data <= b_data_sig;
            a_en_out <= a_en_out_sig;
            b_en_out <= b_en_out_sig;
            
        end if ;
    end process ; -- ramProcess




end Behavioral;
