define GetFromPkg
$(shell node -p "require('./package.json').$(1)")
endef

PROJECT      := $(call GetFromPkg,name)
LAST_VERSION := $(call GetFromPkg,version)


.PHONY: test
test:
	@echo ${PROJECT}
	@echo v${LAST_VERSION}

.PHONY: up
up:
	git add .
	git commit -am "update"
	git pull origin main
	git push origin main
	@echo "\n 代码提交..."

.PHONY: tag
tag:
	git pull origin master
	git add .
	git commit -am "${PROJECT} ${LAST_VERSION}"
	git push origin main
	git tag v${LAST_VERSION}
	git push --tags
	@echo "\n tags 发布中..."%
