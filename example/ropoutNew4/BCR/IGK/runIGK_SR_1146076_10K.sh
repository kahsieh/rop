ln -s /u/home/s/serghei/code2/rop//db/BCRTCR/internal_data/ ./ 
/u/home/s/serghei/code2/rop/tools/igblastn -germline_db_V /u/home/s/serghei/code2/rop/db/BCRTCR/IGKV.fa -germline_db_D /u/home/s/serghei/code2/rop/db/BCRTCR/IGHD.fa  -germline_db_J /u/home/s/serghei/code2/rop/db/BCRTCR/IGKJ.fa -query /u/home/s/serghei/code2/rop/example/ropoutNew4/QC/SR_1146076_10K_after_rRNA.fasta -outfmt 7 -evalue 1e-05  | awk '{if($13<1e-05 && ($1=="V" || $1=="J")) print }' >/u/home/s/serghei/code2/rop/example/ropoutNew4/BCR/IGK/SR_1146076_10K_IGK_igblast.csv
echo "done!"> /u/home/s/serghei/code2/rop/example/ropoutNew4/BCR/IGK//SR_1146076_10K_igk.done 