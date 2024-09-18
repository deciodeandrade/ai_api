# ai_api

## Descrição

A `ai_api` é uma API para recomendações de livros baseada nas preferências dos usuários. Ela utiliza um serviço para gerar recomendações de livros com base nas preferências e nas informações fornecidas sobre os livros.

## Clonar o Repositório e Configurar a Aplicação

### Clonar o Repositório

Para começar, clone o repositório da API `ai_api` usando o Git. Abra um terminal e execute o seguinte comando:

```bash
git clone https://github.com/deciodeandrade/ai_api.git
cd ai_api
```
Antes de executar a aplicação, você precisa configurar algumas variáveis de ambiente. Crie um arquivo .env na raiz do projeto com as seguintes variáveis:

```
# Arquivo .env
OPENAI_ACCESS_TOKEN=your_secret_key_base
```
Construa a imagem Docker:
```
docker build -t ai_api .
```
Execute o contêiner Docker:
```
docker run -p 3000:3000 --env-file .env ai_api
```
Após executar o contêiner, a API estará disponível em:
```
http://localhost:3000
```
## Endpoints

### POST /book_recommendations

Gera recomendações de livros para um usuário com base nas preferências fornecidas e na lista de livros.

**Request:**

- **URL:** `/book_recommendations`
- **Method:** `POST`
- **Headers:**
  - `Content-Type: application/json`
- **Body:**
```
{
  "genres": ["Dystopian", "Science Fiction"]
}
```
## Resposta

**Status Code:** 200 OK

**Body:**
```json
{
    "recommendations": [
        {
            "name": "The Water Knife"
        },
        {
            "name": "Parable of the Sower"
        },
        {
            "name": "Station Eleven"
        },
        {
            "name": "The Power"
        },
        {
            "name": "Fahrenheit 451"
        }
    ]
}
```
