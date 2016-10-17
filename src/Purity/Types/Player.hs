{-# LANGUAGE DataKinds #-}
module Purity.Types.Player (Player(..)) where

import Purity.Types.Id

data Player = Player (Id ForObject)
