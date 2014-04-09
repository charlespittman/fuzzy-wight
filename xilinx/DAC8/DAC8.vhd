library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity DAC8 is
  port (clk   : in  std_logic;
        data  : in  std_logic_vector (7 downto 0);
        stream : out std_logic);
end DAC8;

architecture Behavioral of DAC8 is

  signal sum : std_logic_vector(8 downto 0);

begin
  stream <= sum(8);

  process (clk) is
  begin  -- process
    if (rising_edge(clk)) then          -- rising clock edge
      sum <= std_logic_vector(unsigned(sum) + unsigned(data));
    end if;
  end process;

end Behavioral;
