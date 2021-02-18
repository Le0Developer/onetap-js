# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "main" "_build/main" $(SPHINXOPTS) $(O)
	@$(SPHINXBUILD) -M $@ "v3" "_build/v3" $(SPHINXOPTS) $(O)
	@$(SPHINXBUILD) -M $@ "v3rerun" "_build/v3rerun" $(SPHINXOPTS) $(O)
	cp -r _build/v3/html/v3/ _build/main/html/v3/
	cp -r _build/v3rerun/html/v3rerun/ _build/main/html/v3rerun/
