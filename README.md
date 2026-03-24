# 🛒 Projeto E-commerce – Banco de Dados SQL

## 📌 Descrição

Este projeto tem como objetivo a criação e implementação de um banco de dados para um sistema de e-commerce, abordando conceitos fundamentais e avançados de SQL.

O projeto contempla modelagem de dados, manipulação, controle transacional, auditoria e backup, garantindo integridade e segurança das informações.

---

## 🎯 Objetivos do Desafio

* Criar a estrutura do banco de dados
* Inserir dados para simulação
* Implementar views para análise
* Aplicar controle de acesso (usuários)
* Criar triggers para auditoria
* Trabalhar com transações
* Criar procedures com tratamento de erro
* Realizar backup e recovery

---

## 🧱 Estrutura do Projeto

* `schema.sql` → Criação do banco e tabelas
* `seed.sql` → Inserção de dados iniciais
* `views.sql` → Views para análise de dados
* `users_permissions.sql` → Controle de acesso
* `triggers.sql` → Auditoria de dados
* `transactions.sql` → Execução de transações
* `procedures.sql` → Procedure com rollback
* `backup_instructions.md` → Guia de backup e restore
* `ecommerce_backup.sql` → Backup do banco

---

## ⚙️ Tecnologias Utilizadas

* MySQL
* SQL (DDL, DML, DCL, TCL)

---

## 🔄 Transações

As transações foram utilizadas para garantir a consistência dos dados, permitindo:

* `COMMIT` → confirmação das operações
* `ROLLBACK` → desfazer alterações
* `SAVEPOINT` → rollback parcial

Aplicação:

* Criação de pedidos
* Inserção de itens
* Atualização de dados

---

## ⚠️ Procedures e Controle de Erro

Foi criada uma procedure com:

* Controle de exceção (`SQLEXCEPTION`)
* Uso de `ROLLBACK` automático
* Utilização de `SAVEPOINT`

---

## 🔍 Triggers

### BEFORE DELETE

Armazena dados de clientes excluídos em uma tabela de histórico.

### BEFORE UPDATE

Registra alterações de preço dos produtos.

---

## 👥 Controle de Acesso

* **Gerente** → acesso a informações estratégicas via views
* **Vendedor** → acesso restrito aos produtos

---

## 💾 Backup e Recovery

O backup foi realizado utilizando o comando:

```bash
mysqldump -u root -p ecommerce2 > ecommerce_backup.sql
```

Restore:

```bash
mysql -u root -p ecommerce2 < ecommerce_backup.sql
```

---

## 🚀 Como Executar o Projeto

1. Criar o banco:

```sql
CREATE DATABASE ecommerce2;
USE ecommerce2;
```

2. Executar na ordem:

* schema.sql
* seed.sql
* views.sql
* users_permissions.sql
* triggers.sql
* transactions.sql
* procedures.sql

---

## 🧪 Validação

O backup foi testado realizando:

* Exclusão do banco
* Restauração completa via arquivo `.sql`

---

## 🎓 Conclusão

Este projeto demonstra a aplicação prática de conceitos essenciais de banco de dados, com foco em:

* Integridade e consistência
* Segurança e controle de acesso
* Auditoria de dados
* Recuperação de informações

---

## 👨‍💻 Autor

Projeto desenvolvido para fins acadêmicos na DIO.
