library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_register is
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
end my_register;

architecture Behavioral of my_register is

begin
    register_output <= register_input;
    register_sim <= register_input;
    register_enable_out <= register_enable;
    register_enable_sim <= register_enable;
end Behavioral;
