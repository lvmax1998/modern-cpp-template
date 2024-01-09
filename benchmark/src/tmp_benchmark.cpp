#include <benchmark/benchmark.h>

#include "project/tmp.hpp"

static void BM_Add(benchmark::State& state)
{
  for (auto _ : state)
  {
    tmp::add(1, 2);
  }
}

BENCHMARK(BM_Add);

BENCHMARK_MAIN();