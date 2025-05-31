ITERATION  ?= 2025/05/25
FORMATS    ?= pdf png svg

DATA_DIR   := qualifications/${ITERATION}
ASSETS_DIR := assets/${ITERATION}
ASSETS     := ${FORMATS:%=${ASSETS_DIR}/resume.%}

RUSTUP  ?= rustup
CARGO   != $(RUSTUP) which cargo
FONTIST ?= fontist
GEM     ?= gem
TYPST   ?= typst

export FONTIST_PATH := ${CURDIR}/.fontist
export TYPST_FONT_PATHS ?= ${FONTIST_PATH}/fonts

ifneq (${PHONE},)
TYPST_ARGS += --input phone=${PHONE}
endif

build: ${ASSETS}
watch: resume.typ
	$(TYPST) watch $<

fonts: .fontist/fonts
update: build assets/current qualifications/current

manifest-locations: .fontist/manifest.yml
	$(FONTIST) manifest-locations $<

.fontist/system_index.default_family.yml:
	$(FONTIST) update
.fontist/fonts: .fontist/manifest.yml | .fontist/system_index.default_family.yml
	$(FONTIST) manifest-install $<

${ASSETS_DIR} ${DATA_DIR}:
	@mkdir -p $@

assets/current: ${ASSETS_DIR}
qualifications/current: ${DATA_DIR}
assets/current qualifications/current:
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
