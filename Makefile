ITERATION  ?= 2025/10/25
FORMATS    ?= pdf png svg

DATA_DIR   := qualifications/${ITERATION}
ASSETS_DIR := assets/${ITERATION}
ASSETS     := ${FORMATS:%=${ASSETS_DIR}/resume.%}

TYPST ?= typst

ifneq (${PHONE},)
TYPST_ARGS += --input phone='${PHONE}'
endif

build: ${ASSETS}
watch: resume.typ
	$(TYPST) watch $<

update: build assets/current qualifications/current

${ASSETS_DIR} ${DATA_DIR}:
	@mkdir -p $@

assets/current: ${ASSETS_DIR}
qualifications/current: ${DATA_DIR}
assets/current qualifications/current:
	@rm -f $@ && ln -rs ${CURDIR}/$< ${CURDIR}/$@

${ASSETS_DIR}/resume.pdf: resume.typ ${ASSETS_DIR}
	$(TYPST) compile $< $@ ${TYPST_ARGS}

${ASSETS_DIR}/resume.png ${ASSETS_DIR}/resume.svg: resume.typ ${ASSETS_DIR}
	$(TYPST) compile $< $@ ${TYPST_ARGS} --pages 1

.envrc: hack/example.envrc
	cp $< $@ && chmod a=,u+r $@

.vscode/settings.json: hack/vscode-settings.json
	envsubst <$< >$@
