library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Mux_sevenSeg is
    Port ( clk : in STD_LOGIC;
           dutyCycle : in STD_LOGIC_VECTOR (0 to 6);
           zero_dash :  in STD_LOGIC_VECTOR (0 to 6);
           segMux : out STD_LOGIC_VECTOR (0 to 6);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_sevenSeg;

architecture Behavioral of Mux_sevenSeg is
signal mux : STD_LOGIC := '0';

begin

process(clk)
begin
    if rising_edge(clk) then
        mux <= not mux;
    end if;
end process;

process(mux)
begin
    if mux = '0' then
        segMux <= dutyCycle;
        an <= "1101";
    elsif mux = '1' then
        segMux <= zero_dash;
        an <= "1110";
    end if;
end process;

end Behavioral;
