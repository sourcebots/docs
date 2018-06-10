{ pkgs ? import <nixpkgs> {}, withTestSupport ? true }:

with pkgs;

# Require hugo >= 0.40.
assert (builtins.compareVersions hugo.version "0.40") >= 0;

stdenv.mkDerivation {
  name = "docs-env";
  buildInputs = [
    hugo
  ] ++ lib.optional withTestSupport nodejs;
}
