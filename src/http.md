# HTTP

O HTTP (Hypertext Transfer Protocol) é um protocolo de comunicação utilizado para a transferência de dados na web. Ele é a base para a comunicação entre clientes (como navegadores) e servidores, permitindo a troca de informações, como páginas web, imagens, vídeos e outros recursos. O HTTP é um protocolo sem estado, o que significa que cada requisição é independente e não mantém informações sobre requisições anteriores. Ele utiliza métodos como GET, POST, PUT e DELETE para realizar operações em recursos na web.

## Os principais métodos

| Método | Descrição |
| --- | --- |
| GET | Utilizado para solicitar um recurso do servidor. Ele é usado para recuperar informações, como páginas web ou dados de uma API. |
| POST | Utilizado para enviar dados ao servidor, geralmente para criar um novo recurso. Ele é comumente usado em formulários e APIs para enviar informações ao servidor. |
| PUT | Utilizado para atualizar um recurso existente no servidor. Ele é usado para modificar informações já existentes. |
| DELETE | Utilizado para excluir um recurso do servidor. Ele é usado para remover informações do servidor. |
| HEAD | Similar ao GET, mas solicita apenas os cabeçalhos da resposta, sem o corpo. Ele é usado para verificar a existência de um recurso ou obter informações sobre ele sem transferir o conteúdo completo. |
| OPTIONS | Utilizado para solicitar informações sobre os métodos HTTP suportados por um recurso. Ele é usado para descobrir quais operações são permitidas em um recurso específico. |
| PATCH | Utilizado para aplicar modificações parciais a um recurso existente. Ele é usado para atualizar apenas parte de um recurso, em vez de substituir o recurso inteiro. |

## Status Codes

Os status codes são códigos numéricos retornados pelo servidor em resposta a uma requisição HTTP. Eles indicam o resultado da requisição e ajudam a identificar se a operação foi bem-sucedida ou se ocorreu algum erro. Os status codes são agrupados em categorias, como:

| Faixa | Significado | Exemplo |
| --- | --- | --- |
| 1xx (Informational) | Indica que a requisição foi recebida e está sendo processada. | 100 Continue |
| 2xx (Successful) | Indica que a requisição foi bem-sucedida. | 200 OK, 201 Created |
| 3xx (Redirection) | Indica que a requisição precisa de redirecionamento para outro recurso. | 301 Moved Permanently, 302 Found |
| 4xx (Client Error) | Indica que houve um erro por parte do cliente. | 400 Bad Request, 401 Unauthorized, 404 Not Found |
| 5xx (Server Error) | Indica que houve um erro por parte do servidor. | 500 Internal Server Error, 502 Bad Gateway |


## Postman

O Postman é uma ferramenta popular para testar e desenvolver APIs. Ele permite que os desenvolvedores criem, enviem e analisem requisições HTTP de forma fácil e eficiente. Com o Postman, é possível criar coleções de requisições, organizar testes automatizados, e compartilhar configurações com outros membros da equipe. Ele suporta diversos métodos HTTP e permite a personalização de cabeçalhos, parâmetros e corpo das requisições, facilitando o processo de desenvolvimento e depuração de APIs.
