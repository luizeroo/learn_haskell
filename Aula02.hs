module Aula02 where
    -- Padronizar, criamento de funções
    ehPar :: Int -> Int
    ehPar x = 2*x
    
    -- Se eu quiser comparar dois elementos
    ehMaior :: Int -> Int -> Bool
    ehMaior x y = x>y
    
    -- Outro exemplo, de forma INFIXA.
    ehMaior2 :: Int -> Int -> Bool
    ehMaior2 x y = (>) x y
    
    ehMenor :: Int -> Int -> Bool
    ehMenor x y = (<) x y
    
    -- Não confunda string com caracter único.
    -- Existem listas vazias.
    
    -- Formas de pegar o último caracter
    ultimoCaracter :: String -> Char
    ultimoCaracter xs = head (reverse xs)
    
    -- Desafio = Apagar a última letra
    lastCaracter :: String -> String
    lastCaracter char = reverse (tail (reverse char))
    
    -- Desafio = Pegar o primeiro de uma, o resto da outra e juntar
    juntarPalavras :: String->String->String
    juntarPalavras c1 c2 = head c1 : tail c2
    
    -- Dobrar valores
    dobroLista :: [Int] -> [Int]
    dobroLista num = [2 * x | x <- num]
    
    -- Triplicar valores
    triplicarLista :: [Int] -> [Int]
    triplicarLista num = [3 * x | x <- num]
    
    
