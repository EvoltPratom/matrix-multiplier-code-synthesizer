def matmulmaker(a,b,c):
    # a,b,c = 2,3,4

    # ?print = pprint.pprint
    #axb * bxc = axc

    write_lines = []
    write_lines.append("library IEEE;")
    write_lines.append("\n")
    write_lines.append("use IEEE.STD_LOGIC_1164.ALL;")
    write_lines.append("\n")
    write_lines.append("\n")
    write_lines.append("\n")

    # Entity Description
    write_lines.append(f" -- To Perform MatMul on {a}x{b} and {b}x{c} matrices ")
    write_lines.append("\n")
    write_lines.append("entity matmul is")
    write_lines.append("\n")
    write_lines.append("port(")
    write_lines.append("\n")
    write_lines.append(f"mat1 : in std_logic_vector({a*b*8-1} downto 0);")
    write_lines.append("\n")
    write_lines.append(f"mat2 : in std_logic_vector({b*c*8-1} downto 0);")
    write_lines.append("\n")
    write_lines.append(f"mat3 : out std_logic_vector({a*c*32-1} downto 0)")
    write_lines.append("\n")
    write_lines.append(");")
    write_lines.append("\n")
    write_lines.append("end matmul;")
    write_lines.append("\n")
    write_lines.append("\n")
    write_lines.append("\n")

    # Architecture Description

    write_lines.append("architecture Behavioral of matmul is")
    write_lines.append("\n")

    no_of_dPs = a*c

    temp3 = " ,".join([f"d{i}" for i in range(no_of_dPs)])
    write_lines.append(f"signal {temp3} : std_logic_vector(31 downto 0);")
    write_lines.append("\n")

    # for i in range(c):
    #     write_lines.append(f"signal x{i} : std_logic_vector({8*a-1} downto 0);")
    #     write_lines.append("\n")

    temp4 = " ,".join([f"x{i}" for i in range(c)])
    write_lines.append(f"signal {temp4} : std_logic_vector({8*a-1} downto 0);")
    write_lines.append("\n")


    write_lines.append("\n")
    write_lines.append("begin")
    write_lines.append("\n")


    #for mat1
    lolo = []
    cc = 0
    for i in range(a):
        lolo.append(f"mat1({cc + 8*b -1} downto {cc})")
        cc += 8*b
    # print(lolo)
    lolol = []
    for i in range(len(lolo)):
        for j in range(c):
            lolol.append(lolo[i])
    print(lolol)

    # for mat2
    xx= []
    count = 0
    for i in range(c):
        aa = [f"mat2({count + c*8*j+7} downto {count + c*8*j})" for j in range(b)]
        xx.append(aa[::-1])
        count +=8
    xx = [" & ".join(i) for i in xx]
    # print(xx)

    for i in xx:
        write_lines.append(f"x{xx.index(i)} <= {xx[xx.index(i)]};")
        write_lines.append("\n")

    # Dot Product port mapping

    for i in range(no_of_dPs):
        write_lines.append("\n")
        write_lines.append(f"dp{i}: entity work.dotp port map( {lolol[i]},x{i%c},d{i} );")
        write_lines.append("\n")

    write_lines.append("\n")
    kera = " & ".join([f"d{i}" for i in range(no_of_dPs-1,-1,-1)])
    write_lines.append(f"mat3 <= {kera};")
    write_lines.append("\n")
    write_lines.append("\n")

    write_lines.append("end Behavioral;")
    write_lines.append("\n")



    with open("nnmatmul.vhd","w") as f:
        f.writelines(write_lines)

