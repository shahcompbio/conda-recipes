DEBUG ?= 0
PARALLEL ?= 0
STATIC ?= 0

# Flags
CXX=g++
CXXFLAGS += -pedantic -W -Wall -Wno-unknown-pragmas
LDFLAGS += -lboost_iostreams -lboost_filesystem -lboost_system -lboost_program_options -lboost_date_time 

# Additional flags for release/debug
ifeq (${PARALLEL}, 1)
	CXXFLAGS += -fopenmp -DOPENMP
else
	CXXFLAGS += -DNOPENMP
endif

# Additional flags for release/debug
ifeq (${STATIC}, 1)
	LDFLAGS += -static -static-libgcc -pthread -lhts -lz
else
	LDFLAGS += -lhts -lz -Wl,-rpath,-rpath
endif
ifeq (${DEBUG}, 1)
	CXXFLAGS += -g -O0 -fno-inline -DDEBUG
else ifeq (${DEBUG}, 2)
	CXXFLAGS += -g -O0 -fno-inline -DPROFILE
	LDFLAGS += -lprofiler -ltcmalloc
else
	CXXFLAGS += -O3 -funroll-loops --fast-math -DNDEBUG
endif

# Delly sources
DELLYSOURCES = $(wildcard src/*.h) $(wildcard src/*.cpp)

# Targets
TARGETS = src/delly src/extract src/cov src/iover src/stats

all:   	$(TARGETS)

src/delly: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp -o $@ $(LDFLAGS)

src/extract: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp -o $@ $(LDFLAGS)

src/cov: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp -o $@ $(LDFLAGS)

src/iover: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp -o $@ $(LDFLAGS)

src/stats: $(DELLYSOURCES)
	$(CXX) $(CXXFLAGS) $@.cpp -o $@ $(LDFLAGS)

clean:
	rm -f $(TARGETS) $(TARGETS:=.o)
