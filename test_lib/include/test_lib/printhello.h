#ifndef _printhelloH_
#define _printhelloH_

#include <windows.h>

//#if defined(TESTLIB_SHARED)
#  if defined(TESTLIB_EXPORT)
#    define TESTLIB_API __declspec(dllexport)
#  else
#    define TESTLIB_API __declspec(dllimport)
#  endif
//#else
//#  define TESTLIB_API
//#endif

extern "C" {

// stdcall type function (typical windows API, no leading underscore)
int WINAPI TESTLIB_API printhello(const char* name);

// cdecl type function (leading underscore)
int __cdecl TESTLIB_API printname(const char* name);


} // extern "C"

#endif // _printhelloH_
