# conversationalcomments

A \LaTeX\ interface for margin comments linked to highlighted document text. It supports commentator registration, alternating threads, and multi-author conversation blocks.

## Package Options

- `draft` (default): Enables comments, highlights, and geometry adjustments.
- `final`: Disables all comments and highlights, restoring the original document geometry.

## Conversation Resolution and Reporting

- **Starred variant:** Commentator commands and the `\conversation` block support a starred variant (e.g., `\bill*`, `\conversation*`) to mark a thread as resolved. Resolved comments display a gray `[Resolved]` prefix in the margin.
- **Reporting macro:** Use `\printconversations[filter]` to render a hyperlinked summary report of conversations with links back to the text:
  - `\printconversations` (or `\printconversations[unresolved]`): Lists unresolved conversations.
  - `\printconversations[all]`: Lists both resolved and unresolved conversations.
  - `\printconversations[resolved]`: Lists resolved conversations.

## Distribution Structure

This package is distributed as a documented \LaTeX\ (`.dtx`) and installation batch (`.ins`) pair:

- `conversationalcomments.dtx`: Source file containing both the package code and the user manual.
- `conversationalcomments.ins`: Installation script.
- `conversationalcomments.pdf`: Compiled user manual.

## Installation / Extraction

Extract the style file:
```bash
latex conversationalcomments.ins
```

Move `conversationalcomments.sty` into the \TeX\ search path.

## Compiling the Documentation

Compile the user manual:
```bash
pdflatex conversationalcomments.dtx
```

## Quick Start Example

Preamble:
```latex
\usepackage{conversationalcomments}
\setreviewmarginwidth{1.5in}

% Register commentators with colors and partners
\newcommentator{bill}{Bill}{pastelblue}[vale]
\newcommentator{vale}{Vale}{pastelred}[bill]
\newcommentator{alice}{Alice}{pastelgreen}
```

Document body:

### 1. Basic Comments
```latex
% Text-linked comment (Highlight + Connecting Line)
\bill{This is some highlighted text}{This box is in the margin.}

% Standalone note in the margin next to the current line
\vale{}{A floating standalone note in the margin.}
```

### 2. Auto-Alternating Conversation Threads
Consecutive braced arguments alternate replies between the commentator and their default partner:
```latex
\bill{Reference text}{Initial query}{First response}{Second response}
```

### 3. Third-Party Nesting
A third commentator can join a thread by nesting their command inside a reply argument:
```latex
\bill{Reference Text}{Initial comment.}{\vale{Reviewer response.}}{\alice{Additional comment.}}
```

### 4. Multi-Author Collaborative Conversations (`\conversation`)
For three or more commentators, commentator commands inside the `\conversation` block act as inline reply formatters:
```latex
\conversation{Target text to review}{
    \bill{Proposed revision for this section.}
    \vale{The modification matches the technical requirements.}
    \alice{The comments are aligned with the text.}
}
```

## License

This material is subject to the MIT License. See the `LICENSE` file for the full license text.
