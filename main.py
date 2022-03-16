import argparse
from helper1 import makedotproduct
from helper2 import matmulmaker
parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('shape', metavar='N', type=tuple, help='axb bxc so (a,b,c)')

a,b,c = tuple(map(int, parser.parse_args().shape))

makedotproduct(b)
matmulmaker(a,b,c)





