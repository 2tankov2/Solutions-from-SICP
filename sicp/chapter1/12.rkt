#lang racket/base

(require rackunit)

(define (pascal-triangle n m)
   (cond ((or (= m 1) (= n m)) 1)
         (else (+ (pascal-triangle (- n 1) m) (pascal-triangle (- n 1) (- m 1))))))

(check-equal? (pascal-triangle 1 1) 1)
(check-equal? (pascal-triangle 2 2) 1)
(check-equal? (pascal-triangle 3 2) 2)
(check-equal? (pascal-triangle 4 2) 3)
(check-equal? (pascal-triangle 5 2) 4)
(check-equal? (pascal-triangle 5 3) 6)