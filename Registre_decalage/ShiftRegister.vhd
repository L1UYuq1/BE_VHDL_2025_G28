
--- libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity ShiftRegister is
port(
    clk, rst, direction: in std_logic;
    mode: in std_logic_vector (1 downto 0);
    data: out std_logic_vector (7 downto 0)
);
end ShiftRegister;

architecture structural of ShiftRegister is

    -- Signals interns pour les connexions
    signal shift_connection : std_logic;

begin

    -- Instance du controleur de vitesse
    U1: entity work.SpeedController
    port map(
   	 clk => clk,
   	 rst => rst,
   	 mode => mode,
   	 shift => shift_connection
    );
    
    -- Instance du registre
    U2: entity work.RegisterS
    port map(
   	 clk => clk,
   	 rst => rst,
   	 shift => shift_connection,
   	 direction => direction,
   	 dout => data
    );

end structural;
