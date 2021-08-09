{ pkgs ? import <nixpkgs> {}, withTestSupport ? true }:

with pkgs;

# Require hugo >= 0.87.
assert (builtins.compareVersions hugo.version "0.87.0") >= 0;

stdenv.mkDerivation {
  name = "docs-env";
  buildInputs = [
    hugo
  ] ++ lib.optional withTestSupport nodejs;
}
