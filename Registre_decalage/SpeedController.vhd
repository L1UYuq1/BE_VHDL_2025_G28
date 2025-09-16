--- libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity SpeedController is
    
    port(
   	 clk, rst: in std_logic;
   	 mode: in std_logic_vector (1 downto 0);
   	 shift: out std_logic
    );
end SpeedController;

architecture Behavior of SpeedController is

begin

    process(clk, rst, mode)
   	 variable counter: integer range 0 to 400000000;
    begin
   	 if(rst='0') then
   		 counter:=0;
   		 shift<='0';
   	 elsif(rising_edge(clk)) then
   		 if(counter=0) then
   			 shift<='0';
   		 end if;
   		 counter:=counter+1;
   		 case mode is
   			 when "00" =>
   				 if(counter=50000000) then --50000000
   					 counter:=0;
   					 shift<='1';
   				 end if;
   			 when "01" =>
   				 if(counter=100000000) then --100000000
   					 counter:=0;
   					 shift<='1';
   				 end if;
   			 when "10" =>
   				 if(counter=200000000) then --200000000
   					 counter:=0;
   					 shift<='1';
   				 end if;
   			 when "11" =>
   				 if(counter=400000000) then --400000000
   					 counter:=0;
   					 shift<='1';
   				 end if;
   			 when others =>
   				 shift<='0';
   				 counter:=counter;
   		 end case;
   	 end if;
    end process;
    
end Behavior;

