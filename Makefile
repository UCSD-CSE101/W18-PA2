# CSE 101 PA 2 Makefile
#
# DO NOT MODIFY

CC=g++
FLAGS=-std=c++0x -g -I./

TEST_Dijkstra = testsrc/TestDijkstra.cpp Dijkstra.cpp
Dijkstra = Dijkstra.cpp Graph.hpp Dijkstra.hpp
TEST_Prim = testsrc/TestPrim.cpp Prim.cpp
Prim = Prim.cpp Graph.hpp Prim.hpp
TEST_PrimDijk = testsrc/TestPrimDijk.cpp PrimDijk.cpp
PrimDijk = PrimDijk.cpp Graph.hpp PrimDijk.hpp
TEST_Bitvest = testsrc/TestBitvest.cpp Bitvest.cpp
Bitvest = Bitvest.cpp Graph.hpp Bitvest.hpp
TEST_Graph = testsrc/TestGraph.cpp Graph.hpp
PA_SRCS = $(TEST_Dijkstra) $(Dijkstra) $(TEST_Prim) $(Prim) $(TEST_PrimDijk) $(PrimDijk) $(TEST_Bitvest) $(Bitvest) $(TEST_Graph)

BUILD = build

$(BUILD):
	mkdir $(BUILD)

TestDijkstra : $(BUILD)/Dijkstra.o $(BUILD)/TestDijkstra.o
	$(CC) $(FLAGS) $^ -o $(BUILD)/$@
$(BUILD)/TestDijkstra.o : $(TEST_Dijkstra) | $(BUILD)
	$(CC) $(FLAGS) -c $< -o $@
$(BUILD)/Dijkstra.o : $(Dijkstra) | $(BUILD)
	$(CC) $(FLAGS) -c $< -o $@

TestPrim : $(BUILD)/Prim.o $(BUILD)/TestPrim.o
	$(CC) $(FLAGS) $^ -o $(BUILD)/$@
$(BUILD)/TestPrim.o : $(TEST_Prim) | $(BUILD)
	$(CC) $(FLAGS) -c $< -o $@
$(BUILD)/Prim.o : $(Prim) | $(BUILD)
	$(CC) $(FLAGS) -c $< -o $@

TestPrimDijk : $(BUILD)/PrimDijk.o $(BUILD)/TestPrimDijk.o
	$(CC) $(FLAGS) $^ -o $(BUILD)/$@
$(BUILD)/TestPrimDijk.o : $(TEST_PrimDijk) | $(BUILD)
	$(CC) $(FLAGS) -c $< -o $@
$(BUILD)/PrimDijk.o : $(PrimDijk) | $(BUILD)
	$(CC) $(FLAGS) -c $< -o $@

TestBitvest : $(BUILD)/Bitvest.o $(BUILD)/TestBitvest.o
	$(CC) $(FLAGS) $^ -o $(BUILD)/$@
$(BUILD)/TestBitvest.o : $(TEST_Bitvest) | $(BUILD)
	$(CC) $(FLAGS) -c $< -o $@
$(BUILD)/Bitvest.o : $(Bitvest) | $(BUILD)
	$(CC) $(FLAGS) -c $< -o $@

TestAll: TestDijkstra TestPrim TestBitvest TestPrimDijk 

all: TestAll

clean:
	rm -rf build

clean_graphs:
	rm -f graphs/*

turnin:
	tar -cvf PA2.tar *.cpp *.hpp
	turnin -c cs101w PA2.tar

.PHONY: all
