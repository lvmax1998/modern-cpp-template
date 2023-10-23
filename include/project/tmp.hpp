#ifndef TMP_TMP_H_
#define TMP_TMP_H_

#include "project_export.h"

#define TESTTOOL        (int)TOOL
#define TOOL(X, Y, NUM) TOOL##NUM(X, Y)

#define TOOL1(X, Y) (X + Y)
#define TOOL2(X, Y) (X - Y)

namespace tmp
{
  PROJECT_EXPORT int add(int, int);
  PROJECT_NO_EXPORT void minus(int, int);
}  // namespace tmp

#endif  // TMP_TMP_H_
