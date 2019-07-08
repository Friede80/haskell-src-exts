{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hse_examples (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/matt/haskell-src-exts/.stack-work/install/x86_64-linux/cc7a1d47258c7be0ed1c56d5499f9165d37890f241187c8e37ed8354179c8513/8.9.0.20190628/bin"
libdir     = "/home/matt/haskell-src-exts/.stack-work/install/x86_64-linux/cc7a1d47258c7be0ed1c56d5499f9165d37890f241187c8e37ed8354179c8513/8.9.0.20190628/lib/x86_64-linux-ghc-8.9.0.20190628/hse-examples-0.1-5JD7A2Fy2Gs3sWa67U2PZZ-prettify"
dynlibdir  = "/home/matt/haskell-src-exts/.stack-work/install/x86_64-linux/cc7a1d47258c7be0ed1c56d5499f9165d37890f241187c8e37ed8354179c8513/8.9.0.20190628/lib/x86_64-linux-ghc-8.9.0.20190628"
datadir    = "/home/matt/haskell-src-exts/.stack-work/install/x86_64-linux/cc7a1d47258c7be0ed1c56d5499f9165d37890f241187c8e37ed8354179c8513/8.9.0.20190628/share/x86_64-linux-ghc-8.9.0.20190628/hse-examples-0.1"
libexecdir = "/home/matt/haskell-src-exts/.stack-work/install/x86_64-linux/cc7a1d47258c7be0ed1c56d5499f9165d37890f241187c8e37ed8354179c8513/8.9.0.20190628/libexec/x86_64-linux-ghc-8.9.0.20190628/hse-examples-0.1"
sysconfdir = "/home/matt/haskell-src-exts/.stack-work/install/x86_64-linux/cc7a1d47258c7be0ed1c56d5499f9165d37890f241187c8e37ed8354179c8513/8.9.0.20190628/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hse_examples_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hse_examples_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hse_examples_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hse_examples_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hse_examples_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hse_examples_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
