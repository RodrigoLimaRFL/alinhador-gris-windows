@echo off
setlocal enabledelayedexpansion
REM --- Parameters ---
set "min_sim=0.5"
set "min_seq_sim=0.5"
set "min_str_sim=0.5"
set "max_wer=0.5"
set "pa=15"
set "ps=0.3"
set "a=0.5"

REM --- Array of pairs ---
set "pairs[0]=entoa_tts_auto_SP_D2_255.txt|entoa_tts_prosodic_SP_D2_255.txt"
set "pairs[1]=entoa_tts_auto_SP_D2_333.txt|entoa_tts_prosodic_SP_D2_333.txt"
set "pairs[2]=entoa_tts_auto_SP_D2_343.txt|entoa_tts_prosodic_SP_D2_343.txt"
set "pairs[3]=entoa_tts_auto_SP_D2_360.txt|entoa_tts_prosodic_SP_D2_360.txt"
set "pairs[4]=entoa_tts_auto_SP_D2_396.txt|entoa_tts_prosodic_SP_D2_396.txt"
set "pairs[5]=entoa_tts_auto_SP_DID_018.txt|entoa_tts_prosodic_SP_DID_018.txt"
set "pairs[6]=entoa_tts_auto_SP_DID_137.txt|entoa_tts_prosodic_SP_DID_137.txt"
set "pairs[7]=entoa_tts_auto_SP_DID_161.txt|entoa_tts_prosodic_SP_DID_161.txt"
set "pairs[8]=entoa_tts_auto_SP_DID_208.txt|entoa_tts_prosodic_SP_DID_208.txt"
set "pairs[9]=entoa_tts_auto_SP_DID_235.txt|entoa_tts_prosodic_SP_DID_235.txt"
set "pairs[10]=entoa_tts_auto_SP_DID_242.txt|entoa_tts_prosodic_SP_DID_242.txt"
set "pairs[11]=entoa_tts_auto_SP_DID_250.txt|entoa_tts_prosodic_SP_DID_250.txt"
set "pairs[12]=entoa_tts_auto_SP_DID_251.txt|entoa_tts_prosodic_SP_DID_251.txt"
set "pairs[13]=entoa_tts_auto_SP_EF_124.txt|entoa_tts_prosodic_SP_EF_124.txt"
set "pairs[14]=entoa_tts_auto_SP_EF_153.txt|entoa_tts_prosodic_SP_EF_153.txt"
set "pairs[15]=entoa_tts_auto_SP_EF_156.txt|entoa_tts_prosodic_SP_EF_156.txt"
set "pairs[16]=entoa_tts_auto_SP_EF_377.txt|entoa_tts_prosodic_SP_EF_377.txt"
set "pairs[17]=entoa_tts_auto_SP_EF_388.txt|entoa_tts_prosodic_SP_EF_388.txt"
set "pairs[18]=entoa_tts_auto_SP_EF_405.txt|entoa_tts_prosodic_SP_EF_405.txt"

REM --- Process each pair ---
for /L %%n in (0,1,18) do (
    set "elems=!pairs[%%n]!"
    
    REM --- Split the pair by delimiter "|" ---
    for /f "tokens=1,2 delims=|" %%i in ("!elems!") do (
        set "file1=%%i"
        set "file2=%%j"
        echo Processing [%%n/18]: !file1! and !file2!
        
        REM --- Make output directory ---
        set "out_dir=aligns_%min_sim%_%min_seq_sim%_%min_str_sim%_%max_wer%_%pa%_%ps%_%a%\!file1!"
        if not exist "!out_dir!" mkdir "!out_dir!"
        
        REM --- Run python command ---
        python aligner/main.py "!file1!" ^
            --target-texts "!file2!" ^
            --output-preliminary-csv "!out_dir!\prel.csv" ^
            --output-csv "!out_dir!\final.csv" ^
            --decimal-csv "," ^
            --min-similarity %min_sim% ^
            --min-seq-similarity %min_seq_sim% ^
            --min-str-similarity %min_str_sim% ^
            --max-wer %max_wer% ^
            -pa %pa% ^
            -ps %ps% ^
            -a %a% ^
            -l INFO ^
        > "!out_dir!\out.txt"
        
        echo Completed !file1! and !file2!
    )
)

echo All processing complete!
pause