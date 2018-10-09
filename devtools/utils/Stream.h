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

#ifndef POLAR_DEVLTOOLS_UTILS_STREAM_H
#define POLAR_DEVLTOOLS_UTILS_STREAM_H

#include <iosfwd>

namespace polar {

/// This returns a reference to a raw_ostream for standard output. Use it like:
/// out_stream() << "foo" << "bar";
std::ostream &out_stream();

/// This returns a reference to a raw_ostream for standard error. Use it like:
/// error_stream() << "foo" << "bar";
std::ostream &error_stream();

} // polar

#endif // POLAR_DEVLTOOLS_UTILS_STREAM_H
