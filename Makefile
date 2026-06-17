FORMATS ?= pdf png svg
ASSETS  := $(FORMATS:%=assets/resume.%)

TYPST ?= typst

ifneq ($(PHONE),)
TYPST_ARGS += --input phone='$(PHONE)'
endif

build: $(ASSETS)
watch: resume.typ
	$(TYPST) watch $<

assets:
	@mkdir -p $@

assets/resume.pdf: resume.typ | assets
	$(TYPST) compile $< $@ $(TYPST_ARGS)

assets/resume.png assets/resume.svg: resume.typ | assets
	$(TYPST) compile $< $@ $(TYPST_ARGS) --pages 1

.envrc: hack/example.envrc
	cp $< $@ && chmod a=,u+r $@

.vscode/settings.json: hack/vscode-settings.json
	envsubst <$< >$@
