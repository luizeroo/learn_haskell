module Prova where
    import Data.Monoid
    
    -- Extrair os 8 primeiras letras de um p :: String
    
     ----------------------- PATTERN MATCHING PARA LISTAS
            {-
                * [] = [] -> Vazio
                
                * x:_ -> UMA LETRA x E IGNORA O RESTO
                    -- exemplo: x='F' e o resto ignorado
                
                * x:xs -> UMA LETRA x E O RESTO EM XS
                    -- exemplo: x='F' e o resto em xs="ATEC"
                
                * x:[] -> APENAS UMA LETRA x 
                -- exemplos
                        1) X:Y:Z:ZS -> tres letras x,y,z e o restante em ZS
                    
                        2) x:y:z:w:[] -> APENAS QUATRO LETRAS
                        
                        3) a:b:c:d:_:ds -> QUATRO LETRAS, IGNORA A QUINTA E O RESTO EM DS
                            -- "FILME DO DEATH NOTE"
                                a = 'F'
                                b = 'I'
                                c = 'L'
                                d = 'M'
                                _ = ''
                                ds = " DO DEATH NOTE"
                -}
                
    -- extrair 8 primeiras letras de um p :: String 
    p1 :: String -> String
    p1 (l1:l2:l3:l4:l5:l6:l7:l8:xs) = l1:l2:l3:l4:l5:l6:l7:l8:[]
    
    -- extrair 8 ultimas letras p :: String
        
    
    
    -- lambda para verificar se um numero é maior que 10
    p3 = (\numero -> numero > 10)
    
    -- lambda para verificar se caracter é um numeral
    data Tipo = Um deriving Show
    p5 = (\tipo -> (show tipo)) Um
    
    -- dê o tipo das funções
        -- fmap (\x -> "Ola" ++ x)
        
    -- list compreenshions
    -- multiplos de 17 e negativos
    list01 :: [Int] -> [Int]
    list01 lista = [item | item <- lista, item < 0 || mod item 17 == 0]
    
    -- duplicar cada elemento String de uma lista de strings
    list02 :: [String] -> [String] 
    list02 lista = [ item ++ item | item <- lista]
    
    -- Obter lista [[2], [4] .. [14]]
    list03 :: [[Int]]
    list03 = [[item] | item <- [2,4 .. 14]]
    
    -- vamos para os lambda dnv
    -- Lista de tamanho 9
    listaTamanho9 = (\lista -> length lista == 9)
    
    -- filtrar palavras de tamanho maior que 30 de um array de string
    filtrarLista = (\xs ->  (\palavra -> (length palavra) > 30) xs)
    
    -- Recebe uma String e retorna na ordem reverse sendo tipo Maybe String
    reverteJust = (\palavra -> Just (reverse palavra))
    
    -- Checar se é positivo
    check = (\numero -> numero > 0)
    
    -- Dê o tipo das seguintes funções 
        -- \x -> ["Ola" ++ x]
    -- \x -> ["Ola" ++ x] :: String -> [String]
    
    -- Sem os dois primeiros
    semDois :: [a] -> [a]
    semDois (x:y:xs) = xs
    
    -- Uma função que recebe dois Maybe Int e retorne o menor entre eles
    menorMaybe :: Maybe Int -> Maybe Int -> Maybe Int 
    menorMaybe (Just valor1) (Just valor2)
        | valor1 > valor2 = Just valor1
        | otherwise = Just valor2
    menorMaybe _ _ = Nothing
    
    -- Função que recebe valor qualquer e retorne Nothing 
    qualquerValor :: a -> Maybe a
    qualquerValor _ = Nothing
    
    
    -- Uma função que receba um valor e verifica se é maior que seu empty
   -- verificaMonoid :: (Monoid a) => Bool
--    verificaMonoid a = a > mempty

    -- Uma funcao que receba um vetor de Int (Tamanho qualquer) e retorne a soma dos quadrados dos elementos
    vetorInt :: [Int] -> Int 
    vetorInt numeros = foldl (\resultado item -> resultado + item) 0 numeros
    
    -- Filtrar numeros pares
    filtrarPares :: [Int] -> [Int]
    filtrarPares numeros = [cada | cada <- numeros, mod cada 2 == 0]
    
    filtrarLambda :: [Int] -> [Int]
    filtrarLambda xs = filter (\x -> (mod x 2 == 0)) xs
    
    -- C - Filtre os números primos de uma lista (Fazer uma funcao de checar primos):
    exC :: [Int] -> [Int]
    exC xs = filter (\x -> ( (==) 2 $ length $ (\var -> [x | x <- [1..var], mod var x == 0]) x)) xs
    
    -- recebe uma lista, dobra e tira os multiplos de 4
    dobraTira :: [Int] -> [Int]
    dobraTira lista = [2 * cada | cada <- lista, mod cada 4 /= 0, cada /= 2]
    
    exD :: [Int] -> [Int]
    exD xs = filter (\x -> ( mod x 4 /= 0 )) xs