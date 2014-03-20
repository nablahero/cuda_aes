TARGET = aes

NVCC = /usr/local/cuda/bin/nvcc -arch=sm_20
CUDA_FLAGS = -I ./h -I /usr/local/cuda/include -I /usr/local/cuda_sdk/C/common/inc
CUDA_LIBS = -L /usr/local/cuda_sdk/C/lib -lcutil_x86_64

SRCDIR = /home-ares/gpu-class/walben/
CUDA_SOURCES = aes_wrapper.cu
C_SOURCES =

CUDA_OBJECTS = aes_wrapper.o
C_OBJECTS = 

all: $(TARGET)

$(TARGET): $(CUDA_OBJECTS) $(C_OBJECTS)
		   $(NVCC) -o $(TARGET) $(CUDA_FLAGS) $(CUDA_LIBS) $(CUDA_OBJECTS) $(C_OBJECTS)
		   rm -f *.o *.bak 

%.o: %.cu
	 $(NVCC) -c $(CUDA_FLAGS) $(SRCDIR)$*.cu

%.o: %.cpp
	 $(NVCC) -c $(CUDA_FLAGS) $(SRCDIR)$*.cpp


clean:
	rm -f *.o *.bak *~ *.out
	rm -f $(TARGET)