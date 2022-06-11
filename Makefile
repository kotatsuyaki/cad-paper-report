.POSIX:
.PHONY: all
all: main.pdf
main.pdf: main.md frontmatter.md
	pandoc \
		frontmatter.md main.md \
		-o main.pdf \
		--from markdown+east_asian_line_breaks+definition_lists+citations \
		--data-dir=. \
		--template=eisvogel \
		--pdf-engine=xelatex \
		--listings \
		--filter=pandoc-crossref \
		--lua-filter=./filters/image-size.lua \
		--citeproc \
		--bibliography=./cite.bibtex \
		--csl=./ieee.csl
