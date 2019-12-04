library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_matr_mult_tb is
end control_matr_mult_tb;

architecture Behavioral of control_matr_mult_tb is
    component control_matr_mult
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
    end component;

    signal clk           : std_logic;
    signal to_C11        :  integer:= 0;
    signal to_C12        :  integer:= 0;
    signal to_C13        :  integer:= 0;
    signal to_C21        :  integer:= 0;
    signal to_C22        :  integer:= 0;
    signal to_C23        :  integer:= 0;
    signal to_C31        :  integer:= 0;
    signal to_C32        :  integer:= 0;
    signal to_C33        :  integer:= 0;
    signal to_C11_en     :  std_logic;
    signal to_C12_en     :  std_logic;
    signal to_C13_en     :  std_logic;
    signal to_C21_en     :  std_logic;
    signal to_C22_en     :  std_logic;
    signal to_C23_en     :  std_logic;
    signal to_C31_en     :  std_logic;
    signal to_C32_en     :  std_logic;
    signal to_C33_en     :  std_logic;
    signal RAM_46_ccMM   :  integer;
    signal RAM_47_ccMM   :  integer;
    signal RAM_48_ccMM   :  integer;
    signal RAM_49_ccMM   :  integer;
    signal RAM_50_ccMM   :  integer;
    signal RAM_51_ccMM   :  integer;
    signal RAM_52_ccMM   :  integer;
    signal RAM_53_ccMM   :  integer;
    signal RAM_54_ccMM   :  integer;

    signal c_data_out    :  integer;
    signal c_addr_out    :  integer;
    signal c_enable_out  :  std_logic;

    constant TbPeriod : time := 5 ns;

begin

    DUT : control_matr_mult
    port map
    (
        clk          => clk         ,
        to_C11       => to_C11      ,
        to_C12       => to_C12      ,
        to_C13       => to_C13      ,
        to_C21       => to_C21      ,
        to_C22       => to_C22      ,
        to_C23       => to_C23      ,
        to_C31       => to_C31      ,
        to_C32       => to_C32      ,
        to_C33       => to_C33      ,
        to_C11_en    => to_C11_en   ,
        to_C12_en    => to_C12_en   ,
        to_C13_en    => to_C13_en   ,
        to_C21_en    => to_C21_en   ,
        to_C22_en    => to_C22_en   ,
        to_C23_en    => to_C23_en   ,
        to_C31_en    => to_C31_en   ,
        to_C32_en    => to_C32_en   ,
        to_C33_en    => to_C33_en   ,
        RAM_46_ccMM  => RAM_46_ccMM ,
        RAM_47_ccMM  => RAM_47_ccMM ,
        RAM_48_ccMM  => RAM_48_ccMM ,
        RAM_49_ccMM  => RAM_49_ccMM ,
        RAM_50_ccMM  => RAM_50_ccMM ,
        RAM_51_ccMM  => RAM_51_ccMM ,
        RAM_52_ccMM  => RAM_52_ccMM ,
        RAM_53_ccMM  => RAM_53_ccMM ,
        RAM_54_ccMM  => RAM_54_ccMM 

    );

    clock_proc : process
    begin
        if now >= TbPeriod * 70 then
            std.env.stop;            
        end if ;
        
        clk <= '0';
        wait for TbPeriod / 2;
        clk <= '1';
        wait for TbPeriod / 2;
    end process;

end Behavioral;
