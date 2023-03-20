#language: pt

@gerador_certidao
Funcionalidade: Validar a api de geração de certidão de nascimento
  Para que eu possa realizar consultas de certidão de nascimento
  Sendo um usuário do 4Devs
  Posso receber as informações geradas de certidão de nascimento

  Esquema do Cenário: Validar a geração de certidão de nascimento
    Quando chamar o endpoint de certidão de nascimento
    | pontuacao     | <pontuacao> |
    | tipo_certidao | <tipo_certidao> |
    Então validar o retorno do endpoint de certidão de nascimento
  Exemplos:
    | pontuacao | tipo_certidao              |
    | sim       | Indiferente                |
    | sim       | Nascimento                 |
    | sim       | Casamento                  |
    | sim       | Casamento Efeito Religioso |
    | sim       | Óbito                      |
    | não       | Indiferente                |
    | não       | Nascimento                 |
    | não       | Casamento                  |
    | não       | Casamento Efeito Religioso |
    | não       | Óbito                      |
