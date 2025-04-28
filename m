Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A36A9E8EB
	for <lists+samba-technical@lfdr.de>; Mon, 28 Apr 2025 09:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=SlWjW2ODDAy0x6dMoBWRg1N1yRcAOd58zc1LUhffu4U=; b=33ZwO9WqXo73IPoLVsPNjZ+Joq
	O3R6NQ8myDG6P+0jWiBcd8DRvVB3YIbJpc91BYP2U050DQP6YZYl/1OTaIFRc10eqU+YEkvIX29rx
	CxVwkR3dokjtsjLeeg+wPQ5McrcjArVzkIrpISowtpPMXNggvf9GIb6FRIRHTxR8EwDc0/LMtwnpS
	hBqVI2LIBemq9ZYQHi8lsZvTq/ZDZgqQ9KGQ7NYvYwpmrH/Qe9k1+vXDoYftnG+KUA6fM2m3O0428
	9fpK9r+EO/CWVVuMSk2b7RkmwIHOhP9VfMocOr6GIhsY+X51swAVZ8KImdKffwxgUk8GA2xX9vDqv
	MESnXT1g==;
Received: from ip6-localhost ([::1]:35022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u9IeH-000ulc-Uj; Mon, 28 Apr 2025 07:11:30 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:54404) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u9IeC-000ulV-IH
 for samba-technical@lists.samba.org; Mon, 28 Apr 2025 07:11:27 +0000
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e7297c3ce7aso3181196276.0
 for <samba-technical@lists.samba.org>; Mon, 28 Apr 2025 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745824282; x=1746429082; darn=lists.samba.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SlWjW2ODDAy0x6dMoBWRg1N1yRcAOd58zc1LUhffu4U=;
 b=c6pN/EAYFYT2I6whtQvXeUJIql9tBsFd8l6HRODDTYB49MeO1HiRqfyDxVwWLnl6xs
 M0D8bboZ89EksHy8muN8H7vBYfS1PJF60bwbGmBfy8VuwJ4uutPfwj87CveSXG6o8jG4
 51ZGIP9zqPn03neMp5R8LVcTPCKZqcrmQG3KDa/FMnGiycLCRwgpun3AvSY0vdghe6HJ
 HOc3gPewNzvKPoz4ZhKLmOddeMGRV43EyE+Xep/SG6vI6FdCnS2QoRPkQ48BHNxnWB07
 NS5WDKS3BLjQntxNd+P6nWCogwPfRYvpUDYUxIuG9B6hUI0ScllwQZ0aSGq+eySGxwu0
 r44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745824282; x=1746429082;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SlWjW2ODDAy0x6dMoBWRg1N1yRcAOd58zc1LUhffu4U=;
 b=ulqzoxyzGFPrUa/AYyglfwA3xrnv9iAwGXIREqT+yeMvswwvcbZV1BRejLXPynvgqC
 sxsrrF2Kkf08rlmOc6Sl02GpNv52i11+TQliYe5Lt2F1OyDD8+qkn3nkHUragTp8mvaa
 HKq9G87datmt/Imwj4o+JBTJRWEbDd7z7IRLbmhOYBu1r8GYT8pzEdg1ebwPOejN4hU9
 x6lY8xcS+l4yUhwYxFStFIz7pbtcvLNUFIF8HWK+QcW8SBvRg6dr33JR9xCUNawNgIjF
 CtkEYGoZS5HyQYGRyEreSvH4m62tHmpAFwEIgeZtGrKkRdYBioqGj/BmxizqgbcR5LpC
 5PzA==
X-Gm-Message-State: AOJu0YwINJTue0KTU9976NbkPe0y6iE2yz8Rd7I+huxchhruz0gRe4oc
 6JYGaybOyD/O7/IBIjk2sMeYXLGY9Bq6E9HjLZZ1HPI2TQ3bI4WO10KugEEtUSZWEIS0e1ZokBi
 tKSG/qh0fCMrLY0PsHObtPFCSOKdlDg==
X-Gm-Gg: ASbGncthbOIUZoAOZ7vmLYEgAOdvfhUaXt7RcQ6GEj55WvbH3x1J0PDI1tIb3GGI5Bm
 Lc7X5cFyll4AEBOrS2PINqM683ohxdr7rzxPLwvEEb91ZHT1BX2burk+FP7IEaUpWDzcYya67D+
 Vcw/EPdJzVJKtiqf5TpFE9O6vTdjDiO+n9OWh7hkPakX/1BN35PJFNlw==
X-Google-Smtp-Source: AGHT+IEAF75xTEnUt+4O1AHoQn8bRqF/gFpornmsmzeBo7cGrK83Wi4bobR1JfQWG7XXoDApVj6vUYHfHNTMI8TF0z8=
X-Received: by 2002:a05:6902:3402:b0:e73:63c:3107 with SMTP id
 3f1490d57ef6-e732344cb81mr9883569276.33.1745824282277; Mon, 28 Apr 2025
 00:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAGiEHCuVgXa4p5u0Z7rXu_nY7XZ-z_K+R7uweYF+ejjUe-p_HQ@mail.gmail.com>
