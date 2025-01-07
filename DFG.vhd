----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2023 03:53:41 PM
-- Design Name: 
-- Module Name: DFG - Behavioral
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

entity DFG is
  Port ( 
    A1, B1, A2, B2, A3, B3, A4, B4, A5, B5 : in STD_LOGIC_VECTOR(3 downto 0); -- Inputs to the Row1 CU
    Y1, Y2, Y3, Y4, Y5 : out std_logic_vector(3 downto 0); -- Outputs from Row 5 CU
    
    Sel1x1, Sel1x2, Sel1x3, Sel1x4, Sel1x5 : in std_logic_vector(4 downto 0); -- CU Operation Selector for Row 1
    Sel2x1, Sel2x2, Sel2x3, Sel2x4, Sel2x5 : in std_logic_vector(4 downto 0); -- CU Operation Selector for Row 2
    Sel3x1, Sel3x2, Sel3x3, Sel3x4, Sel3x5 : in std_logic_vector(4 downto 0); -- CU Operation Selector for Row 3
    Sel4x1, Sel4x2, Sel4x3, Sel4x4, Sel4x5 : in std_logic_vector(4 downto 0); -- CU Operation Selector for Row 4
    Sel5x1, Sel5x2, Sel5x3, Sel5x4, Sel5x5 : in std_logic_vector(4 downto 0); -- CU Operation Selector for Row 5
    ------------- Enable signals for CUs --------------------------
    CUEn1x1, CUEn1x2, CUEn1x3, CUEn1x4, CUEn1x5 : in std_logic; -- Enable signal for Row 1 CUs
    CUEn2x1, CUEn2x2, CUEn2x3, CUEn2x4, CUEn2x5 : in std_logic; -- Enable signal for Row 2 CUs
    CUEn3x1, CUEn3x2, CUEn3x3, CUEn3x4, CUEn3x5 : in std_logic; -- Enable signal for Row 3 CUs
    CUEn4x1, CUEn4x2, CUEn4x3, CUEn4x4, CUEn4x5 : in std_logic; -- Enable signal for Row 4 CUs
    CUEn5x1, CUEn5x2, CUEn5x3, CUEn5x4, CUEn5x5 : in std_logic; -- Enable signal for Row 5 CUs
    ------------------------------ IC1 ------------------------------
    En1x1, En1x2, En1x3, En1x4, En1x5 : in std_logic; -- Enable signal for InterConnect 1 Multiplexers
    ----- Selectors for Multiplexers in Interconnect 1 to select inputs for Row 2 CUs -----
    ICSel1x1_1, ICSel1x1_2, ICSel1x5_1, ICSel1x5_2 : in std_logic; 
    ICSel1x2_1, ICSel1x2_2, ICSel1x3_1, ICSel1x3_2, ICSel1x4_1, ICSel1x4_2 : in std_logic_vector(1 downto 0);
    -----------------------------------------------------------------
    ------------------------------ IC2 ------------------------------
    En2x1, En2x2, En2x3, En2x4, En2x5 : in std_logic; -- Enable signal for InterConnect 2 Multiplexers
    ----- Selectors for Multiplexers in Interconnect 2 to select inputs for Row 3 CUs -----
    ICSel2x1_1, ICSel2x1_2, ICSel2x5_1, ICSel2x5_2 : in std_logic;
    ICSel2x2_1, ICSel2x2_2, ICSel2x3_1, ICSel2x3_2, ICSel2x4_1, ICSel2x4_2 : in std_logic_vector(1 downto 0);
    -----------------------------------------------------------------
    ------------------------------ IC3 ------------------------------
    En3x1, En3x2, En3x3, En3x4, En3x5 : in std_logic; -- Enable signal for InterConnect 3 Multiplexers
    ----- Selectors for Multiplexers in Interconnect 3 to select inputs for Row 4 CUs -----
    ICSel3x1_1, ICSel3x1_2, ICSel3x2_1, ICSel3x2_2 : in std_logic_vector(1 downto 0); 
    ICSel3x3_1, ICSel3x3_2, ICSel3x4_1, ICSel3x4_2, ICSel3x5_1, ICSel3x5_2 : in std_logic; 
    -----------------------------------------------------------------
    ------------------------------ IC4 ------------------------------
    En4x1, En4x2, En4x3, En4x4, En4x5 : in std_logic; -- Enable signal for InterConnect 4 Multiplexers
    ----- Selectors for Multiplexers in Interconnect 4 to select inputs for Row 5 CUs -----
    ICSel4x1_1, ICSel4x1_2, ICSel4x2_1, ICSel4x2_2, ICSel4x3_1, ICSel4x3_2, ICSel4x4_1, ICSel4x4_2, ICSel4x5_1, ICSel4x5_2 : in std_logic 
  );
