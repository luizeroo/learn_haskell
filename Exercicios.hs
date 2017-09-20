module Exercicios where
    -- menor de dois numeros 
    exercicio001 :: Int -> Int -> Int
    exercicio001 x y = if x <= y then x else y
    
    exercicio001b :: Int -> Int -> Int 
    exercicio001b x y 
        | x < y = x
        | otherwise = y
    
    -- menor de tres 
    exercicio002 :: Int -> Int -> Int -> Int 
    exercicio002 x y z
        | x < y && x < z = x
        | y < z = y
        | otherwise = z
        
    -- fatorial
    exercicio003 :: Int -> Int 
    exercicio003 x 
        | x == 1 = 1
        | otherwise = x * exercicio003( x - 1 )
        
    -- fibonacci
    exercicio004 :: Int -> Int 
    exercicio004 xs
        | xs == 1 = 1
        | otherwise = xs * exercicio004(xs-1)
        
    -- elemento: recebe uma lista e um número inteiro positivo para retornar o n-ésimo elemento da lista
    exercicio005 :: [Int] -> Int -> Int
    exercicio005 lista posicao
        | posicao > length lista = 0
        | posicao <= 0 = 0
        | otherwise = lista !! (posicao-1)
    
    -- pertence: recebe uma lista e um elemento qualquer e verifica se o elemento pertence à lista
    exercicio006 :: Int -> [Int] -> Bool 
    exercicio006 elemento [] = False 
    exercicio006 elemento (c:resto)
        | elemento == c = True
        | otherwise = exercicio006 c resto
        
    {-------
        EXERCICIOS DO LIVRO
    ------}
    
    -- [1,11,121,1331,14641,161051,1771561]
    livro01 :: [Float]
    livro01 = [11 ** x | x <- [0..7]]
    
    -- [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39]
    livro02 :: [Int]
    livro02 = [x | x<-[1 .. 40], mod x 4 /= 0]
    
    -- ["AaBB", "AbBB", "AcBB", "AdBB", "AeBB", "AfBB","AgBB"]
    livro03 :: [String]
    livro03 = ['A':x:"BB" | x <- ['a' .. 'f']]
    
    
    data Correncia = Dollar | Libra | Real deriving (Enum, Show, Eq)
    
    data Dinheiro = Dinheiro {
        valor :: Double,
        correncia :: Correncia
    } deriving (Show, Eq)
    
    converterReal :: Dinheiro -> Dinheiro
    converterReal (Dinheiro x Libra) = Dinheiro (3.75*x) Real
    converterReal (Dinheiro x Dollar) = Dinheiro (3.90*x) Real
    converterReal x = x
    
    -- Converter e somar para real
    somarConversao :: Dinheiro -> Dinheiro -> Dinheiro 
    somarConversao valor1 valor2 = Dinheiro ( valor(converterReal valor1) + valor(converterReal valor2) ) Real
    
    -- Verificar se o tamanho é par ou não
    lista22 :: String -> Bool
    lista22 string = mod (length string) 2  == 0
    
    -- Escreva uma função que receba um vetor de String e reorn uma lista com todos os elementos em ordem reversa
    lista23 :: [String] -> [String]
    lista23 strings = [x | x <- reverse strings ]
    
    --lista23b :: [String] -> [String]
    --lsita23b strings = [x | x <- ]
    
    -- Escreva uma função que receba vetor de Strings e retorne uma lista com o tamanho de cada String. As palavras de tamanho par devem ser excluídas
    lista24 :: [String] -> [Int]
    lista24 strings = [length x | x <- strings, mod (length x) 2 /= 0]
    
    -- Faça uma função que receba uma String e retorne true se ela for palindromo, caso contrário, falso.
    lista26 :: String -> Bool 
    lista26 xs
        | xs == reverse xs = True
        | otherwise = False
        
    -- Faça uma função que receba um inteiro e retorna uma tupla, contendo: dobro deste numero na primeira, triplo na segunda, quadruplo na terceira e quintuplo na quarta 
    
    {- Capítulo 3 -}
    foo :: Int -> Int -> Bool
    foo x n = x /= n
    -- :t foo 
    
    
    
    {-- PATTERN MATCHING --}
    -- Criar um pattern matching com uma tupla de inteiros e suas coordenadas
    patternMatching :: (Int,Int) -> Int
    patternMatching (0,0) = 0
    patternMatching (0,1) = 1
    patternMatching (1,0) = 1
    patternMatching (x,0) = x
    patternMatching (0,y) = y
    patternMatching (x,y) = x+y
    
    -- Primeiro DATA CONSTRUCTOR
    data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving (Show, Enum)
    
    agenda :: Dia -> String 
    agenda Segunda = "Sobrino"
    agenda Terca = "Rosana e Eve"
    agenda Quarta = "Davi"
    agenda Quinta = "Garcia"
    agenda _ = "Ser inutil"
    
    -- -- Faça  uma função que converta os Dias para Ints. Segunda vale 1, Terca 2 ... Domingo 7
    data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Show, Enum)
    
    calendar :: Dia -> Day
    calendar Segunda = Mon
    calendar Terca = Tue
    calendar Quarta = Wed
    calendar Quinta = Thu
    calendar Sexta = Fri 
    calendar Sabado = Sat 
    calendar Domingo = Sun
    
    
    data Pessoa = Fisica String Int | Juridica String deriving Show-- conceito de currying.
    
    pessoa :: Pessoa -> (String, String)
    pessoa (Fisica x y) = ("Nome: " ++ x, "Idade: " ++ show y)
    pessoa (Juridica x) = ("Nome: " ++ x, "Idade: Não")
    
    {- TIPO MULTIPLICATIVO -}
    -- Aula 03, Aluno
    -- aniversario de um aluno
    data Aluno = Aluno String Int Curso deriving Show
    aniversario :: Aluno -> Aluno
    aniversario (Aluno nome idade matriculado) = Aluno nome (idade+1) matriculado
    
    data Curso = SI | ADS | GE deriving Show
    
    transferir :: Aluno -> Aluno
    transferir (Aluno nome idade SI) = Aluno nome idade ADS
    transferir (Aluno nome idade ADS) = Aluno nome idade SI
    transferir x = x
    
    -- Se eu quisesse transferir um aluno com +2 de idade?
    --transferir (aniversario(aniversario(aniversario(Aluno "Jose" 10 SI))))
    
    -- AVATAR
    data Tipo = Fogo | Agua | Ar | Terra deriving (Show, Enum, Eq)
    data Sexo = Masculino | Feminino deriving (Show, Enum)
    data Dobrador = Dobrador Tipo Sexo deriving Show -- NAO PODE ENUM, PQ É MULTIPLICATIVO.
    
    dobradores :: [Dobrador]
    dobradores = [Dobrador elemento sexo | elemento <- [Fogo .. Terra], sexo <- [Masculino .. Feminino]]
    
    dobradoresNFogo :: [Dobrador]
    dobradoresNFogo = [Dobrador elemento sexo | elemento <- [Fogo .. Terra], sexo <- [Masculino .. Feminino], elemento /= Fogo]
    
    dobradoresAgua :: [Dobrador]
    dobradoresAgua = [Dobrador elemento sexo | elemento <- [Fogo .. Terra], sexo <- [Masculino .. Feminino], elemento == Agua]
    
    {- RECORD SYNTAX -}
    -- tirar o nome de cada campo, associado a VALUE CONSTRUCTOR, parecido com o GET da programação orientada a objeto.
    data Manga = Manga {
        nome :: String,
        preco :: Double,
        cur :: Correncia,
        volume :: Int,
        autor :: String
    } deriving (Show, Eq)
    
    dobrarManga :: Manga -> Manga
    dobrarManga (Manga nome preco cur volume autor) = (Manga nome (preco*2) cur volume autor)
    
    -- DUVIDA
    --comprarMangas :: [Manga] -> Double
    --comprarMangas (Manga nome, preco, cur, volume, autor) = (Manga nome, preco, cur, volume, autor)
    
    -- Somar dois mangas
    --somarMangas :: Manga -> Manga -> Manga
    --somarMangas mangaUm mangaDois = Manga (nome (preco mangaUm + preco mangaDois) cur volume autor)
   
    somarMangas :: Manga -> Manga -> Manga
    somarMangas (Manga nome preco cur volume autor) (Manga nome2 preco2 cur2 volume2 autor2) = Manga nome (preco + preco2) cur volume autor
    
    {-EXERCICIOS-}
    -- Crie o tipo PERGUNTA com values Sim ou Nao e as seguintes funcoes
    data Pergunta = Sim | Nao deriving Eq
    
    -- pergNum: recebe via parametro uma pergunta e retorna 0 para não e 1 para simo
    pergNum :: Pergunta -> Int 
    pergNum Sim = 1
    pergNum Nao = 0
    
    -- listPergs: recebe via parametro uma lista de pergunta e retorna 0 e 1 correpsondente aos constructores na lista 
    listPergs :: [Pergunta] -> [Int]
    listPergs perguntas = [pergNum(numeros) | numeros <- perguntas ]
    -- dobrarLista lista = [2*numeros | numeros<-lista]
    
    -- and': recebe duas perguntas como parametro e retorna a tabela verdade do AND lógico, usando SIM como verdade e Nao false
    pergAnd :: Pergunta -> Pergunta -> Bool
    pergAnd pergunta1 pergunta2
        | pergunta1 == pergunta2 = True
        | otherwise = False
    
    
    -- or
   -- pergOr :: Pergunta -> Pergunta -> Bool
--    pergOr pergunta1 pergunta2
  --      | pergunta1 == pergunta2 = True
    
    -- Temperatura
    data Temperatura = Celsius | Farenheit | Kelvin 
    
    converterCelsius :: Double -> Temperatura -> Temperatura