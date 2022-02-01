# rva -- Reina-Valera Bible on the Command Line

[🇺🇸 English](README-en.md) // [🇲🇽 Español](README.md)

Read the Word of God from your terminal, now in Spanish.

Original implementation created by [bontibon/kjv](https://github.com/bontibon/kjv).
Forked from [LukeSmithxyz/kjv](https://github.com/LukeSmithxyz/kjv).


## Usage

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

## Notes

- This program uses [RVA found in BibleGateway](https://www.biblegateway.com/versions/Reina-Valera-Antigua-RVA-Biblia/#booklist), however, it is actually the Reina-Valera from 1909, which is only slightly updated.
- The Spanish used in the RVA is about as dated as the English used in the KJV. You shouldn't expect to master Spanish with this, but it could certainly function as an interesting study tool.


## TODO

- Include apocryphal/deuterocanonical books. The RVA-1909 did not update the apocrypha, which means that they need to be manually updated before they're included here.
- Modify the matching algorithm to ignore accents.



## Install

Install `rva` by running:

```
git clone url
cd rva
sudo make install
```

## Licencia

This script is in the public domain.
