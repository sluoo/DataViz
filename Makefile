## This is public, a screens project directory under DataViz
## makestuff/project.Makefile

## https://mac-theobio.github.io/DataViz
## https://github.com/mac-theobio/DataViz/tree/gh-pages
## https://github.com/mac-theobio/DataViz/

current: target
-include target.mk
-include makestuff/rmdweb.def

######################################################################

## Flow

## Use `make pull` to pull from both branches

pullup pull: pull_pages
pull_pages:
	-cd pages && git commit -am "pullsync"
	-cd pages && git pull

######################################################################

# Overview

## Sources += README.md notes.md
Sources += $(wildcard *.md)

Makefile: pages

vim_session:
	bash -cl "vm README.md notes.md makestuff/rmdweb.mk"

######################################################################

## Trying to develop a pipeline 2019 Sep 01 (Sun)

## Appearance
Sources += main.header.html main.footer.html $(wildcard styles/*.css)
Ignore += main.css
main.css: styles/light.css Makefile
	$(copy)

## Content

## pages/index.html: index.mkd

######################################################################

Sources += $(webSources)

######################################################################

### Resources

## Use pardirs for direct editing if you decide to do that, but not for 
## sd; we can sd from above to keep things flatter

pardirs += QMEE 744

## Makefile: $(pardirs) may or may not be wanted, also make sure it stays low if you do (after all the pardirs)

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/rmdweb.mk
-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
