 TransLog Express - Sistema de Controle de Manutenção de Veículos

Este repositório contém a documentação e os scripts iniciais para o desenvolvimento de um sistema de controle de manutenção para a frota da empresa TransLog Express. O objetivo é gerenciar o histórico de manutenções, custos, quilometragem e emitir alertas de revisão.

 Visão Geral do Projeto

O sistema é projetado para ser uma aplicação web robusta, utilizando uma arquitetura moderna e tecnologias de código aberto. Ele suporta diferentes perfis de usuário (Administrador, Mecânico e Motorista) e foca na rastreabilidade e prevenção de falhas na frota.

 Stack Tecnológica

A infraestrutura do projeto foi definida para garantir escalabilidade e agilidade no desenvolvimento:

Categoria
Tecnologia
Detalhe
SGBD
Supabase (PostgreSQL)
Banco de dados relacional gerenciado, utilizado para armazenar todos os dados do sistema.
Backend
Python com Django
Framework robusto para lógica de negócios, autenticação e API.
Frontend
HTML5, CSS3, JavaScript
Tecnologias web padrão para a interface do usuário.


 Instalação e Configuração

Siga os passos abaixo para configurar o ambiente de banco de dados utilizando o Supabase.

1. Configuração do Supabase

1.
Crie um Projeto: Acesse o Supabase Dashboard e crie um novo projeto.

2.
Acesse o Editor SQL: No menu lateral do seu projeto, navegue até SQL Editor.

3.
Execute o Script de Criação:

•
Abra o arquivo 3_script_sql.sql deste repositório.

•
Copie e cole todo o conteúdo do script no editor SQL do Supabase.

•
Execute o script. Ele criará as tabelas (USUARIO, VEICULO, MANUTENCAO, ALERTA) e inserirá os dados iniciais de teste.



2. Documentação do Projeto

Todos os documentos detalhados do projeto estão disponíveis neste repositório:

Arquivo
Conteúdo
1_requisitos_funcionais.md
Lista de Requisitos Funcionais (RFs).
2_der_modelo_de_dados.md
Diagrama Entidade-Relacionamento (DER) e Modelo de Dados.
3_script_sql.sql
Script SQL de Criação e População do Banco de Dados.
4_documentacao_interfaces.md
Descrição das Interfaces de Login, Principal, Cadastro e Manutenção.
5_casos_de_teste.md
Casos de Teste (Sucesso e Falha).
6_requisitos_infraestrutura.md
Requisitos de Infraestrutura e Stack Tecnológica.


 Próximos Passos (Desenvolvimento)

Com o banco de dados configurado no Supabase, o próximo passo seria:

1.
Configurar o Backend (Django): Conectar o framework Django ao banco de dados PostgreSQL do Supabase.

2.
Implementar a Autenticação: Utilizar o sistema de autenticação do Django (ou do próprio Supabase Auth) para gerenciar os perfis de Admin, Mecânico e Motorista.

3.
Desenvolver as Interfaces: Criar as telas descritas em 4_documentacao_interfaces.md, utilizando o backend para interagir com o Supabase.

4.
Implementar a Lógica de Alerta: Criar uma rotina no backend que verifique a quilometragem dos veículos e gere os alertas na tabela ALERTA (RF06).

5.
Testes: Executar os testes definidos em 5_casos_de_teste.md.

