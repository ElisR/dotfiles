{ pkgs, ... }:

{
  home.packages = [
    pkgs.git
    pkgs.presenterm
    pkgs.zoxide
    pkgs.eza
    pkgs.zellij
    pkgs.helix
    pkgs.lazygit
    pkgs.delta
    pkgs.ripgrep
    pkgs.fzf
    pkgs.yazi
    pkgs.zsh
    pkgs.marksman
    pkgs.ruff
    pkgs.pyright
    pkgs.starship
    pkgs.pixi
    pkgs.uv
  ];

  programs = {
    zsh = {
      enable = true;
    };
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "solarized_light";
        editor = {
          bufferline = "always";
          line-number = "relative";
          idle-timeout = 0;
          cursor-shape.insert = "bar";
          indent-guides = {
            render = true;
            character = "╎";
            skip-levels = 1;
          };
          statusline.left = ["mode" "spinner" "file-name" "version-control"];
          lsp.display-inlay-hints = true;
          file-picker.hidden = false;
        };
        keys.normal.space = {
          q = ":quit";
          x = ":buffer-close";
        };
      };
      languages = {
        language-server.ruff = {
          command = "ruff";
          args = ["server"];
          config = {
            documentFormatting = true;
            settings.run = "onSave";
          };
        };

        language-server.pyright = {
          command = "pyright-langserver";
          args = ["--stdio"];
          config = {
            reportMissingTypeStubs = false;
            reportOptionalMemberAcces = false;
          };
        };
        language-server.rust-analyzer = {
          config.check.command = "clippy";
        };
        language = [
          {
            name = "python";
            auto-format = true;
            language-servers = [
              {
                name = "ruff";
                only-features = [ "format" "diagnostics" "code-action" ];
              }
              {
                name = "pyright";
                except-features = [ "format" "diagnostics" "code-action" ];
              }
            ];
          }
          {
            name = "rust";
            language-servers = ["rust-analyzer"];
            auto-format = true;
          }
        ];
      };
    };
    lazygit = {
      enable = true;
      settings = {
        git = {
          parseEmoji = true;
          paging = {
            colorArg = "always";
            pager = "delta --light --paging=never";
          };
        };
        gui = {
          nerdFontsVersion = 3;
          sidePanelWidth = 0.25;
        };
      };
    };
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        nodejs.disabled = true;
        package.disabled = true;
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    zellij = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        simplified_ui = true;
        default_shell = "zsh";
        theme = "solarized-light";
        themes = {
          solarized-light = {
              fg = [101 123 131];
              bg = [253 246 227];
              black = [7 54 66];
              red = [220 50 47];
              green = [133 153 0];
              yellow = [181 137 0];
              blue = [38 139 210];
              magenta = [211 54 130];
              cyan = [42 161 152];
              white = [238 232 213];
              orange = [203 75 22];
          };
        };
        keybinds = {
          unbind = ["Ctrl x" "Ctrl o" "Ctrl s" "Alt n"];
          session = {
              bind = {
                _args = ["Ctrl x"];
                SwitchToMode = "Normal";
              };
          };
          "shared_except \"session\" \"locked\"" = {
            bind = {
              _args = ["Ctrl x"];
              SwitchToMode = "Session";
            };
          };
          "shared_except \"scroll\" \"locked\"" = {
            bind = {
              _args = ["Ctrl k"];
              SwitchToMode = "Scroll";
            };
          };
          scroll = {
              bind = {
                _args = ["Ctrl k"];
                SwitchToMode = "Normal";
              };
          };
          search = {
              bind = {
                _args = ["Ctrl k"];
                SwitchToMode = "Normal";
              };
          };
        };
      };
    };
  };
}
