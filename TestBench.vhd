----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2023 03:28:26 PM
-- Design Name: 
-- Module Name: TestBench - Behavioral
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

entity TestBench is
--  Port ( );
end TestBench;

architecture Behavioral of TestBench is

Signal A1s, B1s, A2s, B2s, A3s, B3s, A4s, B4s, A5s, B5s : STD_LOGIC_VECTOR(3 downto 0); -- Inputs
Signal Y1s, Y2s, Y3s, Y4s, Y5s : std_logic_vector(3 downto 0); -- Outputs
------------- Enable signals for CUs --------------------------
Signal CUEn1x1s, CUEn1x2s, CUEn1x3s, CUEn1x4s, CUEn1x5s : std_logic;
Signal CUEn2x1s, CUEn2x2s, CUEn2x3s, CUEn2x4s, CUEn2x5s : std_logic;
Signal CUEn3x1s, CUEn3x2s, CUEn3x3s, CUEn3x4s, CUEn3x5s : std_logic;
Signal CUEn4x1s, CUEn4x2s, CUEn4x3s, CUEn4x4s, CUEn4x5s : std_logic;
Signal CUEn5x1s, CUEn5x2s, CUEn5x3s, CUEn5x4s, CUEn5x5s : std_logic;
---------------------------------------------------------------
------------- Enable signals for MUX - InterConnect--------------------------
signal En1x1s, En1x2s, En1x3s, En1x4s, En1x5s : std_logic;
signal En2x1s, En2x2s, En2x3s, En2x4s, En2x5s : std_logic;
signal En3x1s, En3x2s, En3x3s, En3x4s, En3x5s : std_logic;
signal En4x1s, En4x2s, En4x3s, En4x4s, En4x5s : std_logic;
---------------------------------------------------------------
------------- Operation(CU) Selector --------------------------
Signal Sel1x1s, Sel1x2s, Sel1x3s, Sel1x4s, Sel1x5s : std_logic_vector(4 downto 0); 
signal Sel2x1s, Sel2x2s, Sel2x3s, Sel2x4s, Sel2x5s : std_logic_vector(4 downto 0); 
signal Sel3x1s, Sel3x2s, Sel3x3s, Sel3x4s, Sel3x5s : std_logic_vector(4 downto 0); 
signal Sel4x1s, Sel4x2s, Sel4x3s, Sel4x4s, Sel4x5s : std_logic_vector(4 downto 0); 
signal Sel5x1s, Sel5x2s, Sel5x3s, Sel5x4s, Sel5x5s : std_logic_vector(4 downto 0); 
---------------------------------------------------------------
------------------ Mux Selector -IC1 --------------------------
signal ICSel1x1_1s, ICSel1x1_2s, ICSel1x5_1s, ICSel1x5_2s : std_logic; 
signal ICSel1x2_1s, ICSel1x2_2s, ICSel1x3_1s, ICSel1x3_2s, ICSel1x4_1s, ICSel1x4_2s : std_logic_vector(1 downto 0); 
---------------------------------------------------------------
------------------ Mux Selector -IC2 --------------------------
signal ICSel2x1_1s, ICSel2x1_2s, ICSel2x5_1s, ICSel2x5_2s : std_logic; 
signal ICSel2x2_1s, ICSel2x2_2s, ICSel2x3_1s, ICSel2x3_2s, ICSel2x4_1s, ICSel2x4_2s : std_logic_vector(1 downto 0); 
---------------------------------------------------------------
------------------ Mux Selector -IC3 --------------------------
signal ICSel3x1_1s, ICSel3x1_2s, ICSel3x2_1s, ICSel3x2_2s : std_logic_vector(1 downto 0); 
signal ICSel3x3_1s, ICSel3x3_2s, ICSel3x4_1s, ICSel3x4_2s, ICSel3x5_1s, ICSel3x5_2s : std_logic; 
---------------------------------------------------------------
------------------ Mux Selector -IC4 --------------------------
signal ICSel4x1_1s, ICSel4x1_2s, ICSel4x2_1s, ICSel4x2_2s, ICSel4x3_1s, ICSel4x3_2s, ICSel4x4_1s, ICSel4x4_2s, ICSel4x5_1s, ICSel4x5_2s : std_logic; 
---------------------------------------------------------------
begin

