#!/usr/bin/env bash

# A set of little reference tables in TSV format.
# From:
# https://en.wikipedia.org/wiki/Proteinogenic_amino_acid#General_chemical_properties
# https://en.wikipedia.org/wiki/Template:Codon_table
# https://en.wikipedia.org/wiki/Template:Inverse_codon_table
AMINOACIDS=$(cat "$DOTFILES/bio/aminoacids.tsv")
CODONS=$(cat "$DOTFILES/bio/codons.tsv")
CODONS_INVERSE=$(cat "$DOTFILES/bio/codons_inverse.tsv")
unset dir

function aminoacids { echo "$AMINOACIDS" | csvtool readable - -t TAB; }
function codons { echo "$CODONS" | csvtool readable - -t TAB; }
function codons_inverse { echo "$CODONS_INVERSE" | csvtool readable - -t TAB; }

alias revcmp='rev | tr "[ACGT]" "[TGCA]"'

# Ugh Illumina sample sheets tend to be a mess of weird line endings and have missing ending newlines.
# This is a rough attempt to clean those up.
function ss {
	cat "$1" | mac2unix | dos2unix | cat - <(echo)
}
