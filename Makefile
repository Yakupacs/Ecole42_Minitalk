NAME=serverclient.a

CC=gcc
CFLAGS=-Wall -Wextra -Werror
printf= src/libftprintf.a

CLIENT = client
SERVER = server

all: $(SERVER) $(CLIENT)

$(NAME): $(SERVER) $(CLIENT)

$(SERVER):
	make -C ./src
	$(CC) $(CFLAGS) server.c $(printf) -o $@

$(CLIENT):
	make -C ./src
	$(CC) $(CFLAGS) client.c $(printf) -o $@

clean:
	make fclean -C ./src
	rm server client

fclean: clean

re: fclean all

.PHONY: all clean fclean re