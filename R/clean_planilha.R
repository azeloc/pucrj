#' @export
clean_planilha_controle <- function(arq){

  cnj_pattern <- '[0-9]{7}-[0-9]{2}\\.[0-9]{4}\\.8\\.26\\.[0-9]{4}'

  openxlsx::read.xlsx(arq) %>%
    dplyr::filter(!is.na(X2)) %>%
    dplyr::rename(processo = `Parâmetros.do.relatório`,
           alunos = X2) %>%
    dplyr::mutate(alunos = stringr::str_trim(alunos)) %>%
    tidyr::separate(alunos, into = c("aluno1","aluno2"), sep = " e ") %>%
    dplyr::mutate(n_processo = stringr::str_extract(processo, cnj_pattern),
                  n_processo = stringr::str_replace_all(n_processo, "[.-]",""))
}
