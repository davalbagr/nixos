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

    define-command -docstring \
    "Open Yazi in your kakoune's root directory" \
    yazi-root %{
        edit %sh{
            output=/tmp/kak-yazi
            rm -f $output

            $kak_opt_termcmd "yazi --chooser-file $output"

            if [ -s "$output" ]; then
                cat "$output"
            else
                echo $kak_buffile
            fi
        }
    }

    define-command -docstring \
    "Open Yazi in your current buffer's directory" \
    yazi %{
        edit %sh{
            output=/tmp/kak-yazi
            rm -f $output

            cd "$(dirname "$kak_buffile")"
            $kak_opt_termcmd "yazi --chooser-file $output"

            if [ -s "$output" ]; then
                cat "$output"
            else
                echo $kak_buffile
            fi
        }
    }

    map global user f ':yazi<ret>'
    map global user F ':yazi-root<ret>'

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
  '';
}
