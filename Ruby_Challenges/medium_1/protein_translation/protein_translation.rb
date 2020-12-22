class InvalidCodonError < StandardError; end

class Translation
  AMINO_ACIDS = {
    Methionine: ['AUG'],
    Phenylalanine: ['UUU', 'UUC'],
    Leucine: ['UUA', 'UUG'],
    Serine: ['UCU', 'UCC', 'UCA', 'UCG'],
    Tyrosine: ['UAU', 'UAC'],
    Cysteine: ['UGU', 'UGC'],
    Tryptophan: ['UGG'],
    STOP: ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(codon)
    raise InvalidCodonError if !valid_codon?(codon)

    AMINO_ACIDS.select do |_, seqs|
      seqs.any? { |seq| seq == codon }
    end.keys[0].to_s
  end

  def self.of_rna(strand)
    codons = strand.scan /.{3}/
    codons.take_while { |c| of_codon(c) != 'STOP' }.map { |c| of_codon(c) }
  end

  def self.valid_codon?(codon)
    AMINO_ACIDS.values.flatten.include?(codon)
  end
end
