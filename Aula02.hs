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
    
    -- Lista _ baralho
        -- baralho :: [] (String, String)
    baralho :: [(Char, String)]
    baralho = [(valor, naipe) | valor <- "A123456789JQK", naipe <- ["PAUS", "COPAS", "ESPADAS", "OUROS"]]
    -- baralho = [(valor, naipe) | valor <- "A123456789JQK", naipe <- ["PAUS", "COPAS", "ESPADAS", "OUROS"], DEPOIS DESSA VIRGULA É FILTRO (sem a seta)]
    
    -- Pokemon
        -- ZIP: pega duas listas e "zipa", junta com dois elementos.
    pokemon :: [(Int, String)]
    pokemon = zip [1 .. 6] ["Squirtle", "Squitle2", "Squirtle3", "Charmander1", "Chamander2", "Chamander3"]
    
    -- Pessoas
    pessoas :: [(String, String)]
    pessoas = [(p1, p2) | p1 <- ["Jose", "Gustavo", "Lucas"], p2 <- ["Jose", "Gustavo", "Lucas"], p1 /= p2]
    
    -- Pegar o próprio valor (e somar 10) e duplicar CHAR.
    anexar :: Char -> Int -> (Int, String)
    anexar caracter valor = (valor+10, caracter:[caracter])
    
{-
    _____________________________________________________________________________________________________________
-}

-- EXERCICIOS
    lista01 :: [Int]
    lista01 = [11 * n | n <- [0, 1, 11]] -- nnnn
    
    lista02 :: [Int]
    lista02 = [x | x <- [1 .. 40], mod x 4 /= 0]
    
    -- lista03 :: [String], página 32
        -- ['A':x :"BB" | x<- ['a' .. 'f'] ]
    lista03 = ['A':x:"BB" | x<-['a' .. 'f']]
    