end DFG;

architecture Behavioral of DFG is

signal Out1x1,Out1x2,Out1x3,Out1x4,Out1x5 : std_logic_vector(3 downto 0); -- Outputs of the Row1 CUs
signal Out2x1,Out2x2,Out2x3,Out2x4,Out2x5 : std_logic_vector(3 downto 0); -- Outputs of the Row2 CUs
signal Out3x1,Out3x2,Out3x3,Out3x4,Out3x5 : std_logic_vector(3 downto 0); -- Outputs of the Row3 CUs
signal Out4x1,Out4x2,Out4x3,Out4x4,Out4x5 : std_logic_vector(3 downto 0); -- Outputs of the Row4 CUs
signal Out5x1,Out5x2,Out5x3,Out5x4,Out5x5 : std_logic_vector(3 downto 0); -- Outputs of the Row5 CUs
------------------------------ IC1 ------------------------------
----- Outputs of the Interconnect 1 Multiplexers to feed it to the Row2 CU inputs -----
  signal ICOut1x1_1, ICOut1x2_1, ICOut1x3_1, ICOut1x4_1, ICOut1x5_1 : std_logic_vector(3 downto 0);
  signal ICOut1x1_2, ICOut1x2_2, ICOut1x3_2, ICOut1x4_2, ICOut1x5_2 : std_logic_vector(3 downto 0);
-----------------------------------------------------------------
------------------------------ IC2 ------------------------------
----- Outputs of the Interconnect 2 Multiplexers to feed it to the Row3 CU inputs -----
  signal ICOut2x1_1, ICOut2x2_1, ICOut2x3_1, ICOut2x4_1, ICOut2x5_1 : std_logic_vector(3 downto 0);
  signal ICOut2x1_2, ICOut2x2_2, ICOut2x3_2, ICOut2x4_2, ICOut2x5_2 : std_logic_vector(3 downto 0);
-----------------------------------------------------------------
------------------------------ IC3 ------------------------------
----- Outputs of the Interconnect 3 Multiplexers to feed it to the Row4 CU inputs -----
  signal ICOut3x1_1, ICOut3x2_1, ICOut3x3_1, ICOut3x4_1, ICOut3x5_1 : std_logic_vector(3 downto 0);
  signal ICOut3x1_2, ICOut3x2_2, ICOut3x3_2, ICOut3x4_2, ICOut3x5_2 : std_logic_vector(3 downto 0);
-----------------------------------------------------------------
------------------------------ IC4 ------------------------------
----- Outputs of the Interconnect 4 Multiplexers to feed it to the Row5 CU inputs -----
  signal ICOut4x1_1, ICOut4x2_1, ICOut4x3_1, ICOut4x4_1, ICOut4x5_1 : std_logic_vector(3 downto 0);
  signal ICOut4x1_2, ICOut4x2_2, ICOut4x3_2, ICOut4x4_2, ICOut4x5_2 : std_logic_vector(3 downto 0);
-----------------------------------------------------------------
begin

CU1x1: entity work.CU(Behavioral)
Port map(A => A1, B => B1, Y => Out1x1, En => CUEn1x1, Sel => Sel1x1 );

CU1x2: entity work.CU(Behavioral)
Port map(A => A2, B => B2, Y => Out1x2, En => CUEn1x2, Sel => Sel1x2 );

CU1x3: entity work.CU(Behavioral)
Port map(A => A3, B => B3, Y => Out1x3, En => CUEn1x3, Sel => Sel1x3 );

CU1x4: entity work.CU(Behavioral)
Port map(A => A4, B => B4, Y => Out1x4, En => CUEn1x4, Sel => Sel1x4 );

CU1x5: entity work.CU(Behavioral)
Port map(A => A5, B => B5, Y => Out1x5, En => CUEn1x5, Sel => Sel1x5 );

IC1: entity work.InterConnect_1(Behavioral)
Port map(A => Out1x1, B => Out1x2, C => Out1x3, D => Out1x4, E => Out1x5,
En1x1 => En1x1, En1x2 => En1x2, En1x3 => En1x3, En1x4 => En1x4, En1x5 => En1x5,
ICOut1x1_1 => ICOut1x1_1, ICOut1x2_1 => ICOut1x2_1, ICOut1x3_1 => ICOut1x3_1, ICOut1x4_1 => ICOut1x4_1, ICOut1x5_1 => ICOut1x5_1, 
ICOut1x1_2 => ICOut1x1_2, ICOut1x2_2 => ICOut1x2_2, ICOut1x3_2 => ICOut1x3_2, ICOut1x4_2 => ICOut1x4_2, ICOut1x5_2 => ICOut1x5_2,
ICSel1x1_1 => ICSel1x1_1, ICSel1x2_1 => ICSel1x2_1, ICSel1x3_1 => ICSel1x3_1, ICSel1x4_1 => ICSel1x4_1, ICSel1x5_1 => ICSel1x5_1,
ICSel1x1_2 => ICSel1x1_2, ICSel1x2_2 => ICSel1x2_2, ICSel1x3_2 => ICSel1x3_2, ICSel1x4_2 => ICSel1x4_2, ICSel1x5_2 => ICSel1x5_2);

