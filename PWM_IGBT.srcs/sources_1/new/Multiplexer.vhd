library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
    Port ( PWM_10 : in STD_LOGIC;
           PWM_20 : in STD_LOGIC;
           PWM_30 : in STD_LOGIC;
           PWM_40 : in STD_LOGIC;
           PWM_50 : in STD_LOGIC;
           PWM_60 : in STD_LOGIC;
           PWM_70 : in STD_LOGIC;
           PWM_80 : in STD_LOGIC;
           PWM_90 : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR (3 downto 0);
           PWM_out : out STD_LOGIC);
end Multiplexer;

architecture Behavioral of Multiplexer is
signal tmp : STD_LOGIC;

begin

process(sel, tmp, PWM_10, PWM_20, PWM_30, PWM_40, PWM_50, PWM_60, PWM_70, PWM_80, PWM_90)
begin
    case sel is
        when "0000" => tmp <= '0';
        when "0001" => tmp <= PWM_10; 
        when "0010" => tmp <= PWM_20; 
        when "0011" => tmp <= PWM_30;
        when "0100" => tmp <= PWM_40;
        when "0101" => tmp <= PWM_50;
        when "0110" => tmp <= PWM_60;
        when "0111" => tmp <= PWM_70;
        when "1000" => tmp <= PWM_80;
        when "1001" => tmp <= PWM_90;
        when others => tmp <= '0';
    end case;
end process;

PWM_out <= tmp;
end Behavioral;
