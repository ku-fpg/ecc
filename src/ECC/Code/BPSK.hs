{-# LANGUAGE TupleSections #-}
module ECC.Code.BPSK where

import Data.Bit
import ECC.Types
import Data.Char (isDigit)
import qualified Data.Vector.Unboxed  as U

-- Simple BSPK encode/decode.

mkUnencoded :: Applicative f => Int -> ECC f
mkUnencoded n = ECC
        { name            = "unecoded"
        , encode          = pure
        , decode          = pure . (,True) . U.map hard
        , message_length  = n
        , codeword_length = n
        }

code :: Code
code = Code ["unencoded/<message-length>"]
     $ \ xs -> case xs of
                        ["unencoded",n]  | all isDigit n
                                         -> return [mkUnencoded (read n)]  
                        _                -> return []
