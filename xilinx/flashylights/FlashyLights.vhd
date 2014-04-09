library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FlashyLights is
  port (clk : in  std_logic;
        audio : out std_logic;
        LED : out std_logic_vector (7 downto 0));
end FlashyLights;

architecture Behavioral of FlashyLights is

  component counter30 is
    port (
      clk : in  std_logic;
      q   : out std_logic_vector(29 downto 0));
  end component counter30;

  component memory is
    port (
      clka  : in  std_logic;
      wea   : in  std_logic_vector(0 downto 0);
      addra : in  std_logic_vector(9 downto 0);
      dina  : in  std_logic_vector(7 downto 0);
      douta : out std_logic_vector(7 downto 0));
  end component memory;

  component DAC8 is
    port (
      clk    : in  std_logic;
      data   : in  std_logic_vector (7 downto 0);
      stream : out std_logic);
  end component DAC8;

  signal count : std_logic_vector(29 downto 0);
  signal data : std_logic_vector(7 downto 0);

begin

  addr_counter : entity work.counter30
    port map (
      clk => clk,
      q   => count);

  rom_memory : entity work.memory
    port map (
      clka  => clk,
      addra => count(15 downto 8),
      douta => data);

  DAC8_1: entity work.DAC8
    port map (
      clk    => clk,
      data   => data,
      stream => audio);

  LED <= data;

end Behavioral;
