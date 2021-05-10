class Language{
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);
  static List<Language> LanguageList(){
    return <Language>[
      Language(1, "🇺🇸","Anglais","en"),
      Language(2, "🇫🇷", "Francais","fr"),
      Language(3,"🇹🇳", "Arabe","ar"),


    ];
  }

}
