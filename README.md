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


## Endpoints

### POST /book_recommendations

Gera recomendações de livros para um usuário com base nas preferências fornecidas e na lista de livros.

**Request:**

- **URL:** `/book_recommendations`
- **Method:** `POST`
- **Headers:**
  - `Content-Type: application/json`
- **Body:**
  ```json
  {
    "user": {
      "name": "John",
      "age": 30,
      "preferences": ["Fiction", "Science"]
    },
    "books": [
      {
        "id": 1,
        "title": "1984",
        "authors": ["George Orwell"],
        "genres": ["Dystopian", "Science Fiction"],
        "description": ["A dystopian novel set in a totalitarian society under constant surveillance."]
      },
      {
        "id": 2,
        "title": "Brave New World",
        "authors": ["Aldous Huxley"],
        "genres": ["Dystopian", "Science Fiction"],
        "description": ["A novel about a future society where humans are engineered and conditioned for specific roles."]
      },
      {
        "id": 3,
        "title": "The Great Gatsby",
        "authors": ["F. Scott Fitzgerald"],
        "genres": ["Fiction", "Classic"],
        "description": ["A story of the American Dream and the disillusionment of the Jazz Age."]
      },
      {
        "id": 4,
        "title": "The Catcher in the Rye",
        "authors": ["J.D. Salinger"],
        "genres": ["Fiction", "Classic"],
        "description": ["A novel following the experiences of a disaffected teenager in 1950s New York."]
      },
      {
        "id": 5,
        "title": "Neuromancer",
        "authors": ["William Gibson"],
        "genres": ["Science Fiction", "Cyberpunk"],
        "description": ["A seminal work in the cyberpunk genre about a washed-up computer hacker hired for one last job."]
      },
      {
        "id": 6,
        "title": "Dune",
        "authors": ["Frank Herbert"],
        "genres": ["Science Fiction", "Epic"],
        "description": ["A science fiction epic set on the desert planet Arrakis and its complex politics."]
      },
      {
        "id": 7,
        "title": "To Kill a Mockingbird",
        "authors": ["Harper Lee"],
        "genres": ["Fiction", "Classic"],
        "description": ["A novel set in the Deep South, dealing with issues of race and morality through the eyes of a young girl."]
      },
      {
        "id": 8,
        "title": "The Hobbit",
        "authors": ["J.R.R. Tolkien"],
        "genres": ["Fantasy", "Adventure"],
        "description": ["A fantasy novel about the adventures of Bilbo Baggins, a hobbit who embarks on an epic quest."]
      },
      {
        "id": 9,
        "title": "Fahrenheit 451",
        "authors": ["Ray Bradbury"],
        "genres": ["Dystopian", "Science Fiction"],
        "description": ["A novel about a future society where books are banned and 'firemen' burn any that are found."]
      },
      {
        "id": 10,
        "title": "Ender's Game",
        "authors": ["Orson Scott Card"],
        "genres": ["Science Fiction", "Military"],
        "description": ["A novel about a young genius recruited to a military academy to prepare for an impending alien invasion."]
      }
    ]
  }
## Resposta

**Status Code:** 200 OK

**Body:**
```json
{
  "recommendations": [
    {
      "id": 1,
      "recommendation": "\"1984\" is a classic dystopian novel that combines elements of fiction and science fiction, making it a perfect fit for John's preferences. The exploration of totalitarian society and surveillance themes resonate with the scientific inquiry into societal structure and ethics."
    },
    {
      "id": 6,
      "recommendation": "\"Dune\" is a seminal work in science fiction, featuring rich world-building and complex political intrigue. Its epic narrative aligns well with John's interest in both science and fiction, providing a deep dive into a unique universe intertwined with science-related themes."
    },
    {
      "id": 5,
      "recommendation": "\"Neuromancer\" is a cornerstone of the cyberpunk genre, merging technology and fiction in a gripping narrative. Its exploration of artificial intelligence and hacking draws on scientific concepts that would likely engage John's interests in both fiction and science."
    }
  ]
}
```

Após executar o contêiner, a API estará disponível em:
```
http://localhost:3000
```
