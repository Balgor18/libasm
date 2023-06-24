NAME = test

OBJ_DIR		=	objs
INC_DIR		=	includes
SRC_DIR		=	$(shell find srcs -type d)
# LIB			=	-lreadline


### IF MAC OS
# nasm -f macho64 <file>
# ld -macosx_version_min 10.8 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem <file>
# FLAGS = -L /Library/Developer/CommandLineTools/SDKs/MacOSX13.3.sdk/usr/lib/ -lSystem
# FLAGS = -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
# FLAGS = -macosx_version_min 10.8 -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem

# CMD_AS = nasm
# FLAG_AS = -f macho
### END IF

CMD_AS = as
FLAG_AS = 


OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:%.s=%.o))
SRCS = test.s

vpath %.s $(foreach dir, $(SRC_DIR), $(dir):)

all : $(NAME)

$(NAME) : $(OBJS)
	ld $(OBJS) -o $(NAME) $(FLAGS)

# --  Redirection in OBJS  -- #
$(OBJ_DIR)/%.o: %.s $(OBJ_DIR)
	$(CMD_AS) ${FLAG_AS} -o $@ -DDARWIN $<

$(OBJ_DIR) :
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)


re: fclean all

.PHONY: re fclean clean all