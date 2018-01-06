{ pkgs ? import <nixpkgs> {}, withTestSupport ? true }:

with pkgs;

# Require hugo >= 0.30.
assert (builtins.compareVersions hugo.version "0.30") >= 0;

stdenv.mkDerivation {
  name = "docs-env";
  buildInputs = [
    hugo
  ] ++ lib.optional withTestSupport nodejs;
}
