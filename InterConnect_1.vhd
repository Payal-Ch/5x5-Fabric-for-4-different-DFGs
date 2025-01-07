----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2023 04:05:27 PM
-- Design Name: 
-- Module Name: InterConnect_1 - Behavioral
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

entity InterConnect_1 is
  Port (
  A,B,C,D,E : in std_logic_vector(3 downto 0); -- Inputs to the Interconnect
  ---------- Outputs of Interconnect ----------
  ICOut1x1_1, ICOut1x2_1, ICOut1x3_1, ICOut1x4_1, ICOut1x5_1 : out std_logic_vector(3 downto 0);
  ICOut1x1_2, ICOut1x2_2, ICOut1x3_2, ICOut1x4_2, ICOut1x5_2 : out std_logic_vector(3 downto 0);
  ---------------------------------------------
  En1x1, En1x2, En1x3, En1x4, En1x5 : in std_logic; -- Enable signals for mirrored mux pair
  ---------- Selectors for multiplexers ----------
  ICSel1x1_1, ICSel1x5_1 : in std_logic; 
  ICSel1x1_2, ICSel1x5_2 : in std_logic; 
  ICSel1x2_1, ICSel1x3_1, ICSel1x4_1 : in std_logic_vector(1 downto 0); 
  ICSel1x2_2, ICSel1x3_2, ICSel1x4_2 : in std_logic_vector(1 downto 0) 
  ------------------------------------------------
   );
end InterConnect_1;

architecture Behavioral of InterConnect_1 is

begin
Mux1x1_1: entity work.Mux_2x1(Behavioral)
Port map(P => A, Q => "0000", Y => ICOut1x1_1, En => En1x1, Sel => ICSel1x1_1 );
Mux1x1_2: entity work.Mux_2x1(Behavioral)
Port map(P => A, Q => B, Y => ICOut1x1_2, En => En1x1, Sel => ICSel1x1_2 );

Mux1x2_1: entity work.Mux_4x1(Behavioral)
Port map(P => C, Q => B, R => A, S => "0000", Y => ICOut1x2_1, En => En1x2, Sel => ICSel1x2_1 );
Mux1x2_2: entity work.Mux_4x1(Behavioral)
Port map(P => A, Q => B, R => C, S => D, Y => ICOut1x2_2, En => En1x2, Sel => ICSel1x2_2 );

Mux1x3_1: entity work.Mux_4x1(Behavioral)
Port map(P => D, Q => C, R => B, S => A, Y => ICOut1x3_1, En => En1x3, Sel => ICSel1x3_1 );
Mux1x3_2: entity work.Mux_4x1(Behavioral)
Port map(P => B, Q => C, R => D, S => E, Y => ICOut1x3_2, En => En1x3, Sel => ICSel1x3_2 );

Mux1x4_1: entity work.Mux_4x1(Behavioral)
Port map(P => E, Q => D, R => C, S => B, Y => ICOut1x4_1, En => En1x4, Sel => ICSel1x4_1 );
Mux1x4_2: entity work.Mux_4x1(Behavioral)
Port map(P => C, Q => D, R => E, S => "0000", Y => ICOut1x4_2, En => En1x4, Sel => ICSel1x4_2 );

Mux1x5_1: entity work.Mux_2x1(Behavioral)
Port map(P => E, Q => D, Y => ICOut1x5_1, En => En1x5, Sel => ICSel1x5_1 );
Mux1x5_2: entity work.Mux_2x1(Behavioral)
Port map(P => E, Q => "0000", Y => ICOut1x5_2, En => En1x5, Sel => ICSel1x5_2 );

end Behavioral;
