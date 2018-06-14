#lang racket/base

(require rackunit)

(define (double a) (* 2 a))

(define (halve b) (/ b 2))

(define (even? y) (= (remainder y 2) 0))

(define (fast* a b)
    (fast*iter a b 0))

(define (fast*iter a counter product)
        (if (= counter 0)
            product
            (cond ((even? counter) 
                        (fast*iter (double a) (halve counter) product))
                  (else (fast*iter  a (- counter 1) (+ a product))))))

(check-equal? (fast* 2 10) 20)
(check-equal? (fast* 3 6) 18)
(check-equal? (fast* 31 8) 248)