{ config, pkgs, inputs, ... }:

{
  home.username = "tillo";
  home.homeDirectory = "/home/tillo";
  home.stateVersion = "25.11";

  # =========================
  # User Packages
  # =========================
  home.packages = with pkgs; [
    obsidian
  ];

  # =========================
  # ZSH
  # =========================
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "fzf" "zoxide" ];
    };

    shellAliases = {
      ll = "ls -lah";
      ".." = "cd ..";
      "..." = "cd ../..";
      update = "nh os switch";
      cleanup = "nh clean all";
    };

    history.size = 10000;
  };

  # =========================
  # Starship
  # =========================
  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol   = "[❯](bold red)";
      };
      directory = {
        truncation_length = 4;
        truncate_to_repo  = true;
      };
    };
  };

  # =========================
  # Git
  # =========================
  programs.git = {
    enable = true;
    userName = "tilloest";
    userEmail = "178488902+tilloest@users.noreply.github.com";
    extraConfig.init.defaultBranch = "main";
  };

  # =========================
  # VSCode
  # =========================
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;

    extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        mkhl.direnv
        eamodio.gitlens
        usernamehw.errorlens
        ms-python.python
        rust-lang.rust-analyzer
        ms-vscode.cpptools
        catppuccin.catppuccin-vsc
    ];

    userSettings = {
        # ========== Visuals ==========
        "editor.bracketPairColorization.enabled" = true;
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorBlinking" = "phase";
        "editor.fontFamily" = "JetBrainsMono Nerd Font";
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "editor.guides.bracketPairs" = "active";
        "editor.lineNumbers" = "interval";
        "editor.renderWhitespace" = "boundary";
        "window.autoDetectColorScheme" = true;
        "window.menuBarVisibility" = "compact";
        "window.commandCenter" = false;
        "workbench.activityBar.location" = "top";
        "workbench.editor.empty.hint" = "hidden";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.editor.tabActionLocation" = "left";
        "workbench.iconTheme" = "catppuccin-mocha";
        "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
        "workbench.preferredLightColorTheme" = "Catppuccin Latte";
        "workbench.list.smoothScrolling" = true;
        "workbench.sideBar.location" = "right";
        "workbench.startupEditor" = "newUntitledFile";
        "workbench.tree.expandMode" = "singleClick";
        "workbench.tree.indent" = 10;

        # ========== Editor ==========
        "chat.disableAIFeatures" = true;
        "debug.onTaskErrors" = "debugAnyway";
        "diffEditor.ignoreTrimWhitespace" = false;
        "editor.wordSeparators" = "`~!@#%^&*()=+[{]}\\|;:'\",.<>/?";
        "editor.find.addExtraSpaceOnTop" = false;
        "editor.inlineSuggest.enabled" = true;
        "editor.multiCursorModifier" = "ctrlCmd";
        "editor.suggestSelection" = "first";
        "editor.tabSize" = 2;
        "editor.unicodeHighlight.invisibleCharacters" = false;
        "editor.stickyScroll.enabled" = true;
        "editor.hover.sticky" = true;
        "editor.codeActionsOnSave" = {
            "source.fixAll" = "never";
            "source.fixAll.eslint" = "explicit";
            "source.organizeImports" = "never";
        };
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "files.eol" = "\n";
        "files.insertFinalNewline" = true;
        "files.simpleDialog.enable" = true;
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        "git.untrackedChanges" = "separate";
        "scm.diffDecorationsGutterWidth" = 2;
        "terminal.integrated.cursorBlinking" = true;
        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.fontWeight" = "300";
        "terminal.integrated.persistentSessionReviveProcess" = "never";
        "terminal.integrated.tabs.enabled" = true;
        "workbench.editor.closeOnFileDelete" = true;
        "workbench.editor.highlightModifiedTabs" = true;
        "workbench.editor.limit.enabled" = true;
        "workbench.editor.limit.perEditorGroup" = true;
        "workbench.editor.limit.value" = 5;
        "search.exclude" = {
            "**/*.snap" = true;
            "**/*.svg" = true;
            "**/.git" = true;
            "**/.github" = false;
            "**/.nuxt" = true;
            "**/.output" = true;
            "**/.pnpm" = true;
            "**/.vscode" = true;
            "**/.yarn" = true;
            "**/assets" = true;
            "**/bower_components" = true;
            "**/dist/**" = true;
            "**/logs" = true;
            "**/node_modules" = true;
            "**/out/**" = true;
            "**/package-lock.json" = true;
            "**/pnpm-lock.yaml" = true;
            "**/public" = true;
            "**/temp" = true;
            "**/yarn.lock" = true;
            "**/CHANGELOG*" = true;
            "**/LICENSE*" = true;
        };

        # ========== Global Level Config ==========
        "window.dialogStyle" = "custom";
        "window.title" = "\${rootName}"; # Note the backslash to escape the $ in Nix
        "window.titleBarStyle" = "custom";
        "extensions.autoUpdate" = "onlyEnabledExtensions";

        # ========== Extension configs ==========
        "emmet.showSuggestionsAsSnippets" = true;
        "emmet.triggerExpansionOnTab" = false;
        "gitlens.codeLens.authors.enabled" = false;
        "gitlens.codeLens.enabled" = false;
        "gitlens.codeLens.recentChange.enabled" = false;
        "gitlens.menus" = {
            "editor" = { "blame" = false; "clipboard" = true; "compare" = true; "history" = false; "remote" = false; };
            "editorGroup" = { "blame" = true; "compare" = false; };
            "editorTab" = { "clipboard" = true; "compare" = true; "history" = true; "remote" = true; };
            "explorer" = { "clipboard" = true; "compare" = true; "history" = true; "remote" = true; };
            "scm" = { "authors" = true; };
            "scmGroup" = { "compare" = true; "openClose" = true; "stash" = true; };
            "scmGroupInline" = { "stash" = true; };
            "scmItem" = { "clipboard" = true; "compare" = true; "history" = true; "remote" = false; "stash" = true; };
        };
        "iconify.annotations" = true;
        "iconify.inplace" = true;
        "prettier.enable" = false;
        "prettier.printWidth" = 200;
        "prettier.semi" = false;
        "prettier.singleQuote" = true;

        # ========== Language Configs ==========
        "python.analysis.autoSearchPaths" = true;
        "python.analysis.diagnosticSeverityOverrides" = { "reportMissingImports" = "none"; };
        "python.analysis.extraPaths" = [ "\${workspaceFolder}/src" ];
        "python.envFile" = "\${workspaceFolder}/.env";
        "python.terminal.activateEnvironment" = true;
        "python.defaultInterpreterPath" = "\${workspaceFolder}/.venv/bin/python";
        "rust-analyzer.check.command" = "clippy"; # Better linting for Rust
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
    };
  };

  # =========================
  # Direnv
  # =========================
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # =========================
  # FZF & Zoxide
  # =========================
  programs.fzf.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
