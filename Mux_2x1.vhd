----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 11:52:10 AM
-- Design Name: 
-- Module Name: Mux_2x1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_2x1 is
Port (
P : in STD_LOGIC_VECTOR(3 downto 0); -- Input
Q : in STD_LOGIC_VECTOR(3 downto 0); -- Input
En : in STD_LOGIC; -- Enable signal
Y : out std_logic_vector(3 downto 0); -- Output
Sel : in std_logic -- Selector
 );
end Mux_2x1;

architecture Behavioral of Mux_2x1 is

begin
process(P,Q,Sel, En)
begin
    if (En = '1') then
        case Sel is
            when '0' => Y <= P;
            when '1' => Y <= Q;
            when others => Y <= "ZZZZ";
        end case;
--    else
--        Y <= "ZZZZ";
    end if;
end process;


end Behavioral;