CU: entity work.DFG(Behavioral)

Port Map(
A1 => A1s, B1 => B1s, A2 => A2s, B2 => B2s, A3 => A3s, B3 => B3s, A4 => A4s, B4 => B4s, A5 => A5s, B5 => B5s,  
Y1 => Y1s, Y2 => Y2s, Y3 => Y3s, Y4 => Y4s, Y5 => Y5s, 
Sel1x1 => Sel1x1s,  Sel1x2 => Sel1x2s, Sel1x3 => Sel1x3s, Sel1x4 =>  Sel1x4s, Sel1x5 => Sel1x5s,
Sel2x1 => Sel2x1s,  Sel2x2 => Sel2x2s, Sel2x3 => Sel2x3s, Sel2x4 =>  Sel2x4s, Sel2x5 => Sel2x5s,
Sel3x1 => Sel3x1s,  Sel3x2 => Sel3x2s, Sel3x3 => Sel3x3s, Sel3x4 =>  Sel3x4s, Sel3x5 => Sel3x5s,
Sel4x1 => Sel4x1s,  Sel4x2 => Sel4x2s, Sel4x3 => Sel4x3s, Sel4x4 =>  Sel4x4s, Sel4x5 => Sel4x5s,
Sel5x1 => Sel5x1s,  Sel5x2 => Sel5x2s, Sel5x3 => Sel5x3s, Sel5x4 =>  Sel5x4s, Sel5x5 => Sel5x5s,

CUEn1x1 => CUEn1x1s, CUEn1x2 => CUEn1x2s, CUEn1x3 => CUEn1x3s, CUEn1x4 => CUEn1x4s, CUEn1x5 => CUEn1x5s,
CUEn2x1 => CUEn2x1s, CUEn2x2 => CUEn2x2s, CUEn2x3 => CUEn2x3s, CUEn2x4 => CUEn2x4s, CUEn2x5 => CUEn2x5s,
CUEn3x1 => CUEn3x1s, CUEn3x2 => CUEn3x2s, CUEn3x3 => CUEn3x3s, CUEn3x4 => CUEn3x4s, CUEn3x5 => CUEn3x5s,
CUEn4x1 => CUEn4x1s, CUEn4x2 => CUEn4x2s, CUEn4x3 => CUEn4x3s, CUEn4x4 => CUEn4x4s, CUEn4x5 => CUEn4x5s,
CUEn5x1 => CUEn5x1s, CUEn5x2 => CUEn5x2s, CUEn5x3 => CUEn5x3s, CUEn5x4 => CUEn5x4s, CUEn5x5 => CUEn5x5s,

En1x1 => En1x1s, En1x2 => En1x2s, En1x3 => En1x3s, En1x4 => En1x4s, En1x5 => En1x5s,
En2x1 => En2x1s, En2x2 => En2x2s, En2x3 => En2x3s, En2x4 => En2x4s, En2x5 => En2x5s,
En3x1 => En3x1s, En3x2 => En3x2s, En3x3 => En3x3s, En3x4 => En3x4s, En3x5 => En3x5s,
En4x1 => En4x1s, En4x2 => En4x2s, En4x3 => En4x3s, En4x4 => En4x4s, En4x5 => En4x5s,

ICSel1x1_1 => ICSel1x1_1s, ICSel1x1_2 => ICSel1x1_2s,
ICSel1x5_1 => ICSel1x5_1s, ICSel1x5_2 => ICSel1x5_2s,
ICSel1x2_1 => ICSel1x2_1s, ICSel1x2_2 => ICSel1x2_2s, ICSel1x3_1 => ICSel1x3_1s,
ICSel1x3_2 => ICSel1x3_2s, ICSel1x4_1 => ICSel1x4_1s, ICSel1x4_2 => ICSel1x4_2s,

ICSel2x1_1 => ICSel2x1_1s, ICSel2x1_2 => ICSel2x1_2s,
ICSel2x5_1 => ICSel2x5_1s, ICSel2x5_2 => ICSel2x5_2s,
ICSel2x2_1 => ICSel2x2_1s, ICSel2x2_2 => ICSel2x2_2s, ICSel2x3_1 => ICSel2x3_1s,
ICSel2x3_2 => ICSel2x3_2s, ICSel2x4_1 => ICSel2x4_1s, ICSel2x4_2 => ICSel2x4_2s,

ICSel3x1_1 => ICSel3x1_1s, ICSel3x1_2 => ICSel3x1_2s,
ICSel3x5_1 => ICSel3x5_1s, ICSel3x5_2 => ICSel3x5_2s,
ICSel3x2_1 => ICSel3x2_1s, ICSel3x2_2 => ICSel3x2_2s, ICSel3x3_1 => ICSel3x3_1s,
ICSel3x3_2 => ICSel3x3_2s, ICSel3x4_1 => ICSel3x4_1s, ICSel3x4_2 => ICSel3x4_2s,

ICSel4x1_1 => ICSel4x1_1s, ICSel4x1_2 => ICSel4x1_2s,
ICSel4x5_1 => ICSel4x5_1s, ICSel4x5_2 => ICSel4x5_2s,
ICSel4x2_1 => ICSel4x2_1s, ICSel4x2_2 => ICSel4x2_2s, ICSel4x3_1 => ICSel4x3_1s,
ICSel4x3_2 => ICSel4x3_2s, ICSel4x4_1 => ICSel4x4_1s, ICSel4x4_2 => ICSel4x4_2s
);

