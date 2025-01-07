----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2023 04:03:21 PM
-- Design Name: 
-- Module Name: InterConnect_3 - Behavioral
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

entity InterConnect_3 is
  Port ( 
  A,B,C,D,E : in std_logic_vector(3 downto 0); -- Inputs to the Interconnect
  A1,C1 : in std_logic_vector(3 downto 0); -- Inputs for vertical interconnect, its from Row 2
  ---------- Outputs of Interconnect ----------
  ICOut3x1_1, ICOut3x2_1, ICOut3x3_1, ICOut3x4_1, ICOut3x5_1 : out std_logic_vector(3 downto 0);
  ICOut3x1_2, ICOut3x2_2, ICOut3x3_2, ICOut3x4_2, ICOut3x5_2 : out std_logic_vector(3 downto 0);
  ---------------------------------------------
  En3x1, En3x2, En3x3, En3x4, En3x5 : in std_logic; -- Enable signals for mirrored mux pair
  ---------- Selectors for multiplexers ----------
  ICSel3x1_1, ICSel3x2_1 : in std_logic_vector(1 downto 0); 
  ICSel3x1_2, ICSel3x2_2 : in std_logic_vector(1 downto 0); 
  ICSel3x3_1, ICSel3x4_1, ICSel3x5_1 : in std_logic; 
  ICSel3x3_2, ICSel3x4_2, ICSel3x5_2 : in std_logic 
  ------------------------------------------------
  );
end InterConnect_3;

architecture Behavioral of InterConnect_3 is

begin
Mux3x1_1: entity work.Mux_4x1(Behavioral)
Port map(P => B, Q => A, R => "0000", S => "0000", Y => ICOut3x1_1, En => En3x1, Sel => ICSel3x1_1 );
Mux3x1_2: entity work.Mux_4x1(Behavioral)
Port map(P => "0000", Q => A, R => B, S => C, Y => ICOut3x1_2, En => En3x1, Sel => ICSel3x1_2 );

Mux3x2_1: entity work.Mux_4x1(Behavioral) -----------------------
Port map(P => B, Q => A, R => "0000", S => A1, Y => ICOut3x2_1, En => En3x2, Sel => ICSel3x2_1 );
Mux3x2_2: entity work.Mux_4x1(Behavioral)
Port map(P => B, Q => C, R => D, S => C1, Y => ICOut3x2_2, En => En3x2, Sel => ICSel3x2_2 );

Mux3x3_1: entity work.Mux_2x1(Behavioral)
Port map(P => C, Q => B, Y => ICOut3x3_1, En => En3x3, Sel => ICSel3x3_1 );
Mux3x3_2: entity work.Mux_2x1(Behavioral)
Port map(P => C, Q => D, Y => ICOut3x3_2, En => En3x3, Sel => ICSel3x3_2 );

Mux3x4_1: entity work.Mux_2x1(Behavioral)
Port map(P => D, Q => C, Y => ICOut3x4_1, En => En3x4, Sel => ICSel3x4_1 );
Mux3x4_2: entity work.Mux_2x1(Behavioral)
Port map(P => D, Q => E, Y => ICOut3x4_2, En => En3x4, Sel => ICSel3x4_2 );

Mux3x5_1: entity work.Mux_2x1(Behavioral)
Port map(P => E, Q => D, Y => ICOut3x5_1, En => En3x5, Sel => ICSel3x5_1 );
Mux3x5_2: entity work.Mux_2x1(Behavioral)
Port map(P => E, Q => "0000", Y => ICOut3x5_2, En => En3x5, Sel => ICSel3x5_2 );

end Behavioral;
