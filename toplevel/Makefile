
NAME=toplevel
OBJS=toplevel.cmo

all: $(NAME).js

include Makefile.conf

COMP=$(JOOSOURCEDIR)/compiler/$(COMPILER)

JSFILES=$(MIRAGESOURCEDIR)/lib/os/runtime_node/runtime.js mirage_toplevel.js $(JOOSOURCEDIR)/runtime/weak.js toplevel_runtime.js

OCAMLC=ocamlfind ocamlc -package lwt,str -pp "camlp4o $(JOOSOURCEDIR)/lib/syntax/pa_js.cmo" -I $(JOOSOURCEDIR)/lib -I $(JOOSOURCEDIR)/compiler

MIRAGESTDLIB= mirage_stdlib

STDLIB=\
  $(JOOSOURCEDIR)/lib/$(LIBNAME).cma \
  $(JOOSOURCEDIR)/compiler/compiler.cma \
  toplevellib.cma \
  $(MIRAGESTDLIB).cma

DUMMYO= stubs.o
EXPUNGE=$(shell ocamlc -where)/expunge
# Removed gc and sys
STDLIB_MODULES=\
  arg \
  array \
  arrayLabels \
  buffer \
  callback \
  camlinternalLazy \
  camlinternalMod \
  camlinternalOO \
  char \
  complex \
  digest \
  filename \
  format \
  genlex \
  hashtbl \
  int32 \
  int64 \
  lazy \
  lexing \
  list \
  listLabels \
  map \
  marshal \
  moreLabels \
  nativeint \
  obj \
  oo \
  parsing \
  pervasives \
  printexc \
  printf \
  queue \
  random \
  scanf \
  set \
  sort \
  stack \
  stdLabels \
  stream \
  string \
  stringLabels \
  weak
PERVASIVES=$(STDLIB_MODULES) outcometree topdirs toploop

#toplevel.byte: $(OBJS:cmx=cmo) toplevel.cmo
#	ocamlfind ocamlc -linkall -g -package str -linkpkg toplevellib.cma -o $@.tmp $^

$(NAME).js: $(NAME).byte $(COMP) $(JSFILES)
	$(COMP) -toplevel -noinline -noruntime $(MIRAGESOURCEDIR)/lib/_build/node/std/bitstring.cmi $(JSFILES) $(NAME).byte $(OPTIONS)

$(NAME).byte: $(DUMMYO) $(MIRAGESTDLIB).cma $(OBJS) $(JOOSOURCEDIR)/compiler/compiler.cma
	$(OCAMLC) -linkall -linkpkg -o $@.tmp $(STDLIB) $(OBJS)
	$(EXPUNGE) $@.tmp $@ $(PERVASIVES)
	rm -f $@.tmp

$(MIRAGESTDLIB).cma: $(DUMMYO)
	ocamlmklib -o $(MIRAGESTDLIB) $(DUMMYO) $(MIRAGESOURCEDIR)/lib/_build/node/std/stdlib.cma

%.cmo: %.ml
	$(OCAMLC) -c $<

%.o: %.c
	ocamlfind ocamlc -package lwt -c $<

%.cmi: $(JOOSOURCEDIR)/compiler/compiler.cma

$(JOOSOURCEDIR)/compiler/compiler.cma:
	$(MAKE) -C $(JOOSOURCEDIR)/compiler compiler.cma

errors.cmi: errors.mli
	$(OCAMLC) -c $<

clean::
	rm -f *.cm[io] *.a *.so $(NAME).byte $(NAME).js
	rm -f $(DUMMYO)

depend:
	ocamldep -pp "camlp4o $(JOOSOURCEDIR)/lib/syntax/pa_js.cmo" -I $(JOOSOURCEDIR)/compiler *.ml *.mli > .depend

include .depend