stim: process
begin
-------------------------- DFG1 -------------------------- 
A1s <= "1001"; B1s <= "0110";
A2s <= "0100"; B2s <= "0011";
A3s <= "0010"; B3s <= "0111";
A4s <= "1111"; B4s <= "1101";
A5s <= "0001"; B5s <= "0001";
------------ Row1 CU ------------
CUEn1x1s <= '1'; CUEn1x2s <= '1'; CUEn1x3s <= '1'; CUEn1x4s <= '1'; CUEn1x5s <= '1';
Sel1x1s <= "00000";
Sel1x2s <= "00010";
Sel1x3s <= "00000";
Sel1x4s <= "00001";
Sel1x5s <= "00010";
------------ Row1 MUX ------------
En1x1s <= '0';
En1x2s <= '1';
En1x3s <= '1';
En1x4s <= '1';
En1x5s <= '0';
ICSel1x2_1s <= "10"; ICSel1x2_2s <= "10";
ICSel1x3_1s <= "01"; ICSel1x3_2s <= "11";
ICSel1x4_1s <= "11"; ICSel1x4_2s <= "01";
------------ Row2 CU ------------
CUEn2x1s <= '0'; CUEn2x2s <= '1'; CUEn2x3s <= '1'; CUEn2x4s <= '1'; CUEn2x5s <= '0';
Sel2x2s <= "00001";
Sel2x3s <= "00000";
Sel2x4s <= "00001";
------------ Row2 MUX ------------
En2x1s <= '0';
En2x2s <= '1';
En2x3s <= '1';
En2x4s <= '1';
En2x5s <= '0';
ICSel2x2_1s <= "00"; ICSel2x2_2s <= "10";
ICSel2x3_1s <= "00"; ICSel2x3_2s <= "01";
ICSel2x4_1s <= "10"; ICSel2x4_2s <= "11";
------------ Row3 CU ------------
CUEn3x1s <= '0'; CUEn3x2s <= '1'; CUEn3x3s <= '1'; CUEn3x4s <= '1'; CUEn3x5s <= '0';
Sel3x2s <= "10000";
Sel3x3s <= "10001";
Sel3x4s <= "01100";
------------ Row3 MUX ------------
En3x1s <= '0';
En3x2s <= '1';
En3x3s <= '0';
En3x4s <= '1';
En3x5s <= '0';
ICSel3x2_1s <= "00"; ICSel3x2_2s <= "01";
ICSel3x4_1s <= '1'; ICSel3x4_2s <= '0';
------------ Row4 CU ------------
CUEn4x1s <= '0'; CUEn4x2s <= '1'; CUEn4x3s <= '0'; CUEn4x4s <= '1'; CUEn4x5s <= '0';
Sel4x2s <= "01110";
Sel4x4s <= "01101";
------------ Row4 MUX ------------
En4x1s <= '0';
En4x2s <= '1';
En4x3s <= '0';
En4x4s <= '1';
En4x5s <= '0';
ICSel4x2_1s <= '0'; ICSel4x2_2s <= '0';
ICSel4x4_1s <= '0'; ICSel4x4_2s <= '0';
------------ Row5 CU ------------
CUEn5x1s <= '0'; CUEn5x2s <= '1'; CUEn5x3s <= '0'; CUEn5x4s <= '1'; CUEn5x5s <= '0';
Sel5x2s <= "10010";
Sel5x4s <= "10010";
wait for 20 ns;
----------------------------------------------------------
---------------------------- DFG2 -------------------------- 
--A1s <= "1101"; B1s <= "0110";
--A3s <= "0010"; B3s <= "0011";
--A4s <= "0001"; B4s <= "0001";
--A5s <= "0010"; B5s <= "0010";
-------------- Row1 CU ------------
--CUEn1x1s <= '1'; CUEn1x2s <= '0'; CUEn1x3s <= '1'; CUEn1x4s <= '1'; CUEn1x5s <= '1';
--Sel1x1s <= "00001";
--Sel1x3s <= "00010";
--Sel1x4s <= "00000";
--Sel1x5s <= "00010";
-------------- Row1 MUX ------------
--En1x1s <= '0';
--En1x2s <= '1';
--En1x3s <= '1';
--En1x4s <= '1';
--En1x5s <= '0';
--ICSel1x2_1s <= "10"; ICSel1x2_2s <= "11";
--ICSel1x3_1s <= "11"; ICSel1x3_2s <= "11";
--ICSel1x4_1s <= "10"; ICSel1x4_2s <= "10";
-------------- Row2 CU ------------
--CUEn2x1s <= '0'; CUEn2x2s <= '1'; CUEn2x3s <= '1'; CUEn2x4s <= '1'; CUEn2x5s <= '0';
--Sel2x2s <= "00000";
--Sel2x3s <= "00001";
--Sel2x4s <= "00000";
-------------- Row2 MUX ------------
--En2x1s <= '0';
--En2x2s <= '1';
--En2x3s <= '1';
--En2x4s <= '0';
--En2x5s <= '0';
--ICSel2x2_1s <= "11"; ICSel2x2_2s <= "10";
--ICSel2x3_1s <= "01"; ICSel2x3_2s <= "11";
-------------- Row3 CU ------------
--CUEn3x1s <= '0'; CUEn3x2s <= '1'; CUEn3x3s <= '1'; CUEn3x4s <= '0'; CUEn3x5s <= '0';
--Sel3x2s <= "01011";
--Sel3x3s <= "00110";
-------------- Row3 MUX ------------
--En3x1s <= '1';
--En3x2s <= '1';
--En3x3s <= '0';
--En3x4s <= '0';
--En3x5s <= '0';
--ICSel3x1_1s <= "00"; ICSel3x1_2s <= "11";
--ICSel3x2_1s <= "00"; ICSel3x2_2s <= "11";
-------------- Row4 CU ------------
--CUEn4x1s <= '1'; CUEn4x2s <= '1'; CUEn4x3s <= '0'; CUEn4x4s <= '0'; CUEn4x5s <= '0';
--Sel4x1s <= "00100";
--Sel4x2s <= "00101";
------------ Row4 MUX ------------
--En4x1s <= '1';
--En4x2s <= '1';
--En4x3s <= '0';
--En4x4s <= '0';
--En4x5s <= '0';
--ICSel4x1_1s <= '0'; ICSel4x1_2s <= '0';
--ICSel4x2_1s <= '0'; ICSel4x2_2s <= '0';
-------------- Row5 CU ------------
--CUEn5x1s <= '1'; CUEn5x2s <= '1'; CUEn5x3s <= '0'; CUEn5x4s <= '0'; CUEn5x5s <= '0';
--Sel5x1s <= "10010";
--Sel5x2s <= "10010";
--wait for 20 ns;
------------------------------------------------------------
---------------------------- DFG3 -------------------------- 
--A2s <= "1000"; B2s <= "0101";
--A3s <= "1110"; B3s <= "1000";
--A4s <= "0001"; B4s <= "0100";
--A5s <= "0011"; B5s <= "0010";
-------------- Row1 CU ------------
--CUEn1x1s <= '0'; CUEn1x2s <= '1'; CUEn1x3s <= '1'; CUEn1x4s <= '1'; CUEn1x5s <= '1';
--Sel1x2s <= "00000";
--Sel1x3s <= "00001";
--Sel1x4s <= "00010";
--Sel1x5s <= "00010";
-------------- Row1 MUX ------------
--En1x1s <= '0';
--En1x2s <= '1';
--En1x3s <= '1';
--En1x4s <= '1';
--En1x5s <= '0';
--ICSel1x2_1s <= "01"; ICSel1x2_2s <= "10";
--ICSel1x3_1s <= "01"; ICSel1x3_2s <= "11";
--ICSel1x4_1s <= "10"; ICSel1x4_2s <= "10";
-------------- Row2 CU ------------
--CUEn2x1s <= '0'; CUEn2x2s <= '1'; CUEn2x3s <= '1'; CUEn2x4s <= '1'; CUEn2x5s <= '0';
--Sel2x2s <= "00001";
--Sel2x3s <= "00000";
--Sel2x4s <= "00001";
-------------- Row2 MUX ------------
--En2x1s <= '0';
--En2x2s <= '0';
--En2x3s <= '1';
--En2x4s <= '1';
--En2x5s <= '0';
--ICSel2x3_1s <= "01"; ICSel2x3_2s <= "11";
--ICSel2x4_1s <= "01"; ICSel2x4_2s <= "00";
-------------- Row3 CU ------------
--CUEn3x1s <= '0'; CUEn3x2s <= '0'; CUEn3x3s <= '1'; CUEn3x4s <= '1'; CUEn3x5s <= '0';
--Sel3x3s <= "01101";
--Sel3x4s <= "01100";
-------------- Row3 MUX ------------
--En3x1s <= '0';
--En3x2s <= '0';
--En3x3s <= '1';
--En3x4s <= '1';
--En3x5s <= '0';
--ICSel3x3_1s <= '0'; ICSel3x3_2s <= '0';
--ICSel3x4_1s <= '0'; ICSel3x4_2s <= '0';
-------------- Row4 CU ------------
--CUEn4x1s <= '0'; CUEn4x2s <= '0'; CUEn4x3s <= '1'; CUEn4x4s <= '1'; CUEn4x5s <= '0';
--Sel4x3s <= "10010";
--Sel4x4s <= "10010";
-------------- Row4 MUX ------------
--En4x1s <= '0';
--En4x2s <= '0';
--En4x3s <= '1';
--En4x4s <= '1';
--En4x5s <= '0';
--ICSel4x3_1s <= '0'; ICSel4x3_2s <= '0';
--ICSel4x4_1s <= '0'; ICSel4x4_2s <= '0';
-------------- Row5 CU ------------
--CUEn5x1s <= '0'; CUEn5x2s <= '0'; CUEn5x3s <= '1'; CUEn5x4s <= '1'; CUEn5x5s <= '0';
--Sel5x3s <= "10010";
--Sel5x4s <= "10010";
--wait for 20 ns;
------------------------------------------------------------
---------------------------- DFG4 -------------------------- 
--A2s <= "0100"; B2s <= "0010";
--A3s <= "0011"; B3s <= "0100";
--A4s <= "1111"; B4s <= "1010";
--A5s <= "0010"; B5s <= "0010";
-------------- Row1 CU ------------
--CUEn1x1s <= '0'; CUEn1x2s <= '1'; CUEn1x3s <= '1'; CUEn1x4s <= '1'; CUEn1x5s <= '1';
--Sel1x2s <= "00010";
--Sel1x3s <= "00000";
--Sel1x4s <= "00001";
--Sel1x5s <= "00010";
-------------- Row1 MUX ------------
--En1x1s <= '0';
--En1x2s <= '0';
--En1x3s <= '1';
--En1x4s <= '1';
--En1x5s <= '1';
--ICSel1x3_1s <= "10"; ICSel1x3_2s <= "10";
--ICSel1x4_1s <= "10"; ICSel1x4_2s <= "10";
--ICSel1x5_1s <= '1'; ICSel1x5_2s <= '0';
-------------- Row2 CU ------------
--CUEn2x1s <= '0'; CUEn2x2s <= '0'; CUEn2x3s <= '1'; CUEn2x4s <= '1'; CUEn2x5s <= '1';
--Sel2x3s <= "00000";
--Sel2x4s <= "00000";
--Sel2x5s <= "00001";
-------------- Row2 MUX ------------
--En2x1s <= '0';
--En2x2s <= '0';
--En2x3s <= '1';
--En2x4s <= '1';
--En2x5s <= '1';
--ICSel2x3_1s <= "00"; ICSel2x3_2s <= "01";
--ICSel2x4_1s <= "01"; ICSel2x4_2s <= "01";
--ICSel2x5_1s <= '1'; ICSel2x5_2s <= '0';
-------------- Row3 CU ------------
--CUEn3x1s <= '0'; CUEn3x2s <= '0'; CUEn3x3s <= '1'; CUEn3x4s <= '1'; CUEn3x5s <= '1';
--Sel3x3s <= "00111";
--Sel3x4s <= "01010";
--Sel3x5s <= "01000";
-------------- Row3 MUX ------------
--En3x1s <= '0';
--En3x2s <= '0';
--En3x3s <= '0';
--En3x4s <= '1';
--En3x5s <= '1';
--ICSel3x4_1s <= '1'; ICSel3x4_2s <= '0';
--ICSel3x5_1s <= '1'; ICSel3x5_2s <= '0';
-------------- Row4 CU ------------
--CUEn4x1s <= '0'; CUEn4x2s <= '0'; CUEn4x3s <= '0'; CUEn4x4s <= '1'; CUEn4x5s <= '1';
--Sel4x4s <= "01110";
--Sel4x5s <= "01111";
-------------- Row4 MUX ------------
--En4x1s <= '0';
--En4x2s <= '0';
--En4x3s <= '0';
--En4x4s <= '0';
--En4x5s <= '1';
--ICSel4x5_1s <= '1'; ICSel4x5_2s <= '0';
-------------- Row5 CU ------------
--CUEn5x1s <= '0'; CUEn5x2s <= '0'; CUEn5x3s <= '0'; CUEn5x4s <= '0'; CUEn5x5s <= '1';
--Sel5x5s <= "00011";
--wait for 20 ns;
------------------------------------------------------------
end process;


end Behavioral;
