# conversationalcomments

A customizable review comments package for LaTeX. It provides dynamic commentator registration, text highlighting with connection lines to marginal notes, auto-alternating conversational threads, and multi-author conversation blocks.

## Distribution Structure

Following CTAN standards, this package is distributed as a documented LaTeX (`.dtx`) and installation batch (`.ins`) pair:

- `conversationalcomments.dtx`: The single source file containing both the documented LaTeX package code and the user manual.
- `conversationalcomments.ins`: The installation script used to extract the style file.
- `conversationalcomments.pdf`: The compiled user manual.

## Installation / Extraction

To extract the `conversationalcomments.sty` file, run:
```bash
latex conversationalcomments.ins
```

This will generate `conversationalcomments.sty`. Move this file into your TeX search path (e.g., your local directory or your local `texmf` tree) to use it.

## Compiling the Documentation

To build the PDF user manual (`conversationalcomments.pdf`), compile the `.dtx` file using `pdflatex`:
```bash
pdflatex conversationalcomments.dtx
```

## Quick Start Example

Add this to your preamble:
```latex
\usepackage{conversationalcomments}
\setreviewmarginwidth{1.5in}

% Register commentators with colors and partners
\newcommentator{bill}{Bill}{pastelblue}[vale]
\newcommentator{vale}{Vale}{pastelred}[bill]
\newcommentator{alice}{Alice}{pastelgreen}
```

Use them in your document body:

### 1. Basic Comments
```latex
% Text-linked comment (Highlight + Connecting Line)
\bill{This is some highlighted text}{This box is in the margin.}

% Standalone note in the margin next to the current line
\vale{}{A floating standalone note in the margin.}
```

### 2. Auto-Alternating Conversation Threads (Two-Author Shorthand)
By adding consecutive braced arguments, replies automatically alternate between the initiator and their default partner:
```latex
\bill{Let's discuss}{How about this?}{I think it looks good!}{Thanks, let's keep it.}
```

### 3. Third-Party Nesting (Joining a Conversation)
A third author (like Alice) can join a two-author thread by nesting their custom command inside a reply argument:
```latex
\bill{Target Text}{Hey Vale, want to grab lunch?}{\vale{Sure!}}{\alice{Can I join too?}}
```

### 4. Multi-Author Collaborative Conversations (`\conversation`)
For three or more authors, use the `\conversation` block. Inside this block, commentator commands automatically adapt to act as inline reply formatters:
```latex
\conversation{Target text to review}{
    \bill{We are using context-aware macros.}
    \vale{It works flawlessly inside the conversation block.}
    \alice{And the connecting lines look beautiful!}
}
```
