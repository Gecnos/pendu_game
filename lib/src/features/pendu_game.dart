import 'dart:math';
import '../utils/rendu.dart'; 
import '../utils/clear.dart'; 
import '../utils/input.dart'; 


class PenduGame {
  final List<String> _possibleWords = ['dart', 'poo', 'flutter', 'algorithme', 'developpement', 'programmation'];

  late String _secretWord; 
  late List<String> _displayWord; 
  int _remainingChances = 6; 
  final Set<String> _guessedLetters = {}; 
  

  String _statusMessage = ''; 

  PenduGame() {


    final random = Random();
    _secretWord = _possibleWords[random.nextInt(_possibleWords.length)];
    _displayWord = List.filled(_secretWord.length, '_');
  }

  void _renderGame() {

    clearTerminal();     

    print(" PENDU \n");

    print(getrendu(_remainingChances));
    print('-------------------------------------');

    print("Mot à deviner: ${_displayWord.join(' ')}\n");

    print("Chances restantes: $_remainingChances");

    print("Lettres déjà tentées: ${_guessedLetters.join(', ')}");

    if (_statusMessage.isNotEmpty) {
      print('\n*** $_statusMessage ***');
      _statusMessage = ''; 
    }

    print('-------------------------------------');
  }


  void _processInput(String input) {
    if (input.length > 1) {
      // Traitement si l'utilisateur devine le mot complet
      if (input == _secretWord) {
        // Révéler le mot pour gagner immédiatement
        _displayWord = _secretWord.split(''); 
        _statusMessage = 'BRAVO ! Vous avez trouvé le mot entier !';
      } else {
        // Pénalité pour mot incorrect
        _remainingChances--;
        _statusMessage = 'Raté ! "$input" n\'est pas le mot secret.';
      }
    } else {
      // Traitement si l'utilisateur devine une seule lettre
      final char = input;
      _guessedLetters.add(char); // Ajout de la lettre aux lettres tentées
      
      if (_secretWord.contains(char)) {
        // La lettre est dans le mot
        _statusMessage = 'CORRECT ! La lettre "$char" est bien présente.';
        
        // Révéler les positions de la lettre dans le mot
        for (int i = 0; i < _secretWord.length; i++) {
          if (_secretWord[i] == char) {
            _displayWord[i] = char;
          }
        }
      } else {
        // La lettre n'est pas dans le mot
        _remainingChances--;
        _statusMessage = 'FAUX ! La lettre "$char" n\'est pas dans le mot.';
      }
    }
  }

  void startGameLoop() {

    _renderGame();
    
    while (_remainingChances > 0 && _displayWord.contains('_')) {


      print("\nEntrez une lettre ou le mot complet :");
      String? input = getValidInput(_guessedLetters);

      if (input != null) {
        _processInput(input);
      } else {
        _statusMessage = 'Entrée non valide. Veuillez réessayer.';
      }
      

      _renderGame();
    }


    if (!_displayWord.contains('_')) {
      print("\nFÉLICITATIONS ! Vous avez trouvé le mot : **$_secretWord**");
    } else {
      print("\nPENDU ! Le mot était : **$_secretWord**");
    }
  }
}