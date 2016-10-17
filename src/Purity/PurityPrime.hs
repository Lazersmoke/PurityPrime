{-# LANGUAGE DataKinds #-}
module Purity.PurityPrime where

import Data.Unique
import qualified Data.Map as Map
import Data.Map (Map)

import Purity.Types.Vector
import Purity.Types.Server
import Purity.Types.Player
import Purity.Types.Id


-- We should be able to accept any arbitrary Demand and apply constraints to validate it
data Demand 
  = DemandTeleport ObjectId DeltaPosition
  | DemandAccelerate ObjectId DeltaVelocity

type Constraint = Demand -> Maybe Demand

accelerateObject :: DeltaVelocity -> PhysicsObject -> PhysicsObject
accelerateObject dv (MovingObject aabb vel) = MovingObject aabb (dv + vel)
accelerateObject _ a = a

realizeDemand :: Demand -> Server -> Server
realizeDemand (DemandTeleport oid dv) s = Server ps (Map.mapWithKey (\i o -> if i == oid then move dv o else o) os)
realizeDemand (DemandAccelerate oid dv) s = Server ps (Map.mapWithKey (\i o -> if i == oid then accelerateObject dv o else o) os)

compositeConstraint :: Constraint
compositeConstraint = Just

applyArbitraryDemand :: Demand -> Server -> Server
applyArbitraryDemand d = case compositeConstraint d of
  Just d' -> realizeDemand d'
  Nothing -> id
--type PurityT m a = WriterT String m a
--type Purity a = PurityT Identity a

--tellLn :: MonadWriter String m => String -> m ()
--tellLn = tell . (++"\n")

purityPrime :: IO ()
purityPrime = putStrLn "Starting Purity"

--tick :: Purity ()
--tick = void get
{-
movePlayer :: Player -> Purity Player
movePlayer (Player pos vel) = do
  tell "Moving Player from " ++ show pos ++ " to " ++ show vel
  return $ Player (pos + vel) vel
-}
