{ pkgs ? import <nixpkgs> {}, withTestSupport ? true }:

with pkgs;

# Require hugo >= 0.36.1.
assert (builtins.compareVersions hugo.version "0.36.1") >= 0;

stdenv.mkDerivation {
  name = "docs-env";
  buildInputs = [
    hugo
  ] ++ lib.optional withTestSupport nodejs;
}
