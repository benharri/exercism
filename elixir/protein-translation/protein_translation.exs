defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    for <<x::binary-3 <- rna>> do
      of_codon(x)
    end
    |> Enum.reduce([], fn c, acc ->
      case c do
        {:ok, codon} ->
          acc ++ codon

        {:error, _msg} ->
          {:error, "invalid RNA"}
      end
    end)
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case codon do
      n when n in ["UGU", "UGC"] ->
        {:ok, "Cysteine"}

      n when n in ["UUA", "UUG"] ->
        {:ok, "Leucine"}

      "AUG" ->
        {:ok, "Methionine"}

      n when n in ["UUU", "UUC"] ->
        {:ok, "Phenylalanine"}

      n when n in ["UCU", "UCC", "UCA", "UCG"] ->
        {:ok, "Serine"}

      "UGG" ->
        {:ok, "Tryptophan"}

      n when n in ["UAU", "UAC"] ->
        {:ok, "Tyrosine"}

      n when n in ["UAA", "UAG", "UGA"] ->
        {:ok, "STOP"}

      _ ->
        {:error, "invalid codon"}
    end
  end
end
