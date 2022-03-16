library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- 1 bit adder

entity ADD1 is
    port (
        a,b,c: in std_logic;
        sum,cry: out std_logic
    );
end entity ADD1;

architecture ADD1_df of ADD1 is

begin
    sum <= a xor b xor c;
    cry <= (a and b) or (b and c) or (a and c);
end architecture ADD1_df;