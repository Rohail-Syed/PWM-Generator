library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_Module is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (12 downto 0);
           LED : out STD_LOGIC;
           PWM : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (0 to 6);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end Top_Module;

architecture Behavioral of Top_Module is
signal PWM_0_wire : STD_LOGIC;
signal PWM_10_wire : STD_LOGIC;
signal PWM_20_wire : STD_LOGIC;
signal PWM_30_wire : STD_LOGIC;
signal PWM_40_wire : STD_LOGIC;
signal PWM_50_wire : STD_LOGIC;
signal PWM_60_wire : STD_LOGIC;
signal PWM_70_wire : STD_LOGIC;
signal PWM_80_wire : STD_LOGIC;
signal PWM_90_wire : STD_LOGIC;

signal PWM_wire : STD_LOGIC;

signal clk_div_wire : STD_LOGIC;
signal duty_cycle_wire : STD_LOGIC_VECTOR (0 to 6);
signal zero_dash_wire : STD_LOGIC_VECTOR (0 to 6);

component Multiplexer is
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
end component;

component PWM_0 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_0 : out STD_LOGIC);
end component;

component PWM_10 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_10 : out STD_LOGIC);
end component;

component PWM_20 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_20 : out STD_LOGIC);
end component;

component PWM_30 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_30 : out STD_LOGIC);
end component;

component PWM_40 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_40 : out STD_LOGIC);
end component;

component PWM_50 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_50 : out STD_LOGIC);
end component;

component PWM_60 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_60 : out STD_LOGIC);
end component;

component PWM_70 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_70 : out STD_LOGIC);
end component;

component PWM_80 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_80 : out STD_LOGIC);
end component;

component PWM_90 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (8 downto 0);
           PWM_90 : out STD_LOGIC);
end component;

component clockDivider is
    Port ( clk : in STD_LOGIC;
           clk_1000Hz : out STD_LOGIC);
end component;

component segmentDecoder is
    Port ( binaryIn : in STD_LOGIC_VECTOR (3 downto 0);
           segDec : out STD_LOGIC_VECTOR (0 to 6);
           zero_dash :  out STD_LOGIC_VECTOR (0 to 6));
end component;

component Mux_sevenSeg is
    Port ( clk : in STD_LOGIC;
           dutyCycle : in STD_LOGIC_VECTOR (0 to 6);
           zero_dash :  in STD_LOGIC_VECTOR (0 to 6);
           segMux : out STD_LOGIC_VECTOR (0 to 6);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

PWM_0_percent : PWM_0 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_0 => PWM_0_wire);

PWM_10_percent : PWM_10 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_10 => PWM_10_wire);

PWM_20_percent : PWM_20 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_20 => PWM_20_wire);

PWM_30_percent : PWM_30 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_30 => PWM_30_wire);

PWM_40_percent : PWM_40 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_40 => PWM_40_wire);

PWM_50_percent : PWM_50 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_50 => PWM_50_wire);

PWM_60_percent : PWM_60 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_60 => PWM_60_wire);

PWM_70_percent : PWM_70 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_70 => PWM_70_wire);

PWM_80_percent : PWM_80 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_80 => PWM_80_wire);

PWM_90_percent : PWM_90 PORT MAP(
clk => clk,
sw => sw(12 downto 4),
PWM_90 => PWM_90_wire);

MUXING : Multiplexer PORT MAP(
PWM_10 => PWM_10_wire,
PWM_20 => PWM_20_wire,
PWM_30 => PWM_30_wire,
PWM_40 => PWM_40_wire,
PWM_50 => PWM_50_wire,
PWM_60 => PWM_60_wire,
PWM_70 => PWM_70_wire,
PWM_80 => PWM_80_wire,
PWM_90 => PWM_90_wire,
sel => sw,
PWM_out => PWM_wire);

clk_divider : clockDivider PORT MAP(
clk => clk,
clk_1000Hz => clk_div_wire);

Decoder : segmentDecoder PORT MAP(
binaryIn => sw,
segDec => duty_cycle_wire,
zero_dash => zero_dash_wire);

seg_MUX : Mux_sevenSeg PORT MAP(
clk => clk_div_wire,
dutyCycle => duty_cycle_wire,
zero_dash => zero_dash_wire,
segMux => seg,
an => an);

PWM <= PWM_wire;
LED <= PWM_wire;
end Behavioral;
