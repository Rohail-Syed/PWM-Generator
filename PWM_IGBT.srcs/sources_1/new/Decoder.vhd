library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity segmentDecoder is
    Port ( binaryIn : in STD_LOGIC_VECTOR (3 downto 0);
           segDec : out STD_LOGIC_VECTOR (0 to 6);
           zero_dash :  out STD_LOGIC_VECTOR (0 to 6));
end segmentDecoder;

architecture Behavioral of segmentDecoder is
signal cath : STD_LOGIC_VECTOR (0 to 6);
signal zero_dash_sig : STD_LOGIC_VECTOR (0 to 6);

begin
process(binaryIn, cath)
begin
    case binaryIn is
        when "0000" => cath <= "1111110"; -- "-"     
        when "0001" => cath <= "1001111"; -- "1" 
        when "0010" => cath <= "0010010"; -- "2" 
        when "0011" => cath <= "0000110"; -- "3" 
        when "0100" => cath <= "1001100"; -- "4" 
        when "0101" => cath <= "0100100"; -- "5" 
        when "0110" => cath <= "0100000"; -- "6" 
        when "0111" => cath <= "0001111"; -- "7" 
        when "1000" => cath <= "0000000"; -- "8"     
        when "1001" => cath <= "0000100"; -- "9"
        when others => cath <= "1111110";
    end case;
end process;

process(zero_dash_sig, binaryIn)
begin
    case binaryIn is
        when "0001" => zero_dash_sig <= "0000001"; 
        when "0010" => zero_dash_sig <= "0000001"; 
        when "0011" => zero_dash_sig <= "0000001"; 
        when "0100" => zero_dash_sig <= "0000001"; 
        when "0101" => zero_dash_sig <= "0000001"; 
        when "0110" => zero_dash_sig <= "0000001"; 
        when "0111" => zero_dash_sig <= "0000001"; 
        when "1000" => zero_dash_sig <= "0000001";    
        when "1001" => zero_dash_sig <= "0000001"; 
        when others => zero_dash_sig <= "1111110";
    end case;
end process;

segDec <= cath;
zero_dash <= zero_dash_sig;
end Behavioral;