CU2x1: entity work.CU(Behavioral)
Port map(A => ICOut1x1_1, B => ICOut1x1_2, Y => Out2x1, En => CUEn2x1, Sel => Sel2x1 );

CU2x2: entity work.CU(Behavioral)
Port map(A => ICOut1x2_1, B => ICOut1x2_2, Y => Out2x2, En => CUEn2x2, Sel => Sel2x2 );

CU2x3: entity work.CU(Behavioral)
Port map(A => ICOut1x3_1, B => ICOut1x3_2, Y => Out2x3, En => CUEn2x3, Sel => Sel2x3 );

CU2x4: entity work.CU(Behavioral)
Port map(A => ICOut1x4_1, B => ICOut1x4_2, Y => Out2x4, En => CUEn2x4, Sel => Sel2x4 );

CU2x5: entity work.CU(Behavioral)
Port map(A => ICOut1x5_1, B => ICOut1x5_2, Y => Out2x5, En => CUEn2x5, Sel => Sel2x5 );

-------------------------------------------------
IC2: entity work.InterConnect_2(Behavioral)
Port map(A => Out2x1, B => Out2x2, C => Out2x3, D => Out2x4, E => Out2x5,
A1 => Out1x1, B1 => Out1x2, C1 => Out1x3, D1 => Out1x4, E1 => Out1x5,
En2x1 => En2x1, En2x2 => En2x2, En2x3 => En2x3, En2x4 => En2x4, En2x5 => En2x5,
ICOut2x1_1 => ICOut2x1_1, ICOut2x2_1 => ICOut2x2_1, ICOut2x3_1 => ICOut2x3_1, ICOut2x4_1 => ICOut2x4_1, ICOut2x5_1 => ICOut2x5_1, 
ICOut2x1_2 => ICOut2x1_2, ICOut2x2_2 => ICOut2x2_2, ICOut2x3_2 => ICOut2x3_2, ICOut2x4_2 => ICOut2x4_2, ICOut2x5_2 => ICOut2x5_2,
ICSel2x1_1 => ICSel2x1_1, ICSel2x2_1 => ICSel2x2_1, ICSel2x3_1 => ICSel2x3_1, ICSel2x4_1 => ICSel2x4_1, ICSel2x5_1 => ICSel2x5_1,
ICSel2x1_2 => ICSel2x1_2, ICSel2x2_2 => ICSel2x2_2, ICSel2x3_2 => ICSel2x3_2, ICSel2x4_2 => ICSel2x4_2, ICSel2x5_2 => ICSel2x5_2);
---------------------------------

CU3x1: entity work.CU(Behavioral)
Port map(A => ICOut2x1_1, B => ICOut2x1_2, Y => Out3x1, En => CUEn3x1, Sel => Sel3x1 );

CU3x2: entity work.CU(Behavioral)
Port map(A => ICOut2x2_1, B => ICOut2x2_2, Y => Out3x2, En => CUEn3x2, Sel => Sel3x2 );

CU3x3: entity work.CU(Behavioral)
Port map(A => ICOut2x3_1, B => ICOut2x3_2, Y => Out3x3, En => CUEn3x3, Sel => Sel3x3 );

CU3x4: entity work.CU(Behavioral)
Port map(A => ICOut2x4_1, B => ICOut2x4_2, Y => Out3x4, En => CUEn3x4, Sel => Sel3x4 );

CU3x5: entity work.CU(Behavioral)
Port map(A => ICOut2x5_1, B => ICOut2x5_2, Y => Out3x5, En => CUEn3x5, Sel => Sel3x5 );

