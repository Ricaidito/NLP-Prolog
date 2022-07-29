# NLP-Prolog

## PDP1 - Mini proyecto parcial - Procesamiento de lenguaje natural

### Integrantes:

- Carlos Collado - 10138713
- Ricardo Ramírez - 10139152

### Archivos:

`main.pl` - Archivo principal para ejecutar y probar los casos de prueba

`tokenizer.pl` - Archivo que contiene los predicados para procesar la cadena de texto de entrada

`grammar.pl` - Archivo que contiene la regla para verificar y producir la oración en lógica de predicados

### Como ejecutarlo:

```prolog
dcg(X) :- go(List), s(X, List, []).
```

Para ejecutar el programa consulte con PROLOG el archivo `main.pl` y utilice la regla `dcg(X)` introduciendo su mensaje en la consola.

### Casos prueba para ejecutarlo:

```bash
'All boys run'.
'All boys like all watermelons that contain some divine flavor'.
'Some boy eats some apple'.
'Some government conscripts some pacifist people'.
'All government that conscripts pacifist people are evil'.
```
