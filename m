Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3C40438F
	for <lists+samba-technical@lfdr.de>; Thu,  9 Sep 2021 04:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Pc3862BjYgZlSqU5uVUKQdS8Wow53UYZaa5jj1uaMhs=; b=mP1s7mODw28XxplYvfyginslkX
	yxnARqSL30Hnr3SGPKpe2vOudbG+GWYddqsGyHbPIYcsch5k9SmeMJJvVgKrds9Oh43AgkUk/2jfL
	pLFf8a51DIPEkks/GiQ7jcrNN/96IFBPCgV55RWf+pcMmpZpto0MYjLbU/slHVyQ2dH0wMEJgP2zl
	bsAtmynbwb8zFlhRaudYSQ5GxQURg0quiSXKR7v7KPvGQ8xgzKq3Xq3tuDD4cat175iqbouWK376S
	0C6OYjov+ZXzSc14I3sC3cyX/5v2wH6WCuMyhLt4+NJwd37J4V+ZsbWg71nqGqVxhQhIAZgIz7yAB
	M+U+tqCQ==;
Received: from ip6-localhost ([::1]:55002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mO9l9-00Dx5u-7E; Thu, 09 Sep 2021 02:25:51 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:41365) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mO9l3-00Dx5l-KN
 for samba-technical@lists.samba.org; Thu, 09 Sep 2021 02:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1631154320;
 bh=Pc3862BjYgZlSqU5uVUKQdS8Wow53UYZaa5jj1uaMhs=;
 h=Date:From:To:Subject:From;
 b=F8zmHcSmWdMC+/HpHtuwh6vB56m3wzviV3sXHV+LtJ2yNm1IAx4tIfUyYCDkpJcr6
 aGEWNaUhutJJ3aztn+o00RZ6H88t7K69DYID3ShiSLpMwtPYzy9oExHG7s9R3m+tG9
 gAL6MAFPppRKD1E8G6qjRBHuD6wNTGducmmrFgOQz7rTjCozsWNL2tWnosoefyfIwW
 k4HOX7CuYo/z4nQQljqxKvdykxXgNvZiDZXukjyCizAE11/KcKTJAY5eWYM6soFpCN
 WRZCF9Yuyc28a21A4EzMQLgSdu/t73/UPQUB44oPKgzwsUIijOceYSxNOx7ICKktnL
 771+wQevNIejg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H4jXJ369jz9sRN;
 Thu,  9 Sep 2021 12:25:20 +1000 (AEST)
Date: Thu, 9 Sep 2021 12:25:17 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Is Samba's compile_commands.json useful?
Message-ID: <20210909122517.5bc193cb@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'm getting into the 21st century and attempting to use Emacs with LSP,
in particular with clangd.

If I use Samba's automatically generated (via
./configure [...] && make -j) compile_commands.json then clangd
generates way too many errors, apparently because it can't find any
include files. compile_commands.json contains very few details. For
example, here's what it has for replace.c:

  {
    "arguments": [
      "/usr/bin/gcc",
      "-D_SAMBA_BUILD_=4",
      "-DHAVE_CONFIG_H=1",
      "-MMD",
      "-D_GNU_SOURCE=1",
      "-D_XOPEN_SOURCE_EXTENDED=1",
      "-DHAVE_CONFIG_H=1",
      "../../lib/replace/replace.c",
      "-c",
      "-o/home/martins/samba/samba/bin/default/lib/replace/replace.c.2.o"
    ],
    "directory": "/home/martins/samba/samba/bin/default",
    "file": "../../lib/replace/replace.c"
  },

If I generate my own compile_commands.json via something like:

  ./configure [...] && bear -- make -j

then this file contains all of the options for compiling each file,
including -D, -I and -W options, which is what I expect.  This works
well with clangd.

