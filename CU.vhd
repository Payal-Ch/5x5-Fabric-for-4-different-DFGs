----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 11:08:45 AM
-- Design Name: 
-- Module Name: CU - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CU is
Port (
A : in STD_LOGIC_VECTOR(3 downto 0); -- Input
B : in STD_LOGIC_VECTOR(3 downto 0); -- Input
En : in std_logic; -- Enable signal
Y : out std_logic_vector(3 downto 0); -- Output
Sel : in std_logic_vector(4 downto 0) -- Operation Selector
 );
end CU;

architecture Behavioral of CU is

begin
process(A,B,Sel,En)
begin
    if (En = '1') then
 case(Sel) is
 when "00000" => Y <= A+B; -- Addition
 
 when "00001" => Y <= A-B; -- subtraction
 
 when "00010" => Y <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),4)); -- multiplication
 
 when "00011" =>  -- less than
 if(A < B) then
 Y <= A;
 else
 Y <= B;
 end if;
 
 when "00100" => -- greater than
 if(A > B) then
 Y <= A;
 else
 Y <= B;
 end if;
 
 when "00101" => -- equal to
 if(A = B) then
 Y <= "1111";
 else
 Y <= "0000";
 end if;
 
 when "00110" => Y <= to_stdlogicvector(to_bitvector(A) sll to_integer(unsigned(B(1 downto 0))));  -- Shift left logically

 when "00111" => Y <= to_stdlogicvector(to_bitvector(A) srl to_integer(unsigned(B(1 downto 0)))); -- Shift Right logically

 when "01000" => Y <= to_stdlogicvector(to_bitvector(A) sla to_integer(unsigned(B(1 downto 0)))); -- shift left arithmatically
 
 when "01001" => Y <= to_stdlogicvector(to_bitvector(A) sra to_integer(unsigned(B(1 downto 0)))); -- shift right arithmatically

 when "01010" => Y <= to_stdlogicvector(to_bitvector(A) rol to_integer(unsigned(B(1 downto 0)))); -- rotate left
 
 when "01011" => Y <= to_stdlogicvector(to_bitvector(A) ror to_integer(unsigned(B(1 downto 0)))); -- rotate right
 
 when "01100" => Y <= A nand B; -- nand

 when "01101" => Y <= A nor B; -- nor
 
 when "01110" => Y <= A xor B; -- xor
 
 when "01111" => Y <= A xnor B; -- xnor
 
 when "10000" => Y <= A or B; -- or
 
 when "10001" => Y <= A and B; -- and
 
 when "10010" => Y <= A; --pass A
 
 when "10011" => Y <= B; --pass B
 
 when "10100" => Y <= "0000"; --no op

 when others => Y <= "ZZZZ"; 
 end case;
--     else
--        Y <= "ZZZZ";
    end if;
 end process;

end Behavioral;
