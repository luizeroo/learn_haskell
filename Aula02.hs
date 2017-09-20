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
    
    -- SOMAR DE CARACTERES
    somar2P :: String -> String -> Int
    somar2P xs ys = length xs + length ys
    
    -- TAMANHO
    tamanho :: String -> Int
    tamanho ks = length ks
    
    -- COMPREENSAO DE LISTAS
    -- dobrar uma lista de valores 
    dobrarLista :: [Int] -> [Int]
    dobrarLista lista = [2*numeros | numeros<-lista]
    
    -- triplar uma lista de valores
    triplarLista :: [Int] -> [Int]
    triplarLista tripla = [3*numeros | numeros<-tripla]
    
    -- map de uma lista, 2*x+1 se distribuirá a todos elementos da lista [0 .. 10] , com exceção do número 5
    mapLista :: [Int]
    mapLista = [2 * x + 1 | x<-[0 .. 10], x /= 5]
    
    -- map de uma lista, 3 * 3 +3 -4 a todos elementos pares até 30
    mapLista2 :: [Int]
    mapLista2 = [3*3*x+3-4 | x <- [0,2 .. 30]]
    
    {-
        PRA LIDAR COM LISTAS
    -}
        -- VALOR | VALOR <- LISTA , CONDICAO 1 .. CONDICAON
    treinarLista :: [Int]
    treinarLista = [valor | valor <- [1..50], mod valor 2 /= 0]
        
    
    menorDeDoisNumeros :: Int -> Int -> Int
    menorDeDoisNumeros x y = if x <= y then x else y
    
    
    {-
        TUPLAS
    -}



-- EXERCICIOS
    lista01 :: [Int]
    lista01 = [11 * n | n <- [0, 1, 11]] -- nnnn
    
    lista02 :: [Int]
    lista02 = [x | x <- [1 .. 40], mod x 4 /= 0]
    
    -- lista03 :: [String], página 32
        -- ['A':x :"BB" | x<- ['a' .. 'f']]
    lista03 = ['A':x:"BB" | x<-['a' .. 'f']]
    
    -- [1.0,0.5,0.25,0.125,0.0625,0.03125]

-- Exercicios 2.2 - Crie uma função que verifique se o tamanho de uma string é par ou não
