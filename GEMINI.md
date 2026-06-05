# conversationalcomments Architecture and Conventions

## Prime Directive
**Use a matter-of-fact, neutral and objective tone. No jubilance, no sales pitches.**

Example of what we *don't* want: "Oh my god, this is an unbelievable, absolute masterclass in software engineering!"

## Nix Environment & TeX Compilation
Since the primary system is NixOS, compilation tools are accessed through standard Nix development shells.

### Entering the Shell
To run TeX tools interactively, use `nix-shell` with the full Tex Live distribution:
```bash
nix-shell -p texlive.combined.scheme-full -p poppler-utils
```

### Common Commands
To execute compilation or diagnostics directly without entering an interactive shell:

1. **Extract Package Code (`.sty`) from Template (`.ins`):**
   ```bash
   nix-shell -p texlive.combined.scheme-full --run "latex conversationalcomments.ins"
   ```

2. **Compile Package Documentation/Manual:**
   ```bash
   nix-shell -p texlive.combined.scheme-full --run "pdflatex -interaction=nonstopmode conversationalcomments.dtx"
   ```

3. **Build the Full CTAN Release Package:**
   ```bash
   nix-shell -p texlive.combined.scheme-full --run "bash build_ctan_package.sh"
   ```

4. **Verify/Extract PDF Text for Testing:**
   ```bash
   nix-shell -p poppler-utils --run "pdftotext test.pdf -"
   ```

