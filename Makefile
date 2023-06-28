NAME = libasm.a
NAME_T = test

OBJ_DIR		=	objs
INC_DIR		=	includes
SRC_DIR		=	$(shell find srcs -type d)

CXX	= clang
CXXFLAGS = -Wall -Wextra -Werror

ifeq ($(DEBUG), 1)
	CXXFLAGS += -g3
endif
OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:%.s=%.o))
SRCS =	ft_strlen.s \
		ft_write.s \
		ft_read.s

SRC_TEST = main.c
OBJS_TEST = $(addprefix $(OBJ_DIR)/, $(SRC_TEST:%.c=%.o))

vpath %.s $(foreach dir, $(SRC_DIR), $(dir):)
vpath %.c $(foreach dir, $(SRC_DIR), $(dir):)

ifeq ($(shell UNAME), Darwin)
	CMD_AS = nasm
	FLAG_AS = -f macho64 -DDARWIN
	FLAGS = -macosx_version_min 10.8 -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
else
	CMD_AS = as
	FLAG_AS = 
endif


all : $(NAME)

$(NAME) : $(OBJS)
# ld ${OBJS} -o $(NAME) $(FLAGS)
	ar -rcs $(NAME) $(OBJS)
	ranlib $(NAME)

# --  Redirection in OBJS  -- #
$(OBJ_DIR)/%.o: %.s | $(OBJ_DIR)
	$(CMD_AS) ${FLAG_AS} -o $@ $<

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	$(CXX) ${CXXFLAGS} -I${INC_DIR} -o $@ -c $<

$(OBJ_DIR) :
	@mkdir -p $@

${NAME_T} : $(NAME) ${OBJS_TEST}
	$(CXX) ${CXXFLAGS} -L. -lasm ${OBJS_TEST} -I${INC_DIR} -o $(NAME_T)

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME) ${NAME_T}


re: fclean all

.PHONY: re fclean clean all