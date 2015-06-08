#lang racket

#| Exercise 1.5.  Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

Then he evaluates the expression

(test 0 (p))

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)
|#

#| With an applicative-order interpreter:

The program will crash because (p) has been defined in terms of itself, so as soon as test is run, the interpreter will try to evaluate the arguments.

Since (p) is equal to (p), it keeps trying to evaluate this until there is a stack overflow error.

|#

#| With a normal-order interpreter:

The program will return 0 because it will evaluate (= x 0), figure out that x is 0, and then return 0. (p) will never be evaluated.

|#
