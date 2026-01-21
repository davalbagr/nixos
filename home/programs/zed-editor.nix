{ pkgs, ... }:
{
  enable = true;
  extraPackages = with pkgs; [
    nil
  ];
  userSettings = {
    base_keymap = "VSCode";
    git_panel = {
      button = false;
    };
    collaboration_panel = {
      button = false;
    };
    title_bar = {
      show_sign_in = false;
    };
    project_panel = {
      dock = "right";
    };
    context_servers = {
      mcp-server-shopify-dev = {
        enabled = true;
        settings = { };
      };
    };
    git = {
      disable_git = true;
    };
    icon_theme = "Catppuccin Mocha";
    languages = {
      "HTML+ERB" = {
        language_servers = [
          "herb"
          "ruby-lsp"
          "..."
        ];
      };
      "JS+ERB" = {
        language_servers = [
          "ruby-lsp"
          "..."
        ];
      };
      Ruby = {
        language_servers = [
          "ruby-lsp"
          "!solargraph"
          "!rubocop"
          "..."
        ];
      };
      "YAML+ERB" = {
        language_servers = [
          "ruby-lsp"
          "..."
        ];
      };
    };
    session = {
      trust_all_worktrees = true;
    };
    tab_bar = {
      show = false;
    };
    theme = "Catppuccin Mocha";
    vim_mode = true;
  };
}
