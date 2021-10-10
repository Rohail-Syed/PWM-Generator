library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity clockDivider is
    Port ( clk : in STD_LOGIC;
           clk_1000Hz : out STD_LOGIC);
end clockDivider;

architecture Behavioral of clockDivider is
signal count: integer := 1;
signal tmp : std_logic := '0';

begin
process(clk)
begin
    if rising_edge(clk) then
        count <= count + 1;
            if (count = 50000) then
                tmp <= not tmp;
                count <= 1;
            end if;
    end if;
end process;

clk_1000Hz <= tmp;
end Behavioral;
