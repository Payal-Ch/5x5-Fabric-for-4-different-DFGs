----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 11:57:04 AM
-- Design Name: 
-- Module Name: Mux_4x1 - Behavioral
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

entity Mux_4x1 is
Port (
P : in STD_LOGIC_VECTOR(3 downto 0); -- Input
Q : in STD_LOGIC_VECTOR(3 downto 0); -- Input
R : in STD_LOGIC_VECTOR(3 downto 0); -- Input
S : in STD_LOGIC_VECTOR(3 downto 0); -- Input
En : in std_logic; -- Enable signal
Y : out std_logic_vector(3 downto 0); -- Output
Sel : in std_logic_vector(1 downto 0) -- Selector
 );
end Mux_4x1;

architecture Behavioral of Mux_4x1 is

begin
process(P,Q,R,S,Sel, En)
begin
    if (En = '1') then
        case sel is
            when "00" => Y <= P;
            when "01" => Y <= Q;
            when "10" => Y <= R;
            when "11" => Y <= S;
            when others => Y <= "ZZZZ";
        end case;
--    else
--        Y <= "ZZZZ";
    end if;
 end process;


end Behavioral;
