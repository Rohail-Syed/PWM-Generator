library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Top_Module_tb is
end;

architecture bench of Top_Module_tb is

  component Top_Module
      Port ( clk : in STD_LOGIC;
             sw : in STD_LOGIC_VECTOR (12 downto 0);
             LED : out STD_LOGIC;
             PWM : out STD_LOGIC;
             seg : out STD_LOGIC_VECTOR (0 to 6);
             an : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  signal clk: STD_LOGIC;
  signal sw: STD_LOGIC_VECTOR (12 downto 0);
  signal LED: STD_LOGIC;
  signal PWM: STD_LOGIC;
  signal seg: STD_LOGIC_VECTOR (0 to 6);
  signal an: STD_LOGIC_VECTOR (3 downto 0);
  
  constant clk_period : time := 10 ns;

begin

  clocking : process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;  
  end process;

  uut: Top_Module port map ( clk => clk,
                             sw  => sw,
                             LED => LED,
                             PWM => PWM,
                             seg => seg,
                             an  => an );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here
sw <= "1000000000000";
wait for 5ms;
sw <= "1100000000000";
wait for 5ms;
sw <= "1110000000000";
wait for 5ms;
sw <= "1111000000000";
wait for 5ms;
sw <= "1111100000000";
wait for 5ms;
sw <= "1111110000000";
wait for 5ms;
sw <= "0110";
wait for 5ms;
sw <= "0111";
wait for 5ms;
sw <= "1000";
wait for 5ms;
sw <= "1001";
wait for 5ms;
sw <= "1010";
wait for 5ms;
sw <= "1011";
wait for 5ms;
sw <= "1100";
wait for 5ms;
sw <= "1101";
wait for 5ms;
sw <= "1110";
wait for 5ms;
sw <= "1111";
  end process;


end;