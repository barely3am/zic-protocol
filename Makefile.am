EXTRA_DIST = src

ME=protocol-magic
BUILD=$(shell git describe --tags)
SNAPSHOT=$(ME)-$(BUILD)

all: default

default:
	@echo "Please read the README before beginning your installation."

install:
	@echo "Please read the README before beginning your installation."

perl: pbperl 
pbperl:
	$(PERL) sbin/generate_perl_bindings.pl

cpp: protobuf_cpp
pbcpp:
	[ -d pb-cpp ] || mkdir pb-cpp
	$(PROTOC) --cpp_out=pb-cpp $(PROTOFILES)

python: pbpython
pbpython:
	[ -d pb-python ] || mkdir pb-python
	$(PROTOC) --python_out=pb-python $(PROTOFILES) 

tpython:
	@echo "not implemented yet..."

tcpp:
	@echo "not implemented yet..."

tperl:
	@echo "not implemented yet..."

clean:
	rm Makefile
	rm config.log
	rm config.status

realclean: clean
	rm Makefile.in
	rm configure
	rm aclocal.m4

reconf:
	autoreconf -vf

snapshot:
	git archive --format=tar --prefix=$(BUILD)/ $(BUILD) | gzip > $(SNAPSHOT).tar.gz
