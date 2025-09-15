-- declaration des librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity TimerLed is
    generic(max: natural := 2500000);
    port(
        clk : in  std_logic;
        rst : in  std_logic;
        led : out std_logic
    );
end TimerLed;

architecture Beh of TimerLed is
begin
    process(clk, rst)
        variable temp : integer range 0 to max;
        variable tout : std_logic;
    begin
        if (rst = '0') then
            led  <= '0';
            temp := 0;
            tout := '0';
        elsif (rising_edge(clk)) then
            temp := temp + 1;
            if (temp = max) then
                temp := 0;
                tout := not tout;
            end if;
            led <= tout;
        end if;
    end process;
end Beh;
