-- Bibliothèques
library ieee;
use ieee.std_logic_1164.all;

entity SpeedController is
  port(
    clk     : in  std_logic;                       -- Horloge 50 MHz
    rst     : in  std_logic;                       -- Reset asynchrone, actif à '0'
    mode    : in  std_logic_vector(1 downto 0);    -- Sélection de la vitesse (00=1Hz, 01=0.5Hz, 10=0.25Hz, 11=0.125Hz)
    shift   : out std_logic;                       -- Impulsion (tick) : déclenche le registre à décalage
    pwm_out : out std_logic                        -- Signal PWM de sortie (pour observer la fréquence/rapport cyclique)
  );
end SpeedController;

architecture Behavior of SpeedController is
  -- Paramètres du rapport cyclique (duty cycle)
  constant DUTY_NUM : integer := 1;
  constant DUTY_DEN : integer := 2;  -- 1/2 = 50 %
  signal pwm_s : std_logic := '0';   -- Signal interne du PWM
begin

  process(clk, rst)
    variable counter   : integer range 0 to 400000000 := 0;  -- Compteur pour diviser l’horloge
    variable period_v  : integer;   -- Valeur de période sélectionnée en fonction de "mode"
    variable duty_high : integer;   -- Seuil haut pour générer le PWM (période * rapport cyclique)
  begin
    if (rst = '0') then
      -- Réinitialisation
      counter   := 0;
      shift     <= '0';
      pwm_s     <= '0';

    elsif rising_edge(clk) then
      -- 1) Choix de la période selon "mode"
      case mode is
        when "00" => period_v := 50000000;    -- 1 Hz
        when "01" => period_v := 100000000;   -- 0.5 Hz
        when "10" => period_v := 200000000;   -- 0.25 Hz
        when others => period_v := 400000000; -- 0.125 Hz (y compris "11")
      end case;

      -- 2) Calcul du seuil pour le rapport cyclique et génération du PWM
      duty_high := (period_v * DUTY_NUM) / DUTY_DEN;  -- Exemple : 50 % => period_v/2
      if counter < duty_high then
        pwm_s <= '1';   -- Niveau haut tant que le compteur < seuil
      else
        pwm_s <= '0';   -- Sinon niveau bas
      end if;

      -- 3) Gestion du compteur et génération de l’impulsion "shift"
      if counter = period_v - 1 then
        counter := 0;
        shift   <= '1';     -- Une seule impulsion courte à la fin de chaque période
      else
        counter := counter + 1;
        shift   <= '0';
      end if;
    end if;
  end process;

  -- Affectation du signal interne vers le port de sortie
  pwm_out <= pwm_s;

end Behavior;
