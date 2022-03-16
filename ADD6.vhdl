----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:30 02/16/2022 
-- Design Name: 
-- Module Name:    ADD6 - ADD6_df 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD6 is
    port (
         A: in std_logic_vector(5 downto 0);
         B: in std_logic_vector(5 downto 0);
         cin: in std_logic;
         sum6: out std_logic_vector(5 downto 0);
         f_cry: out std_logic
    );
end ADD6;

architecture ADD6_df of ADD6 is
component ADD1 is
    port (
         a,b,c: in std_logic;
        sum,cry: out std_logic
    );
end component ADD1;

signal cry6 : std_logic_vector(4 downto 0);
begin
    FA0: ADD1 port map (
        a => A(0) , b =>B(0) , c => cin, sum => sum6(0) , cry => cry6(0)
    );
    FA1: ADD1 port map (
        a => A(1) , b =>B(1) , c => cry6(0), sum => sum6(1) , cry => cry6(1)
    );
    FA2: ADD1 port map (
        a => A(2) , b =>B(2) , c => cry6(1), sum => sum6(2) , cry => cry6(2)
    );
    FA3: ADD1 port map (
        a => A(3) , b =>B(3) , c => cry6(2), sum => sum6(3) , cry => cry6(3)
    );
    FA4: ADD1 port map (
        a => A(4) , b =>B(4) , c => cry6(3), sum => sum6(4) , cry => cry6(4)
    );
    FA5: ADD1 port map (
        a => A(5) , b =>B(5) , c => cry6(4), sum => sum6(5) , cry => f_cry
    );


end ADD6_df;

