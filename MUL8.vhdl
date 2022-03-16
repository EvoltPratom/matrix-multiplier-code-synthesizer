----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:31 02/16/2022 
-- Design Name: 
-- Module Name:    MUL8 - MUL8_df 
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

entity MUL8 is
    port (
        a : in std_logic_vector(7 downto 0);
		  b : in std_logic_vector(7 downto 0);
		  c : out std_logic_vector(15 downto 0)
		  
    );
end MUL8;

architecture MUL8_df of MUL8 is
component MUL4 is
    port (
        a : in std_logic_vector(3 downto 0);
		  b : in std_logic_vector(3 downto 0);
		  c : out std_logic_vector(7 downto 0)
		  
    );

end component MUL4;

component ADD8 is
    port (
         A: in std_logic_vector(7 downto 0);
         B: in std_logic_vector(7 downto 0);
         cin: in std_logic;
         sum8: out std_logic_vector(7 downto 0);
         f_cry: out std_logic
    );
end component ADD8;

--12 bit adder

component ADD12 is
    port (
         A: in std_logic_vector(11 downto 0);
         B: in std_logic_vector(11 downto 0);
         cin: in std_logic;
         sum12: out std_logic_vector(11 downto 0);
         f_cry: out std_logic
    );
end component ADD12;

signal q0,q1,q2,q3 : std_logic_vector(7 downto 0);
signal q4 : std_logic_vector(7 downto 0);
signal q5 : std_logic_vector(11 downto 0);
signal q6 : std_logic_vector(11 downto 0);
signal q7 : std_logic_vector(7 downto 0);
signal q8 : std_logic_vector(11 downto 0);
signal q9 : std_logic_vector(11 downto 0);
signal q10 : std_logic_vector(11 downto 0);
signal q11 : std_logic_vector(3 downto 0);


begin

-- port mapping 4 4x4 vedic multipliers

vedic_mul_4x4_1: MUL4 port map(
	a => a(3 downto 0) , b => b(3 downto 0) , c => q0(7 downto 0)
);
vedic_mul_4x4_2: MUL4 port map(
	a => a(7 downto 4) , b => b(3 downto 0) , c => q1(7 downto 0)
);
vedic_mul_4x4_3: MUL4 port map(
	a => a(3 downto 0) , b => b(7 downto 4) , c => q2(7 downto 0)
);
vedic_mul_4x4_4: MUL4 port map(
	a => a(7 downto 4) , b => b(7 downto 4) , c => q3(7 downto 0)
);

-- port mapping 3 adders

--adder1
q4 <= "0000" & q0(7 downto 4);
e8_bit_adder: ADD8 port map( 
	A => q4 , B => q1 , cin => '0' , sum8 => q7
);

--adder2
q5 <= "0000" & q2;
q6 <= q3 & "0000";
t12_bit_adder_1 : ADD12 port map(
	A => q5, B => q6, cin => '0' , sum12 => q9
);

--adder3
q8 <= "0000" & q7; -- adding zeros to make 8 bit ->  12 bit
t12_bit_adder_2 : ADD12 port map(
	A => q8, B => q9, cin => '0' , sum12 => c(15 downto 4) -- sum 12 bits
);

--q11 <= q0(3 downto 0); -- 4 bits
--c <= q10 & q11; -- total 16 bits
c(3 downto 0) <= q0(3 downto 0);

end MUL8_df;

