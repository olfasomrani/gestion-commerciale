class Language{
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);
  static List<Language> LanguageList(){
    return <Language>[
      Language(1, "πΊπΈ","Anglais","en"),
      Language(2, "π«π·", "Francais","fr"),
      Language(3,"πΉπ³", "Arabe","ar"),


    ];
  }

}
