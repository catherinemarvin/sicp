#lang racket

;;; Exercise 1.3.  Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square x)
  (* x x))

(define (sum-of-larger-squares a b c)
  (cond ((and (> a b) (> b c)) (+ (square a) (square b)))
        ((and (> a b) (> c b)) (+ (square a) (square c)))
        (else (+ (square b) (square c)))
        )
  )
