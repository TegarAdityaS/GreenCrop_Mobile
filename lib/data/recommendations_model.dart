class Recommendation {
  final String name;
  final String description;
  final double dosage;

  Recommendation(this.name, this.description, this.dosage);
}

List<Recommendation> recommendations = [
  Recommendation('Urea (46-00-00)', 'Pupuk UREA adalah pupuk tunggal yang mengandung 46% Nitrogen di dalamnya. Memiliki manfaat bagi tanaman.', 357.68),
  Recommendation('NPK (16-16-16)', 'Pupuk NPK 16 mengandung N-P-K 16-16-16-16% Manfaat bagi tanaman: 1. Mengandung kombinasi...', 357.68),
  // Tambahkan rekomendasi lainnya di sini
];
