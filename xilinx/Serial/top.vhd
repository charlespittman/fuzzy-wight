
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
  port (
    clk : in  std_logic;
    rx  : in  std_logic;
    tx  : out std_logic);
end top;

architecture Behavioral of top is

  signal shiftReg : std_logic_vector(15 downto 0) := "1111111010110100";
  signal counter  : std_logic_vector(12 downto 0) := (others => '0');

begin

  tx <= shiftReg(0);

  process (clk) is
  begin  -- process
    if (rising_edge(clk)) then          -- rising clock edge
      if (unsigned(counter) = 3332) then
        shiftReg <= shiftReg(0) & shiftReg(15 downto 1);
        counter  <= (others => '0');
      else
        counter <= std_logic_vector(unsigned(counter) + 1);
      end if;
    end if;
  end process;

end Behavioral;
