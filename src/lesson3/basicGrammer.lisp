#|
basicGrammer:
- Author: user
- Date: 2024-04-09
|#

#|리스프는 대소문자 구분이 없다.|#
(print (eq 'fooo 'FoOo))

#|정수형 실수형 연산은 실수형 반환|#
(print (+ 1 1.0))

#|제곱함수 expt|#
(print (expt 53 33))

#|나누기|#
(print (/ 4 6))

#|다른 나누기 결과|#
(print (/ 4.0 6))

#|문자열 출력하기|#
(princ "Tutti Frutti")

#|문자열 역슬레시 특수문자|#
(princ "He yelled \"Stop that thief!\" from the busy street.")

#|데이터모드|#
(print `(expt(2 3)))

