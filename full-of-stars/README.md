# It's full of stars

How are all \*-functions similar?

> They all ask three questions and recur with the
`car` as well with the `cdr`, whenever the `car`
is a list.

Why?

> Because all \*-functions work on lists that are
either: 
>
>    - empty
>    - an atom *cons*ed onto a list
>    - a list *cons*ed onto a list

## Chapter files

1. [`rember*`](rember-star.rkt)
2. [`insertR*`](insertR-star.rkt)
3. [`occur*`](occur-star.rkt)
4. [`subst*`](subst-star.rkt)
5. [`insertL*`](insertL-star.rkt)
6. [`member*`](member-star.rkt)
7. [`leftmost`](leftmost.rkt)
8. [`eqlist?` (*version 1*)](eqlist1.rkt)
9. [`equal?` (*version 1*)](equal1.rkt)
10. [`equal?` and `eqlist?` (*version 2*)](equal2.rkt)
11. [`rember` (*version 1*)](rember1.rkt)
11. [`rember` (*version 2*)](rember2.rkt)

### Commandments

* [First (*final version*)](commandments/first.md)
* [Fourst (*final version*)](commandments/fourth.md)
* [Sixth](commandments/sixth.md)

