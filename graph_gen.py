# CSE 101 Winter 2018, PA 2
#
# Graph generator: DO NOT MODIFY
#
# The root vertex is always set to be 0

import random
import argparse
import math

def graph_gen(args):

   n = args["num"]
   p = args["prob"]
   w = args["weight"]

   print 'Generating graph with n={0}, p={1}, and w={2}'.format(n, p, w)
   filename = 'graphs/{0}_{1}_{2}'.format(p, n, w)
   output_file = open(filename, 'w')

   output_file.write('0\n')

   v = -1
   lp = math.log(1.0-p)

   u = 1
   while (u < n):
      lr = math.log(1.0 - random.random())
      v = v + 1 + int(lr / lp)
      while v >= u and u < n:
         v = v - u
         u = u + 1
      if u < n:
         output_file.write('{0} {1} {2:.4f}\n'.format(u, v, 1 + (w-1)*random.random()))

   output_file.close()

   print 'Graph written to file ' + filename

if __name__ == '__main__':
   parser = argparse.ArgumentParser()
   parser.add_argument('-n', action='store', dest='num', type=int,
         help='the number of vertices in the graph', required=True)
   parser.add_argument('-p', action='store', dest='prob', type=float,
         help='probability that an edge exists between vertex u and v -- must be in range (0.0, 1.0]', required=True)
   parser.add_argument('-w', action='store', dest='weight', type=float,
         help='Max edge weight. Weights will be randomly selected from the range [1.0, w].', required=True)
   args = vars(parser.parse_args())
   if args["prob"] <= 0.0:
      print("Probability must be in range (0.0, 1.0]")
   if args["num"] <= 0:
      print("Number of nodes must be positive.")
   if args["weight"] <= 0.0:
      print("Max weight must be positive.")
   graph_gen(args)
