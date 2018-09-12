let
  pkgs = import <nixpkgs> { overlays = [ (import ../pkgs) ]; };
in {
  bash = pkgs.writeBash "hello-world" ''
   if [[ "test" == "test" ]]; then echo "bash features"; fi
  '';
  # cc -L/nix/store/...blah/lib -I/nix/store/...blah/include
  dash = pkgs.writeDash "hello-world" ''
   test '~' = '~' && echo 'dash features'
  '';
  haskell = pkgs.writeHaskell "hello-world" [ "acme-cuteboy" ] ''
    import Acme.CuteBoy

    main :: IO ()
    main = print Rolf
  '';
  perl = pkgs.writePerl "simple.pl" { deps = [ pkgs.perlPackages.boolean ]; } ''
    use boolean;
    print "Howdy!\n" if true;
  '';
  python2 = pkgs.writePython2 "hello-world" { deps = [ pkgs.python2Packages.pyyaml ]; } ''
    import yaml

    print yaml.load("""
      - some
      - random
      - variables
    """)
  '';
  python3 = pkgs.writePython3 "hello-world" { deps = [ pkgs.python3Packages.pyyaml ]; } ''
    import yaml

    print(yaml.load("""
      - some
      - random
      - variables
    """))
  '';
  sed = pkgs.writeDash "sed-example" ''
    echo hello | ${pkgs.writeSed "hello-world" "s/hello/& world/"}
  '';
}
