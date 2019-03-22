#!/usr/bin/env bash
for lang in 'chi_sim_best+eng_best' 'chi_tra_best+eng_best' 'chi_sim_fast+eng_fast' 'chi_tra_fast+eng_fast'; do
    for chr in '' 'digits'; do
        for oem in 0 1 2; do
            for psm in 1 3 4 5 6 7 11 12; do
                tesseract 600dpi_fc.jpg $lang.oem$oem.psm$psm.$chr --oem $oem --psm $psm $chr;
            done;
        done;
    done;
done
