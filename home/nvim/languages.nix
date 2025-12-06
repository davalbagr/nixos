_: {
  go.enable = true;
  nix.enable = true;
  css.enable = true;
  html.enable = true;
  sql.enable = true;
  tailwind.enable = true;
  ts.enable = true;
  yaml.enable = true;
  ruby.enable = true;
  ruby.lsp.servers = [ "ruby_lsp" ];

  enableExtraDiagnostics = true;
  enableFormat = true;
  enableTreesitter = true;
}
