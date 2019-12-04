library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity controller is
port
(
    clk         : in std_logic;
    c_data      : in integer;
    c_addr      : in integer;
    c_enable    : in std_logic;

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
    RAM_47     : out integer;
    RAM_48      : out integer;
    RAM_49      : out integer;
    RAM_50      : out integer;
    RAM_51      : out integer;
    RAM_52      : out integer;
    RAM_53      : out integer;
    RAM_54      : out integer;

    counter : out integer
    
);
end controller;

architecture Behavioral of controller is
    type memory is array (0 to 54) of integer; 
    signal RAM : memory :=
    (

    -- Matrix A1 --  The A matrix is Transposed so that it can easily be iterated through
              -- This means the actual input matrix is           
        1,4,7, -- 1,2,3,
        2,5,8, -- 4,5,6,
        3,6,9, -- 7,8,9
        --1,2,3,
        --4,5,6,
        --7,8,9,
            
       -- Matrix A1 --  transposed
        
        1,4,7,
        2,5,8,
        3,6,9,
        
        
        -- Matrix B1 -- Not transposed
        1,2,3,
        4,5,6,
        7,8,9,
        
        -- Matrix B2 -- Not transposed
        1,2,3,
        4,5,6,
        7,8,9,
        
        0,0,0,0,0,0,0,0,0,0, -- Bufferbits between B and C matrix so that B doesn't iterate into the C matrix.
        
        -- Matrix C -- Only one C matrix for the output that gets overwritten
        0,0,0,0,0,0,0,0,0

    );

    signal count : integer := 0;

begin

    cProc : process( clk )
    begin
        if (rising_edge(clk)) then
            if (c_enable = '1') then
                RAM(integer(c_addr)) <= integer(c_data);                            
            end if ;            
        end if ;
    end process ; -- cProc


    clock_pro : process( clk )
    variable aitr : integer := 0;
    variable bitr : integer := 18;
    begin
        if (rising_edge(clk)) then
            count <= count + 1;
            if ((count mod 3)=0) then
                to_A0 <= RAM(aitr);
                to_B0 <= RAM(bitr);
                to_A_en <= "100";
                to_B_en <= "100";

                aitr := aitr + 1 ;
                bitr := bitr + 1 ;
            end if ;

            if ((count mod 3)=1) then
                to_A1 <= RAM(aitr);
                to_B1 <= RAM(bitr);
                to_A_en <= "010";
                to_B_en <= "010";

                aitr := aitr + 1 ;
                bitr := bitr + 1 ;
            end if ;

            if ((count mod 3)=2) then
                to_A2 <= RAM(aitr);
                to_B2 <= RAM(bitr);
                to_A_en <= "001";
                to_B_en <= "001";

                aitr := aitr + 1 ;
                bitr := bitr + 1 ;
            end if ;
        end if ;
    end process ; -- clock_pro

    RAM_46 <= RAM(46); 
    RAM_47 <= RAM(47); 
    RAM_48 <= RAM(48); 
    RAM_49 <= RAM(49); 
    RAM_50 <= RAM(50); 
    RAM_51 <= RAM(51); 
    RAM_52 <= RAM(52); 
    RAM_53 <= RAM(53); 
    RAM_54 <= RAM(54); 
    
    counter <= count;
end Behavioral;
