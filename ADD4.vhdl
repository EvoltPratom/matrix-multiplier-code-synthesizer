
  -- 4 bit ripple carry adder


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ADD4 is
    port (
         A: in std_logic_vector(3 downto 0);
         B: in std_logic_vector(3 downto 0);
         cin: in std_logic;
         sum4: out std_logic_vector(3 downto 0);
         f_cry: out std_logic
    );
end ADD4;

architecture ADD4_df of ADD4 is

component ADD1 is
    port (
         a,b,c: in std_logic;
        sum,cry: out std_logic
    );
end component ADD1;

signal cry4 : std_logic_vector(2 downto 0);
begin
    FA0: ADD1 port map (
        a => A(0) , b =>B(0) , c => cin, sum => sum4(0) , cry => cry4(0)
    );
    FA1: ADD1 port map (
        a => A(1) , b =>B(1) , c => cry4(0), sum => sum4(1) , cry => cry4(1)
    );
    FA2: ADD1 port map (
        a => A(2) , b =>B(2) , c => cry4(1), sum => sum4(2) , cry => cry4(2)
    );
    FA3: ADD1 port map (
        a => A(3) , b =>B(3) , c => cry4(2), sum => sum4(3) , cry => f_cry
    );

end ADD4_df;

