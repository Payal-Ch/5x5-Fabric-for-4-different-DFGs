----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2023 10:50:13 AM
-- Design Name: 
-- Module Name: InterConnect_4 - Behavioral
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

entity InterConnect_4 is
  Port ( 
  A,B,C,D,E : in std_logic_vector(3 downto 0); -- Inputs to the Interconnect
  ---------- Outputs of Interconnect ----------
  ICOut4x1_1, ICOut4x2_1, ICOut4x3_1, ICOut4x4_1, ICOut4x5_1 : out std_logic_vector(3 downto 0);
  ICOut4x1_2, ICOut4x2_2, ICOut4x3_2, ICOut4x4_2, ICOut4x5_2 : out std_logic_vector(3 downto 0);
  ---------------------------------------------
  En4x1, En4x2, En4x3, En4x4, En4x5 : in std_logic; -- Enable signals for mirrored mux pair
  ---------- Selectors for multiplexers ----------
  ICSel4x1_1, ICSel4x2_1, ICSel4x3_1, ICSel4x4_1, ICSel4x5_1 : in std_logic; 
  ICSel4x1_2, ICSel4x2_2, ICSel4x3_2, ICSel4x4_2, ICSel4x5_2 : in std_logic 
  ------------------------------------------------
  );
end InterConnect_4;

architecture Behavioral of InterConnect_4 is

begin

Mux4x1_1: entity work.Mux_2x1(Behavioral)
Port map(P => A, Q => "0000", Y => ICOut4x1_1, En => En4x1, Sel => ICSel4x1_1 );
Mux4x1_2: entity work.Mux_2x1(Behavioral)
Port map(P => A, Q => B, Y => ICOut4x1_2, En => En4x1, Sel => ICSel4x1_2 );

Mux4x2_1: entity work.Mux_2x1(Behavioral)
Port map(P => B, Q => A, Y => ICOut4x2_1, En => En4x2, Sel => ICSel4x2_1 );
Mux4x2_2: entity work.Mux_2x1(Behavioral)
Port map(P => B, Q => C, Y => ICOut4x2_2, En => En4x2, Sel => ICSel4x2_2 );

Mux4x3_1: entity work.Mux_2x1(Behavioral)
Port map(P => C, Q => B, Y => ICOut4x3_1, En => En4x3, Sel => ICSel4x3_1 );
Mux4x3_2: entity work.Mux_2x1(Behavioral)
Port map(P => C, Q => D, Y => ICOut4x3_2, En => En4x3, Sel => ICSel4x3_2 );

Mux4x4_1: entity work.Mux_2x1(Behavioral)
Port map(P => D, Q => C, Y => ICOut4x4_1, En => En4x4, Sel => ICSel4x4_1 );
Mux4x4_2: entity work.Mux_2x1(Behavioral)
Port map(P => D, Q => E, Y => ICOut4x4_2, En => En4x4, Sel => ICSel4x4_2 );

Mux4x5_1: entity work.Mux_2x1(Behavioral)
Port map(P => E, Q => D, Y => ICOut4x5_1, En => En4x5, Sel => ICSel4x5_1 );
Mux4x5_2: entity work.Mux_2x1(Behavioral)
Port map(P => E, Q => "0000", Y => ICOut4x5_2, En => En4x5, Sel => ICSel4x5_2 );

end Behavioral;
