#!/bin/bash
for lang in chi_sim chi_sim_fast chi_sim_best eng eng_fast eng_best; do
    for psm in {6..13}; do
        echo "$lang $psm";
        st=$(date +%s);
        time for l in {0..49}; do
            (echo;
             for c in {0..7}; do
                 tesseract cell_r${l}_c_$c.jpg - -l $lang --oem 3 --psm $psm 2>/dev/null | head -1 | tr -d '[\n\r\f]';
                 echo -en '\t';
             done;) >> pagecells50x8.${lang}.oem3.psm${psm}.tsv;
        done;
        echo $(($(date +%s) - st));
    done;
done
