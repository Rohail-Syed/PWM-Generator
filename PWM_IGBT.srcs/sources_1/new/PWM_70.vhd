library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity PWM_70 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_70 : out STD_LOGIC);
end PWM_70;

architecture Behavioral of PWM_70 is
signal count: integer:=0;
signal tmp : std_logic;
signal duty_cycle : integer:=0;

begin

process(sw)
begin
    case sw is
        when "100000000" => duty_cycle <= 1000; -- "2" 
        when "110000000" => duty_cycle <= 2000; -- "2" 
        when "111000000" => duty_cycle <= 3000; -- "3" 
        when "111100000" => duty_cycle <= 4000; -- "4" 
        when "111110000" => duty_cycle <= 5000; -- "5" 
        when "111111000" => duty_cycle <= 6000; -- "6" 
        when "111111100" => duty_cycle <= 7000; -- "7" 
        when "111111110" => duty_cycle <= 8000; -- "8"     
        when "111111111" => duty_cycle <= 9000; -- "9"
        when others => duty_cycle <= 0;
    end case;
end process;

process(clk)
begin
    if rising_edge(clk) then
        count <= count + 1;
        if (count > 100000) then
        count <= 0;
        elsif (count < 70000 + duty_cycle) then
        tmp <= '1';
        else
        tmp <= '0';
        end if;
    end if;
end process;

PWM_70 <= tmp;
end Behavioral;
