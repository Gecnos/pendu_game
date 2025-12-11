import 'dart:io';

String? getValidInput(Set<String> guessedLetters) {

  // Lit l'entrée brute de l'utilisateur.
  final rawInput = stdin.readLineSync(); 
  
  if (rawInput == null || rawInput.trim().isEmpty) {
    return null; // Entrée vide.
  }

  // Nettoyage de l'entrée : en minuscules et suppression des espaces.
  final input = rawInput.trim().toLowerCase();

  // Vérifie si c'est une lettre unique
  if (input.length == 1) {
    final char = input;
    
    // Vérification s'il s'agit d'une lettre de l'alphabet  
    if (!RegExp(r'[a-z]').hasMatch(char)) {
      return null; 
    }

    // Vérifions si l'user entre deux fois la meme valeur
    if (guessedLetters.contains(char)) {
      return null; 
    }
    
    return char;
  } 
  
  // On vérifie si c'est un  mot complet que l'utilisateur entre 
  else if (RegExp(r'^[a-z]+$').hasMatch(input)) {
    // Si l'utilisateur entre un mot entier, on le considère comme une tentative de mot
    return input; 
  }

  return null;
}