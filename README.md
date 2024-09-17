# Project: Assembly Language Exercises

**Author**: Alexandru-Andrei Ionita    
**Year**: 2022-2023 

## Overview

This project implements a series of assembly language programs designed to solve specific problems. The tasks include encrypting communication, simulating game logic, and optimizing data structures for enhanced performance. Each problem is solved independently using assembly language, focusing on efficient and low-level computation.

---

## Simple Cipher Encryption

### Overview

A cipher program is designed to encrypt messages for communication between engineers. The encryption method involves shifting each character in a string to the right by a certain number of steps within the alphabet. This method ensures secure communication within the team.

For example, the string "ANABANANA" becomes "BOBCBOBOB" when shifted by 1. Since the alphabet contains 26 characters, a shift by 26 returns the original string.

### Function Details

#### Function Prototype:
```c
void simple(int n, char* plain, char* enc_string, int step)
```

#### Parameters:
- `n`: The length of the input string.
- `plain`: The input string to be encrypted.
- `enc_string`: The output string containing the encrypted result.
- `step`: The number of steps to shift each character.

### Implementation Notes:
- The program only works with uppercase English letters (A-Z).
- The shift step is restricted to values between 0 and 26, corresponding to the number of letters in the alphabet.
- The result is a new string where each letter is shifted by the given number of steps, wrapping around when reaching the end of the alphabet.

#### File: `simple.asm`

This file implements the encryption logic in assembly. It reads the input string, applies the shift operation to each character, and stores the resulting encrypted string.

---

## Checkers Game Simulation

### Overview

This program simulates the movement of a checkers piece on an 8x8 board. Given the current position of a piece, the function calculates all the valid positions it can move to based on the rules of the game.

The checkers piece moves diagonally, and the function must respect the boundaries of the 8x8 grid. No other pieces are present on the board, so there are no collision concerns.

### Function Details

#### Function Prototype:
```c
void checkers(int x, int y, char table[8][8])
```

#### Parameters:
- `x`: The row position of the checkers piece.
- `y`: The column position of the checkers piece.
- `table`: An 8x8 matrix representing the game board, where valid moves will be marked.

### Implementation Notes:
- The program calculates valid diagonal moves from the current position of the checkers piece.
- The board is updated with the possible new positions the piece can move to.
- Movement is restricted by the edges of the board, so the piece cannot move off the 8x8 grid.

#### File: `checkers.asm`

This file contains the assembly implementation for simulating checkers piece movement. It updates the 8x8 game board to indicate all possible positions the piece can move to based on its current location.

---

## Optimized Checkers Using Bitboard Representation

### Overview

To further optimize the checkers simulation, this section implements the board using a **Bitboard** structure. A Bitboard is a binary data structure where each bit represents the presence or absence of a checkers piece at a specific location on the board.

Since an 8x8 board requires 64 bits, and we don’t have access to 64-bit registers in this context, the board is split across two 32-bit integers. This compact representation reduces memory usage and speeds up position calculations.

### Function Details

#### Function Prototype:
```c
void bonus(int x, int y, int board[2])
```

#### Parameters:
- `x`: The row position of the checkers piece.
- `y`: The column position of the checkers piece.
- `board`: A 2-element array of integers, where each element represents 32 bits of the 64-bit game board.

### Implementation Notes:
- The `board` parameter is split into two 32-bit integers representing the upper and lower halves of the checkers board.
- Each bit in these integers corresponds to a position on the board, allowing for fast and efficient computation of possible moves.
- The function updates the board to reflect all valid moves for the checkers piece based on its current position.

#### File: `bonus.asm`

The assembly implementation in this file uses a Bitboard structure to represent the checkers board. It calculates the valid moves of a checkers piece and updates the 64-bit board representation, split across two 32-bit registers for optimized memory use and faster computations.

---
