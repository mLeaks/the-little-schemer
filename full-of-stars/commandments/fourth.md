# The Fourth Commandment

Always change at least one argument while recurring.

* when recurring on a list of atoms, `lat`, use `(cdr lat)`.
* when recurring on a number, `n`, use `(sub1 n)`.
* when reccuring on a list of S-expressions, `l`, use `(car l)`
and `(cdr l)` if neither `(null? l)` nor `(atom? (car l))` are true.

It must be changed to be closer to termination. The changing
argument must be tested in the termination condition:

* when using `cdr`, test termination with `null?`
* when using `sub1`, test termination with `zero?`.