In-Reply-To: <CAGiEHCuVgXa4p5u0Z7rXu_nY7XZ-z_K+R7uweYF+ejjUe-p_HQ@mail.gmail.com>
Date: Mon, 28 Apr 2025 09:11:10 +0200
X-Gm-Features: ATxdqUEywPDYq5HwXGIgqYg2A_jNRRSlGhs8zergaY2qEHl4NDCAnMs2envTVqE
Message-ID: <CAGiEHCtXnFtPM7OQjz1vPP7LSth4F1-1SG5LAmUje=jodiO5_A@mail.gmail.com>
Subject: Fwd: tallocStatic: ld: attempted static link of dynamic object
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Milan Hauth via samba-technical <samba-technical@lists.samba.org>
Reply-To: Milan Hauth <milahu@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

building a static talloc 2.4.3 fails with waf 2.1.5

```
$ nix-build '<nixpkgs>' -A pkgsStatic.talloc
...
       > Checking simple C program                : not found
       > The configuration failed
       > (complete log in /build/talloc-2.4.3/bin/config.log)
```

configurePhase runs

```
buildtools/bin/waf
--prefix=/tmp/nixbd/lf0wk88bkh3zw9f0ggv0ks26zkw0l51k-talloc-static-x86_64-unknown-linux-musl-2.4.3
--enable-talloc-compat1 --bundled-libraries=NONE
--builtin-libraries=replace --cross-compile
--cross-execute=/nix/store/al8bd0vx45iv2qb6ndxgik7cfl6dy0xf-exec/bin/exec
configure
```

config.log

```
$ cat /tmp/tmp.237HjvYNQ7/talloc-2.4.3/bin/config.log
...
Checking simple C program
==>
#define SRCDIR "/tmp/tmp.237HjvYNQ7/talloc-2.4.3"
#define HAVE_SYS_UTSNAME_H 1
/* #undef SYSTEM_UNAME_SYSNAME */
/* #undef SYSTEM_UNAME_MACHINE */
/* #undef SYSTEM_UNAME_RELEASE */
/* #undef SYSTEM_UNAME_VERSION */
#define HAVE_STDIO_H 1
#include <stdio.h>
 int main(void) { printf("hello world"); return 0; }
<==
[1/2] Compiling bin/.conf_check_f842c8fd62dc26d84809f47fc0f40da7/test.c
['x86_64-unknown-linux-musl-gcc', '-MMD',
'-I/tmp/tmp.237HjvYNQ7/talloc-2.4.3/buildtools/wafsamba', '-I.',
'-I../..', '-I.', '-I../..', '../../test.c', '-c',
'-o/tmp/tmp.237HjvYNQ7/talloc-2.4.3/bin/.conf_check_f842c8fd62dc26d84809f47fc0f40da7/testbuild/default/test.c.1.o']
[2/2] Linking bin/.conf_check_f842c8fd62dc26d84809f47fc0f40da7/testbuild/default/testprog
['x86_64-unknown-linux-musl-gcc', 'test.c.1.o',
'-o/tmp/tmp.237HjvYNQ7/talloc-2.4.3/bin/.conf_check_f842c8fd62dc26d84809f47fc0f40da7/testbuild/default/testprog',
'-Wl,-Bstatic', '-Wl,-Bdynamic']
err: /nix/store/d57vggzgdwhq8xpll7sxa8561rpkc6an-x86_64-unknown-linux-musl-binutils-2.44/bin/x86_64-unknown-linux-musl-ld:
attempted static link of dynamic object
`/nix/store/y75kpl0ypw5gpd98apzdcxizn1gs3pjk-musl-static-x86_64-unknown-linux-musl-1.2.5/lib/libc.so'
collect2: error: ld returned 1 exit status
```

gcc

```
mkdir -p bin/.conf_check_f842c8fd62dc26d84809f47fc0f40da7/testbuild/default
cat >bin/.conf_check_f842c8fd62dc26d84809f47fc0f40da7/test.c <<EOF
#define SRCDIR "$NIX_BUILD_TOP/$sourceRoot"
#define HAVE_SYS_UTSNAME_H 1
/* #undef SYSTEM_UNAME_SYSNAME */
/* #undef SYSTEM_UNAME_MACHINE */
/* #undef SYSTEM_UNAME_RELEASE */
/* #undef SYSTEM_UNAME_VERSION */
#define HAVE_STDIO_H 1
#include <stdio.h>
 int main(void) { printf("hello world"); return 0; }
EOF
pushd bin/.conf_check_f842c8fd62dc26d84809f47fc0f40da7/testbuild/default
# compile
x86_64-unknown-linux-musl-gcc -MMD
-I$NIX_BUILD_TOP/$sourceRoot/buildtools/wafsamba -I. -I../.. -I.
-I../.. ../../test.c -c
-o$NIX_BUILD_TOP/$sourceRoot/bin/.conf_check_f842c8fd62dc26d84809f47fc0f40da7/testbuild/default/test.c.1.o
# link
x86_64-unknown-linux-musl-gcc test.c.1.o
-o$NIX_BUILD_TOP/$sourceRoot/bin/.conf_check_f842c8fd62dc26d84809f47fc0f40da7/testbuild/default/testprog
-Wl,-Bstatic -Wl,-Bdynamic
popd
```

problem: the link step has `-Wl,-Bstatic -Wl,-Bdynamic`
it works when i remove `-Wl,-Bdynamic`

see also
https://gitlab.com/ita1024/waf/-/issues/2467

