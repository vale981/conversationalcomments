#!/usr/bin/env bash
# build_ctan_package.sh
# Automates compiling and zipping the LaTeX package for CTAN submission.
# CTAN guidelines mandate:
#   - Flat directory layout named after the package.
#   - Inclusion of .dtx, .ins, -doc.pdf documentation, README.md, and LICENSE.
#   - Exclusion of any derived files (like .sty) or intermediate auxiliary files.

set -e

# Ensure we are in the script's directory
cd "$(dirname "$0")"

echo "=== [1/3] Compiling LaTeX Package and Documentation ==="

# 1. Unpack the package (generates .sty which is required for compiling the .dtx docs)
latex -interaction=nonstopmode conversationalcomments.ins

# 2. Run first pdflatex pass with jobname to generate -doc.idx and -doc.glo files
pdflatex -jobname=conversationalcomments-doc -interaction=nonstopmode conversationalcomments.dtx

# 3. Generate Index and Change Log (Glossaries) matching the new jobname
makeindex -s gind.ist -o conversationalcomments-doc.ind conversationalcomments-doc.idx
makeindex -s gglo.ist -o conversationalcomments-doc.gls conversationalcomments-doc.glo

# 4. Multi-pass pdflatex with jobname to resolve references, citations, index, and change log
pdflatex -jobname=conversationalcomments-doc -interaction=nonstopmode conversationalcomments.dtx
pdflatex -jobname=conversationalcomments-doc -interaction=nonstopmode conversationalcomments.dtx
pdflatex -jobname=conversationalcomments-doc -interaction=nonstopmode conversationalcomments.dtx

echo "=== [2/3] Preparing CTAN-Compliant Layout ==="
BUILD_DIR="ctan_build"
PKG_NAME="conversationalcomments"

# Clean any existing artifacts
rm -rf "$BUILD_DIR"
rm -f "${PKG_NAME}.zip"

# Create the standard flat package directory
mkdir -p "$BUILD_DIR/$PKG_NAME"

# Copy ONLY required files
# (Note: .sty is explicitly omitted as it is a derived file; PDF ends in -doc.pdf)
cp conversationalcomments.dtx "$BUILD_DIR/$PKG_NAME/"
cp conversationalcomments.ins "$BUILD_DIR/$PKG_NAME/"
cp conversationalcomments-doc.pdf "$BUILD_DIR/$PKG_NAME/"
cp README.md "$BUILD_DIR/$PKG_NAME/"
cp LICENSE "$BUILD_DIR/$PKG_NAME/"

echo "=== [3/3] Archiving CTAN Package ==="
# Move to build directory so the ZIP archive contains exactly "conversationalcomments/" at its root
cd "$BUILD_DIR"
zip -r "../${PKG_NAME}.zip" "./$PKG_NAME"
cd ..

# Cleanup build directory
rm -rf "$BUILD_DIR"

echo "========================================================="
echo "Success! CTAN Package ZIP created: ${PKG_NAME}.zip"
echo "Package contents inside the ZIP:"
unzip -l "${PKG_NAME}.zip"
echo "========================================================="
