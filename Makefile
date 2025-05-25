ITERATION  ?= 2025/05/23
ASSETS_DIR := assets/${ITERATION}
FORMATS    ?= pdf png svg
ASSETS     := ${FORMATS:%=${ASSETS_DIR}/resume.%}

RUSTUP ?= rustup
CARGO  != $(RUSTUP) which cargo
TYPST  := bin/typst

build: ${ASSETS}
watch: resume.typ
	$(TYPST) watch $<

update: build assets/current

${ASSETS_DIR}:
	@mkdir -p $@
assets/current: ${ASSETS_DIR}
	@rm -f $@ && ln -rs ${CURDIR}/$< ${CURDIR}/$@
${ASSETS}: resume.typ ${ASSETS_DIR} | $(TYPST)
	$(TYPST) compile $< $@

bin/typst: .versions/typst
	$(CARGO) install typst-cli \
	--root ${CURDIR} --no-track \
	--version $(shell cat $<)

.envrc: hack/example.envrc
	cp $< $@ && chmod a=,u+r $@
