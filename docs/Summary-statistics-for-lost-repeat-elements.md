Starting with release 1.0.5, summary statistics for lost repeat elements is provided. Thanks for contribution from Kevin Wesel at [Bruins-In-Genomics (B.I.G.) Summer Program](http://qcb.ucla.edu/big-summer/). Currently available as a standalone application. We are planning to ingrate this functionality in the ROP in the next release. 

Here we explain how to use a script that turns the lost repeats results of ROP into two files, one human-readable `.tsv` file and one graphing-ready `.csv` output file that both summarize the data into numeric tables.

###Very Brief Summary:

The program takes two parameters, an ROP output file and the directory where new output files should be saved, and returns in those output files the frequency of reads per element in a vertical TSV file and a horizontal CSV file.

###Part 1: Important Things to Know Before Using the Script

The SLR script requires a repBase file in the same directory location as the script itself. This file should include all elements that the reads are matched up to.

For example:

```
HERVH-ERV1-Eutheria
X21_LINE-CR1-Mammalia
UCON50-hAT-Mammalia
Charlie22a-hAT-Mammalia
PrimLTR79-ERV1-Homo sapiens
LTR89-ERV3-Mammalia
TIGGER5-Mariner/Tc1-Homo sapiens
LTR25-int-ERV1-Primates
HERV18-Endogenous Retrovirus-Homo sapiens
UCON55-SINE2/tRNA-Mammalia
MER21I-ERV1-Homo sapiens
LTR1F2-ERV1-Primates
Tigger3c-Mariner/Tc1-Primates
LTR13-ERV2-Homo sapiens
X9a_DNA-DNA transposon-Mammalia
EUTREP16-EUTREP16-Eutheria
UCON96-Repetitive element-Mammalia
LTR14B-ERV2-Homo sapiens
ALR2-SAT-Homo sapiens
```

Both output files will return the number of reads that matched to each element, even in that number is 0. See more details below for more information about the organization of the output files.

###Part 2: Parameters the Script Takes

The script takes two parameters.

First, it takes in a `.tsv` file of ROP output data. The absolute path of the data should be provided after the python script is called. The file of output results should look like this:

```
HWI-D00108:213:C3U67ACXX:1:1101:3247:8212/1 L1MB4-L1-Homo   87.30   63  7   1   37  98  686 624 1e-14   73.1
HWI-D00108:213:C3U67ACXX:1:1101:10036:9092/1    AluYk11-SINE1/7SL-Primates  93.00   100 7   0   1   100 157 256 6e-37    147
HWI-D00108:213:C3U67ACXX:1:1101:2558:9457/1 L1HS-L1-Homo    100.00  100 0   0   1   100 5074    5173    1e-48    185
HWI-D00108:213:C3U67ACXX:1:1101:2558:9457/2 L1HS-L1-Homo    97.96   98  1   1   1   98  5270    5174    1e-43    169
HWI-D00108:213:C3U67ACXX:1:1101:19140:9848/2    AluSz   92.41   79  6   0   1   79  64  142 6e-27    113
HWI-D00108:213:C3U67ACXX:1:1101:18630:10959/2   AluSg7-SINE1/7SL-Primates   91.58   95  6   2   1   95  133 41  6e-32    130
HWI-D00108:213:C3U67ACXX:1:1101:20536:14815/1   L1PA5-L1-Homo   98.96   96  1   0   1   96  182 87  1e-44    172
HWI-D00108:213:C3U67ACXX:1:1101:12048:16383/1   SVA_F-SINE-Homo 95.45   44  2   0   13  56  373 330 3e-14   71.3
HWI-D00108:213:C3U67ACXX:1:1101:2876:16715/1    AluYb8a1-SINE1/7SL-Homo 97.96   49  1   0   1   49  49  1   1e-18   86.1
HWI-D00108:213:C3U67ACXX:1:1101:2131:19253/1    CER-SAT-Homo    90.72   97  9   0   4   100 170 266 6e-32    130
```

and a possible absolute path might look like this:

```
/u/home/k/kwesel/scratch/repeatLostGTEX/data/G41588.GTEX-WY7C-2026.1.unmapped_trim_after_rRNA.fasta_after_rRNA_lostHuman.fasta_lostRepeats_blastFormat6.tsv
```

Important things to note about the ROP output parameter: The name of the read itself (HWI-D00108-etc.) should be in the first column, and the element name (L1MB4-L1-Homo) should be in the second column.

Second, the script takes the directory of where the two output files should be saved. This parameter should be a folder as opposed to a file. The absolute path of a directory to save results in might look like this:

```
/u/home/k/kwesel/scratch/repeatLostGTEX/results
```

Important things to note about the output location parameter: There should NOT be an additional slash at the end of the absolute path: (not results/).

Example of a correct call to the script:

```
python ~/newcode/examplescript.py /u/home/k/kwesel/scratch/repeatLostGTEX/data/G60628.GTEX-13OVH-1826.2.unmapped_after_rRNA_lostHuman.fasta_lostRepeats_blastFormat6.tsv /u/home/k/kwesel/scratch/repeatLostGTEX/results
```

###Part 3: The Output Files from the Script

Two output files will be created from the script.

First output file:

The first output file will be a vertical .tsv file of three columns, with the leftmost column storing every element, the middle column storing the number of reads for that element, and the rightmost column storing the frequency out of reads that matched to that element out of all reads.

An example of the vertical `.tsv` output file:

```
Element Name                        Frequency   Rel. Abundance (%) 
EuthAT-1-hAT-Eutheria                  0        0.0
LTR22B2-ERV2-Homo                     12        0.00712
L1MDA_5-L1-Eutheria                   34        0.02017
CHARLIE5-hAT-Homo                      9        0.00534
MER66B-ERV1-Homo                       3        0.00178
EuthAT-N1-hAT-Eutheria                 0        0.0
MER90a_LTR-ERV1-Eutheria               0        0.0
LTR40C-ERV3-Homo                       3        0.00178
X9c_DNA-DNA                            0        0.0
HERVK11DI-ERV2-Homo                   21        0.01246
UCON49-L2-Mammalia                     0        0.0
UCON44-Repetitive                      0        0.0
LTR87-ERV3-Eutheria                    1        0.00059
MER34A1-ERV1-Eutheria                  3        0.00178
MADE1-Mariner/Tc1-Homo                19        0.01127
UCON78-DNA                             0        0.0
MER66_I-ERV1-Homo                     13        0.00771
MARE9-MARE9-Mammalia                   0        0.0
MER76-int-ERV3-Eutheria                3        0.00178
```

This .tsv output file will be saved with the name "OriginalName_relfreq.tsv" (refreq standing for "relative frequency").

An example of this output file's name:

```
G41589.GTEX-WY7C-2226.1.unmapped_trim_after_rRNA.fasta_after_rRNA_lostHuman.fasta_lostRepeats_blastFormat6_relfreq.tsv
```

Second Output File:

The second output file is a two-row CSV file that is less human-readable, but can be used to turn the data into boxplot in a statistical program such as R.

Example:

```
File_Name, EuthAT-1-hAT-Eutheria, LTR22B2-ERV2-Homo, MARNA-Mariner/Tc1-Homo, L1MDA_5-L1-Eutheria, CHARLIE5-hAT-Homo, MER66B-ERV1-Homo, EuthAT-N1-hAT-Eutheria, MER90a_LTR-ERV1-Eutheria, LTR40C-ERV3-Homo, X9c_DNA-DNA, HERVK11DI-ERV2-Homo, LTR22E-ERV2-Homo, UCON44-Repetitive, LTR87-ERV3-Eutheria, MER34A1-ERV1-Eutheria, MADE1-Mariner/Tc1-Homo, UCON78-DNA, MER66_I-ERV1-Homo, EUTREP10-Endogenous, MARE9-MARE9-Mammalia, MER76-int-ERV3-Eutheria, MamRep137-Mariner/Tc1-Mammalia, MER85-DNA, LTR1B1-ERV1-Homo, MLT1F-ERV3-Eutheria, LTR10F-ERV1-Homo, MER66A-ERV1-Homo, LTR12E-ERV1-Homo, BSRd-Satellite-Primates, HERVFH19I-Endogenous, ALR1-SAT-Homo, L1ME3-L1-Homo, L1M2B_5-L1-Homo, MLT1B-ERV3-Eutheria, UCON55-SINE2/tRNA-Mammalia, CHARLIE9-hAT-Homo, MER4D_LTR-ERV1-Primates, L1PA6-L1-Homo, MLT1J2-ERV3-Eutheria, L1MC4-L1-Homo, Merlin1_HS-Merlin-Homo, X15_DNA-hAT-Mammalia, CER-SAT-Homo, X29a_DNA-DNA, UCON81-hAT-Mammalia, MER91C-hAT-Homo, UCON84-Repetitive, MER93-Long, LTR26-ERV1-Homo, UCON57-Repetitive, Charlie24-hAT-Mammalia, HERV46I-Endogenous, MER54A-ERV3-Homo, MER104B-DNA, UCON62-Repetitive, MER74A-ERV3-Eutheria, MER34A-ERV1-Eutheria, TIGGER2-Mariner/Tc1-Homo, LTR26E-ERV1-Homo, LTR14C-ERV2-Homo, LTR22C-ERV2-Primates, L1MEf_5end-L1-Mammalia, MER117-hAT-Homo, L1P4e_5end-L1-Primates, X12_LINE-Vingi-Mammalia, LTR56-ERV1-Homo, Kanga11a-Mariner/Tc1-Mammalia, LTR86C-ERV3-Mammalia, CHARLIE8-hAT-Homo, LTR82B-ERV3-Mammalia, MLT1C2-ERV3-Eutheria, LTR41C-ERV3-Homo, MER61C-ERV1-Homo, MER69A-hAT-Eutheria, MER94-hAT-Homo, X18_LINE-CR1-Mammalia, MLT1D-ERV3-Eutheria, LTR10B2-ERV1-Homo, HUERS-P3-LTR, HERVK11I-ERV2-Homo, LTR51-ERV1-Homo, MLT1K-ERV3-Homo, HSAT5-SAT-Primates, LTR77B-ERV3-Homo, GOLEM_A-Mariner/Tc1-Homo, UCON33-Repetitive, MER57B1-ERV1-Eutheria, AluSg1-SINE1/7SL-Primates, L1MED_5-L1-Homo, MER69C-hAT-Homo, LOR1I-ERV1-Homo, THE1B-ERV3-Hominidae, MER11C-ERV2-Homo, L1MB4_5-L1-Eutheria, LTR55-ERV3-Homo, LTR61-ERV1-Homo, MER83B-ERV1-Homo, HUERS-P3B-Endogenous, MER122-MER122-Homo, MLT2B3-ERV3-Eutheria, UCON74-hAT-Mammalia, LTR44-ERV1-Homo, L1MA9-L1-Homo, X2b_DNA-DNA, MER63C-hAT-Eutheria, PRIMA4_I-Endogenous, MER94B-hAT-Homo, SAR-SAT-Primates, L1PA2-L1-Homo, L1ME3F_3end-L1-Eutheria, LTR16D1-ERV3-Eutheria, THER1-SINE2/tRNA-Mammalia, AluSc5-SINE1/7SL-Primates, LTR16B1-ERV3-Eutheria, LTR12F-ERV1-Primates, MER34-int-ERV1-Eutheria, HERVK-ERV2-Primates, L1MC3-L1-Eutheria, LTR11-LTR, X1_LR-LTR, L1ME3E_3end-L1-Eutheria, PRIMA4_LTR-ERV1-Homo, L3b_3end-CR1-Mammalia, MER57F-ERV1-Homo, LTR22C2-ERV2-Homo, KANGA2_A-Mariner/Tc1-Homo, LTR43B-ERV1-Homo, LTR80B-ERV3-Eutheria, LTR35A-ERV1-Primates, LTR21A-ERV1-Homo, MER105-DNA, RICKSHA_0-MuDR-Eutheria, BSR-SAT-Homo, MER28-DNA, HERV15I-Endogenous, MER52C-ERV1-Homo, MARE4-MARE4-Mammalia, MLT1N2-ERV3-Homo, L1PB2-L1-Homo, MLT1J-ERV3-Eutheria, HERV49I-ERV1-Homo, LTR57-ERV3-Homo, UCON76-Repetitive, Eutr13-Eutr13-Eutheria, MamGypLTR1a-Gypsy-Mammalia, MLT2B4-ERV3-Eutheria, TIGGER5_B-Mariner/Tc1-Eutheria, LTR18A-ERV3-Homo, L1MA2-L1-Homo, FAM-SINE1/7SL-Primates, MLT1E2-ERV3-Eutheria, LTR21C-ERV1-Homo, UCON92-Repetitive, LTR81AB-ERV1-Homo, MER2-Mariner/Tc1-Eutheria, UCON32-Repetitive, X26_DNA-Mariner/Tc1-Mammalia, MER21A-ERV3-Homo, MLT2F-ERV3-Eutheria, L1PA14_5-L1-Homo, MLT1G2-ERV3-Homo, MSTB-ERV3-Homo, L1MD3-L1-Homo, X1_DNA-Mariner/Tc1-Eutheria, LTR28B-ERV1-Homo, LTR29-ERV1-Homo, L1PA7-L1-Homo, UCON47-Repetitive, MLT1I-ERV3-Homo, UCON51-Repetitive, LTR75-ERV3-Homo, Tigger4a-Mariner/Tc1-Primates, HERVL66I-ERV3-Eutheria, MSTA-ERV3-Primates, MER31-Endogenous, MER45B-DNA, ALR-SAT-Homo, MER1B-hAT-Homo, LTR1E-ERV1-Homo, L1P_MA2-L1-Eutheria, HSAT6-SAT-Homo, LTR64-ERV1-Homo, HERV38I-Endogenous, Tigger13a-Mariner/Tc1-Mammalia, MamRep564-Transposable, LTR45C-ERV1-Homo, AluYb11-SINE1/7SL-Homo, LTR81C-ERV1-Mammalia, Tigger3d-Mariner/Tc1-Primates, X18_DNA-DNA, MER74-Endogenous, Eutr10-Eutr10-Eutheria, MLT1L-ERV3-Homo, L1MB6_5-L1-Eutheria, LTR5_Hs-ERV2-Primates, AluMacYb2-SINE1/7SL-Macaca, EutTc1-N1-Mariner/Tc1-Eutheria, UCON63-Repetitive, L4-RTEX-Mammalia, LTR91-ERV3-Homo, MLT2E-ERV3-Eutheria, TAR1-Satellite-Eutheria, L1M2_5-L1-Homo, MER110A-ERV1-Homo, LTR37A-ERV1-Homo, MER112-hAT-Homo, LTR10G-ERV1-Eutheria, LTR85c-Gypsy-Mammalia, Zaphod3-hAT-Eutheria, MER54B-ERV3-Homo, LTR72-ERV1-Homo, Tigger12A-Mariner/Tc1-Mammalia, HUERS-P2-Endogenous, L1MB4-L1-Homo, MER74C-ERV3-Homo, L1MA3-L1-Homo, MER51C-ERV1-Homo, MER45R-DNA, AluYk11-SINE1/7SL-Primates, PRIMA41-Endogenous, MLT1O-ERV3-Eutheria, UCON40-Repetitive, Helitron1Nb_Mam-Helitron-Eutheria, AluYd3a1_gib-SINE1/7SL-Nomascus, ALINE-Non-LTR, LTR2B-ERV1-Homo, X17_LINE-CR1-Mammalia, IN25-L1-Homo, CHESHIRE_B-hAT-Homo, MER34B-ERV1-Homo, MamGypLTR1c-Gypsy-Mammalia, MLT1H_I-ERV3-Eutheria, HERV16-ERV3-Homo, UCON38-Repetitive, MER4B-ERV1-Homo, LTR1F1-ERV1-Primates, HERV4_LTR-Endogenous, UCON45-Repetitive, MamRep1527-Transposable, UCON71-Repetitive, MER57E2-ERV1-Eutheria, Charlie28-hAT-Eutheria, ORSL-hAT-Eutheria, MARE7-Integrated, L1PA8-L1-Homo, LTR46-ERV1-Homo, L1ME3C_3end-L1-Eutheria, LTR81B-ERV1-Mammalia, LTR31-ERV1-Homo, MLT1G1-ERV3-Homo, MamRep434-Mariner/Tc1-Mammalia, LTR47B-ERV3-Homo, AluYb9, MER39B-ERV1-Homo, HERV4_I-ERV1-Homo, X13_DNA-Mariner/Tc1-Mammalia, MER77-ERV3-Homo, L1MA4A-L1-Homo, MER76-ERV3-Homo, LTR26B, LTR26C, LTR26D, MER5C-hAT-Eutheria, MER51I-LTR, LTR60-ERV1-Homo, GOLEM_B-Mariner/Tc1-Eutheria, AluJb, AluYk13-SINE1/7SL-Homo, UCON60-Repetitive, LTR58-ERV1-Homo, HSAT4-SAT-Homo, LTR48-ERV1-Homo, L1M2A1_5-L1-Homo, MER110-ERV1-Homo, X28_DNA-DNA, LTR33B-ERV3-Mammalia, MER45C-hAT-Homo, LTR30-ERV1-Homo, MER84I-Endogenous, MER58C-hAT-Eutheria, MER57E1-ERV1-Eutheria, LTR16A-ERV3-Eutheria, ERVL-B4-ERV3-Eutheria, LTR5A-ERV2-Primates, ALR_-SAT-Primates, LTR52-ERV3-Homo, X30_DNA-DNA, UCON83-Repetitive, UCON100-DNA, LTR84b-ERV3-Eutheria, LTR86A2-ERV3-Mammalia, MER41F-Endogenous, MER31_I-Endogenous, LTR34-ERV1-Homo, LOR1b_LTR-ERV1-Primates, L1MEg_5end-L1-Mammalia, ORSL-2a-hAT-Mammalia, HERVK3I-ERV2-Homo, EUTREP16-EUTREP16-Eutheria, MLT1C1-ERV3-Eutheria, L1PB3-L1-Homo, X25_DNA-DNA, MER99-DNA, MER39-ERV1-Homo, ERVL-E-ERV3-Eutheria, MER52B-LTR, LTR9B-ERV1-Homo, HERVI-ERV1-Homo, EUTREP13-Endogenous, UCON101-Repetitive, MER51B-ERV1-Homo, MamGypLTR2b-Gypsy-Mammalia, EUTREP6-EUTREP6-Eutheria, LTR5B-ERV2-Homo, Charlie21a-hAT-Eutheria, MER83AI-ERV1-Homo, HERV9-ERV1-Homo, UCON36-Repetitive, LTR53-ERV3-Homo, EUTREP7-EUTREP7-Eutheria, MER113B-hAT-Homo, ERV3-16A3_LTR-ERV3-Homo, EUTREP3-hAT-Eutheria, MER61I-LTR, LTR16D2-ERV3-Eutheria, L1MA4-L1-Homo, LTR40A1-ERV3-Eutheria, LTR13A-ERV2-Homo, TIGGER9-Mariner/Tc1-Homo, L1PA14-L1-Homo, MER63D-hAT-Homo, CHARLIE10-hAT-Homo, MER57E3-ERV1-Eutheria, Charlie18a-hAT-Mammalia, LTR6B-ERV1-Homo, L1ME3A-L1-Homo, PTR5-LTR, UCON97-Repetitive, Tigger2b_Pri-Mariner/Tc1-Primates, X13_LINE-Non-LTR, MER58A-hAT-Eutheria, Eutr11-Eutr11-Eutheria, GSATX-SAT-Primates, Charlie12-hAT-Primates, L1PA11-L1-Homo, UCON75-Repetitive, LTR27-ERV1-Homo, UCON35-Repetitive, LTR24B-ERV1-Homo, AluSz6-SINE1/7SL-Primates, LSAU-Satellite-Homo, CHESHIRE_A-hAT-Homo, AluMacYa3-SINE1/7SL-Macaca, MER34C2-ERV1-Homo, Tigger12-Mariner/Tc1-Mammalia, L1MA9_5-L1-Eutheria, X4a_DNA-DNA, MLT1F1-ERV3-Eutheria, L1P4c_5end-L1-Primates, MamGypLTR2-Gypsy-Mammalia, LTR41-ERV3-Homo, L1MD2-L1-Homo, X9b_DNA-DNA, HERV18-Endogenous, MER57C2-ERV1-Eutheria, LTR10B1-ERV1-Primates, UCON77-Repetitive, LTR81A-ERV1-Mammalia, MamSINE1-tRNA-Mammalia, MER101B-ERV1-Homo, LTR4-ERV1-Homo, LTR72B-ERV1-Homo, LTR16E1-ERV3-Eutheria, UCON102-Repetitive, HERV-K14CI-ERV2-Homo, HERV57I-Endogenous, RICKSHA-MuDR-Eutheria, GSAT-SAT-Primates, MER70A-ERV3-Homo, L1MB1-L1-Homo, MER34D-ERV1-Primates, HERV30I-Endogenous, AluYf1, HERV1_LTR-Endogenous, UCON42-Mariner/Tc1-Mammalia, AluYf2, MER51A-ERV1-Homo, HSMAR1-Mariner/Tc1-Homo, L1M3B_5-L1-Homo, LTR14B-ERV2-Homo, L1ME4A-L1-Homo, Charlie27-hAT-Eutheria, Tigger14a-Mariner/Tc1-Mammalia, UCON61-Repetitive, LOOPER-DNA, Charlie16a-hAT-Mammalia, LTR2752-ERV1-Homo, UCON107-hAT-Mammalia, MSTA1-ERV3-Primates, Charlie11-hAT-Eutheria, MER44D-Mariner/Tc1-Eutheria, MLT1E-ERV3-Eutheria, LTR80A-ERV3-Eutheria, MER50C-ERV1-Primates, LTR3A-ERV2-Primates, AluYf5-SINE1/7SL-Primates, MamRep38-hAT-Mammalia, MER121-hAT-Mammalia, LTR69-ERV3-Homo, X3_LINE-Non-LTR, MARE1-Mariner/Tc1-Mammalia, SN5-SAT-Homo, L1MCB_5-L1-Homo, L1PA13_5-L1-Homo, MER35-MER35-Homo, MER4D-ERV1-Homo, TIGGER5-Mariner/Tc1-Homo, MER57B2-ERV1-Homo, X10b_DNA-Mariner/Tc1-Mammalia, LTR60B-ERV1-Homo, LTR1F-ERV1-Homo, AluSq2-SINE1/7SL-Primates, L1M2A_5-L1-Homo, LTR3-ERV2-Homo, MER103-DNA, LTR65-ERV1-Homo, UCON56-Repetitive, UCON73-Repetitive, Eutr16-Eutr16-Eutheria, LTR1C-ERV1-Homo, UCON52-hAT-Mammalia, MARE10-MARE10-Mammalia, MARE6-TN1-Mammalia, MER63A-DNA, LTR14A-ERV2-Homo, LTR1B0-ERV1-Primates, HERVFH21I-Endogenous, CHARLIE2B-hAT-Homo, L1M3D_5-L1-Eutheria, MIR3-SINE2/tRNA-Mammalia, LTR9-ERV1-Homo, LTR33A-ERV3-Eutheria, UCON68-Repetitive, EUTREP5-EUTREP5-Eutheria, ZAPHOD-DNA, X10a_DNA-Mariner/Tc1-Mammalia, L1PA12_5-L1-Homo, MER4CL34-ERV1-Homo, LTR53B-ERV3-Homo, LTR37B-ERV1-Homo, EUTREP15-EUTREP15-Eutheria, FORDPREFECT-hAT-Homo, EUTREP1-DNA, L1PA16_5-L1-Homo, MER67D-ERV1-Homo, MER44B-Mariner/Tc1-Homo, Tigger3b-Mariner/Tc1-Primates, LTR32-ERV3-Homo, LTR42-ERV3-Homo, L1ME2-L1-Homo, AmnSINE1_HS-SINE3/5S-Homo, LTR27B-ERV1-Homo, L1MB8-L1-Homo, EUTREP2-EUTREP2-Eutheria, ALR2-SAT-Homo, UCON93-Repetitive, UCON54-Repetitive, MER88-ERV3-Homo, MER11D-ERV2-Homo, X9a_DNA-DNA, MER41D-ERV1-Homo, LTR10A-ERV1-Eutheria, AluYb8, LTR86B2-ERV3-Mammalia, UCON48-Repetitive, UHG-snRNA-Homo, L1M4B-L1-Homo, LTR28-ERV1-Homo, UCON94-Repetitive, MLT1J-int-ERV3-Eutheria, MER41I-Endogenous, Tigger9b-Mariner/Tc1-Eutheria, Eutr1-Eutr1-Eutheria, MER95-LTR, LTR5-ERV2-Homo, L1PA17_5-L1-Homo, MLT1G-ERV3-Homo, LTR62-ERV3-Homo, LTR22A-ERV2-Homo, L1MD1_5-L1-Eutheria, LTR43-ERV1-Homo, LTR41B-ERV3-Homo, LTR33C-ERV3-Eutheria, UCON39-DNA, AluYb3a1, MER61F-LTR, L1MC4B-L1-Eutheria, Helitron3Na_Mam-Helitron-Mammalia, MER41A-ERV1-Homo, UCON34-Repetitive, MamGypLTR2c-Gypsy-Mammalia, TIGGER7-Mariner/Tc1-Homo, EUTREP14-EUTREP14-Eutheria, AluSc8-SINE1/7SL-Primates, LTR22-ERV2-Primates, MER33-hAT-Homo, MER65I-Endogenous, LTR9D-ERV1-Homo, MER92B-ERV1-Homo, X5a_DNA-DNA, MER31A-ERV1-Eutheria, LTR18C-ERV3-Homo, HSMAR2-Mariner/Tc1-Homo, SVA2-MSAT-Eutheria, UCON96-Repetitive, L1PA13-L1-Homo, AluSq10-SINE1/7SL-Primates, MER41B-ERV1-Homo, LTR25-ERV1-Homo, MamRep1894-hAT-Mammalia, MER115-hAT-Eutheria, MER49-ERV1-Homo, UCON103-Repetitive, X33a_DNA-Mariner/Tc1-Mammalia, MER57A_I-Endogenous, DNA1_Mam-DNA, AluYk12-SINE1/7SL-Primates, MER9B-ERV2-Homo, UCON67-Repetitive, LTR79-ERV3-Mammalia, MER50-ERV1-Homo, MER83C-ERV1-Homo, MLT2A2-ERV3-Homo, MLT1J1-ERV3-Eutheria, Eutr12-Eutr12-Eutheria, MER91A-hAT-Homo, EUTREP11-EUTREP11-Eutheria, MER57I-Endogenous, AluYg6, X2_LR-LTR, L1MD1-L1-Homo, L1M6B_5end-L1-Homo, L1MA1-L1-Homo, L1MEe_5end-L1-Eutheria, MER4A1_LTR-ERV1-Primates, MER5A-hAT-Eutheria, L1MB7-L1-Eutheria, L1PA10-L1-Homo, FORDPREFECT_A-hAT-Homo, LTR86A1-ERV3-Mammalia, MamRep605-Transposable, MSTD-ERV3-Homo, MER103C-hAT-Homo, UCON104-Mariner/Tc1-Mammalia, MER21I-ERV1-Homo, L1MEC_5-L1-Eutheria, AluYa1, AluYd8, AluYa4, AluYa5, AluYa8, Tigger3c-Mariner/Tc1-Primates, MER21B-ERV3-Eutheria, LTR47B2-ERV3-Homo, AluSq4-SINE1/7SL-Primates, Tigger16a-Mariner/Tc1-Mammalia, LTR38A1-ERV1-Homo, CHARLIE1-hAT-Eutheria, MER8-Mariner/Tc1-Homo, Charlie17a-hAT-Mammalia, LTR16B-ERV3-Eutheria, MLT2A1-ERV3-Homo, L1P4d_5end-L1-Primates, X20_LINE-CR1-Mammalia, GOLEM_C-Mariner/Tc1-Homo, MLT1A1-ERV3-Eutheria, L1PREC1-L1-Homo, UCON66-Repetitive, L1MA8-L1-Homo, Eutr5-Eutr5-Eutheria, LTR39-ERV1-Homo, X7_DNA-hAT-Mammalia, MER70C-ERV3-Homo, HSFAU-HSFAU-Homo, EuthAT-2B-hAT-Eutheria, LTR35-ERV1-Homo, L2-CR1-Eutheria, L1ME5-L1-Eutheria, UCON99-DNA, LOR1-LTR, EUTREP12-EUTREP12-Eutheria, MER44A-Mariner/Tc1-Homo, MER21C-ERV3-Eutheria, LTR1B-ERV1-Homo, MER104C-DNA, Tigger16b-Mariner/Tc1-Mammalia, X17_DNA-Repetitive, CHARLIE6-hAT-Homo, LTR33-ERV3-Eutheria, HERVP71A_I-Endogenous, MER4I-LTR, LTR35B-ERV1-Homo, MER4BI-Endogenous, LTR7A-ERV3-Homo, LTR1D1-ERV1-Primates, TIGGER8-Mariner/Tc1-Homo, TIGGER5A-Mariner/Tc1-Eutheria, LTR71B-ERV1-Homo, HERV23-Endogenous, LTR67B-ERV3-Eutheria, MARE8-MARE8-Mammalia, MER68_I-ERV3-Eutheria, L1PA7_5-L1-Homo, L1-L1-Homo, Kanga1-Mariner/Tc1-Mammalia, LTR9C-ERV1-Homo, HUERS-P1-ERV1-Primates, LTR16-ERV3-Homo, LTR19C-ERV3-Homo, L1PB1-L1-Homo, MER66D-ERV1-Homo, L1M3DE_5-L1-Eutheria, BSRf-Satellite-Primates, L1MCA_5-L1-Homo, L1MA6-L1-Homo, L1MC2-L1-Homo, LTR38C-ERV1-Homo, L1PA16-L1-Homo, SUBTEL2_sat-SAT-Primates, L2C-L2-Eutheria, HERV35I-ERV1-Homo, SVA_C-SINE-Homo, L1M3C_5-L1-Homo, MER51E-ERV1-Homo, AluYc5-SINE1/7SL-Primates, LTR71A-ERV1-Homo, UCON86-L2-Mammalia, UCON70-Repetitive, PABL_AI-ERV1-Homo, CR1_Mam-CR1-Mammalia, L1PA3-L1-Homo, MER54-Transposable, MER51D-ERV1-Homo, LTR10B-ERV1-Homo, MARE11-MARE11-Mammalia, LTR90B-LTR, GSATII-SAT-Homo, LTR3B-ERV2-Homo, UCON37-Repetitive, MER96-hAT-Homo, MLT1A0-ERV3-Eutheria, MER92C-ERV1-Eutheria, L2D-L2-Eutheria, Eutr18-Eutr18-Eutheria, MER53-DNA, MER61B-ERV1-Homo, ORSL-2b-hAT-Mammalia, L1ME1-L1-Homo, MER41E-ERV1-Primates, L1PA5-L1-Homo, LTR10D-ERV1-Homo, LTR16E-ERV3-Homo, LTR43_I-ERV1-Primates, LTR1C2-ERV1-Homo, THE1D-ERV3-Homo, LTR82A-ERV3-Eutheria, L1ME4-L1-Eutheria, LTR1F2-ERV1-Primates, L2B-CR1-Eutheria, MER101-ERV1-Homo, MARE3-SINE-Mammalia, UCON88-Repetitive, HARLEQUINLTR-LTR, MER61E-LTR, ZOMBI_B-Mariner/Tc1-Eutheria, UCON91-Repetitive, LOR1a_LTR-ERV1-Primates, UCON72-Repetitive, L1PBB_5-L1-Homo, KER-KER-Homo, LTR38B-ERV1-Homo, LTR45-ERV1-Homo, X29b_DNA-DNA, LTR27C-ERV1-Homo, MER4D1-ERV1-Homo, Eutr8-hAT-Eutheria, Eutr2-Eutr2-Eutheria, AluSN3-SINE1/7SL-Primates, MER113-hAT-Homo, MLT1H1-ERV3-Homo, MER4A-ERV1-Homo, FLAM-SINE1/7SL-Primates, LTR77-ERV1-Homo, HERVR-ERV1-Papio, MER61D-LTR, MER97d-hAT-Eutheria, Eutr6-Eutr6-Eutheria, Charlie25-hAT-Mammalia, L1PB2c-L1-Homo, AluSN1-SINE1/7SL-Primates, AluYh9, CHARLIE1B-hAT-Eutheria, UCON41-Repetitive, ALU-SINE1/7SL-Primates, MER4E1-ERV1-Homo, LTR78B-ERV1-Homo, HAL1B-L1-Homo, MER96B-hAT-Homo, LTR8B-ERV1-Homo, MER4A1-ERV1-Homo, MLT2C2-ERV3-Homo, HERVS71-ERV1-Eutheria, MER92A-ERV1-Homo, MLT2B2-ERV3-Eutheria, Eutr15-Eutr15-Eutheria, X23_DNA-DNA, HERVK22I-ERV2-Eutheria, MER110I-ERV1-Homo, L1MCC_5-L1-Homo, LTR24-ERV1-Homo, LTR16A1-ERV3-Homo, LTR12B-ERV1-Homo, MLT1F2-ERV3-Eutheria, MER44C-Mariner/Tc1-Homo, X11_LINE-RTE-Mammalia, L1MC1-L1-Homo, X12_DNA-Mariner/Tc1-Mammalia, L1PBA_5-L1-Homo, HERVL74-ERV3-Homo, HARLEQUIN-ERV1-Homo, UCON106-Repetitive, MER34B_I-Endogenous, MER5C1-hAT-Eutheria, MER67B-ERV1-Homo, X19_LINE-CR1-Mammalia, ACRO1-SAT-Homo, MER119-hAT-Homo, LTR25-int-ERV1-Primates, MER69B-hAT-Eutheria, THE1C-ERV3-Homo, L1M3A_5-L1-Eutheria, X24_LINE-L2-Mammalia, L1MDB_5-L1-Homo, BLACKJACK-hAT-Eutheria, X22_DNA-DNA, LTR48B-ERV1-Homo, MER81-hAT-Homo, SVA_F-SINE-Homo, AluYbc3a, MER20-hAT-Homo, MER61A-Endogenous, GGAAT-SAT-Homo, MER9-ERV2-Homo, LTR06-ERV1-Homo, LTR21B-ERV1-Homo, ZOMBI_C-Mariner/Tc1-Eutheria, LTR54B-ERV1-Eutheria, HERVE-ERV1-Homo, HERVL-ERV3-Homo, L1ME_ORF2-L1-Homo, UCON95-hAT-Mammalia, LTR8-ERV1-Homo, MIRb-SINE2/tRNA-Mammalia, L1MA7-L1-Homo, L1PBA1_5-L1-Homo, X27_DNA-DNA, L1MB2-L1-Homo, UCON69-Repetitive, MER80B-hAT-Homo, L1MA5-L1-Homo, LTR90A-LTR, LTR15-ERV1-Homo, LTR36-ERV1-Homo, SVA_B-SINE-Homo, MER135-Transposable, MER103B-hAT-Homo, MER4E-ERV1-Homo, MLT1H-ERV3-Homo, LTR40B-ERV3-Homo, PrimLTR79-ERV1-Homo, MER83-ERV1-Homo, HERV39-Endogenous, MER63B-DNA, LTR85b-Gypsy-Mammalia, MamRep4096-hAT-Mammalia, MER70_I-LTR, MER4C-ERV1-Homo, L1M7_5end-L1-Mammalia, LTR76-ERV1-Homo, TIGGER1-Mariner/Tc1-Homo, CHARLIE8A-hAT-Eutheria, ERV3-16A3_I-ERV3-Homo, MER89-ERV1-Homo, HERV-K14I-ERV2-Homo, D20S16-SAT-Primates, MER75B-DNA, AluJr-SINE1/7SL-Primates, LTR10E-ERV1-Eutheria, LTR78-ERV1-Mammalia, L1ME5_3end-L1-Mammalia, EUTREP4-EUTREP4-Eutheria, MER6C-Mariner/Tc1-Eutheria, MER65B-ERV1-Homo, MSR1-MSAT-Homo, L1M2C_5-L1-Homo, LTR1A2-ERV1-Primates, AluYb8a1-SINE1/7SL-Homo, RPS2-Pseudogene-Homo, LTR84a-ERV3-Eutheria, UCON58-Repetitive, UCON98-Repetitive, CHARLIE2A-hAT-Homo, THE1_I-LTR, LTR40A-ERV3-Homo, MER68C-ERV3-Homo, L1PA15-L1-Homo, MER66C-ERV1-Homo, LTR75B-ERV3-Homo, X5b_DNA-DNA, SATR1-SAT-Homo, Eutr9-Eutr9-Eutheria, HERVH48I-Endogenous, AluMacYb4-SINE1/7SL-Macaca, L1MEA_5-L1-Homo, PABL_B-ERV1-Homo, X34_DNA-DNA, MER101_I-ERV1-Primates, LTR9A1-ERV1-Homo, MER68A-ERV3-Eutheria, LTR2-ERV1-Homo, MER47B-Mariner/Tc1-Eutheria, UCON43-Repetitive, MLT1E1-ERV3-Eutheria, HSATI-SAT-Primates, LTR19A-ERV3-Homo, MER34-ERV1-Homo, MER45-hAT-Homo, MSTA2-ERV3-Primates, AluYi6, 6kbHsap-satellite-Homo, UCON132b-hAT-Mammalia, LTR6A-ERV1-Homo, Charlie13a-hAT-Mammalia, LTR50-ERV3-Homo, EuthAT-2-hAT-Eutheria, HERV17-ERV1-Homo, MER84-ERV1-Homo, LTR47A2-ERV3-Homo, LTR22B1-ERV2-Homo, LTR38-ERV1-Homo, MER106-hAT-Homo, UCON90-Repetitive, HERVIP10FH-ERV1-Homo, MER83BI-ERV1-Homo, LTR88c-Gypsy-Mammalia, PABL_A-ERV1-Homo, Eutr17-Eutr17-Eutheria, SVA_A-SINE-Homo, LTR1C3-ERV1-Primates, L1MA10-L1-Eutheria, UCON46-Repetitive, L1ME3D_3end-L1-Eutheria, LTR27D-ERV1-Homo, AluY, TIGGER5_A-Mariner/Tc1-Eutheria, ALRa-SAT-Primates, TIGGER6A-Mariner/Tc1-Eutheria, MER46C-Mariner/Tc1-Eutheria, MER87B-ERV1-Homo, MIRc-SINE2/tRNA-Mammalia, AluYd3a1, MER58D-hAT-Eutheria, EUTREP8-EUTREP8-Eutheria, AluYb3a2, AluSg7-SINE1/7SL-Primates, AluSg4-SINE1/7SL-Primates, MER82-DNA, MER75A-piggyBac-Primates, UCON50-hAT-Mammalia, FLAM_C, MER89I-ERV1-Homo, FLAM_A, AluYe5, L1M1B_5-L1-Homo, MER47C-Mariner/Tc1-Eutheria, Charlie26a-hAT-Mammalia, ZOMBI_A-Mariner/Tc1-Homo, CHARLIE1A-hAT-Eutheria, X31_DNA-DNA, MER5A1-hAT-Eutheria, UCON64-Repetitive, MER97A-hAT-Homo, MER106B-hAT-Homo, LTR28C-ERV1-Homo, UCON59-Repetitive, UCON89-Repetitive, LTR18B-ERV3-Homo, LTR16D-ERV3-Homo, MER107-hAT-Homo, X3_LR-LTR, AluYe2, CR1_HS-CR1-Homo, UCON132a-hAT-Mammalia, Charlie13b-hAT-Mammalia, MER1A-hAT-Homo, MER124-Transposable, SVA_D-SINE-Homo, MER22-MER22-Homo, FLA, X4b_DNA-DNA, Ricksha_a-MuDR-Eutheria, MamRep488-hAT-Mammalia, MERX-Mariner/Tc1-Eutheria, TIGGER6B-Mariner/Tc1-Homo, MER31B-ERV1-Homo, UCON53-Repetitive, BSRa-Satellite-Primates, MER70B-ERV3-Homo, UCON49-L2-Mammalia, LTR12D-ERV1-Homo, MER87-ERV1-Homo, MER34C-ERV1-Homo, LTR16E2-ERV3-Eutheria, LTR7B-ERV3-Homo, MER97C-hAT-Homo, HERVL68-Endogenous, HERVIP10F-ERV1-Homo, L1PREC2-L1-Homo, L1PA4-L1-Homo, MamGypLTR1d-Gypsy-Mammalia, MER30B-hAT-Homo, MER52D-ERV1-Homo, MER50I-ERV1-Homo, THE1A-ERV3-Homo, UCON85-Repetitive, MER21C_BT-ERV3-Eutheria, MER52AI-ERV1-Homo, ALRb-SAT-Primates, CHARLIE2-hAT-Eutheria, Charlie22a-hAT-Mammalia, LTR89-ERV3-Mammalia, Eutr4-Eutr4-Eutheria, UCON65-Repetitive, PRIMAX_I-Endogenous, LTR10C-ERV1-Homo, ZOMBI-Mariner/Tc1-Eutheria, LTR16A2-ERV3-Homo, L1M6_5end-L1-Mammalia, MER5B-hAT-Homo, SATR2-SAT-Homo, MamGypLTR3-Gypsy-Mammalia, MER97B-hAT-Homo, X15_LINE-L2-Mammalia, THER2-SINE2/tRNA-Mammalia, MER104-DNA, HERVL_40-Endogenous, LTR83-ERV3-Eutheria, L1M1_5-L1-Eutheria, HERVKC4-ERV2-Eutheria, AluSN4-SINE1/7SL-Primates, HSTC2-Mariner/Tc1-Homo, UCON79-hAT-Mammalia, MSTB1-ERV3-Primates, X6a_DNA-DNA, Eutr14-Eutr14-Eutheria, AluJo, L1MEE_5-L1-Homo, LTR7C-ERV3-Homo, MER90-ERV1-Homo, X21_LINE-CR1-Mammalia, X32_DNA-Mariner/Tc1-Mammalia, MLT2D-ERV3-Homo, L1MB3-L1-Homo, MamGypLTR1b-Gypsy-Mammalia, LTR73-ERV1-Homo, MER50B-ERV1-Homo, MLT1H2-ERV3-Homo, X24_DNA-DNA, L1HS-L1-Homo, ERVL-ERV3-Homo, FRAM-SINE1/7SL-Primates, LTR17-ERV1-Homo, L1MEB_5-L1-Homo, SUBTEL_sat-Satellite-Primates, LTR13-ERV2-Homo, MER3-hAT-Eutheria, MER57D-ERV1-Eutheria, MER11B-ERV2-Primates, L1MC5-L1-Eutheria, MST_I-ERV3-Eutheria, MLT1_I-ERV3-Eutheria, MER72-ERV1-Homo, REP522-Satellite-Primates, LTR1D-ERV1-Homo, Charlie15a-hAT-Eutheria, MER116-DNA, CHARLIE7-hAT-Homo, UCON80-Repetitive, BSRb-Satellite-Primates, AluJr4-SINE1/7SL-Primates, LTR70-ERV1-Homo, MER11A-ERV2-Homo, AluYb10-SINE1/7SL-Homo, LTR12-ERV1-Primates, MER2B-Mariner/Tc1-Eutheria, L3-CR1-Homo, MER21-ERV3-Homo, AluYd3, AluYd2, MSTC-ERV3-Eutheria, LTR54-ERV1-Eutheria, CHARLIE3-hAT-Homo, MER58B-hAT-Eutheria, HERVH-ERV1-Eutheria, SVA_E-SINE-Homo, MIR-SINE2/tRNA-Mammalia, X11_DNA-DNA, MER73-ERV3-Homo, LTR1C1-ERV1-Primates, MER104A-DNA, LTR27E-ERV1-Homo, MER68B-ERV3-Homo, Tigger10-Mariner/Tc1-Mammalia, MER57C1-ERV1-Eutheria, MER65D-ERV1-Homo, X6b_DNA-DNA, LTR47A-ERV3-Homo, MLT1M-ERV3-Mammalia, L1MB3_5-L1-Homo, Eutr7-hAT-Eutheria, LTR66-ERV3-Homo, LTR12C-ERV1-Homo, HERVK13I-ERV2-Homo, MER48-ERV1-Homo, LTR88b-Gypsy-Mammalia, MER41G-ERV1-Homo, MER41C-ERV1-Homo, LTR85a-Gypsy-Mammalia, Charlie19a-hAT-Mammalia, HAL1-L1-Eutheria, MER52A-ERV1-Homo, LTR8A-ERV1-Homo, PABL_BI-ERV1-Homo, AluSp, AluSq, MER67C-ERV1-Homo, MER67A-ERV1-Homo, MER30-hAT-Vertebrata, LTR14-ERV2-Homo, MER20B-hAT-Homo, AluSz, LTR24C-ERV1-Homo, Eutr3-Eutr3-Eutheria, MER80-hAT-Eutheria, AluSg, AluSc, LTR59-ERV1-Homo, LTR1-ERV1-Homo, MLT1C-ERV3-Eutheria, MER65C-ERV1-Homo, MER74B-ERV3-Homo, LTR23-ERV1-Homo, AluYc2, MLT1G3-ERV3-Homo, L1PB4-L1-Homo, AluYc1, MER57A1-ERV1-Homo, MLT-int-ERV3-Eutheria, MER72B-ERV1-Homo, MER65A-ERV1-Eutheria, X20_DNA-DNA, X2a_DNA-DNA, L1P4a_5end-L1-Primates, MLT1F_I-ERV3-Eutheria, HERVK9I-ERV2-Homo, AluSN, LTR45B-ERV1-Homo, L1MC4_5end-L1-Eutheria, HERV3-ERV1-Homo, MARE5-hAT-Mammalia, L1MB5-L1-Homo, HSATII-SAT-Primates, LTR88a-Gypsy-Mammalia, LTR86B1-ERV3-Mammalia, HERV19I-ERV1-Homo, X21_DNA-hAT-Mammalia, L1P4b_5end-L1-Primates, HERVG25-Endogenous, LTR7Y-ERV3-Primates, LTR26B-ERV1-Primates, MLT1E1A-ERV3-Eutheria, MER6-Mariner/Tc1-Eutheria, ALRa_-SAT-Primates, L1MA5A-L1-Homo, LTR19B-ERV3-Homo, LTR68-ERV1-Eutheria, LTR16B2-ERV3-Eutheria, MER6B-Mariner/Tc1-Homo, MER91B-hAT-Eutheria, L1PA12-L1-Homo, LTR49-ERV1-Homo, UCON105-Repetitive, MER75-DNA, UCON82-Repetitive, GOLEM-Mariner/Tc1-Eutheria, LTR75_1-ERV1-Eutheria, CHARLIE4-hAT-Eutheria, MER6A-Mariner/Tc1-Primates, Tigger15a-Mariner/Tc1-Mammalia, LTR2C-ERV1-Homo, HERV52I-Endogenous, L5-RTEX-Mammalia, LTR22B-ERV2-Homo, CHESHIRE-hAT-Homo, LTR16C-ERV3-Homo, UCON87-Repetitive, X4_LR-LTR
G60628.GTEX-13OVH-1826.2.unmapped_after_rRNA_lostHuman.fasta_lostRepeats_blastFormat6, 0, 4, 4, 5, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0, 0, 2, 4, 0, 151, 2, 11, 12, 0, 11, 0, 4, 14, 1217, 4, 120, 0, 0, 48, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 58, 2, 1, 0, 0, 15, 1, 2, 0, 0, 0, 0, 0, 27469, 0, 10, 0, 1, 0, 0, 0, 10, 1, 608, 4, 0, 0, 0, 19, 0, 0, 0, 4, 96, 72, 0, 0, 0, 14, 1, 0, 0, 1, 76, 0, 0, 4, 982, 2, 0, 4, 27565, 32, 0, 64, 22, 5, 66, 0, 1, 0, 8, 8, 0, 0, 1, 0, 1, 0, 3, 0, 0, 1, 0, 43, 0, 4, 0, 0, 79, 0, 11, 10, 0, 0, 0, 4, 6, 0, 95, 8, 3877, 0, 0, 10, 0, 0, 12, 0, 7, 0, 2, 0, 48, 0, 0, 0, 0, 0, 963, 0, 0, 0, 0, 4, 2, 1, 1, 8, 29, 0, 145, 0, 0, 0, 0, 0, 0, 18987, 0, 1, 0, 0, 0, 0, 1, 176, 24254, 0, 0, 0, 0, 0, 57, 6, 0, 0, 1328, 0, 0, 0, 1, 0, 0, 1, 71, 0, 79, 1, 9, 20519, 3, 0, 24725, 0, 14426, 0, 15, 0, 0, 18, 2, 1, 0, 0, 99, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 931, 0, 1, 0, 0, 0, 0, 3, 16080, 3, 0, 0, 87, 0, 0, 0, 0, 3, 1, 47, 0, 18777, 0, 0, 0, 0, 5, 0, 0, 0, 0, 17, 6, 0, 5, 0, 0, 19, 47, 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 6, 26435, 17996, 39, 0, 3, 8, 1, 4, 0, 22, 0, 0, 1, 0, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 3, 0, 4, 0, 296, 0, 0, 0, 0, 0, 4, 9, 2, 0, 7, 0, 18, 0, 0, 379, 28, 368, 0, 0, 0, 0, 0, 3, 21, 17401, 2, 0, 0, 0, 0, 0, 2, 3, 0, 1, 0, 0, 0, 4, 0, 0, 0, 1, 0, 3, 0, 0, 60, 0, 5, 22738, 4, 0, 18621, 6, 40, 0, 60, 2, 0, 0, 1576, 0, 0, 0, 0, 22, 0, 3, 0, 1, 0, 0, 0, 6, 19434, 0, 0, 0, 0, 1, 0, 0, 3, 0, 12, 9, 1, 0, 0, 33280, 0, 2, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 3, 75, 0, 0, 1, 0, 1, 1, 1622, 0, 0, 1, 0, 0, 0, 11, 67, 3, 1, 0, 0, 3, 0, 0, 0, 6, 0, 0, 21026, 0, 0, 0, 4, 0, 5, 0, 0, 1, 1, 0, 0, 0, 4, 0, 0, 2, 0, 14, 0, 24204, 0, 1, 34, 0, 0, 10, 0, 17, 0, 31980, 0, 1, 0, 0, 0, 1, 0, 0, 0, 15, 26, 0, 377, 22022, 54, 1, 0, 1, 1, 16268, 29, 0, 0, 5, 0, 21304, 4, 2, 8, 0, 2, 0, 25, 0, 0, 0, 3, 0, 0, 22, 0, 79, 0, 7, 0, 0, 102, 432, 0, 0, 0, 18, 0, 0, 0, 26097, 2447, 23187, 21271, 16182, 0, 5, 0, 31175, 0, 2, 1, 0, 0, 22, 0, 1, 24, 0, 2, 0, 0, 0, 2, 3, 0, 0, 296, 0, 3, 107, 0, 0, 8, 42, 1, 0, 0, 0, 0, 0, 21, 0, 0, 7, 53, 0, 0, 9, 3, 2, 0, 0, 0, 0, 0, 0, 8, 10, 0, 13, 0, 0, 86, 0, 0, 0, 3, 99, 43, 0, 0, 10, 0, 11, 2614, 0, 0, 20289, 0, 0, 0, 17, 1, 1075, 5, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 0, 1, 2, 0, 28, 0, 0, 1314, 0, 1, 0, 0, 1, 121, 0, 0, 0, 1, 0, 0, 0, 16, 2, 11, 1, 6, 0, 0, 0, 0, 0, 0, 36, 0, 34870, 0, 1, 0, 4655, 0, 2, 0, 0, 0, 0, 0, 175, 36705, 13751, 0, 0, 0, 0, 0, 15, 0, 0, 0, 1, 17, 0, 1, 8, 2, 0, 0, 12, 0, 1, 0, 116, 1, 10, 0, 56, 0, 21, 0, 25, 0, 14, 0, 0, 0, 0, 0, 3, 0, 139, 0, 0, 0, 0, 0, 0, 2412, 21523, 1, 0, 0, 6, 0, 0, 29648, 0, 3, 63, 0, 0, 19, 21, 7, 3, 0, 65, 0, 0, 0, 70, 0, 1, 0, 5, 0, 3362, 0, 0, 3, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 113, 224, 6, 0, 0, 1, 0, 2, 16102, 9, 0, 0, 0, 6, 30, 4, 22078, 0, 0, 0, 0, 0, 139, 0, 0, 189, 2, 0, 0, 93, 4, 0, 19, 0, 6, 0, 0, 5, 0, 0, 0, 0, 0, 1, 0, 0, 21, 18166, 1, 0, 2, 25, 0, 0, 16, 1, 0, 0, 0, 0, 0, 12, 1, 5, 7, 0, 2243, 28, 11, 0, 28013, 22, 5, 1, 1, 0, 15925, 0, 17989, 0, 23009, 25555, 31490, 0, 0, 0, 1, 0, 4655, 4, 1, 0, 0, 2, 1, 1, 55, 0, 0, 1, 0, 0, 13, 0, 0, 0, 25607, 0, 0, 0, 0, 46, 3, 2570, 46, 0, 3217, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 191, 0, 0, 0, 2, 0, 37, 3, 3, 1412, 0, 26, 2, 6, 2, 0, 0, 6, 0, 16, 0, 0, 1, 0, 6, 10, 0, 0, 0, 18235, 0, 0, 0, 0, 0, 0, 0, 0, 5, 18463, 0, 0, 0, 23, 0, 0, 0, 0, 6, 0, 0, 0, 3, 0, 82, 0, 0, 0, 0, 0, 2317, 17, 6922, 11, 0, 1, 86, 0, 0, 62, 0, 41, 1, 0, 0, 0, 0, 0, 82, 0, 12861, 171, 36, 20134, 135, 0, 0, 0, 21348, 25356, 105, 4, 49, 0, 13, 54, 20089, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 8, 273, 9, 1, 0, 0, 8, 0, 15, 0, 0, 3, 0, 0, 26697, 35961, 1, 1, 30, 0, 0, 35472, 0, 0, 0, 35257, 0, 0, 94, 18, 0, 0, 115, 26256, 0, 0, 27115, 3, 0, 1, 8, 0, 0, 0, 96, 36252, 9118, 1, 0, 5, 0, 84, 0, 0, 0, 13, 0, 0, 25771, 58, 0, 69, 1, 43, 3, 2, 0, 0, 0, 0, 0, 3, 2, 0, 2, 0, 1, 0, 0, 5, 0, 3, 0, 0, 0, 0, 18, 0, 0, 0
```

The first row 's first column says "File_Name" to label the file that will come below it in the second row, and then has every element filling out the rest of the row, each one separated by commas.

The second row's first column has the full title of the sample without the original ".tsv" extension. The rest of the second row has every number of reads that matched up with each element in the sample.

An example of this output file's name:

```
G60618.GTEX-13OVG-0526.2.unmapped_after_rRNA_lostHuman.fasta_lostRepeats_blastFormat6_horizfreq.csv
```

Important Note:

This output file, although less human-readable, can be used for graphing, but it can also be used to show the data of many samples at once - the second row from the outputfile for other samples can all be concatenated together to produce one large file of data.

The bash script to concatenate many of these output files together is provided below for your convenience:

```
for z in [location of many horizontal output files]; do grep -v File_Name $z; done > latter.csv


grep File_Name [location of one horizontal output file] > former.csv

cat former.csv latter.csv > /u/home/k/kwesel/scratch/cancerSkin/completeervfile.csv


rm former.csv
rm latter.csv
```

NOTE: We recommend normalizing the repeat counts. For example by the total number of reads for each sample.
