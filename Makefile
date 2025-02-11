EXEC_NAME = fizzbuzz


SRC_DIR := ./src
SRC_FILES := $(shell find $(SRC_DIR) -name '*.cpp' -or -name '*.c')

BUILD_DIR := ./build
# FROM MY UNDERSTANDING:
# Takes the source files (ex: ./src/main.cpp)
# Finds the './' portion
# Replaces the './' portion and replaces it with "$(BUILD_DIR)/<rest of file name>.o"
OBJ_FILES = $(SRC_FILES:./=$(BUILD_DIR)/%.o)


DEPS := $(shell pkg-config $(shell pkg-config --list-package-names | grep -o -P sdl.+) --libs --cflags)


ASS_DIR := $(SRC_DIR:%=%/assets)



$(EXEC_NAME): $(OBJ_FILES)
	-rm -rf assets/
	-cp -r $(ASS_DIR) .
	$(CXX) $(OBJ_FILES) $(DEPS) -o $@

$(BUILD_DIR)/%.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(SRC_FILES) $(DEPS) -c



.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

.PHONY: debug
debug:


