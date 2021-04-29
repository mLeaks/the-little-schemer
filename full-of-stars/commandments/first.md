# The First Commandment

When recurring on a list of atoms, `lat`, ask two questions
about it: `(null? lat)` and `else`.

When recurring on a number, `n`, ask two questions about it: `(zero? n)`
and `else`.

When recurring on a list of S-expressions, `l`, ask three question
about it: `(null? l)`, `(atom? (car l))`, and `else`.

