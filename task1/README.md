# Task 1: Static, Stack and Heap Arrays

## About the task

In this task I compared three ways of creating a large array in C++. One array is static, one is on the stack, and one is on the heap. All three arrays have the same size of 100,000 integers. I called every function 200,000 times, which is more than the required 100,000 times.

```cpp
constexpr int ARRAY_SIZE = 100000;
constexpr int CALL_COUNT = 200000;
```

The static function uses this array:

```cpp
static int numbers[ARRAY_SIZE];
```

The static array is created once and stays in memory until the program ends. Every next call uses the same array again.

The stack function uses a normal local array:

```cpp
int numbers[ARRAY_SIZE];
```

This array exists while the function is running. Its stack space is handled automatically when the function ends.

The heap function creates the array with `new[]`:

```cpp
int* numbers = new int[ARRAY_SIZE];
```

At the end of the function I release it with:

```cpp
delete[] numbers;
```

This is needed because heap memory is not removed automatically after the function ends. Without `delete[]`, calling the function 200,000 times would create a large memory leak.

In each function I set only the first and last values:

```cpp
numbers[0] = 1;
numbers[ARRAY_SIZE - 1] = 2;
result += numbers[0] + numbers[ARRAY_SIZE - 1];
```

I did not fill the whole array because then most of the measured time would be for writing 100,000 values instead of comparing the memory types. The global `result` is `volatile`, so the compiler does not ignore the array operations as unused code.

The program uses `std::chrono::steady_clock` to record the time before and after calling each function 200,000 times. The result is printed in milliseconds.

## Running and result

I compiled and ran the code with:

```text
g++ main.cpp
./a.out
```

This was my output:

```text
hacizadarufat@KapMac334-M task1 % g++ main.cpp
hacizadarufat@KapMac334-M task1 % ./a.out
Array size: 100000 integers
Calls per function: 200000

Static array time: 0.537292 ms
Stack array time:  0.742125 ms
Heap array time:   5.59237 ms
```

## Explanation

The static array was the fastest. It is allocated only once, so the same memory is reused on every call. The stack array was a little slower, but still very fast. Its stack space is managed for every function call and removed automatically when the function ends. The heap array was the slowest because every call uses `new[]` to allocate memory and `delete[]` to release it. This gives more work to the memory manager.

The result from fastest to slowest was:

```text
static array < stack array < heap array
```

The heap is useful when the array size is decided while the program is running or when the data must live longer than one function call. However, heap allocation takes more time and the memory must be released correctly.