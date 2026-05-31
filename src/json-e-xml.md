# JSON e XML

O JSON (JavaScript Object Notation) e o XML (eXtensible Markup Language) são dois formatos de dados amplamente utilizados para a troca de informações entre sistemas. Ambos são legíveis por humanos e podem ser facilmente processados por máquinas, mas possuem diferenças significativas em sua estrutura e sintaxe.

## JSON

O JSON (JavaScript Object Notation) é um formato de dados leve e fácil de ler, utilizado para a troca de informações entre sistemas. Ele é baseado em uma sintaxe de objetos JavaScript, mas é independente de linguagem, o que significa que pode ser utilizado em diversas linguagens de programação. O JSON é amplamente utilizado em APIs (Application Programming Interfaces) para transmitir dados entre clientes e servidores. O formato JSON é composto por pares de chave-valor, onde as chaves são strings e os valores podem ser strings, números, objetos, arrays, booleanos ou nulos. O JSON é uma alternativa popular ao XML para a troca de dados, devido à sua simplicidade e facilidade de uso.

Abaixo estão alguns exemplos de como o JSON é utilizado para representar diferentes tipos de dados:

```json
{
  "nome": "João",
  "idade": 30,
  "casado": true,
  "filhos": ["Maria", "Pedro"],
  "endereco": {
    "rua": "Rua A",
    "numero": 123,
    "cidade": "São Paulo"
  }
}
```

## XML

O XML (Extensible Markup Language) é um formato de dados utilizado para a troca de informações entre sistemas. Ele é baseado em uma estrutura de marcação, onde os dados são representados por elementos e atributos. O XML é amplamente utilizado em APIs (Application Programming Interfaces) e em documentos de configuração, devido à sua flexibilidade e capacidade de representar dados complexos.

O XML é um formato de texto que pode ser lido por humanos e processado por máquinas. Ele é utilizado para representar dados hierárquicos, onde os elementos podem conter outros elementos, criando uma estrutura em árvore. O XML também suporta a definição de esquemas, que permitem validar a estrutura e o conteúdo dos documentos XML. O XML é amplamente utilizado em conjunto com outros padrões, como XSLT (Extensible Stylesheet Language Transformations) para transformar documentos XML em outros formatos, e XPath (XML Path Language) para navegar e selecionar elementos em um documento XML.

Abaixo estão alguns exemplos de elementos e atributos em XML:

```xml
<note>
  <to>Bruno</to>
  <from>Ana</from>
  <heading>Reminder</heading>
  <body>Don't forget our meeting tomorrow!</body>
</note>
```
