const List<String> rendu = [
  // 0 : 6 Chances restantes (Poteau seulement)
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

String getrendu(int essainumber){
   final index = 6 - essainumber;
   if( index <0 || index >= rendu.length){
     return rendu[0];
   }
   return rendu[index];
}