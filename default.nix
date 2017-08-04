# default parameter, lazily imports all of nixpkgs namespace into scope
{ pkgs ? import <nixpkgs> {} }:
# stdenv is passed in automatically
pkgs.stdenv.mkDerivation rec {
  name = "hello-2.9";
  # src itself is a derivation, all derivations are stored in the /nix/store, before being realized
  src = pkgs.fetchurl {
    # URL of source to fetch
    url = "mirror://gnu/hello/${name}.tar.gz";
    # Hash of source
    sha256 = "19qy37gkasc4csb1d3bdiz9snn8mir2p3aj0jgzmfv0r2hi7mfzc";
  };
  # cheat to see how build phases run
  preBuild = ''
    set -x
  '';
}
