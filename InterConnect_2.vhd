----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2023 02:55:21 PM
-- Design Name: 
-- Module Name: InterConnect_2 - Behavioral
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

entity InterConnect_2 is
  Port ( 
  A,B,C,D,E : in std_logic_vector(3 downto 0); --  -- Inputs to the Interconnect
  A1,B1,C1,D1,E1 : in std_logic_vector(3 downto 0);-- Inputs for vertical interconnect, its from Row 1
  ---------- Outputs of Interconnect ----------
  ICOut2x1_1, ICOut2x2_1, ICOut2x3_1, ICOut2x4_1, ICOut2x5_1 : out std_logic_vector(3 downto 0);
  ICOut2x1_2, ICOut2x2_2, ICOut2x3_2, ICOut2x4_2, ICOut2x5_2 : out std_logic_vector(3 downto 0);
  ---------------------------------------------
  En2x1, En2x2, En2x3, En2x4, En2x5 : in std_logic; -- Enable signals for mirrored mux pair
  ---------- Selectors for multiplexers ----------
  ICSel2x1_1, ICSel2x5_1 : in std_logic;
  ICSel2x1_2, ICSel2x5_2 : in std_logic; 
  ICSel2x2_1, ICSel2x3_1, ICSel2x4_1 : in std_logic_vector(1 downto 0); 
  ICSel2x2_2, ICSel2x3_2, ICSel2x4_2 : in std_logic_vector(1 downto 0)
  ------------------------------------------------
  );
end InterConnect_2;

architecture Behavioral of InterConnect_2 is

begin
Mux2x1_1: entity work.Mux_2x1(Behavioral)
Port map(P => A, Q => "0000", Y => ICOut2x1_1, En => En2x1, Sel => ICSel2x1_1 );
Mux2x1_2: entity work.Mux_2x1(Behavioral)
Port map(P => A, Q => B, Y => ICOut2x1_2, En => En2x1, Sel => ICSel2x1_2 );

Mux2x2_1: entity work.Mux_4x1(Behavioral)
Port map(P => B, Q => A, R => "0000", S => A1, Y => ICOut2x2_1, En => En2x2, Sel => ICSel2x2_1 );
Mux2x2_2: entity work.Mux_4x1(Behavioral)
Port map(P => B, Q => C, R => D, S => C1, Y => ICOut2x2_2, En => En2x2, Sel => ICSel2x2_2 );

Mux2x3_1: entity work.Mux_4x1(Behavioral)
Port map(P => C, Q => B, R => A, S => B1, Y => ICOut2x3_1, En => En2x3, Sel => ICSel2x3_1 );
Mux2x3_2: entity work.Mux_4x1(Behavioral)
Port map(P => C, Q => D, R => E, S => D1, Y => ICOut2x3_2, En => En2x3, Sel => ICSel2x3_2 );

Mux2x4_1: entity work.Mux_4x1(Behavioral)
Port map(P => D, Q => C, R => B, S => C1, Y => ICOut2x4_1, En => En2x4, Sel => ICSel2x4_1 );
Mux2x4_2: entity work.Mux_4x1(Behavioral)
Port map(P => D, Q => E, R => "0000", S => E1, Y => ICOut2x4_2, En => En2x4, Sel => ICSel2x4_2 );

Mux2x5_1: entity work.Mux_2x1(Behavioral)
Port map(P => E, Q => D, Y => ICOut2x5_1, En => En2x5, Sel => ICSel2x5_1 );
Mux2x5_2: entity work.Mux_2x1(Behavioral)
Port map(P => E, Q => "0000", Y => ICOut2x5_2, En => En2x5, Sel => ICSel2x5_2 );


end Behavioral;
