  
  -- 4 bit vedic mupltiplier
  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUL4 is
    port (
        a : in std_logic_vector(3 downto 0);
		  b : in std_logic_vector(3 downto 0);
		  c : out std_logic_vector(7 downto 0)
		  
    );

end MUL4;

architecture MUL4_df of MUL4 is
-- 2 bit multiplier
component MUL2 is
    port (
        a : in std_logic_vector(1 downto 0);
		  b : in std_logic_vector(1 downto 0);
		  c : out std_logic_vector(3 downto 0)
		  
    );
end component MUL2;
-- 4 bit adder
component ADD4 is
    port (
         A: in std_logic_vector(3 downto 0);
         B: in std_logic_vector(3 downto 0);
         cin: in std_logic;
         sum4: out std_logic_vector(3 downto 0);
         f_cry: out std_logic
    );
end component ADD4;

component ADD6 is
    port (
         A: in std_logic_vector(5 downto 0);
         B: in std_logic_vector(5 downto 0);
         cin: in std_logic;
         sum6: out std_logic_vector(5 downto 0);
         f_cry: out std_logic
    );
end component ADD6;

signal q0,q1,q2,q3: std_logic_vector(3 downto 0);
signal q4 : std_logic_vector (3 downto 0);
signal q5 : std_logic_vector (5 downto 0);
signal q6 : std_logic_vector (5 downto 0);
signal q7 : std_logic_vector (4 downto 0);
signal q8 : std_logic_vector (5 downto 0);
signal q9 : std_logic_vector (1 downto 0);
signal q10 : std_logic_vector (5 downto 0);
signal q11 : std_logic_vector (5 downto 0);

begin
-- port map 4 2x2 vedic multipliers

vedic_mul_2x2_1: MUL2 port map( 
		a => a(1 downto 0), b => b(1 downto 0), c => q0(3 downto 0) 
);
vedic_mul_2x2_2: MUL2 port map( 
		a => a(3 downto 2), b => b(1 downto 0), c => q1(3 downto 0) 
);
vedic_mul_2x2_3: MUL2 port map( 
		a => a(1 downto 0), b => b(3 downto 2), c => q2(3 downto 0) 
);
vedic_mul_2x2_4: MUL2 port map( 
		a => a(3 downto 2), b => b(3 downto 2), c => q3(3 downto 0) 
);

-- port map 3 adders (one 4 bit and two 6 bit adders)
q4 <= "00"& q0(3 downto 2);

f4_bit_adder: ADD4 port map(
		A => q4, B => q1, sum4 => q7(3 downto 0), f_cry => q7(4),cin => '0'
);

q5 <= "00" & q2(3 downto 0); -- concatinating 00 at the beginning before adding
q6 <= q3(3 downto 0) & "00";
s6_bit_adder_1 : ADD6 port map(
	A => q5 , B=> q6 , sum6 => q8, cin => '0'
);

q11 <= "0" & q7; -- concatinating 0 at the beginning before adding
s6_bit_adder_2: ADD6 port map(
	A => q8 , B => q11 , sum6 => q10,cin => '0'
);

q9 <= q0(1 downto 0);

-- output is in q10 & q9 so

c <= q10 & q9;

end MUL4_df;

