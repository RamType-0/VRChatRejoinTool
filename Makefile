CSC		= /cygdrive/c/windows/microsoft.net/framework/v4.0.30319/csc.exe
TARGET	= VRChatRejoin.exe
SRC		= \
	main.cs \

DEPS	=

CSC_FLAGS		= /nologo /target:winexe
DEBUG_FLAGS		= 
RELEASE_FLAGS	= 

.PHONY: debug
debug: CSC_FLAGS+=$(DEBUG_FLAGS)
debug: all

.PHONY: release
release: CSC_FLAGS+=$(RELEASE_FLAGS)
release: all

.PHONY: genzip
genzip: VRChatRejoin.zip
	zip -r VRChatRejoinTool.zip VRChatRejoinTool

all: $(TARGET)
$(TARGET): $(SRC) $(DEPS)
	$(CSC) $(CSC_FLAGS) /out:$(TARGET) $(SRC) | iconv -f cp932 -t utf-8

.PHONY: clean
clean:
	rm $(TARGET)

