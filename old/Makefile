ARDOUR_NOTES_DIR ?= Ardour_Notes
ARDOUR_NOTES_FILE ?= $(ARDOUR_NOTES_DIR)/en-US/Ardour_Notes.xml
ARDOUR_NOTES_OUTDIR ?= notes_tmp

ARDOUR_GUIDE_DIR ?= Ardour_Guide
ARDOUR_GUIDE_FILE ?= $(ARDOUR_GUIDE_DIR)/en-US/Ardour_Guide.xml
ARDOUR_GUIDE_OUTDIR ?= guide_tmp


help::
	@echo " The Following is a list of supported build targets:"
	@echo
	@echo " all:"
	@echo "     Generate HTML and PDF versions of the Documentation."
	@echo
	@echo " html:"
	@echo "     Generate HTML versions of the Documentation."
	@echo
	@echo " pdf:"
	@echo "     Generate PDF versions of the Documentation."
	@echo
	@echo " format:"
	@echo "     Format DocBook XML source using xmlformat."
	@echo
	@echo " test:"
	@echo "     Test if XML is valid."
	@echo
	@echo " clean:"
	@echo "     Remove temporary files."
	@echo

notes-html::
	publican build --formats html --langs en-US --src_dir=Ardour_Notes

notes-pdf::
	publican build --formats pdf --langs en-US --src_dir=Ardour_Notes

guide-html::
	publican build --formats html --langs en-US --src_dir=Ardour_Guide

guide-pdf::
	publican build --formats pdf --langs en-US --src_dir=Ardour_Guide

notes::notes-html notes-pdf
.PHONY : notes

guide::guide-html guide-pdf
.PHONY : guide

html::guide-html notes-html
.PHONY : html

pdf::notes-pdf guide-pdf
.PHONY : pdf

all:: notes guide
.PHONY : all

format::
	@for file in `find . -name '*.xml' -type f`; \
		do xmlformat/xmlformat.pl --in-place --backup .bak \
		--config-file xmlformat/xmlformat.conf $$file; \
		done

.PHONY : format

clean-notes::
	@rm -rf $(ARDOUR_NOTES_OUTDIR)

clean-guide::
	@rm -rf $(ARDOUR_GUIDE_OUTDIR)

clean-backup-files::
	@for file in `find . -name '*.bak' -type f`; do \
		rm $$file; done

.PHONY : clean-backup-files

clean:: clean-notes clean-guide clean-backup-files

.PHONY : clean
