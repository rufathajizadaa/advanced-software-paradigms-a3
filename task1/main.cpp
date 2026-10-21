#include <chrono>
#include <iostream>

constexpr int ARRAY_SIZE = 100000;
constexpr int CALL_COUNT = 200000;

//this value makes sure the compiler will not discard the array operations
volatile int result = 0;

void useStaticArray() {
    static int numbers[ARRAY_SIZE];

    numbers[0] = 1;
    numbers[ARRAY_SIZE - 1] = 2;
    result += numbers[0] + numbers[ARRAY_SIZE - 1];
}

void useStackArray() {
    int numbers[ARRAY_SIZE];

    numbers[0] = 1;
    numbers[ARRAY_SIZE - 1] = 2;
    result += numbers[0] + numbers[ARRAY_SIZE - 1];
}

void useHeapArray() {
    int* numbers = new int[ARRAY_SIZE];

    numbers[0] = 1;
    numbers[ARRAY_SIZE - 1] = 2;
    result += numbers[0] + numbers[ARRAY_SIZE - 1];

    delete[] numbers;
}

double measureTime(void (*function)()) {
    auto start = std::chrono::steady_clock::now();

    for (int i = 0; i < CALL_COUNT; ++i) {
        function();
    }

    auto end = std::chrono::steady_clock::now();
    return std::chrono::duration<double, std::milli>(end - start).count();
}

int main() {
    std::cout << "Array size: " << ARRAY_SIZE << " integers\n";
    std::cout << "Calls per function: " << CALL_COUNT << "\n\n";

    std::cout << "Static array time: " << measureTime(useStaticArray) << " ms\n";
    std::cout << "Stack array time:  " << measureTime(useStackArray) << " ms\n";
    std::cout << "Heap array time:   " << measureTime(useHeapArray) << " ms\n";

    return 0;
}