-------------------------------------------------
IC3: entity work.InterConnect_3(Behavioral)
Port map(A => Out3x1, B => Out3x2, C => Out3x3, D => Out3x4, E => Out3x5,
A1 => Out2x1, C1 => Out2x3,
En3x1 => En3x1, En3x2 => En3x2, En3x3 => En3x3, En3x4 => En3x4, En3x5 => En3x5,
ICOut3x1_1 => ICOut3x1_1, ICOut3x2_1 => ICOut3x2_1, ICOut3x3_1 => ICOut3x3_1, ICOut3x4_1 => ICOut3x4_1, ICOut3x5_1 => ICOut3x5_1, 
ICOut3x1_2 => ICOut3x1_2, ICOut3x2_2 => ICOut3x2_2, ICOut3x3_2 => ICOut3x3_2, ICOut3x4_2 => ICOut3x4_2, ICOut3x5_2 => ICOut3x5_2,
ICSel3x1_1 => ICSel3x1_1, ICSel3x2_1 => ICSel3x2_1, ICSel3x3_1 => ICSel3x3_1, ICSel3x4_1 => ICSel3x4_1, ICSel3x5_1 => ICSel3x5_1,
ICSel3x1_2 => ICSel3x1_2, ICSel3x2_2 => ICSel3x2_2, ICSel3x3_2 => ICSel3x3_2, ICSel3x4_2 => ICSel3x4_2, ICSel3x5_2 => ICSel3x5_2);
---------------------------------

CU4x1: entity work.CU(Behavioral)
Port map(A => ICOut3x1_1, B => ICOut3x1_2, Y => Out4x1, En => CUEn4x1, Sel => Sel4x1 );

CU4x2: entity work.CU(Behavioral)
Port map(A => ICOut3x2_1, B => ICOut3x2_2, Y => Out4x2, En => CUEn4x2, Sel => Sel4x2 );

CU4x3: entity work.CU(Behavioral)
Port map(A => ICOut3x3_1, B => ICOut3x3_2, Y => Out4x3, En => CUEn4x3, Sel => Sel4x3 );

CU4x4: entity work.CU(Behavioral)
Port map(A => ICOut3x4_1, B => ICOut3x4_2, Y => Out4x4, En => CUEn4x4, Sel => Sel4x4 );

CU4x5: entity work.CU(Behavioral)
Port map(A => ICOut3x5_1, B => ICOut3x5_2, Y => Out4x5, En => CUEn4x5, Sel => Sel4x5 );

-------------------------------------------------
IC4: entity work.InterConnect_4(Behavioral)
Port map(A => Out4x1, B => Out4x2, C => Out4x3, D => Out4x4, E => Out4x5,
En4x1 => En4x1, En4x2 => En4x2, En4x3 => En4x3, En4x4 => En4x4, En4x5 => En4x5,
ICOut4x1_1 => ICOut4x1_1, ICOut4x2_1 => ICOut4x2_1, ICOut4x3_1 => ICOut4x3_1, ICOut4x4_1 => ICOut4x4_1, ICOut4x5_1 => ICOut4x5_1, 
ICOut4x1_2 => ICOut4x1_2, ICOut4x2_2 => ICOut4x2_2, ICOut4x3_2 => ICOut4x3_2, ICOut4x4_2 => ICOut4x4_2, ICOut4x5_2 => ICOut4x5_2,
ICSel4x1_1 => ICSel4x1_1, ICSel4x2_1 => ICSel4x2_1, ICSel4x3_1 => ICSel4x3_1, ICSel4x4_1 => ICSel4x4_1, ICSel4x5_1 => ICSel4x5_1,
ICSel4x1_2 => ICSel4x1_2, ICSel4x2_2 => ICSel4x2_2, ICSel4x3_2 => ICSel4x3_2, ICSel4x4_2 => ICSel4x4_2, ICSel4x5_2 => ICSel4x5_2);
---------------------------------

CU5x1: entity work.CU(Behavioral)
Port map(A => ICOut4x1_1, B => ICOut4x1_2, Y => Out5x1, En => CUEn5x1, Sel => Sel5x1 );

CU5x2: entity work.CU(Behavioral)
Port map(A => ICOut4x2_1, B => ICOut4x2_2, Y => Out5x2, En => CUEn5x2, Sel => Sel5x2 );

CU5x3: entity work.CU(Behavioral)
Port map(A => ICOut4x3_1, B => ICOut4x3_2, Y => Out5x3, En => CUEn5x3, Sel => Sel5x3 );

CU5x4: entity work.CU(Behavioral)
Port map(A => ICOut4x4_1, B => ICOut4x4_2, Y => Out5x4, En => CUEn5x4, Sel => Sel5x4 );

CU5x5: entity work.CU(Behavioral)
Port map(A => ICOut4x5_1, B => ICOut4x5_2, Y => Out5x5, En => CUEn5x5, Sel => Sel5x5 );

Y1 <= Out5x1;
Y2 <= Out5x2;
Y3 <= Out5x3;
Y4 <= Out5x4;
Y5 <= Out5x5;
end Behavioral;
