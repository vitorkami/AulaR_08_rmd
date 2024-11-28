####---------------------- Github e projects------------------------ ##########
library(usethis)

#Confiurando o Git:
usethis::use_git_config(user.nane= "Vitor Kamimura",
                        user.email= "vitorkami@msn.com")

#Criando token:
usethis::create_github_token()

#Criando um projects:
usethis::create_project("/Users/kamimuravitor/Library/CloudStorage/OneDrive-Pessoal/ACADEMIA/POS-DOCS - Geral
                        /UNICAMP/Disciplinas ministradas/AulaR/Git/Github_Markdown") #Nunca façam isso.

#Criando o respositorio no github:

usethis::use_git()

usethis::use_github()

usethis::use_readme_md()