Here's the snippet for replace.c:

  {
    "arguments": [
      "/usr/bin/x86_64-linux-gnu-gcc-10",
      "-D_SAMBA_BUILD_=4",
      "-DHAVE_CONFIG_H=1",
      "-D_GNU_SOURCE=1",
      "-D_XOPEN_SOURCE_EXTENDED=1",
      "-DHAVE_CONFIG_H=1",
      "-D_SAMBA_HOSTCC_",
      "-DDEVELOPER",
      "-DDEBUG_PASSWORD",
      "-fPIC",
      "-D__STDC_WANT_LIB_EXT1__=1",
      "-D_REENTRANT",
      "-DDEVELOPER",
      "-DDEBUG_PASSWORD",
      "-DCTDB_HELPER_BINDIR=\"/usr/local/samba/libexec/ctdb\"",
      "-DLOGDIR=\"/usr/local/samba/var/log\"",
      "-DCTDB_DATADIR=\"/usr/local/samba/share/ctdb\"",
      "-DCTDB_ETCDIR=\"/usr/local/samba/etc/ctdb\"",
      "-DCTDB_VARDIR=\"/usr/local/samba/var/lib/ctdb\"",
      "-DCTDB_RUNDIR=\"/usr/local/samba/var/run/ctdb\"",
      "-fstack-protector-strong",
      "-fstack-clash-protection",
      "-g",
      "-Wall",
      "-Wshadow",
      "-Wmissing-prototypes",
      "-Wmissing-field-initializers",
      "-Wformat-overflow=2",
      "-Wcast-align",
      "-Wcast-qual",
      "-fno-common",
      "-Werror=address",
      "-Werror=strict-prototypes",
      "-Wstrict-prototypes",
      "-Werror=write-strings",
      "-Wwrite-strings",
      "-Werror-implicit-function-declaration",
      "-Werror=pointer-arith",
      "-Wpointer-arith",
      "-Werror=declaration-after-statement",
      "-Wdeclaration-after-statement",
      "-Werror=return-type",
      "-Wreturn-type",
      "-Werror=uninitialized",
      "-Wuninitialized",
      "-Wimplicit-fallthrough",
      "-Werror=strict-overflow",
      "-Wstrict-overflow=2",
      "-Wformat=2",
      "-Wno-format-y2k",
      "-Wno-format-zero-length",
      "-Werror=format-security",
      "-Wformat-security",
      "-Werror=format",
      "-Werror",
      "-Wno-error=deprecated-declarations",
      "-Wno-error=tautological-compare",
      "-Wno-error=cast-align",
      "-Wno-error=discarded-qualifiers",
      "-Wno-error=cast-qual",
      "-Wno-error=missing-field-initializers",
      "-Wno-error=shadow",
      "-Wno-error=implicit-fallthrough",
      "-Wno-error=enum-compare",
      "-Wno-error=unused-but-set-variable",
      "-Wno-error=unused-const-variable",
      "-Wno-error=unused-variable",
      "-Wno-error=unused-result",
      "-DSTATIC_ROKEN_HOSTCC_MODULES=NULL",
      "-DSTATIC_ROKEN_HOSTCC_MODULES_PROTO=extern void __ROKEN_HOSTCC_dummy_module_proto(void)",
      "-Isource4/heimdal_build",
      "-I../../source4/heimdal_build",
      "-Isource4/heimdal/lib/roken",
      "-I../../source4/heimdal/lib/roken",
      "-Isource4/heimdal/include",
      "-I../../source4/heimdal/include",
      "-Isource4/heimdal_build/include",
      "-I../../source4/heimdal_build/include",
      "-Iinclude/public",
      "-I../../include/public",
      "-Isource4",
      "-I../../source4",
      "-Ilib",
      "-I../../lib",
      "-Isource4/lib",
      "-I../../source4/lib",
      "-Isource4/include",
      "-I../../source4/include",
      "-Iinclude",
      "-I../../include",
      "-Ilib/replace",
      "-I../../lib/replace",
      "-Ictdb/include",
      "-I../../ctdb/include",
      "-Ictdb",
      "-I../../ctdb",
      "-I.",
      "-I../..",
      "../../source4/heimdal_build/replace.c",
      "-c",
      "-o/home/martins/samba/samba/bin/default/source4/heimdal_build/replace.c.3.o"
    ],
    "directory": "/home/martins/samba/samba/bin/default",
    "file": "/home/martins/samba/samba/bin/default/../../source4/heimdal_build/replace.c",
    "output": "/home/martins/samba/samba/bin/default/../../source4/heimdal_build/replace.o"
  },


I'm trying to understand how the automatically generated
compile_commands.json can be useful without all of these options.

What am I missing?

Thanks...

peace & happiness,
martin

