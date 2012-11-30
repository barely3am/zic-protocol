EXTRA_DIST = src

ME=protocol-magic
BUILD=$(shell git describe --tags)
SNAPSHOT=$(ME)-$(BUILD)
SRC=src/person.proto

all: default

default:
	@echo "Please read the README before beginning your installation."

install:
	@echo "Please read the README before beginning your installation."

perl:
	$(PERL) sbin/generate_perl_bindings.pl

cpp: 
	[ -d pb-cpp ] || mkdir pb-cpp
	$(PROTOC) --cpp_out=pb-cpp $(SRC)

python:
	[ -d pb-python ] || mkdir pb-python
	$(PROTOC) --python_out=pb-python $(SRC) 

clean:
	rm Makefile
	rm config.log
	rm config.status

realclean: clean
	rm Makefile.in
	rm configure
	rm aclocal.m4
	rm -R -f pb-*

reconf:
	autoreconf -vf

snapshot:
	git archive --format=tar --prefix=$(BUILD)/ $(BUILD) | gzip > $(SNAPSHOT).tar.gz
