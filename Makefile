# --- Compiladores ---
CC = gcc
CXX = g++

# --- Nome do Executável ---
TARGET = main

# --- Diretórios ---
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
INCLUDE_DIR = include

# O caminho completo do executável
EXECUTABLE = $(BIN_DIR)/$(TARGET)

# --- Flags de Compilação ---
# CPPFLAGS (C PreProcessor Flags): Flags para o pré-processador (ex: -I para includes)
CPPFLAGS = -I$(INCLUDE_DIR)

# CFLAGS: Flags específicas para C
CFLAGS = -Wall -Wextra -std=c11

# CXXFLAGS: Flags específicas para C++
CXXFLAGS = -Wall -Wextra -std=c++17

# LDFLAGS (Linker Flags): Bibliotecas a serem linkadas (ex: -lm para matemática)
LDFLAGS = 

# --- Detecção Automática de Arquivos ---
# Encontra todos os arquivos .c e .cpp no diretório SRC_DIR
SRCS_C := $(wildcard $(SRC_DIR)/*.c)
SRCS_CXX := $(wildcard $(SRC_DIR)/*.cpp)

# Gera a lista de arquivos de objeto (.o) correspondentes na pasta OBJ_DIR
OBJS_C := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS_C))
OBJS_CXX := $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS_CXX))

# Lista combinada de todos os arquivos de objeto
OBJS := $(OBJS_C) $(OBJS_CXX)

# --- Regras ---

# Regra 'all' (padrão): Compila o executável principal
all: $(EXECUTABLE)

# Regra para linkar o executável final
# Depende de todos os arquivos de objeto (.o) e do diretório 'bin'
$(EXECUTABLE): $(OBJS) | $(BIN_DIR)
	@echo "Linkando executável..."
	# Usamos CXX (g++) para linkar se houver qualquer C++, 
	# pois ele lida corretamente com a biblioteca padrão do C++
	$(CXX) $(LDFLAGS) -o $@ $^
	@echo "Build concluído: $(EXECUTABLE)"

# Regra de padrão para compilar C++: .cpp -> .o
# Compila um arquivo 'src/%.cpp' para 'obj/%.o'
# Depende do diretório 'obj'
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	@echo "Compilando C++: $<"
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

# Regra de padrão para compilar C: .c -> .o
# Compila um arquivo 'src/%.c' para 'obj/%.o'
# Depende do diretório 'obj'
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@echo "Compilando C: $<"
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# Regras para criar os diretórios, se não existirem
# O '|' indica que são pré-requisitos de "ordem apenas"
$(BIN_DIR):
	@mkdir -p $@

$(OBJ_DIR):
	@mkdir -p $@

# --- Regras "Phony" (Falsas) ---
# .PHONY declara que estas regras não produzem arquivos com esses nomes

# Regra 'run': Executa o programa
# Depende de 'all' para garantir que o programa esteja compilado
run: all
	@echo "Executando $(EXECUTABLE)..."
	@./$(EXECUTABLE)

# Regra 'clean': Limpa os arquivos gerados (objetos e executável)
clean:
	@echo "Limpando diretórios..."
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Declara as regras que não geram arquivos
.PHONY: all clean run
