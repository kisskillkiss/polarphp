// This source file is part of the polarphp.org open source project
//
// Copyright (c) 2017 - 2018 polarphp software foundation
// Copyright (c) 2017 - 2018 zzu_softboy <zzu_softboy@163.com>
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://polarphp.org/LICENSE.txt for license information
// See http://polarphp.org/CONTRIBUTORS.txt for the list of polarphp project authors
//
// Created by polarboy on 2018/10/09.
//
// Warning: this file generated by polarphp build system, do not modify.

/*===------- llvm/Config/abi-breaking.h - llvm configuration -------*- C -*-===*/
/*                                                                            */
/*                     The POLAR Compiler Infrastructure                       */
/*                                                                            */
/* This file is distributed under the University of Illinois Open Source      */
/* License. See LICENSE.TXT for details.                                      */
/*                                                                            */
/*===----------------------------------------------------------------------===*/

/* This file controls the C++ ABI break introduced in POLAR public header. */

#ifndef POLAR_DEVLTOOLS_UTILS_ABI_BREAKING_CHECKS_H
#define POLAR_DEVLTOOLS_UTILS_ABI_BREAKING_CHECKS_H

/* Define to enable checks that alter the POLAR C++ ABI */
#cmakedefine01 POLAR_ENABLE_ABI_BREAKING_CHECKS

/* Allow selectively disabling link-time mismatch checking so that header-only
   ADT content from POLAR can be used without linking libSupport. */
#if !POLAR_DISABLE_ABI_BREAKING_CHECKS_ENFORCING

// ABI_BREAKING_CHECKS protection: provides link-time failure when clients build
// mismatch with POLAR
#if defined(_MSC_VER)
// Use pragma with MSVC
#define POLAR_XSTR(s) POLAR_STR(s)
#define POLAR_STR(s) #s
#pragma detect_mismatch("POLAR_ENABLE_ABI_BREAKING_CHECKS", POLAR_XSTR(POLAR_ENABLE_ABI_BREAKING_CHECKS))
#undef POLAR_XSTR
#undef POLAR_STR
#elif defined(_WIN32) || defined(__CYGWIN__) // Win32 w/o #pragma detect_mismatch
// FIXME: Implement checks without weak.
#elif defined(__cplusplus)
namespace polar {
#if POLAR_ENABLE_ABI_BREAKING_CHECKS
extern int EnableABIBreakingChecks;
__attribute__((weak, visibility ("hidden"))) int *VerifyEnableABIBreakingChecks = &EnableABIBreakingChecks;
#else
extern int DisableABIBreakingChecks;
__attribute__((weak, visibility ("hidden"))) int *VerifyDisableABIBreakingChecks = &DisableABIBreakingChecks;
#endif
}
#endif // _MSC_VER

#endif // POLAR_DISABLE_ABI_BREAKING_CHECKS_ENFORCING

#endif // POLAR_DEVLTOOLS_UTILS_ABI_BREAKING_CHECKS_H
