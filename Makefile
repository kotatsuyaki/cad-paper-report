.POSIX:
.PHONY: all
all: main.pdf
main.pdf: main.md frontmatter.md
	pandoc \
		frontmatter.md main.md \
		-o main.pdf \
		--from markdown+east_asian_line_breaks \
		--data-dir=. \
		--template=eisvogel \
		--pdf-engine=xelatex \
		--listings \
		--lua-filter=./filters/image-size.lua
