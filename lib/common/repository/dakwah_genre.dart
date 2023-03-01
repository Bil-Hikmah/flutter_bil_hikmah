enum VideoDakwahGenre {
  semua,
  disabilitas,
  dakwah,
  khutbah,
  quran,
  hadist,
  sejarah,
  fiqih,
  akhlak,
  umum,
  lainnya,
}

List<String> get stringGenre {
  return VideoDakwahGenre.values.map((e) => e.name).toList();
}

VideoDakwahGenre enumGenre(String genre) {
  switch (genre) {
    case 'disabilitas':
      return VideoDakwahGenre.disabilitas;
    case 'dakwah':
      return VideoDakwahGenre.dakwah;
    case 'khutbah':
      return VideoDakwahGenre.khutbah;
    case 'quran':
      return VideoDakwahGenre.quran;
    case 'hadist':
      return VideoDakwahGenre.hadist;
    case 'sejarah':
      return VideoDakwahGenre.sejarah;
    case 'fiqih':
      return VideoDakwahGenre.fiqih;
    case 'akhlak':
      return VideoDakwahGenre.akhlak;
    case 'umum':
      return VideoDakwahGenre.umum;
    case 'lainnya':
      return VideoDakwahGenre.lainnya;
    default:
      return VideoDakwahGenre.semua;
  }
}
