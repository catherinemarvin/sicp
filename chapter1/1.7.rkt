#lang racket

;;; Exercise 1.7.  The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

;;; For small numbers, the test will be bad because the values involved are so small that the guess will terminate too quickly.

;"1.7.rkt"> (my-sqrt .0001)
;0.03230844833048122
;"1.7.rkt"> (sqrt .0001)
;0.01

;; This solution is three times larger than the actual value and it gets worse rapidly.

;;; For larger numbers, the computer is unable to represent small differences between large numbers.

;;; Ex: 
;"1.7.rkt"> (my-sqrt 1000000000000)
;1000000.0
;"1.7.r)t"> (my-sqrt 10000000000000)
; Takes a very long time to return.

;;; Alternative sqrt implementation

(define (sqrt-iter2 prev-guess guess x)
  (if (close-enough? prev-guess guess)
    guess
    (sqrt-iter2 guess (improve guess x) x)
    )
  )

(define (close-enough? prev-guess guess)
  (< (abs (- prev-guess guess)) 0.001)
  )

(define (my-sqrt2 x)
  (sqrt-iter2 0.0 1.0 x))

;"1.7.rkt"> (sqrt .0001)
;0.01
;"1.7.rkt"> (my-sqrt .0001)
;0.03230844833048122
;"1.7.rkt"> (my-sqrt2 .0001)
;0.010000714038711746
;"1.7.rkt"> (sqrt 10000000000000)
;3162277.6601683795
;"1.7.rkt"> (my-sqrt2 10000000000000)
;3162277.6601683795

;; It performs much better
