{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = [ pkgs.openjdk8
                          pkgs.maven 
                          pkgs.eclipses.eclipse-java
                        ];
  }
