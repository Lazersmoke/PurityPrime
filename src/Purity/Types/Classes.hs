module Purity.Types.Classes where

import Purity.Types.Vector
import Purity.Types.Object

-- Class for things that can be moved (ie they have a position that can be changed)
class Positioned p where
  move :: Offset -> p -> p

instance Positioned PhysicsObject where
  move dv (SimpleObject aabb) = SimpleObject (move dv aabb)
  move dv (MovingObject aabb vel) = MovingObject (move dv aabb) vel
  move dv (PointObject pos) = PointObject (move dv pos)

instance Positioned Vector where
  move = (+)

instance Positioned AABB where
  move dv (AABB pos off) = AABB (pos + dv) off


