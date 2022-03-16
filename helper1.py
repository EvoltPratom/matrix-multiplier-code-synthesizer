def makedotproduct(dim):
    # dim = b # col of m1
    no_of_mul8 = dim
    no_of_add32 = dim-1
    d1MSB = 8 * dim - 1

    write_lines = []

    write_lines.append("library IEEE;\n")
    write_lines.append("use IEEE.STD_LOGIC_1164.ALL;\n")
    write_lines.append("\n")
    write_lines.append("entity dotp is\n")
    write_lines.append(f"-- Dot product of {dim}x{dim} elements\n")
    write_lines.append("port (")
    write_lines.append("\n")
    write_lines.append(f"d1,d2 : in std_logic_vector({d1MSB} downto 0);")
    write_lines.append("\n")
    write_lines.append("d3 : out std_logic_vector(31 downto 0)") # 32 bit adder
    write_lines.append("\n")
    write_lines.append(");")
    write_lines.append("\n")
    write_lines.append("end dotP3;")
    write_lines.append("\n")

    # now for the architecture

    write_lines.append("architecture Behavioral of dotP3 is")
    write_lines.append("\n")
    write_lines.append(f"--Intermediate signals {no_of_mul8} multipliers and {no_of_add32} adders")
    write_lines.append("\n")

    # Intermediate signals t1t2t3. . . a1a2a3 . .

    temp1 = " ,".join([f"t{i}" for i in range(no_of_mul8)])
    write_lines.append(f"signal {temp1} : std_logic_vector (15 downto 0);" )
    write_lines.append("\n")
    temp2 = " ,".join([f"a{i}" for i in range(no_of_add32)])
    write_lines.append(f"signal {temp2} : std_logic_vector(31 downto 0);")
    # write_lines.append("")
    write_lines.append("\n")

    # start of begin

    write_lines.append("begin")
    write_lines.append("\n")

    write_lines.append(f"-- Mapping the {no_of_mul8} MUL8s")
    write_lines.append("\n")
    count = 0
    d1MSB_copy = d1MSB

    while d1MSB_copy>=0:
        write_lines.append(f"mul{count} : entity work.MUL8 port map(d1({d1MSB_copy} downto {d1MSB_copy-7}),d2({d1MSB_copy} downto {d1MSB_copy-7}),t{count});")
        write_lines.append("\n")
        d1MSB_copy -= 8
        count+=1



    write_lines.append(f"-- Now mapping the {no_of_add32} ADD32s")
    write_lines.append("\n")

    # adders

    for i in range(no_of_add32):
        if i==0:
            write_lines.append(f"add{i} : entity work.ADD16 port map(t0,t1,a0);")
            write_lines.append("\n")
            continue
        write_lines.append(f"add{i} : entity work.ADD16 port map(a{i-1},t{i+1},a{i});")
        write_lines.append("\n")


    write_lines.append(f"d3 <= a{no_of_add32-1};")
    write_lines.append("\n")

    write_lines.append("end Behavioral;")
    write_lines.append("\n")

    with open("nndotproduct.vhd","w") as f:
        f.writelines(write_lines)
