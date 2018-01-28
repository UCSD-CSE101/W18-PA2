// Tester for PA2 Bitvest
//
// DO NOT MODIFY

#ifndef __TEST_BITVEST_CPP__
#define __TEST_BITVEST_CPP__

#include <iostream>
#include <fstream>
#include <sstream>
#include <list>

#include "TestGraph.cpp"
#include "Bitvest.hpp"

// this reads in a graph from input stream to memory

int main(int argc, char * argv[]) {
  if (argc != 2) {
    std::cerr << "Invalid number of arguments; expecting 1 for file name" << std::endl;
    exit(1);
  }

  std::ifstream input (argv[1], std::ios::in);
  std::list<Exchange> exchanges;
  std::map<std::string, float> fees;

  if (!buildFees(fees, input)) {
    std::cerr << "Unable to build fees map, please check file format" << std::endl;
    exit(1);
  }

  if (!buildExchanges(exchanges, input)) {
    std::cerr << "Unable to build exchanges, please check file format" << std::endl;
    exit(1);
  }

  std::cout << "Trade status: " << bitvest(exchanges, fees) << std::endl;

  return 0;
}

#endif
