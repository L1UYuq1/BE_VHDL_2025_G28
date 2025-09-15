-- appel des librarie et de packages

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Déclarartion de l'entité du composant

entity Speed_controller is

	generic (
		periode1 : nature := 50000000;  --1Hz
		periode1 : nature := 100000000; --0.5Hz
		periode1 : nature := 200000000; --0.25Hz
		periode1 : nature := 400000000; --0.125Hz
		
		--rapport cyclique  = 50% par défaut
		duty_num : nature := 1;
		duty_den : nature := 2;
	
	);

	port(
		clk :	in std_logic;
		rst : in std_logic;
		sel : in std_logic_vector(1 downto 0);
		pwm_out : out std_logic;
		tick : out std_logic;
	
	);



end entity Speed_controller;

--Architecture du composant

architecture  rtl of Speed_controller is 
	begin
	
	process(clk,rst)
		variable counter : interger range 0 to 400000000;
		
		if(rst = '0') then
			counter := 0;
			sel := 0;	
		
		end if;
	end process;
	
	
	
	

end architecture rtl ;