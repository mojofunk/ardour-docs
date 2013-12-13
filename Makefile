ARDOUR_BOOK_DIR ?= Ardour_Book
ARDOUR_BOOK_FILE ?= $(ARDOUR_BOOK_DIR)/en-US/Ardour_Book.xml
ARDOUR_BOOK_OUTDIR ?= tmp

help::
	@echo " The Following is a list of supported build targets:"
	@echo
	@echo " build:"
	@echo "     Build Ardour Book."
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

all:: Ardour_Book
.PHONY : all

build-ardour-book-html::
	publican build --formats html --langs en-US --src_dir=Ardour_Book

build-ardour-book-pdf::
	publican build --formats pdf --langs en-US --src_dir=Ardour_Book

build-html:: build-ardour-book-html

build-pdf:: build-ardour-book-pdf

build:: build-ardour-book-html build-ardour-book-pdf

.PHONY : build

format::
	@for file in `find . -name '*.xml' -type f`; \
		do xmlformat/xmlformat.pl --in-place --backup .bak \
		--config-file xmlformat/xmlformat.conf $$file; \
		done

.PHONY : format

clean-ardour-book::
	@rm -rf $(ARDOUR_BOOK_OUTDIR)

.PHONY : clean-ardour-book

clean-backup-files::
	@for file in `find . -name '*.bak' -type f`; do \
		rm $$file; done

.PHONY : clean-backup-files

clean:: clean-ardour-book clean-backup-files

.PHONY : clean
