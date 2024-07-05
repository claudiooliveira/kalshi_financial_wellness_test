extension RemoveEmojisFromString on String {
  String removeEmojis() {
    final emojiPattern = RegExp(
      r'[\u{1F600}-\u{1F64F}' // Emoticons
      r'|\u{1F300}-\u{1F5FF}' // Símbolos e pictogramas
      r'|\u{1F680}-\u{1F6FF}' // Transportes e símbolos de mapas
      r'|\u{1F700}-\u{1F77F}' // Símbolos alquímicos
      r'|\u{1F780}-\u{1F7FF}' // Símbolos geográficos
      r'|\u{1F800}-\u{1F8FF}' // Símbolos de suplemenetais e pictogramas
      r'|\u{1F900}-\u{1F9FF}' // Símbolos Suplementares e Pictogramas
      r'|\u{1FA00}-\u{1FA6F}' // Objetos e símbolos diversos adicionais
      r'|\u{1FA70}-\u{1FAFF}' // Símbolos Suplementares e Pictogramas
      r'|\u{2600}-\u{26FF}' // Símbolos miscelâneos
      r'|\u{2700}-\u{27BF}' // Dingbats
      r'|\u{FE00}-\u{FE0F}' // Seletores de variação
      r'|\u{1F900}-\u{1F9FF}' // Símbolos Suplementares e Pictogramas
      r'|\u{1F1E6}-\u{1F1FF}' // Bandeiras
      r'|\u{1F600}-\u{1F64F}' // Emoticons
      r'|\u{1F680}-\u{1F6FF}' // Transporte e Símbolos de Mapa
      r'|\u{1F700}-\u{1F77F}' // Símbolos alquímicos
      r'|\u{1F780}-\u{1F7FF}' // Símbolos geográficos
      r'|\u{1F800}-\u{1F8FF}' // Símbolos suplementares e pictogramas
      r'|\u{1F900}-\u{1F9FF}' // Símbolos suplementares e pictogramas
      r'|\u{1FA00}-\u{1FA6F}' // Objetos e símbolos diversos adicionais
      r'|\u{1FA70}-\u{1FAFF}' // Símbolos suplementares e pictogramas adicionais
      r'|\u{1F018}-\u{1F270}' // Símbolos diversos e pictogramas adicionais
      r']',
      unicode: true,
    );

    return replaceAll(emojiPattern, '');
  }
}
