exemplo_lista <- list(
  letra = "A",
  vetor = unique(palmerpenguins::penguins$species),
  tabela = palmerpenguins::penguins,
  lista_exemplo = list(
    numero = 1
  )
)


# install.packages("quarto")
# ---

quarto::quarto_render(input = "aula-5/aula-5.qmd")
# ---

quarto::quarto_render(input = "aula-5/aula-5.qmd",
                      execute_params = list(especie = "Gentoo")
                      )

# ---
quarto::quarto_render(input = "aula-5/aula-5.qmd",
                      execute_params = list(especie = "Gentoo"),
                      output_file = "Relatorio_Gentoo.html"
                      )

# -----
quarto::quarto_render(input = "aula-5/aula-5.qmd",
                      execute_params = list(especie = "Gentoo"),
                      output_file = "Relatorio_Gentoo.html"
                      )
fs::file_move(path = "Relatorio_Gentoo.html", 
              new_path = "aula-5/Relatorio_Gentoo.html"
              )

# -----

nome_especie <- "Chinstrap"
arquivo_html <- paste0("Relatorio_", nome_especie, ".html")
caminho_final <- paste0("aula-5/", arquivo_html)


quarto::quarto_render(
  input = "aula-5/aula-5.qmd",
  execute_params = list(especie = nome_especie),
  output_file = arquivo_html
)
fs::file_move(path = arquivo_html, new_path = caminho_final)

# ----

nome_da_funcao <- function(argumento){
  # o que a função executa
}

sortear_nome <- function(quantidade){
  nomes <- c("Beatriz", "Alan", "Taty", "Alex", "Edson")
  
  if(!is.numeric(quantidade)){
      usethis::ui_stop("Defina um valor numérico para a quantidade")    
  }

  nome_sorteado <- sample(nomes, size = quantidade)
  
  usethis::ui_done("A pessoa sorteada é: {nome_sorteado}")
}

# Experimentando a função

sortear_nome()

sortear_nome("A")

sortear_nome(2)

# sobre os argumentos padrão
round(1.234)

round(1.234, digits = 1)

# ------

contar_diferenca_dias <- function(dia_inicial = Sys.Date(), dia_final){
  
  if(!lubridate::is.Date(dia_inicial)){
    dia_inicial <- lubridate::as_date(dia_inicial)
  }
  
  if(!lubridate::is.Date(dia_final)){
    dia_final <- lubridate::as_date(dia_final)
  }
  
  diferenca_dias <- dia_final - dia_inicial
  
  usethis::ui_info("A diferença entre as datas {format(dia_inicial, '%d/%m/%y')} e {format(dia_final, '%d/%m/%y')} é de {diferenca_dias} dias")
}

contar_diferenca_dias(dia_inicial = Sys.Date(), dia_final = "2025-02-15")

contar_diferenca_dias(dia_inicial = "2025-02-15", dia_final = "2025-03-04")

contar_diferenca_dias(dia_final = "2025-03-04")

# -----

# Vamos transformar isso em função! 

gerar_relatorio_pinguins <- function(nome_especie = "Chinstrap"){

  arquivo_html <- paste0("Relatorio_", nome_especie, ".html")
  caminho_final <- paste0("aula-5/", arquivo_html)
  
  
  quarto::quarto_render(
    input = "aula-5/aula-5.qmd",
    execute_params = list(especie = nome_especie),
    output_file = arquivo_html
  )
  fs::file_move(path = arquivo_html, new_path = caminho_final)
  
  usethis::ui_done("Arquivo gerado: {caminho_final}")
  
}


gerar_relatorio_pinguins("Adelie")
gerar_relatorio_pinguins("Gentoo")
gerar_relatorio_pinguins("Chinstrap")

# iterar com purrr

library(purrr)

# map(vetor_para_iterar, funcao)

especies_possiveis <- unique(palmerpenguins::penguins$species)

map(especies_possiveis, gerar_relatorio_pinguins, .progress = TRUE)




