#Git Concepts

describes the solution created to enable multiple people to write software _collaboratively_

this scenario presents a host of problems:

- issues are fundamentally caused by the creation of different versions of the source code which arise due to multiple people collaborating on the same project 

fundamentally, how can a history of all the different versions of the source code and other artefacts be maintained

``` mermaid
graph LR
  A[Start] --> B{Error?};
  B -->|Yes| C[Hmm...];
  C --> D[Debug];
  D --> B;
  B ---->|No| E[Yay!];
```

``` mermaid
sequenceDiagram
  autonumber
  Alice->>John: Hello John, how are you?
  loop Healthcheck
      John->>John: Fight against hypochondria
  end
  Note right of John: Rational thoughts!
  John-->>Alice: Great!
  John->>Bob: How about you?
  Bob-->>John: Jolly good!
```

