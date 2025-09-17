--déclaration des librairie

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity pwm is
	port(
   	 clk, rst: in std_logic;
   	 mode: in std_logic_vector(1 downto 0);
   	 dout: out std_logic
     );
end pwm;

architecture Beh of pwm is

begin
 
	--signal (1Khz)
	process(clk, rst, mode)
  	  variable counter:integer range 0 to 50000;
	begin
  	  if(rst='0') then
  		 counter:=0;
   		 dout<='0';
  	  elsif(rising_edge(clk)) then
   		 counter:=counter + 1;
   		 
   		 -- check the mode
   		 case mode is
   			 when "00" =>
   				 if (counter=40000) then
   					 dout<='1';
   				 elsif(counter=50000) then
   					 dout<='0';
   					 counter:=0;
   				 end if;
   			 when "01" =>
   				 if (counter=30000) then
   					 dout<='1';
   				 elsif(counter=50000) then
   					 dout<='0';
   					 counter:=0;
   				 end if;
   			 when "10" =>
   				 if (counter=20000) then
   					 dout<='1';
   				 elsif(counter=50000) then
   					 dout<='0';
   					 counter:=0;
   				 end if;
   			 when "11" =>
   				 if (counter=10000) then
   					 dout<='1';
   				 elsif(counter=50000) then
   					 dout<='0';
   					 counter:=0;
   				 end if;
   			 when others =>
   				 dout<='0';
   				 counter:=counter;
   		 end case;
   		 
  	  end if;
	end process;
end Beh;


