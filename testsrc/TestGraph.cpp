// DO NOT MODIFY

#ifndef __TESTGRAPH_CPP__
#define __TESTGRAPH_CPP__

#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <sstream>
#include <list>

#include "Graph.hpp"

// this reads in a graph from input stream to memory
template <class T>
int buildGraph(Graph<T>& g, std::ifstream& input, bool undirected = false) {
  if (input.is_open()) {
    std::string line;

    while (getline(input, line)) {
      std::stringstream in(line);
      T v1;
      in >> v1;
      T v2;
      in >> v2;
      float w;
      in >> w;
      if (g.vertices.count(v1) == 0) {
        g.vertices[v1] = new Vertex<T>(v1);
      }
      if (g.vertices.count(v2) == 0) {
        g.vertices[v2] = new Vertex<T>(v2);
      }

      g.vertices[v1]->edges.insert(v2);
      g.set_weight(v1, v2, w);
      if (undirected) {
        g.vertices[v2]->edges.insert(v1);
        g.set_weight(v2, v1, w);
      }
    }
    input.close();
    return 1;
  }
  return 0;
}

int buildExchanges(std::list<Exchange>& tbr, std::ifstream& input) {
  if (input.is_open()) {
    std::string line;

    while (getline(input, line)) {
      std::stringstream in(line);
      std::string v1;
      in >> v1;
      std::string v2;
      in >> v2;
      float w;
      in >> w;
      tbr.push_front(Exchange(v1, v2, w));
    }
    input.close();
    return 1;
  }
  return 0;
}

int buildFees(std::map<std::string, float>& tbr, std::ifstream& input) {
  if (input.is_open()) {
    std::string line;

    while (getline(input, line)) {
      if (line.length() == 0) {
        break;
      }
      std::stringstream in(line);
      std::string v1;
      in >> v1;
      float w;
      in >> w;
      tbr[v1] = w;
    }
    return 1;
  }
  return 0;
}

#endif
