ITERATION  ?= 2025/05/23
ASSETS_DIR := assets/${ITERATION}
FORMATS    ?= pdf png svg
ASSETS     := ${FORMATS:%=${ASSETS_DIR}/resume.%}

RUSTUP  ?= rustup
CARGO   != $(RUSTUP) which cargo
FONTIST ?= fontist
GEM     ?= gem
TYPST   ?= typst

export FONTIST_PATH := ${CURDIR}/.fontist

FONT_PATH ?= ${FONTIST_PATH}/fonts
TYPST_ARGS += --font-path ${FONT_PATH}

build: ${ASSETS}
watch: resume.typ
	$(TYPST) watch $<

fonts: .fontist/fonts
update: build assets/current

manifest-locations: .fontist/manifest.yml
	$(FONTIST) manifest-locations $<

.fontist/versions:
	$(FONTIST) update
.fontist/fonts: .fontist/manifest.yml | .fontist/versions
	$(FONTIST) manifest-install $<

${ASSETS_DIR}:
	@mkdir -p $@
assets/current: ${ASSETS_DIR}
	@rm -f $@ && ln -rs ${CURDIR}/$< ${CURDIR}/$@
${ASSETS}: resume.typ ${ASSETS_DIR} | fonts
	$(TYPST) compile $< $@ ${TYPST_ARGS}

bin/fontist:
	$(GEM) install fontist --bindir ${CURDIR}/bin

bin/typst: .versions/typst
	$(CARGO) install typst-cli \
	--root ${CURDIR} --no-track \
	--version $(shell cat $<)

.envrc: hack/example.envrc
	cp $< $@ && chmod a=,u+r $@

.vscode/settings.json: hack/vscode-settings.json
	envsubst <$< >$@
