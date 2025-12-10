const List<String> rendu = [
  '''
  +---+
  |   |
      |
      |
      |
      |
  ========
  ''',
  // 1 : 5 Chances restantes (Tête)
  '''
  +---+
  |   |
  O   |
      |
      |
      |
  ========
  ''',
  // 2 : 4 Chances restantes (Corps)
  '''
  +---+
  |   |
  O   |
  |   |
      |
      |
  ========
  ''',
  // 3 : 3 Chances restantes (Bras droit)
  '''
  +---+
  |   |
  O   |
 /|   |
      |
      |
  ========
  ''',
  // 4 : 2 Chances restantes (Deux Bras)
  '''
  +---+
  |   |
  O   |
 /|\\  |
      |
      |
  ========
  ''',
  // 5 : 1 Chance restante (Jambe droite)
  '''
  +---+
  |   |
  O   |
 /|\\  |
 /    |
      |
  ========
  ''',
  // 6 : 0 Chance restante (PENDU - Deux Jambes)
  '''
  +---+
  |   |
  O   |
 /|\\  |
 / \\  |
      |
  ========
  '''
];