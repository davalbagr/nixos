{pkgs, ...}: {
  enable = true;
  defaultEditor = true;
  colorSchemePackage = pkgs.kakounePlugins.kakoune-catppuccin;
  extraConfig = ''
    colorscheme catppuccin_mocha
    set-option global tabstop 2
    set-option global indentwidth 2
    map -docstring "comment line" global user c ":comment-line<ret>"
    add-highlighter global/ number-lines -relative
    map global user p '! wl-paste<ret>' -docstring 'paste after (system)'
    map global user P '<a-!> wl-paste<ret>' -docstring 'paste before (system)'
    map global user y '<a-|> wl-copy<ret>' -docstring 'yank to clipboard'

		# LSP config

    eval %sh{kak-lsp}
    lsp-enable

    map global user l ':enter-user-mode lsp<ret>' -docstring 'LSP mode'

    map global goto d <esc>:lsp-definition<ret> -docstring 'LSP definition'
    map global goto r <esc>:lsp-references<ret> -docstring 'LSP references'
    map global goto y <esc>:lsp-type-definition<ret> -docstring 'LSP type definition'

    map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'

    map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
    map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
    map global object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
    map global object t '<a-semicolon>lsp-object Class Interface Module Namespace Struct<ret>' -docstring 'LSP class or module'
    map global object d '<a-semicolon>lsp-diagnostic-object error warning<ret>' -docstring 'LSP errors and warnings'
    map global object D '<a-semicolon>lsp-diagnostic-object error<ret>' -docstring 'LSP errors'
    set-option global modelinefmt '%val{bufname}'
    set-face global StatusLine default,default
    set-face global StatusLineMode default,default
    set-face global StatusLineInfo default,default
    set-face global StatusLineValue default,default
    set-face global PrimaryCursor      rgb:585b70,rgb:b4befe
    set-face global SecondaryCursor    rgb:cdd6f4,rgb:6c7086
    set-face global PrimaryCursorEol   rgb:585b70,rgb:b4befe
    set-face global SecondaryCursorEol rgb:cdd6f4,rgb:6c7086

    hook global ModeChange .*:insert %{
        set-face window PrimaryCursor      rgb:11111b,rgb:f5e0dc
        set-face window PrimaryCursorEol   rgb:11111b,rgb:f5e0dc
    }

    hook global ModeChange .*:normal %{
        unset-face window PrimaryCursor
        unset-face window PrimaryCursorEol
    }
  '';
}
