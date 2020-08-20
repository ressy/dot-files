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

# DNA reverse complement
alias revcmp='rev | tr "[ACGT]" "[TGCA]"'

# Ugh Illumina sample sheets tend to be a mess of weird line endings and have missing ending newlines.
# This is a rough attempt to clean those up.
function ss {
	cat "$1" | mac2unix | dos2unix | cat - <(echo)
}

# A slow and longwinded nucleotide to amino acid translation.  Can be helpful
# for troubleshooting.
function translate {
	sed -r 's/(...)/\1\n/g' | while read codon; do
		if $(echo $codon | grep -q -- -); then
			aa_abbr="???"
			aa_letter="X"
		elif [[ ${#codon} -ne 3 ]]; then
			aa_abbr="???"
			aa_letter="X"
		else
			aa_abbr=$(codons | grep -o "$codon ..." | cut -f 2 -d ' ')
			if [[ "$aa_abbr" == "Sto" ]]; then
				aa_letter="*"
			elif [[ "$aa_abbr" != "" ]]; then
				aa_letter=$(aminoacids | grep " $aa_abbr" | sed "s/ acid//" | tr -s ' ' | cut -f 2 -d ' ')
			else
				aa_letter="X"
			fi
		fi
		echo -e "$codon\t$aa_abbr\t$aa_letter"
	done
}

# Generate a string of random nucleotides of a given length
function random_nt {
	len=$1
	ctr=0
	# Note that this goofy method breaks as soon as you hit 10 things to
	# replace
	while [[ $ctr -lt len ]]; do
		echo $((RANDOM % 4 + 1))
		ctr=$((ctr + 1))
	done | tr 1234 ACTG | tr -d '\n'
	echo
}

# Quick FASTA MSA with defaults
function align {
	clustalw2 -align -infile=$1 -output=fasta =outfile=${1}.aln.fasta
}
