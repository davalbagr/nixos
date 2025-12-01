_: {
  enable = true;
  enableFishIntegration = true;
  settings = {
    elm = {
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
      symbol = " ";
    };
    nix_shell = {
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol ]($style)[](fg:overlay)";
      disabled = false;
      symbol = "❄";
    };
    scala = {
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
      symbol = " ";
    };
    python = {
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
      symbol = " ";
    };
    conda = {
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$environment ]($style)[](fg:overlay)";
      disabled = false;
      symbol = "🅒 ";
    };
    format = "$directory$fill$c$elixir$golang$haskell$java$nodejs$nim$rust$scala$python$nix_shell
  [󱞪](fg:iris) ";
    elixir = {
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
      symbol = " ";
    };
    java = {
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
      symbol = " ";
      style = "bg:overlay fg:pine";
    };
    nim = {
      symbol = "󰆥 ";
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
    };
    fill = {
      style = "fg:overlay";
      symbol = " ";
    };
    git_status = {
      behind = "[⇣\(\${count}\)](bg:overlay fg:rose)";
      disabled = false;
      format = "[](fg:overlay)([$all_status$ahead_behind]($style))[](fg:overlay) ";
      up_to_date = "[ ✓ ](bg:overlay fg:iris)";
      untracked = "[?\($count\)](bg:overlay fg:gold)";
      stashed = "[\$](bg:overlay fg:iris)";
      modified = "[!\($count\)](bg:overlay fg:gold)";
      renamed = "[»\($count\)](bg:overlay fg:iris)";
      staged = "[++\($count\)](bg:overlay fg:gold)";
      style = "bg:overlay fg:love";
      deleted = "[✘\($count\)](style)";
      ahead = "[⇡\(\${count}\)](bg:overlay fg:foam)";
      diverged = "⇕[\[](bg:overlay fg:iris)[⇡\(\${ahead_count}\)](bg:overlay fg:foam)[⇣\(\${behind_count}\)](bg:overlay fg:rose)[\]](bg:overlay fg:iris)";
    };
    golang = {
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
      symbol = " ";
    };
    haskell = {
      disabled = false;
      symbol = " ";
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
    };
    "\$schema" = "https://starship.rs/config-schema.json";
    palette = "rose-pine";
    palettes = {
      rose-pine = {
        iris = "#c4a7e7";
        overlay = "#26233a";
        love = "#eb6f92";
        gold = "#f6c177";
        rose = "#ebbcba";
        pine = "#31748f";
        foam = "#9ccfd8";
      };
    };
    directory = {
      truncation_length = 3;
      truncation_symbol = "…/";
      substitutions = {
        Pictures = " ";
        Documents = "󰈙";
        Downloads = " ";
        Music = " ";
      };
      format = "[](fg:overlay)[ $path ]($style)[](fg:overlay) ";
      style = "bg:overlay fg:pine";
    };
    git_branch = {
      style = "bg:overlay fg:foam";
      symbol = "";
      format = "[](fg:overlay)[ $symbol $branch ]($style)[](fg:overlay) ";
    };
    username = {
      format = "[](fg:overlay)[ 󰧱 $user ]($style)[](fg:overlay) ";
      show_always = true;
      style_root = "bg:overlay fg:iris";
      style_user = "bg:overlay fg:iris";
      disabled = false;
    };
    nodejs = {
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
      symbol = "󰎙 ";
      style = "bg:overlay fg:pine";
    };
    rust = {
      symbol = " ";
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
    };
    c = {
      style = "bg:overlay fg:pine";
      format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
      disabled = false;
      symbol = " ";
    };
  };
}
