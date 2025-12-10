void clearTerminal() {
  // ANSI escape code to clear the terminal
  print('\x1B[2J\x1B[0;0H');
}