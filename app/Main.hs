import Data.Char

data Operator = Plus | Minus | Times | Div
  deriving (Show, Eq)

data Token = TokOp Operator
           | TokIdent String
           | TokNum Double
    deriving (Show, Eq)

operator :: Char -> Operator
operator c | c == '+' = Plus
           | c == '-' = Minus
           | c == '*' = Times
           | c == '/' = Div


tokenize :: String -> [Token]
tokenize [] = []
tokenize (c:cs)
    | elem c "+-*/" = TokOp (operator c) : tokenize cs
    | isDigit c = number c cs
    | isAlpha c = identifier c cs
    | isSpace c = tokenize cs
    | otherwise = error $ "Cannot tokenize " ++ [c]
    where
      identifier c cs = let (str, cs') = span isAlpha cs in
                        TokIdent (c:str) : tokenize cs'
      number c cs = let (str, cs') = span (\x -> isDigit x || x == '.') cs in
                    TokNum (read (c:str)) : tokenize cs'

data Expression
parse :: [Token] -> Expression
parse = undefined


evaluate :: Expression -> Double
evaluate = undefined

main :: IO ()
main = print $ tokenize " 1 + 43.2 / x23 "
