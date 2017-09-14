module HelloWorld where
    
    -- função para dobrar resultados
    doubleMe x = x + x
    doubleUs x y = x*2 + y*2
    double x y = doubleMe x + doubleMe y
    
    -- Head
    inicial x = head x
    
    -- Tail
    rabo x = tail x
    
    -- Reverse
    inverter x = reverse x
    
    -- Atividade 1: Tirar a última letra de uma expressao
    lastLetter y = reverse(tail(reverse y))
    
    -- http://haskell.tailorfontela.com.br/starting-out
    
    -- Função simples: vê se um número é par ou não
    ehPar x = mod x 2 == 0
    ehImpar x = mod x 2 /= 0
    
    -- Quero triplicar um valor
    triplicar x = x * 3
    
    -- para concatenar termos, uso ++
    