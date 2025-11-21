let
  username = "davidagra";
  gitUserEmail = "davidaagra@gmail.com";
  gitUserName = "davalbagr";

  hostname = "nixos";
  system = "aarch64-linux";

  homeStateVersion = "25.05";
  nixpkgsBranch = "nixos-unstable";
in {
  inherit
    username
    gitUserEmail
    gitUserName
    hostname
    system
    homeStateVersion
    nixpkgsBranch;
}
