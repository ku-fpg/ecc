module Main where

import ECC.Tester
import ECC.Types
import Data.Monoid

import qualified ECC.Code.BPSK as BPSK
import qualified ECC.Code.Repetition as Repetition

-- code/codename/4
-- moon/min_array/4
-- ["min_array","moon",ns]

codes = BPSK.code <> Repetition.code

main :: IO ()
main = do
  eccTester (Options ["bpsk","repetition/3"] [0,2,4,6,8,10] 0) codes eccPrinter
