#|
DiceOfFateV1:
- Author: tmxhs
- Date: 2024-05-15
- 운명의 주사위 Version 1
|#

#| 전역변수 선언하기 |#
(defparameter *num-player* 2) ; 1. 플레이어 수 (두명 으로 제한)
(defparameter *max-dice* 3) ; 2. 한 영역에 가질 수 있는 주사위의 최대 개수
(defparameter *board-size* 2) ; 3. 판의 크기 (2 X 2 )
(defparameter *board-hexnum* (* *board-size* *board-size*)) ; 4. 게임판 규모에서 모든 육각판 개수를 알면 유리하기 때문에 이를 위한 데이터도 정의한다.

#| 리스트인 판을 배열로 변환 한다.(함수형)|#
(defun board-array (lst)
  (make-array *board-hexnum* :initial-contents lst))

#|임의로 판을 생성 한다 (절차형)|#
(defun gen-board ()
  (board-array (loop for n below *board-hexnum*
                     collect (list (random *num-player*)
                                   (1+ (random *max-dice*))))))

#|gen-board() 함수 실행|#
;(print (gen-board))

#|숫자로 된 플레이어 이름을 글자로 변환 한다 (함수형)|#
(defun player-letter(n)
  (code-char (+ 97 n)))

#|player-letter 함수 실행|#
#|(print (player-letter 1))|#

#|부호화된 게임판을 전달받아 화면에 보기 좋게 출력하는 함수(절차형)|#
(defun draw-board (board)
  (loop for y below *board-size*
        do (progn (fresh-line)
             (loop repeat (- *board-size* y)
                   do (princ " "))
             (loop for x below *board-size*
                   for hex = (aref board (+ x (* *board-size* y)))
                   do (format t "~a-~a "(player-letter (first hex))
                            (second hex))))))

#|(draw-board #((0 3) (0 3) (1 3) (1 1)))|#

#|게임 트리 생성 하기|#
(defun game-tree ( oard player spare-dice first-move)
  (list player
        board
        (add-passi g-move board
                          player
                          spare-dice
                          first-move
                          (attacking-moves board player spare-dice))))

#|게임 트리에 차례 넘기기를 추가하는 함수 (함수형)|#
(defun add-passing-move (board player spare-dice first-move moves)
    (if first-move
        moves
        (cons (list nil
                    (game-tree (add-new-dice board player (1- spare-dice))
                                (mod (1+ player) *num-players*)
                                0
                                t))
                moves)))

#|공격 이동 계산하기 (함수형)|#
(defun attacking-moves (board cur-player spare-dice)
  (labels ((player (pos)
             (car (aref board pos)))
           (dice (pos)
             (cadr (aref board pos))))
    (mapcan (lambda (src)
              (when (eq (player src) cur-player)
                (mapcan (lambda (dst)
                          (when (and (not (eq (player dst) cur-player))
                                (> (dice src) (dice dst)))
                          (list
     (list (list src dst)
           (game-tree (board-attack board cur-player src dst (dice src))
                      cur-player
                      (+ spare-dice (dice dst))
                      nil)))))
                        (neighbors src))))
            (loop for n below *board-hexnum*
                  collect n))))

#|코드가 돌아 갔는지 확인용|#
(print "code is Run")
