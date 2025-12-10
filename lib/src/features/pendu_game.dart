import '../utils/clear.dart';


class PenduGame {
  final List<String> _words = ['hello','victoire','flutter','maison','Arrete','dart','developpement','Noel','Janvier'];
  
  late String _wordToGuess;

  late List<String> _guessedLetters;

  int _essainumber = 6;

  final Set<String> _wrongLetters = {};

  PenduGame() {
    //Selection aléatoire d'un mot aléatoire dans la liste 
    _wordToGuess = _words[(DateTime.now().millisecondsSinceEpoch) % _words.length].toLowerCase();

    //On va initialiser le mot affiché avec des tirets  pour chaque lettre  
    _guessedLetters = List.filled(_wordToGuess.length, '_');

    void startGame() {
      clearTerminal();
      print ('Bienvenue dans le jeu du Pendu ');
      while (_essainumber >0 && _guessedLetters.contains('_')) {

        // L'etat actuel du jeu 
        print("\nMot à deviner: ${_guessedLetters.join(' ')} ");
        print("Chances restantes: $_essainumber ");
        print("Lettres déjà tentées: ${_wrongLetters.join(', ')} ");

        // On demande à l'user une lettre à entrer 
        print("\nEntrez une lettre: ");
        String? input = _getUserInput();

        if (input !=null && input.isNotEmpty){
          //Traitement de l'entrée à implémenter  
          print("Lettre saisie : $input");
        }
  }

  if (!_guessedLetters.contains('_')) {
    print("\nFélicitations ! Vous avez deviné le mot: $_wordToGuess");
  } else {
    print("\nPendu. Le mot était: $_wordToGuess");
  }

}
}}