library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity delayControl is
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
end delayControl;

architecture Behavioral of delayControl is
    component delay_1 is 
    Port 
    (
        clk : in std_logic;
        DATA : in integer;
        ADDR : in integer;
        enable : in std_logic;
        DATA_OUT : OUT integer;
        ADDR_OUT : OUT integer;
        enable_OUT : OUT std_logic 
    );
    end component;

    component delay_2 is 
    Port 
    (
        clk : in std_logic;
        DATA : in integer;
        ADDR : in integer;
        enable : in std_logic;
        DATA_OUT : OUT integer;
        ADDR_OUT : OUT integer;
        enable_OUT : OUT std_logic 
    );
    end component;


    component delay_3 is 
    Port 
    (
        clk : in std_logic;
        DATA : in integer;
        ADDR : in integer;
        enable : in std_logic;
        DATA_OUT : OUT integer;
        ADDR_OUT : OUT integer;
        enable_OUT : OUT std_logic 
    );
    end component;


    component delay_4 is 
    Port 
    (
        clk : in std_logic;
        DATA : in integer;
        ADDR : in integer;
        enable : in std_logic;
        DATA_OUT : OUT integer;
        ADDR_OUT : OUT integer;
        enable_OUT : OUT std_logic 
    );
    end component;

    component delay_5 is 
    Port 
    (
        clk : in std_logic;
        DATA : in integer;
        ADDR : in integer;
        enable : in std_logic;
        DATA_OUT : OUT integer;
        ADDR_OUT : OUT integer;
        enable_OUT : OUT std_logic 
    );
    end component;

    component delay_6 is 
    Port 
    (
        clk : in std_logic;
        DATA : in integer;
        ADDR : in integer;
        enable : in std_logic;
        DATA_OUT : OUT integer;
        ADDR_OUT : OUT integer;
        enable_OUT : OUT std_logic 
    );
    end component;

    

    signal C11_addr : integer := 102;
    signal C12_addr : integer := 103;
    signal C13_addr : integer := 104;
    
    signal C21_addr : integer := 106;
    signal C22_addr : integer := 107;
    signal C23_addr : integer := 108;
    
    signal C31_addr : integer := 110;
    signal C32_addr : integer := 111;
    signal C33_addr : integer := 112;



    signal five_addr : integer;
    signal five_data : integer;
    signal five_en : std_logic:= '0';
    signal five_addr_out : integer;
    signal five_data_out : integer;
    signal five_en_out : std_logic:= '0';

    signal five2_addr : integer;
    signal five2_data : integer;
    signal five2_en : std_logic:= '0';
    signal five2_addr_out : integer;
    signal five2_data_out : integer;
    signal five2_en_out : std_logic:= '0';


    signal four_addr : integer;
    signal four_data : integer;
    signal four_en : std_logic:= '0';
    signal four_addr_out : integer;
    signal four_data_out : integer;
    signal four_en_out : std_logic:= '0';

    signal four2_addr : integer;
    signal four2_data : integer;
    signal four2_en : std_logic:= '0';
    signal four2_addr_out : integer;
    signal four2_data_out : integer;
    signal four2_en_out : std_logic:= '0';

    signal three_addr : integer;
    signal three_data : integer;
    signal three_en : std_logic:= '0';
    signal three_addr_out : integer;
    signal three_data_out : integer;
    signal three_en_out : std_logic:= '0';


    signal three2_addr : integer;
    signal three2_data : integer;
    signal three2_en : std_logic:= '0';
    signal three2_addr_out : integer;
    signal three2_data_out : integer;
    signal three2_en_out : std_logic:= '0';

    signal two_addr : integer;
    signal two_data : integer;
    signal two_en : std_logic:= '0';
    signal two_addr_out : integer;
    signal two_data_out : integer;
    signal two_en_out : std_logic:= '0';

    signal two2_addr : integer;
    signal two2_data : integer;
    signal two2_en : std_logic:= '0';
    signal two2_addr_out : integer;
    signal two2_data_out : integer;
    signal two2_en_out : std_logic:= '0';

    signal one_addr : integer;
    signal one_data : integer;
    signal one_en : std_logic:= '0';
    signal one_addr_out : integer;
    signal one_data_out : integer;
    signal one_en_out : std_logic:= '0';

    signal one2_addr : integer;
    signal one2_data : integer;
    signal one2_en : std_logic:= '0';
    signal one2_addr_out : integer;
    signal one2_data_out : integer;
    signal one2_en_out : std_logic:= '0';

    signal none_addr :integer;
    signal none_data : integer;
    signal none_en : std_logic:='0';


