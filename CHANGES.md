# Unreleased

- Fix: `Traverse.Primitives.Ref` and `Traverse.Primitives.Result` were
  functors with unused parameters, which made `Ref.Make` and
  `Result.Make` unusable; they are now plain modules, like the other
  primitive traversers

# Version 0.3.0, 2020-09-22

- Port to ppxlib 0.16 / ocaml-migrate-parsetree 2.0.0

# Version 0.2.0, 2020-05-11

- Support for OCaml 4.11.0

- Fix: `Traverse.Applicative.Iter` now does something

- Primitive traversers are now defined in `Traverse.Primitives`

# Version 0.1.0, 2020-03-08

- First release
