(define (divides? a b)
    (= (remainder b a) 0))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)
            n)
          ((divides? test-divisor n)
            test-divisor)
          (else
            (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (prime n)
    (= n (smallest-divisor n))
)

(define (even x)
    (= (remainder x 2) 0)
)

(define (odd x)
    (> (remainder x 2) 0)
)

(define (next-odd x)
    (cond ((even x) (+ x 1))
          ((odd x) (+ x 2))
    )
)

(define (continue-primes n count)
    (cond ((= count 0) (newline) (display "Done."))
          ((prime n)
            (newline)
            (display n)
            (continue-primes (next-odd n) (- count 1))
          )
          (else (continue-primes (next-odd n) count))
    )
)

(define (search-for-primes n)
    (let ((start-time (real-time-clock)))
        (continue-primes n 3)
        (- (real-time-clock) start-time)
    )
)

(real-time-clock)

(search-for-primes 1000)

(real-time-clock)

(search-for-primes 10000)

(real-time-clock)

(search-for-primes 100000)

(real-time-clock)

(search-for-primes 1000000)

(real-time-clock)