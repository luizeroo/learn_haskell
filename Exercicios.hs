module Exercicios where
    import Data.Monoid
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
    data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving (Show, Enum, Eq)
    
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
        
    pergOr :: Pergunta -> Pergunta -> Bool
    pergOr pergunta1 pergunta2
        | pergunta1 == Nao && pergunta2 == Nao = False
        | otherwise = True
        
    -- Temperatura
    data Temperatura = C | F | K deriving Eq
    
    converterC :: Double -> Temperatura -> Double
    converterC valor temperatura
        | temperatura == K = valor - 273.15
        | temperatura == F = valor - 32 / 1.8
        | otherwise = valor
        
    converterK :: Double -> Temperatura -> Double
    converterK valor temperatura
        | temperatura == C = valor + 273
        | temperatura == F = (valor + 459.67) * 5/9
        | otherwise = valor
        
    -- garcia
    fatorialg :: Int -> Int
    fatorialg n 
        | n <= 0 = 1
        | otherwise = n * fatorialg (n-1)
    
    modulo :: Double -> Double
    modulo x
        | x >= 0 = x
        | otherwise  = -x
    
    elimVogal :: String -> String
    elimVogal [] = []
    elimVogal (x:xs)
        | elem x "AEIOUaeiou" = elimVogal xs
        | otherwise = x : elimVogal xs
        
    -- 3.14
   -- data Valido = VSim String | VNao deriving (Show, Eq)
    
    --isNomeValido :: String -> Valido
    --isNomeValido nome = VSim
    
   
   
   {- LAMBDA -}
   -- Função anonima, troca o funcionamento.
   -- o lambda ---->>>>>> (\ x y -> x + y)
---- x e y = parametro
----- x+y = expressao

-- EXEMPLO DE LAMBDA NO GHCI
-- (\ x y z -> reverse x ++ " " ++ y ++ " " ++ tail z) "OLA" "ALO" "PHP"
    -- RESPOSTA: "ALO ALO HP"
{-
    let dobro = \x -> 2*x
    dobro 3
    6
    
    ----->  \   === significa LAMBDA

let dobro = (2*)
dobro 3
6
let m = (>0)
m 3
True

    let n = (<=4)
*Aula04> n 3
True

let f = (++" MUNDO")
let f2 = \x -> x ++ " MUNDO"
-}




