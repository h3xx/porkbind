PORKBIND_CONF = porkbind.conf
CFLAGS	= -O2 -Wall \
		  -DPORKBIND_CONF=\"$(PORKBIND_CONF)\" \
		  -pthread # -DDEBUG
# You may have to add -lpthread here
LIBS	= -pthread -lresolv
OBJS    = axfrtest.o main.o chkver.o genver.o vercmp.o skiptodata.o skipname.o \
	  recurtest.o report.o vcheck.o usage.o vexit.o spin.o
EXE     = porkbind
all: $(EXE)
$(EXE): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS)

$(OBJS): dnsqry.h

clean:
	$(RM) $(OBJS) $(EXE)
