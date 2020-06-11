# Table-Search-with-Optimal-CPU
Non-sorted table search of 200 integers with optimal CPU configuration using Assembly language

  Implementation of a program in symbolic language for WinMIPS64 simulator and selection of the optimal CPU configuration
  for execution in the shortest possible time.
  The program performs the following operation:
    searches in a non-sorted table 200 marked integers A[i] (i = 0, 1, ... 199) a specific integer X
    and counts the number K of his appearances. The program also counts how many of the
    table numbers are negative (N), how many positive (P), how many zero (G), how many are
    greater than the required number (B) and how many are less than (S).
    A, X, K, N, P, Z, B, S are variables in the data section of the program.

    Configuration changes:
      Enable Forwarding
      Enable Branch Target Buffer
      Enable Delay Slot

    Loop Unrolling technique used:
      It is a loop transformation technique that attempts to optimize a program's execution speed at the expense of its binary size, which is an approach known as
      space–time tradeoff.
