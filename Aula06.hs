module Aula06 where
    -- Inicio do cap 5 - Polimorfismo paramétrico.
    {-
        Não é o mesmo do padrão de projeto. Aquele polimorfismo de subtipo, aqui é paramétrico.
            . Tipo, e esse tipo vai ter um parametro que é outro tipo, o Tipo vai variar de acordo com parametro e ele vai se comportar de forma diferente.
            . LISTA = Estrutura é parametrizada por um tipo (array de Int, array de String, array de Bool).
                . Operações com a lista propriamente dita. Programar da maneira mais genérica possível.
                    . Não tem noção de subtipo, herança. (dá pra simular, mas não é a mesma coisa).
    -}
    
    
    {-
        SÓ CONSIGO COMEÇAR COM UM TIPO PARAMETRIZADO.
        Exemplo: Carteira
    -}
    
    -- Tipo: CARTEIRA
    -- a: Parametro
    data Carteira a = Nada 
                    | UmItem a 
                    | DoisItens a a
                    -- Nada, UmItem, DoisItens = Value Constructor
                    -- umItem a = Um campo, variaveis
                    -- doisItens aa = Dois campos, variaveis
                        -- DE ACORDO COM O A INICIAL, vão ser Strings, ints, etc....
    
    -- Quando a gente tem isso, temos uma FUNÇÃO ENTRE TIPOS. (Int, String, Boolean, não é uma função entre tipos)
    -- :kind String, Int.....
        -- Vai falar que é uma função constante.
    
    -- KING DE CARTEIRA?
    -- :kind Carteira
        -- * -> *
            -- Kind 2, mais que 0 TYPE PARAMTER, sempre um a menos
            -- kind 1, 0
            -- kind 3, 2
                -- KINDS > 1, parametros
                
            -- Nilson, tuplas são?
                -- :kind (,) = 3
                    -- Cabem 2 TYPES PARAMETERS.
   {- data Carteira3 a b = Nada 
                    | UmItem a 
                    | DoisItens a b
    -}
    
    {-
        (,) Int = (Int, a)
        (,) Int String = (Int,String)
        (,) = (a,b), vira type parameter
    -}
    
    
    -- PERGUNTA?  :kind (->) ===== INDICA FUNÇÃO, tem uma entrada e saída., vale igual a da tuplas
        -- FUNÇÃO SÃO TIPOS DE FUNÇÃO ENTRE TIPOS, Ela fica KIND 3. * -> * -> *
    
    -- PERGUNTA?
        -- Seria uma tupla igual uma função?
            -- Exemplo
           -- foo :: Double -> Double
            -- foo x = x * x
            
            {-
                f 1 = 1
                f 2 = 4
                f 3 = 9
                
                (1,1)
                (2,4)
                (3,9)
                
                (x, foo x)
                
                FUNÇÃO E TUPLAS SÃO JEITOS DIFERENTES DE REPRESENTAR UMA MESMA ESTRUTURA. TUPLAS E FUNÇÕES SÃO "PRIMOS". PEGA ISSO PELO TAMANHO DO KIND.
            -}
    
    -- PERGUNTA?
        -- Algo de KIND 3.
            -- Dicionário (do PYTHON), função, tuplas.
    
    -- KIND 2
        -- Assemelham-se a listas.
        
    -- KIND 3
        -- Assemelham-se a funções.
        
    -- KIND 4
        -- Guarda ai.
        


{-

    :t (DoisItens 'O' True) ((((COM O B))))
        = (DoisItens 'Q' True) :: Carteira Char Bool
    
-}