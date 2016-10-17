{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
module Purity.Types.Vector where

type Position = Vector 
type Velocity = Vector 
type DeltaPosition = Vector 
type DeltaVelocity = Vector 
type Offset = Vector 

data AABB = AABB Position Offset

data GeneralVector a = Vector a a a
type Vector = GeneralVector Rational

instance Num a => Num (GeneralVector a) where
  (Vector a1 b1 c1) + (Vector a2 b2 c2) = Vector (a1 + a2) (b1 + b2) (c1 + c2)
  (Vector a1 b1 c1) * (Vector a2 b2 c2) = Vector (a1 * a2) (b1 * b2) (c1 * c2)
  negate (Vector a b c) = Vector (-a) (-b) (-c)
  abs (Vector a b c) = Vector (abs a) (abs b) (abs c)
  signum (Vector a b c) = Vector (signum a) (signum b) (signum c)
  fromInteger i = Vector (fromInteger i) (fromInteger i) (fromInteger i)
