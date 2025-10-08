// Implement a custom InvalidNucleotideException exception
class InvalidNucleotideException implements Exception {
  final String message;

  InvalidNucleotideException(this.message){
    @override
    String toString() => 'InvalidNucleotideException: $message';
  }
}

class NucleotideCount {
  Map<String, int> count (String strand) {
    strand = strand.toUpperCase();
    Map<String, int> nucleotides = {"A": 0, "C": 0, "G": 0, "T": 0};

    for (int i = 0; i < strand.length; i++) {
      switch (strand[i]) {
        case "A":
          nucleotides.update("A", (value) => value + 1);
          break;
        case "C":
          nucleotides.update("C", (value) => value + 1);
          break;
        case "G":
          nucleotides.update("G", (value) => value + 1);
          break;
        case "T":
          nucleotides.update("T", (value) => value + 1);
          break;
        default:
          throw InvalidNucleotideException('Invalid nucleotide: ${strand[i]}');
      }
    }

    return nucleotides;
  }
}
