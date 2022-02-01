# rva -- Biblia Reina-Valera Antigua en la terminal

[🇲🇽 Español](README.md) // [🇺🇸 English](README-en.md)

Lea la Palabra de Dios desde su terminal, ahora en español.

Implementación original creada por [bontibon/kjv](https://github.com/bontibon/kjv).
Adaptado del script de [LukeSmithxyz/kjv](https://github.com/LukeSmithxyz/kjv).


## Uso

    uso: rva [flags] [referencia...]
    
      -l      listar libros
      -W      sin envoltura de líneas
      -h      mostrar ayuda
    
      Tipos de referencias:
          <Libro>
              Libro individual
          <Libro>:<Capítulo>
              Capítulo individual de un libro
          <Libro>:<Capítulo>:<Versículo>[,<Versículos>]...
              Versículo(s) individual(es) de un capítulo específico de un libro.
          <Libro>:<Capítulo>-<Capítulo>
              Rango de capítulos en un libro
          <Libro>:<Capítulo>:<Versículo>-<Versículo>
              Rango de capítulos y versículos en un libro
          <Libro>:<Capítulo>:<Verse>-<Capítulo>:<Verse>
              Rango de capítulos y versos en un libro
    
          /<Búsqueda>
              Todos los versículos que coinciden con un patrón
          <Libro>/<Búsqueda>
              Todos los versículos en un libro que coinciden con un patrón
          <Libro>:<Capítulo>/<Búsqueda>
              Todos los versículos en un capítulo de un libro que coinciden con un patrón

## Notas

- Este programa utiliza la versión llamada [RVA por BibleGateway](https://www.biblegateway.com/versions/Reina-Valera-Antigua-RVA-Biblia/#booklist), sin embargo esta no es la original de 1602, sino una versión muy ligeramente actualizada de 1909.


## TODO

- Incluir apócrifos/deuterocanónicos. La RVA-1909 no actualizó los libros apócrifos, por lo cual se tendrían que actualizar manualmente para incluir aquí.
- Modificar el algoritmo de búsqueda para ignorar acentuaciones.



## Instalación

`rva` se puede instalar haciendo

```
git clone url
cd rva
sudo make install
```

## Licencia

Este script pertenece al dominio público.