begin

    D1 : delay_1 port map
    (
        clk         => clk ,   
        DATA        => one_data,   
        ADDR        => one_addr,   
        enable      => one_en,   
        DATA_OUT    => one_data_out,   
        ADDR_OUT    => one_addr_out,   
        enable_OUT  => one_en_out   
    );

    D1_2 : delay_1 port map
    (
        clk         => clk,
        DATA        => one2_data,
        ADDR        => one2_addr,
        enable      => one2_en,
        DATA_OUT    => one2_data_out,
        ADDR_OUT    => one2_addr_out,
        enable_OUT  => one2_en_out        
    );

    D2 : delay_2 port map
    (
        clk         => clk ,   
        DATA        => two_data,   
        ADDR        => two_addr,   
        enable      => two_en,   
        DATA_OUT    => two_data_out,   
        ADDR_OUT    => two_addr_out,   
        enable_OUT  => two_en_out
    );

    D22 : delay_2 port map
    (
        clk         => clk,
        DATA        => two2_data,
        ADDR        => two2_addr,
        enable      => two2_en,
        DATA_OUT    => two2_data_out,
        ADDR_OUT    => two2_addr_out,
        enable_OUT  => two2_en_out        
    );

    D3 : delay_3 port map
    (
        clk         =>clk ,   
        DATA        => three_data,   
        ADDR        => three_addr,   
        enable      => three_en,   
        DATA_OUT    => three_data_out,   
        ADDR_OUT    => three_addr_out,   
        enable_OUT  => three_en_out  
    );

    D32 : delay_3 port map
    (
        clk         => clk,
        DATA        => three2_data,
        ADDR        => three2_addr,
        enable      => three2_en,
        DATA_OUT    => three2_data_out,
        ADDR_OUT    => three2_addr_out,
        enable_OUT  => three2_en_out        
    );

    D4 : delay_4 port map
    (
        clk         =>clk ,   
        DATA        => four_data,   
        ADDR        => four_addr,   
        enable      => four_en,   
        DATA_OUT    => four_data_out,   
        ADDR_OUT    => four_addr_out,   
        enable_OUT  => four_en_out   
    );

    D42 : delay_4 port map
    (
        clk         => clk,
        DATA        => four2_data,
        ADDR        => four2_addr,
        enable      => four2_en,
        DATA_OUT    => four2_data_out,
        ADDR_OUT    => four2_addr_out,
        enable_OUT  => four2_en_out        
    );

    D5 : delay_5 port map
    (
        clk         =>clk ,   
        DATA        => five_data,   
        ADDR        => five_addr,   
        enable      => five_en,   
        DATA_OUT    => five_data_out,   
        ADDR_OUT    => five_addr_out,   
        enable_OUT  => five_en_out   
    );

    D52 : delay_5 port map
    (
        clk         => clk,
        DATA        => five2_data,
        ADDR        => five2_addr,
        enable      => five2_en,
        DATA_OUT    => five2_data_out,
        ADDR_OUT    => five2_addr_out,
        enable_OUT  => five2_en_out        
    );

  

    

    feed : process( clk )
    begin
        if (rising_edge(clk)) then
            if (C11_en = '1') then -- no delay
                c_final_data <= C11_data;
                c_final_addr <= C11_addr;
                c_final_en   <= C11_en;
            elsif (C11_en = '0') then
                none_en <= C11_en;            
            end if ;

        if(C12_en = '1') then -- no delay
            c_final_data <= C12_data;
            c_final_addr <= C12_addr;
            c_final_en <=C12_en;
        elsif(C12_en = '0') then
            none_en <= C12_en;
        end if;
    
        if(C13_en = '1') then --delay1
            one2_addr <= C13_data;
            one2_data <= C13_addr;
            one2_en   <= C13_en;
        elsif(C13_en = '0') then
            one2_en <= C13_en;
        end if;
            

        if(C21_en = '1') then --delay1
            one_addr <= C21_addr;
            one_data <= C21_data;
            one_en <= C21_en;
        elsif(C21_en = '0') then
            one_en <= C21_en;
        end if;

        if(C22_en = '1') then --delay1
            two_addr <= C22_addr;
            two_data <= C22_data;
            two_en   <= C22_en;
        elsif(C22_en = '0') then
            three_en   <= C22_en;
        end if;


        if(C23_en = '1') then --delay1
            three2_addr <= C23_addr;
            three2_data <= C23_data;
            three2_en   <= C23_en;
        elsif(C23_en = '0') then
            three2_en <= C23_en;
        end if;


        if(C31_en = '1') then --delay1
            three_addr <= C31_addr;
            three_data <= C31_data;
            three_en   <= C31_en;
        elsif(C31_en = '0') then
            three_en   <= C31_en;
        end if;
        if(C32_en = '1') then --delay1
            four_addr <= C32_addr;
            four_data <= C32_data;
            four_en   <= C32_en;
        elsif(C32_en = '0') then
            four_en   <= C32_en;
        end if;

        if(C33_en = '1') then --delay1
            five2_addr <= C33_addr;
            five2_data <= C33_data;
            five2_en   <= C33_en;
        elsif(C33_en = '0') then
            five2_en   <= C33_en;
        end if;  
        
        

        if (one_en_out = '1') then
            c_final_data <= one_data_out;
            c_final_addr <= one_addr_out;
            c_final_en   <= one_en_out;
        elsif (one2_en_out = '1') then
            c_final_data <= one2_data_out;
            c_final_addr <= one2_addr_out;
            c_final_en   <= one2_en_out;
        elsif (two_en_out = '1') then
            c_final_data <= two_data_out;
            c_final_addr <= two_addr_out;
            c_final_en   <= two_en_out;
        elsif (three_en_out = '1') then
            c_final_data <= three_data_out;
            c_final_addr <= three_addr_out;
            c_final_en   <= three_en_out;
        elsif (three2_en_out = '1') then
            c_final_data <= three2_data_out;
            c_final_addr <= three2_addr_out;
            c_final_en   <= three2_en_out;
        elsif (four_en_out = '1') then
            c_final_data <= four_data_out;
            c_final_addr <= four_addr_out;
            c_final_en   <= four_en_out;
        elsif (five2_en_out = '1') then
            c_final_data <= five2_data_out;
            c_final_addr <= five2_addr_out;
            c_final_en   <= five2_en_out;
        end if ;
    end if ;        
    end process ; -- feed

end Behavioral;
