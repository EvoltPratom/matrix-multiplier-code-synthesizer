

-- 1 bit XOR
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity xor1 is
    port(
            x,y: in std_logic;
            z: out std_logic
        );
end entity xor1;

architecture xor1_df of xor1 is

begin
    z <= x xor y;
end architecture xor1_df;

-- 8 bit Adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD8 is
    port (
         A: in std_logic_vector(7 downto 0);
         B: in std_logic_vector(7 downto 0);
         cin: in std_logic;
         sum8: out std_logic_vector(7 downto 0);
         f_cry: out std_logic
    );
end entity ADD8;

architecture ADD8_df of ADD8 is
component ADD1 is
    port (
         a,b,c: in std_logic;
        sum,cry: out std_logic
    );
end component ADD1;

component xor1 is
    port (
            x,y: in std_logic;
            z: out std_logic
    );
end component xor1;

signal cry8 : std_logic_vector(6 downto 0);
signal mid_B : std_logic_vector(7 downto 0);



begin
-- Mapping the xor gates for substraction
    XO0: xor1 port map(
        x => cin, y => B(0) , z => mid_B(0)
    );
    XO1: xor1 port map(
        x => cin, y => B(1) , z => mid_B(1)
    );
    XO2: xor1 port map(
        x => cin, y => B(2) , z => mid_B(2)
    );
    XO3: xor1 port map(
        x => cin, y => B(3) , z => mid_B(3)
    );
    XO4: xor1 port map(
        x => cin, y => B(4) , z => mid_B(4)
    );
    XO5: xor1 port map(
        x => cin, y => B(5) , z => mid_B(5)
    );
    XO6: xor1 port map(
        x => cin, y => B(6) , z => mid_B(6)
    );
    XO7: xor1 port map(
        x => cin, y => B(7) , z => mid_B(7)
    );

-- The adding port map starts here
--
    FA0: ADD1 port map (
        a => A(0) , b =>mid_B(0) , c => cin, sum => sum8(0) , cry => cry8(0)
    );
    FA1: ADD1 port map (
        a => A(1) , b =>mid_B(1) , c => cry8(0), sum => sum8(1) , cry => cry8(1)
    );
    FA2: ADD1 port map (
        a => A(2) , b =>mid_B(2) , c => cry8(1), sum => sum8(2) , cry => cry8(2)
    );
    FA3: ADD1 port map (
        a => A(3) , b =>mid_B(3) , c => cry8(2), sum => sum8(3) , cry => cry8(3)
    );
    FA4: ADD1 port map (
        a => A(4) , b =>mid_B(4) , c => cry8(3), sum => sum8(4) , cry => cry8(4)
    );
    FA5: ADD1 port map (
        a => A(5) , b =>mid_B(5) , c => cry8(4), sum => sum8(5) , cry => cry8(5)
    );
    FA6: ADD1 port map (
        a => A(6) , b =>mid_B(6) , c => cry8(5), sum => sum8(6) , cry => cry8(6)
    );
    FA7: ADD1 port map (
        a => A(7) , b =>mid_B(7) , c => cry8(6), sum => sum8(7) , cry => f_cry
    );


end architecture ADD8_df;
