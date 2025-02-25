EXTENSION=daterange_inclusive
MODULE_big=daterange_inclusive
OBJS = daterange_inclusive.o
PGFILEDESC = "daterange_inclusive - daterange with inclusive upper bound"
DATA = "daterange_inclusive--1.0.sql"

REGRESS="daterange_inclusive"
ifdef USE_PGXS
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
endif


