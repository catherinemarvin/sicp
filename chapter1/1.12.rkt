#lang racket

; Write a procedure that computes elements of Pascal's triangle by means of a recursive process.

(define (pascal row col)
  (cond ((= col 0) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col))))
  )
