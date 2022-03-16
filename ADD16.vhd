----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:15:48 03/12/2022 
-- Design Name: 
-- Module Name:    ADD16 - Behavioral 
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

entity ADD16 is
    Port ( A: in std_logic_vector(15 downto 0);
         B: in std_logic_vector(15 downto 0);
         --cin: in std_logic;
         sum16: out std_logic_vector(15 downto 0);
         f_cry: out std_logic
		);
end ADD16;

architecture Behavioral of ADD16 is
signal cry16 : std_logic_vector(14 downto 0);
begin

    FA0: entity work.ADD1 port map (
        a => A(0) , b =>B(0) , c => '0', sum => sum16(0) , cry => cry16(0)
    );
    FA1: entity work.ADD1 port map (
        a => A(1) , b =>B(1) , c => cry16(0), sum => sum16(1) , cry => cry16(1)
    );
    FA2: entity work.ADD1 port map (
        a => A(2) , b =>B(2) , c => cry16(1), sum => sum16(2) , cry => cry16(2)
    );
    FA3: entity work.ADD1 port map (
        a => A(3) , b =>B(3) , c => cry16(2), sum => sum16(3) , cry => cry16(3)
    );
    FA4: entity work.ADD1 port map (
        a => A(4) , b =>B(4) , c => cry16(3), sum => sum16(4) , cry => cry16(4)
    );
    FA5: entity work.ADD1 port map (
        a => A(5) , b =>B(5) , c => cry16(4), sum => sum16(5) , cry => cry16(5)
    );
    FA6: entity work.ADD1 port map (
        a => A(6) , b =>B(6) , c => cry16(5), sum => sum16(6) , cry => cry16(6)
    );
	 FA7: entity work.ADD1 port map (
        a => A(7) , b =>B(7) , c => cry16(6), sum => sum16(7) , cry => cry16(7)
    );
    FA8: entity work.ADD1 port map (
        a => A(8) , b =>B(8) , c => cry16(7), sum => sum16(8) , cry => cry16(8)
    );
    FA9: entity work.ADD1 port map (
        a => A(9) , b =>B(9) , c => cry16(8), sum => sum16(9) , cry => cry16(9)
    );
    FA10: entity work.ADD1 port map (
        a => A(10) , b =>B(10) , c => cry16(9), sum => sum16(10) , cry => cry16(10)
    );	 
    FA11: entity work.ADD1 port map (
        a => A(11) , b =>B(11) , c => cry16(10), sum => sum16(11) , cry => cry16(11)
    );
    FA12: entity work.ADD1 port map (
        a => A(11) , b =>B(12) , c => cry16(11), sum => sum16(12) , cry => cry16(12)
    );
    FA13: entity work.ADD1 port map (
        a => A(11) , b =>B(13) , c => cry16(12), sum => sum16(13) , cry => cry16(13)
    );
    FA14: entity work.ADD1 port map (
        a => A(11) , b =>B(14) , c => cry16(13), sum => sum16(14) , cry => cry16(14)
    );
    FA15: entity work.ADD1 port map (
        a => A(11) , b =>B(15) , c => cry16(14), sum => sum16(15) , cry => f_cry
    );
end Behavioral;

