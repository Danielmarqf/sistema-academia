Sistema Academia

Projeto desenvolvido como parte do critério avaliativo do 5º Semestre do curso de Engenharia de Software. A aplicação consiste em um sistema de gerenciamento de academia robusto, utilizando conceitos avançados de Orientação a Objetos, Arquitetura MVC e Padrões de Projeto (Design Patterns) aplicados de forma nativa.

Tecnologias e Ferramentas

Linguagem: Java (Java EE 8 / Jakarta EE)
Tecnologias Web: Servlets, JSP (JavaServer Pages) e JAX-RS
Persistência de Dados: Padrão DAO (Data Access Object) com JDBC
Servidor de Aplicação: GlassFish / Payara Server
IDE: NetBeans


Arquitetura e Padrões de Projeto (Design Patterns)

Para atender aos rigorosos critérios arquiteturais da engenharia de software, o sistema foi construído sem dependência de frameworks mágicos, implementando os padrões puramente através de Orientação a Objetos:

1. Command Pattern (Padrão de Comportamento)
Utilizado para desacoplar a camada de controle (`Controller`) das ações da aplicação. Cada requisição HTTP é interceptada e mapeada para um comando específico que implementa a interface `Comando`.
Onde encontrar no código: Pacote `command` (ex: `SalvarAlunoComando.java`, `AtualizarProfessorComando.java`).

2. Builder Pattern (Padrão de Criação)
Implementado para a construção fluida e segura de objetos complexos do domínio, eliminando construtores gigantescos ("telescópicos") e garantindo a imutabilidade durante a transferência de dados das requisições.
Onde encontrar no código: Pacote `builder` (`AlunoBuilder.java` e `ProfessorBuilder.java`).

3. Decorator Pattern (Padrão Estrutural)
Mecanismo dinâmico utilizado para calcular o valor dos planos dos alunos e seus respectivos serviços adicionais de forma flexível e cumulativa, sem o uso de condicionais aninhadas (`if/else`).
Onde encontrar no código: Pacote `service.plano` (com as classes `PlanoBasico`, `PlanoPremium`, `DietaDecorator`, `MassagemDecorator` e `PilatesDecorator`).


Recursos Extras 

Padrões REST API
O sistema expõe de forma adequada endpoints RESTful utilizando a especificação oficial JAX-RS para integração de dados, realizando a negociação de conteúdo e retornando coleções estruturadas no formato JSON.
Endpoint:`/api/alunos` (Método HTTP: `GET`)
Onde encontrar no código: Pacote `com.mycompany.sistemaacademia.resources.AlunoResource.java`


Estrutura Principal do Projeto

src/
├── builder/          Classes de construção fluida (Builder Pattern)
├── command/          Desacoplamento de requisições (Command Pattern)
├── controller/       Servlet central (Front Controller)
├── dao/              Camada de persistência (Data Access Object)
├── model/            Entidades de Domínio (Relacionamentos e Herança)
├── service/
│   └── plano/        Componentes e Decoradores de preço (Decorator Pattern)
└── com/mycompany/sistemaacademia/resources/
    └── AlunoResource.java # Endpoint RESTful da aplicação
