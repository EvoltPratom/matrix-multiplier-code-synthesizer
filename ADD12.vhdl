----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:44:48 02/16/2022 
-- Design Name: 
-- Module Name:    ADD12 - ADD12_df 
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

entity ADD12 is
    port (
         A: in std_logic_vector(11 downto 0);
         B: in std_logic_vector(11 downto 0);
         cin: in std_logic;
         sum12: out std_logic_vector(11 downto 0);
         f_cry: out std_logic
    );
end ADD12;

architecture ADD12_df of ADD12 is
component ADD1 is
    port (
         a,b,c: in std_logic;
        sum,cry: out std_logic
    );
end component ADD1;

signal cry12 : std_logic_vector(10 downto 0);

begin
    FA0: ADD1 port map (
        a => A(0) , b =>B(0) , c => cin, sum => sum12(0) , cry => cry12(0)
    );
    FA1: ADD1 port map (
        a => A(1) , b =>B(1) , c => cry12(0), sum => sum12(1) , cry => cry12(1)
    );
    FA2: ADD1 port map (
        a => A(2) , b =>B(2) , c => cry12(1), sum => sum12(2) , cry => cry12(2)
    );
    FA3: ADD1 port map (
        a => A(3) , b =>B(3) , c => cry12(2), sum => sum12(3) , cry => cry12(3)
    );
    FA4: ADD1 port map (
        a => A(4) , b =>B(4) , c => cry12(3), sum => sum12(4) , cry => cry12(4)
    );
    FA5: ADD1 port map (
        a => A(5) , b =>B(5) , c => cry12(4), sum => sum12(5) , cry => cry12(5)
    );
    FA6: ADD1 port map (
        a => A(6) , b =>B(6) , c => cry12(5), sum => sum12(6) , cry => cry12(6)
    );
	 FA7: ADD1 port map (
        a => A(7) , b =>B(7) , c => cry12(6), sum => sum12(7) , cry => cry12(7)
    );
    FA8: ADD1 port map (
        a => A(8) , b =>B(8) , c => cry12(7), sum => sum12(8) , cry => cry12(8)
    );
    FA9: ADD1 port map (
        a => A(9) , b =>B(9) , c => cry12(8), sum => sum12(9) , cry => cry12(9)
    );
    FA10: ADD1 port map (
        a => A(10) , b =>B(10) , c => cry12(9), sum => sum12(10) , cry => cry12(10)
    );	 
    FA11: ADD1 port map (
        a => A(11) , b =>B(11) , c => cry12(10), sum => sum12(11) , cry => f_cry
    );
end ADD12_df;

