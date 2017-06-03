{-# LANGUAGE DataKinds #-}

-- | Set of constraints used by LRC.

module Pos.Lrc.Mode
       ( LrcMode
       ) where

import qualified Ether
import           Mockable                 (Async, Concurrently, Delay, Mockables)

import           Pos.Block.Logic.Internal (BlockApplyMode)
import           Pos.Context              (BlkSemaphore)
import           Pos.DB.Class             (MonadGState)

-- | Set of constraints used by LRC.
type LrcMode ssc m
     = ( BlockApplyMode ssc m
       , MonadGState m
       , Mockables m [Async, Concurrently, Delay]
       , Ether.MonadReader' BlkSemaphore m
       )
