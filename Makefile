CC=gcc
LIBSPATH=lib
CFLAGS=-Iinclude
SRCSPATH=src
OBJSPATH=obj
OBJS=$(OBJSPATH)/chat.o $(OBJSPATH)/command.o $(OBJSPATH)/request.o \
	 $(OBJSPATH)/response.o
LIBS=$(LIBSPATH)/libsocket.o $(LIBSPATH)/str.o $(LIBSPATH)/cursor.o $(OBJS)
CFLAGS+=-g
# CFLAGS+=-Wall -Werror -Wmissing-prototypes -Wcast-qual
# CFLAGS+=-Wmissing-declarations -Wshadow -Wpointer-arith
# CFLAGS+=-Wsign-compare -Isrc/
CFLAGS+=-Wunused-variable -Wunused-function -Wshadow

all: server client

objects: command chat request response

server: server.c
	$(CC) -c -o $(OBJSPATH)/chat.o $(SRCSPATH)/chat.c $(CFLAGS)
	$(CC) -o server server.c $(LIBS) $(CFLAGS)

client: client.c
	$(CC) -c -o $(OBJSPATH)/chat.o $(SRCSPATH)/chat.c $(CFLAGS) -DCLIENT_APP
	$(CC) -o client client.c $(LIBS) $(CFLAGS) 


command: $(SRCSPATH)/command.c
	$(CC) -c -o $(OBJSPATH)/command.o $(SRCSPATH)/command.c $(CFLAGS)

chat: $(SRCSPATH)/chat.c
	$(CC) -c -o $(OBJSPATH)/chat.o $(SRCSPATH)/chat.c $(CFLAGS)

request: $(SRCSPATH)/request.c
	$(CC) -c -o $(OBJSPATH)/request.o $(SRCSPATH)/request.c $(CFLAGS)

response: $(SRCSPATH)/response.c
	$(CC) -c -o $(OBJSPATH)/response.o $(SRCSPATH)/response.c $(CFLAGS)

clean:
	rm $(OBJSPATH)/*.o
	rm client
	rm server

