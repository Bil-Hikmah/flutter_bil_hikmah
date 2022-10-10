class DetailSignDummy {
  final int id;
  final List<DetailSignItemData>? detailSignItemData;

  DetailSignDummy(
    this.id, {
    this.detailSignItemData,
  });
}

final List<DetailSignDummy> detailSignDummy = [
  DetailSignDummy(0, detailSignItemData: listDetailSignItemData),
  DetailSignDummy(1),
];

class DetailSignItemData {
  final String urlImage;
  final String title;
  final String? desc;

  DetailSignItemData(
    this.urlImage,
    this.title, {
    this.desc,
  });
}

final List<DetailSignItemData> listDetailSignItemData = [
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/A.png", "A"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/B.png", "B"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/C.png", "C"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/D.png", "D"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/E.png", "E"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/F.png", "F"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/G.png", "G"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/H.png", "H"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/I.png", "I"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/J.png", "J"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/K.png", "K"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/L.png", "L"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/M.png", "M"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/N.png", "N"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/O.png", "O"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/P.png", "P"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/Q.png", "Q"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/R.png", "R"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/S.png", "S"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/T.png", "T"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/U.png", "U"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/V.png", "V"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/W.png", "W"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/X.png", "X"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/Y.png", "Y"),
  DetailSignItemData("https://pmpk.kemdikbud.go.id/sibi/SIBI/abjad/Z.png", "Z"),
];
