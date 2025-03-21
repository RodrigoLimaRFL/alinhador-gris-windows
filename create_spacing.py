def replace_seg_with_newline(input_file, output_file=None):
    """
    Replaces all instances of <seg> with a newline in a text file.
    
    :param input_file: Path to the input text file.
    :param output_file: Path to the output file (optional, overwrites if None).
    """
    with open(input_file, 'r', encoding='utf-8') as file:
        content = file.read()
    
    modified_content = content.replace("<seg>", "\n")
    
    if output_file is None:
        output_file = input_file  # Overwrite the original file
    
    with open(output_file, 'w', encoding='utf-8') as file:
        file.write(modified_content)
    
    print(f"Processed file saved as: {output_file}")

arquivos = [
    "prosodic/entoa_tts_prosodic_SP_D2_396.txt",
    "prosodic/entoa_tts_prosodic_SP_DID_018.txt",
    "prosodic/entoa_tts_prosodic_SP_DID_137.txt",
    "prosodic/entoa_tts_prosodic_SP_DID_161.txt",
    "prosodic/entoa_tts_prosodic_SP_DID_208.txt",
    "prosodic/entoa_tts_prosodic_SP_DID_235.txt",
    "prosodic/entoa_tts_prosodic_SP_DID_242.txt",
    "prosodic/entoa_tts_prosodic_SP_DID_250.txt",
    "prosodic/entoa_tts_prosodic_SP_DID_251.txt",
    "prosodic/entoa_tts_prosodic_SP_EF_124.txt",
    "prosodic/entoa_tts_prosodic_SP_EF_153.txt",
    "prosodic/entoa_tts_prosodic_SP_EF_156.txt",
    "prosodic/entoa_tts_prosodic_SP_EF_377.txt",
    "prosodic/entoa_tts_prosodic_SP_EF_388.txt",
    "prosodic/entoa_tts_prosodic_SP_EF_405.txt",
    "prosodic/entoa_tts_prosodic_SP_D2_255.txt",
    "prosodic/entoa_tts_prosodic_SP_D2_333.txt",
    "prosodic/entoa_tts_prosodic_SP_D2_343.txt",
    "prosodic/entoa_tts_prosodic_SP_D2_360.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_EF_153.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_EF_156.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_EF_377.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_EF_388.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_EF_405.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_D2_255.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_D2_333.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_D2_343.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_D2_360.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_D2_396.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_DID_018.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_DID_137.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_DID_161.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_DID_208.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_DID_235.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_DID_242.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_DID_250.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_DID_251.txt",
    "automatic_sem_cabecalho/entoa_tts_auto_SP_EF_124.txt",
]

for arquivo in arquivos:
    replace_seg_with_newline(arquivo)
