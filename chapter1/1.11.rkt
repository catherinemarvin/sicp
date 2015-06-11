#lang racket

;Exercise 1.11.  
;A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3. 
;Write a procedure that computes f by means of a recursive process. 
;Write a procedure that computes f by means of an iterative process.

(define (recursive-f n)
  (if (< n 3)
    n
    (+ (recursive-f (- n 1))
       (* 2 (recursive-f (- n 2)))
       (* 3 (recursive-f (- n 3)))))
  )

(define (iterative-f n)
  (define (helper a b c current count)
    (cond 
      ((< n 3) n)
      ((= count n) current)
      (else (helper current a b (+ a (* 2 b) (* 3 c)) (+ count 1)))
      )
    )
  (helper 2 2 0 4 n)
  )
