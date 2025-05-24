CARGO := cargo
TYPST := typst

build: resume.pdf
watch: resume.typ
	$(TYPST) watch $<

resume.pdf: resume.typ
	$(TYPST) compile $<

bin/typst:
	$(CARGO) install --root ${CURDIR} --no-track --locked typst-cli

.envrc: hack/example.envrc
	cp $< $@ && chmod a=,u+r $@
