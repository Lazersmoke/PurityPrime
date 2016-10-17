{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
module Purity.Types.Id (IdKind(..), Id, freshId) where

import Data.Unique

-- Kind lifted param
data IdKind = ForPlayer | ForObject

-- Phantom Type Parameter
newtype Id (k :: IdKind) = Id Unique deriving (Eq)

freshId :: IO (Id k)
freshId = Id <$> newUnique
