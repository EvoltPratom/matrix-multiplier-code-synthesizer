
 
-- 2 bit vedic multiplier

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUL2 is
    port (
        a : in std_logic_vector(1 downto 0);
		  b : in std_logic_vector(1 downto 0);
		  c : out std_logic_vector(3 downto 0)
		  
    );
end entity MUL2;


architecture MUL2_df of MUL2 is
signal s1,s2,s3,s4: std_logic;
begin

c(0) <= a(0) and b(0);
s1 <= a(1) and b(0);
s2 <= a(0) and b(1);
c(1) <= s1 xor s2;
s3 <= s1 and s2;
s4 <= a(1) and b(1);
c(2) <= s3 xor s4;
c(3) <= s3 and s4;

    
end architecture MUL2_df;