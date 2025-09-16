--- libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity RegisterS is
    
    port(
   	 clk, rst, shift, direction: in std_logic;
   	 dout: out std_logic_vector(7 downto 0)
    );
end RegisterS;

architecture Behavior of RegisterS is

begin

    process(clk, rst, shift, direction)
	 
   	 variable doutt: std_logic_vector (7 downto 0);
    
	 begin
   	 if(rst='0') then
   		 doutt:="10100011";
			 
			-- Il va decaler seulement si le signal de shift est 1 
   	 elsif(rising_edge(clk) and shift='1') then
   		 
			 -- Pour vérifier si on doit décaler vers la droite ou vers la gauche
			 if(direction='0') then
				doutt:=doutt(0)&doutt(7 downto 1);
			 else
				doutt:=doutt(6 downto 0)&doutt(7);
			 end if;
			 
   	 end if;
		 
		 dout <= doutt;
    end process;
    
end Behavior;

