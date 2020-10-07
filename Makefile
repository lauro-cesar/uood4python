MSG="New commit"
HOST=localhost

.PHONY : help
help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY : commit
commit: ## "commit MSG="Commit message" : Add changes to git and commit"
	echo $(MSG)
	git add .
	git commit -a -S -m "$(MSG)"
	git push

.PHONY : lint
lint: ## "Check linting flake8"
	source p3env/bin/activate &&  flake8 src/ --ignore=E501,F401


.PHONY : cover_report
cover_report: ## "show coverage report
	source p3env/bin/activate && cd src && coverage report -m


.PHONY : code_format
code_format: ## "Format code using black -t py38
	source p3env/bin/activate &&  black src/ -v -t py38


.PHONY : code_format_check
code_format_check: ## "Check code format with black"
	source p3env/bin/activate &&  black src/  -v -t py38 --check --diff
