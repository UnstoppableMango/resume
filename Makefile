RUSTUP ?= rustup
CARGO  != $(RUSTUP) which cargo
TYPST  := bin/typst

build: resume.pdf
watch: resume.typ
	$(TYPST) watch $<

resume.pdf: resume.typ $(TYPST)
	$(TYPST) compile $< $@

bin/typst:
	$(CARGO) install --root ${CURDIR} --locked typst-cli

.envrc: hack/example.envrc
	cp $< $@ && chmod a=,u+r $@
