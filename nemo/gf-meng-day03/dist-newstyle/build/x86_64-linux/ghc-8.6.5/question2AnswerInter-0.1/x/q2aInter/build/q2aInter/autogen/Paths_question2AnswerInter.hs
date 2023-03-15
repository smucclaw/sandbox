{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_question2AnswerInter (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/nemo/.cabal/bin"
libdir     = "/home/nemo/.cabal/lib/x86_64-linux-ghc-8.6.5/question2AnswerInter-0.1-inplace-q2aInter"
dynlibdir  = "/home/nemo/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/nemo/.cabal/share/x86_64-linux-ghc-8.6.5/question2AnswerInter-0.1"
libexecdir = "/home/nemo/.cabal/libexec/x86_64-linux-ghc-8.6.5/question2AnswerInter-0.1"
sysconfdir = "/home/nemo/.cabal/etc"

getBinDir     = catchIO (getEnv "question2AnswerInter_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "question2AnswerInter_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "question2AnswerInter_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "question2AnswerInter_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "question2AnswerInter_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "question2AnswerInter_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
