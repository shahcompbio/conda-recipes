DEBUG ?= 0
PARALLEL ?= 0
STATIC ?= 0

# Submodules
PWD = $(shell pwd)
BOOST_ROOT ?= $(shell get_boost_include)

# Flags
CXX=g++
CXXFLAGS += -isystem ${BOOST_ROOT} -pedantic -W -Wall -Wno-unknown-pragmas

# Additional flags for release/debug
ifeq (${PARALLEL}, 1)
	CXXFLAGS += -fopenmp -DOPENMP
else
	CXXFLAGS += -DNOPENMP
endif

# Additional flags for release/debug
ifeq (${STATIC}, 1)
	LDFLAGS += -pthread -lhts -lz -lbz2
else
	LDFLAGS += -lhts -lz -Wl,-rpath,${SEQTK_ROOT},-rpath,${BOOST_ROOT}/stage/lib
endif
ifeq (${DEBUG}, 1)
	CXXFLAGS += -g -O0 -fno-inline -DDEBUG
else ifeq (${DEBUG}, 2)
	CXXFLAGS += -g -O0 -fno-inline -DPROFILE
	LDFLAGS += -lprofiler -ltcmalloc
else
	CXXFLAGS += -O3 -funroll-loops -DNDEBUG
endif


# External sources
DELLYSOURCES = $(wildcard src/*.h) $(wildcard src/*.cpp)
BOOSTSOURCES += $(shell get_boost_sources iostreams) 
BOOSTSOURCES += $(shell get_boost_sources filesystem) 
BOOSTSOURCES += $(shell get_boost_sources system) 
BOOSTSOURCES += $(shell get_boost_sources program_options) 
BOOSTSOURCES += $(shell get_boost_sources date_time) 

# Targets
TARGETS = src/delly src/extract src/cov src/iover src/stats

all:   	$(TARGETS)

src/delly: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp $(BOOSTSOURCES) -o $@ $(LDFLAGS)

src/extract: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp -o $@ $(LDFLAGS)

src/cov: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp -o $@ $(LDFLAGS)

src/iover: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp -o $@ $(LDFLAGS)

src/stats: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp -o $@ $(LDFLAGS)

clean:
	cd src/htslib && make clean
	cd src/modular-boost && ./b2 --clean-all
	rm -f $(TARGETS) $(TARGETS:=.o)
