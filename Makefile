NAME = test

OBJ_DIR		=	objs
INC_DIR		=	includes
SRC_DIR		=	$(shell find srcs -type d)
# LIB			=	-lreadline

# FLAGS = -L /Library/Developer/CommandLineTools/SDKs/MacOSX13.3.sdk/usr/lib/ -lSystem
# FLAGS = -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem

FLAGS = -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
# ld -macosx_version_min 10.8  objs/test.o -o test
OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:%.s=%.o))
SRCS = test.s

vpath %.s $(foreach dir, $(SRC_DIR), $(dir):)

# nasm -f macho64 <file>
# ld -macosx_version_min 10.8 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem <file>
all : $(NAME)

$(NAME) : $(OBJS)
	ld $(OBJS) -o $(NAME) -macosx_version_min 10.8 $(FLAGS)

# --  Redirection in OBJS  -- #
$(OBJ_DIR)/%.o: %.s $(OBJ_DIR)
	nasm -f macho -o $@ -DDARWIN $<

$(OBJ_DIR) :
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)


re: fclean all

.PHONY: re fclean clean all