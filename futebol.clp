 (defglobal
  ?*g_resultado* = 0
  )

(deftemplate  forca
  0 150 f_forca
  ((pouca (z 0 50))
    (media (45 0)(60 1)(85 1)(100 0))
    (muita (s 90 150))
    )
)

(deftemplate precisao
  0 100 p_precisao
  ((baixa(0 0)(20 1)(35 0))
   (media (pi 20 50))
   (alta (s 65 100))
  )
)

(deftemplate chance_gol
  0 100 c_chance
    ((muito_baixa (z 0 20))
     (baixa (18 0)(30 1)(40 0))
     (normal (37 0)(48 1)(60 0))
     (alta (55 0)(67 1)(80 0))
     (muito_alta (s 75 100))
    )
)

(defrule muito_baixa
  (declare (salience 10))
  (forca pouca)
  (precisao baixa)
  =>
  (assert (chance_gol muito_baixa))
)

(defrule baixa
  (declare (salience 10))
    (or(and (forca media)(precisao baixa))
       (and (forca pouca)(precisao media)))
  =>
  (assert (chance_gol baixa))
)

(defrule normal
  (declare (salience 10))
  (or(and (forca muita)(precisao baixa))
     (and (forca media)(precisao media))
     (and (forca pouca)(precisao alta)))
  =>
  (assert (chance_gol normal))
)

(defrule alta
  (declare (salience 10))
    (or(and (forca muita)(precisao media))
       (and (forca media)(precisao alta)))
  =>
  (assert (chance_gol alta))
)

(defrule muito_alta
  (declare (salience 10))
  (forca muita)
  (precisao alta)
  =>
  (assert (chance_gol muito_alta))
)

(defrule defuzifica
  (declare (salience 0))
  ?v_tmp <- (chance_gol ?)
=>
  (bind ?*g_resultado* (moment-defuzzify ?v_tmp))

  (retract ?v_tmp)
  (printout t "A chance deste jogador acertar o gol eh: ")
  (printout t ?*g_resultado* crlf)]
  (printout t ">>>Termino<<<" crlf)
)




;(plot-fuzzy-value t "+$*" 0 150 (create-fuzzy-value forca pouca)(create-fuzzy-value forca media)(create-fuzzy-value forca muita))

;(plot-fuzzy-value t "+$*" 0 150 (create-fuzzy-value precisao baixa)(create-fuzzy-value precisao media)(create-fuzzy-value precisao alta))

;(plot-fuzzy-value t "+$*&@" 0 150 (create-fuzzy-value chance_gol muito_baixa)(create-fuzzy-value chance_gol baixa)(create-fuzzy-value chance_gol normal)(create-fuzzy-value chance_gol alta)(create-fuzzy-value chance_gol muito_alta))
