module Purity.Types.Object where

import Purity.Types.Vector

data PhysicsObject = SimpleObject AABB | PointObject Position | MovingObject AABB Velocity
