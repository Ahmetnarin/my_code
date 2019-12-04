library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity delay_3 is
    Port (
        clk : in std_logic;
        DATA : in integer;
        ADDR : in integer;
        enable : in std_logic;
        DATA_OUT : OUT integer;
        ADDR_OUT : OUT integer;
        enable_OUT : OUT std_logic );
end delay_3;

architecture Behavioral of delay_3 is
signal DATAD1 : integer;
signal DATAD2 : integer;
signal DATAD3 : integer;
signal DATAD4 : integer;
signal DATAD5 : integer;



signal ADDRD1 : integer;
signal ADDRD2 : integer;
signal ADDRD3 : integer;
signal ADDRD4 : integer; 
signal ADDRD5 : integer;


signal END1 : std_logic;
signal END2 : std_logic;
signal END3 : std_logic;
signal END4 : std_logic;
signal END5 : std_logic;

begin
delayProc : process(clk)
begin
    if(rising_edge(clk)) then
        DATA_OUT <= DATAD2; -- writes the DATA ADDR and en to a temperary varaible for one cycle
        ADDR_OUT <= ADDRD2;
        enable_OUT <= END2;
        
        DATAD2 <= DATAD1;
        ADDRD2 <= ADDRD1;
        END2   <= END1;
        
        DATAD1 <= DATA;
        ADDRD1 <= ADDR;
        END1 <= enable;
     end if;
end process delayProc;
end ;
