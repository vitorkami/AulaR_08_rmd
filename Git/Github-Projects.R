####---------------------- Github e projects------------------------ ##########
library(usethis)

#Confiurando o Git:
usethis::use_git_config(user.nane= " ",
                        user.email= " ")

#Criando token:
usethis::create_github_token()

#Criando um projects:
usethis::create_project("/Users/kamimuravitor/Library/") #

#Criando o respositorio no github:

usethis::use_git()

usethis::use_github()

usethis::use_readme_md()
