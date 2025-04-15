NAME	= philos
CC		= gcc
CFLAGS	= -Werror -Wall -Wextra -pthread

# Directories
SRC_DIR	= src/
OBJ_DIR	= obj/
INC_DIR	= include/

# Source and Object Files
SRC		=	exit.c \
			grim_reaper.c \
			init.c \
			main.c \
			output.c \
			parsing.c \
			philo.c \
			time.c

SRCS	= $(addprefix $(SRC_DIR), $(SRC))
OBJS	= $(addprefix $(OBJ_DIR), $(SRC:.c=.o))

# Build Target
all: $(NAME)

# Rule to compile .c files into .o files
$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@ -I $(INC_DIR)

# Rule to link the final executable
$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

# Clean up object files
clean:
	rm -rf $(OBJ_DIR)
	@echo "Object files removed."

# Clean up all build files (objects and executable)
fclean: clean
	rm -f $(NAME)
	@echo "Executable removed."

# Rebuild everything from scratch
re: fclean all

.PHONY: all clean fclean re
