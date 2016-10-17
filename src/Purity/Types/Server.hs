{-# LANGUAGE DataKinds #-}
module Purity.Types.Server (emptyServer, Server) where

import qualified Data.Map as Map

import Purity.Types.Id
import Purity.Types.Player
import Purity.Types.Object

data Server = Server (Map.Map (Id ForPlayer) Player) (Map.Map (Id ForObject) PhysicsObject)

emptyServer :: Server
emptyServer = Server Map.empty Map.empty

instance Grab