{- HIGH ORDER FUNCTION -}
-- Lida com funções e tem duas características
    -- Podem receber uma função como parametro 
    -- podem retornar outras funções
    
    highOrder :: (Int -> Int) -> Int 
    highOrder fooH = 1 + fooH 5
    
    highDobro :: Int -> Int
    highDobro x = 2*x
    
    highTriplo :: Int -> Int 
    highTriplo x = 3*x
    
    {- Currying -}
    somarTresNumeros :: Int -> Int -> Int -> Int 
    somarTresNumeros x y z = x+y+z
    
    somarCurr :: Int -> Int
    somarCurr = somarTresNumeros 3 4
    
    -- 4.4 Funções de ALta Ordem
    
    -- 4.1 Função que retorne a média de um [Double]
    exe41 :: [Double] -> Double
    exe41 lista = (foldl (+) 0 lista) / (fromIntegral $ length lista)
    
    -- 4.2 = Função que recebe [String] e retorna as true
    exe42 :: [String] -> [String]
    exe42 palavras = filter lista26 palavras
    
    -- 4.3 Função que filtre os numeros pares e outra que filtre os ímpares de uma lista recebida
    filtrarPar :: [Int] -> [Int]
    filtrarPar lista = [novaLista | novaLista <- lista, mod novaLista 2 == 0]
    
    -- 4.3 Função que filtre os numeros pares e outra que filtre os ímpares de uma lista recebida
    filtrarImpar :: [Int] -> [Int]
    filtrarImpar lista = [novaLista | novaLista <- lista, mod novaLista 2 /= 0]
    
    -- 4.4 Filtrar os primos
    --filtrarPrimos :: [Int] -> [Int]
    -- PAGINA 58
    
    -- 4.6 dobrar menos os multiplos de 4
    dobrarMap :: [Int] -> [Int]
    dobrarMap lista = [2*novaLista | novaLista <- lista, mod novaLista 4 /= 0, novaLista /= 2]
    {-
    map (\x -> 3*x) [1 .. 10]
    [3,6,9,12,15,18,21,24,27,30]
    -}
    
    -- 4.7 lista de dias, filtra dia
    filtrarDia :: [Dia] -> [Dia]
    filtrarDia dia = [item | item <- dia, item /= Terca]
    
    -- 4.8 Implantar Money com valor e correncia
    
    -- 4.8.1 Filtrar todos os dollares de uma lista de dinheiro
        --filtrarDollar :: [Dinheiro] -> [Bool]
        --filtrarDollar (Dinheiro valor correncia) 
        --    | correncia == Dollar = True
        --    | otherwise = False
    filtrarDollares :: [Dinheiro] -> [Dinheiro]
    filtrarDollares dinheiros = filter (\ (Dinheiro v c) -> c == Dollar ) dinheiros
    
    -- 4.8.2 
    
    -- 4.8.3 Quantidade de dollares
    --contarDollar :: [Dinheiro] -> Int 
    --contarDollar dollares = length $ filtrarDollar dollares
    variosDinheiros = [(Dinheiro 10 Real),(Dinheiro 20 Libra),(Dinheiro 2 Dollar), (Dinheiro 10 Dollar)]
    
    qntDollares :: [Dinheiro] -> Int
    qntDollares dinheiros = length $ filtrarDollares dinheiros
    
    -- foldl (\soma vi -> soma + vi) 0 [1 .. 5]
    -- 4.9 Usando foldl, crie lambdas
        -- 4.9.1 contar numeros negativos de uma lista
    funcao491 = foldl (\soma vi -> soma + 1) 0 $ filter (>0) [-10 .. 5]
    
        -- 4.9.2 contar letras 'p' de uma string 
    funcao492 = foldl (\soma item -> soma+1) 0 $ filter (=='p') "pintinhoppp"
   
        -- 4.9.3 Contar sabados em uma lista de semanas
    funcao493 xs = foldl (\resultado item -> resultado+1) 0 $ filter (==Sabado) xs
    
    -- Para, a partir de uma lista de [DiaSemana] , retornar a soma dos dias. Exemplo: [Segunda, Segunda, Quarta] deve retornar 5 . Use uma função auxiliar para converter DiaSemana para Int . 
    numD :: Dia -> Int
    numD Segunda = 1
    numD Terca = 2
    numD Quarta = 3
    numD Quinta = 4
    numD Sexta = 5
    numD Sabado = 6
    numD Domingo = 7
    
    funcao494 = foldl (\soma itens -> soma + itens) 0 $ map numD [Domingo, Segunda, Terca, Quarta, Quinta, Sabado]
    
    -- 4.10 - Refazer os exercícios usando .  $   |>
    
    
    {- CAPITULO 5  POLIMORFISMO PARAMÉTRICO -}
    data Carteira a = Nada
                      | UmItem a 
                      | DoisItens a a deriving Show
    {-
        :t Nada = Carteira a    
        :t UmItem = a -> Carteira a
        :t DoisItens = a -> a -> Carteira a
    -}
    
    data Coisa a b = ZeroCoisa
                   | UmaCoisa a 
                   | DuasCoisas a b deriving Show
    {-
        :t Coisa = Coisa a
        :t UmaCoisa = a -> UmaCoisa a
        :t DuasCoisas = a -> a -> DuasCoisas a
    -}
    
    -- Aqui começamos a falar de TYPE PARAMETER. São equivalentes ao generics do Java no Haskell.
    
    data ExemploCoisa ec = ExemploZero
                            | ExemploUm ec 
                            | ExemploDois ec ec deriving Show
    
    -- Aqui, usando o :kind, podemos saber quanto TYPE PARAMETERS existem no seu tipo
    -- :kind Int = *
        -- É assim pq não possui parametro de tipo
    -- :kind ExemplCoisa = * -> *
    
    -- O kind enxerga os tipos como FUNÇÕES DE TIPOS.
    
    data ExemploKind a b = ExemploKind a b
    
    -- FACA UM DATA TYPE = 4 + a ^ 3 + a 
   -- data Quatro = A | B | C | D 
    --data Letras a = Letras Quatro | Letrasb a a a | Letrasc a
    
    -- FAZ DE NOVO = 4 + a^3 + a 
   -- data ValorQuatro = Av | Bv | Cv | Dv 
    --data LetrasValor a = LetrasValor ValorQuatro | OutraTres a a a | OutraUm a
    --
    
    dobrar :: Double -> Double
    dobrar xs = xs*xs
    
    -- 5.1 TIPOS COM PARAMETROS
    data Carteiras a = Vazia 
                     | ComItem a 
                     | ComItens a a deriving Show
                     
    mostrarPrimeiro :: Carteiras a -> a 
    mostrarPrimeiro (ComItem x) = x
    mostrarPrimeiro (ComItens x _) = x
    
    -- 5.2 RESTRIÇÃO DE TIPOS EM UMA FUNÇÃO
    mostrar :: Show a => Carteiras a -> String
    mostrar Vazia = "Carteira vazia..."
    mostrar (ComItem x) = "Carteira com um item: " ++ show x
    mostrar (ComItens x y) = "Item 1: " ++ show x ++ ", Item 2: " ++ show y
    
    -- só vou restringir se usar um TYPECLASS.
    
    -- 5.3 CLASSES DE TIPOS = INSTANCIAS.
    -- typeclass é uma estrutura que habilita um operador (ou mais) ou uma função (ou mais) a ser usada de forma diferente, dependendo de um TYPE PARAMETER. Para cada tipo, uma instancia deverá ser definida, e com ela, a definição do operador ou da função que o typeclass provê.
        -- lembra uma INTERFACE
    data TypeClass a = Nenhum | UmNegocio a | DoisNegocios a a deriving (Show, Eq)
    
    -- se cair lance de instancia
    -- Faça uma instancia de Eq para Tupla, onde duas Tuplas sao iguais se o primeiro elemento de uma for igual ao segundo elemento da outra.
    data Tupla a = Tupla a a 
    
    instance (Eq a) => Eq (Tupla a) where
        (Tupla a _) == (Tupla _ b) = (a == b)
        
    instance Show a => Show (Tupla a) where 
        show (Tupla a b) = "fst: " ++ (show a) ++ " => snd: " ++ (show b)
    -- LEMBRANDO, quando temos KIND 1 não preciso da restrição
    
    data Moeda = MDollar | MLibra | MReal
    
    instance Show Moeda where 
        show MDollar = "Moeda dollar"
        show MLibra = "Uau, Euro"
        show MReal = "Meh, real"
    
    -- :t \x -> ["oa" ++ x]
    -- \x -> ["oa" ++ x] :: [Char] -> [[Char]]
    
    -- AULA 61
    class Predicado a where
        predi :: a -> Bool
        
    instance Predicado [a] where 
        predi [] = False
        predi _ = True
        
    instance Predicado Char where 
        predi ' ' = False 
        predi _ = True
        
    instance Predicado Int where 
        predi x
            | x >= 0 = True
            | otherwise = False
            
    instance Predicado Bool where 
        predi = id
    
    {- MONOIDES = 5.5 -}
    -- import Data.Monoid
    {-
        :t (<>)
        (<>) :: Monoid m => m -> m -> m
    -}
    -- Product (getStum (Sum 7 <> Sum 3 <> mempty))  <> Product 2 = 20
    -- getSum (Sum 7 <> Sum 3 <> mempty) = 10
    
    data Or = Or Bool deriving Show 
    
    instance Monoid Or where 
        mempty = Or False 
        mappend (Or False) (Or False) = Or True
        mappend _ _ = Or True
    
    -- fazer exercicios do cap 5
    
    
    {- CAPITULO 6 - TEORIA DAS CATEGORIAS -}
    -- NÃO ENTENDI
    
    
    {- CAPITULO 7 - FUNTOR -}
    data Bolsa a = BolsaVazia
                | BolsaUm a 
                | BolsaDois a a deriving Show 
    
    instance Functor Bolsa where
        fmap _ BolsaVazia = BolsaVazia
        fmap funcao (BolsaUm a) = BolsaUm (funcao a)
        fmap funcao (BolsaDois x y) = BolsaDois (funcao y) (funcao x)
        
    
    data TuplaA a = TuplaA a a deriving Show
    
    instance Functor TuplaA where 
        fmap f (TuplaA x y) = TuplaA (id.f $ y) (id.f $ x)
        
    exemploFunctor = fmap (\x -> x) $ TuplaA 2 5
    
    -- FUNCTOR MAYBE
    -- Conserta funções parciais
    protegerHead :: [a] -> Maybe a
    protegerHead [] = Nothing
    protegerHead parametro = Just (head parametro)
    
    -- Arrume a exceção de Divisãoperates
    protegerDivisao :: Double -> Double -> Maybe Double
    protegerDivisao _ 0 = Nothing
    protegerDivisao x y = Just (x/y)
    
    testandoMaybe :: String -> Maybe String 
    testandoMaybe [] = Nothing 
    testandoMaybe parametro = Just parametro
    
    safeTail :: String -> Maybe String
    safeTail [] = Nothing
    safeTail xs = Just $ tail xs
    
    
    -- Either
    safeHead2 :: [a] -> Either String a 
    safeHead2 [] = Left "Lista vazia"
    safeHead2 a = Right (head a)
    
    pegarPosicao :: [a] -> Int -> Either String a 
    pegarPosicao [] _ = Left "Lista vazia"
    pegarPosicao lista numero
        | numero < 0 = Left "Posicao negativa"
        | numero > length lista - 1 = Left "Posicao acima do limite"
        | otherwise = Right (lista !! numero)
    