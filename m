Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 627DB592EB
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 06:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ea18A2hcX5gNoacVWROj9Csg+ni+lIn3cXaiY50FCyc=; b=GPUEAGlW2ACSedVL/A2aB42uFs
	5OMLeslhtb7LMK6aY6gneZQOMhD/V3qH/9THQok9khxr/BOhC7HeODouIct/bfZ2hyB43SpDSceKy
	5zLYMuI23VFBEtM7XHuls4zvvpS3Uljo8hQtEnkQd3lOQRhvyPPDBMLmtAEL73StfHE7BPb3Xj/pS
	s4kwMW6aKhc0weIXjv/USeCRqoOzq2PA9ycnclHynGiWDLjj7iKxAsceh8VpzQtOhYOmo4XQn1eZ9
	CvEnJrEYw4BLOEqNLIpvEDlmyc6dfs+tKD1Fu6LsRk1A2abKF77CUA+s9Lqby8zFeoq+3DQ3YTdh3
	8ie6vdew==;
Received: from localhost ([::1]:58748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgiWR-002GCE-As; Fri, 28 Jun 2019 04:30:03 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:39381 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgiWM-002GC3-V1
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 04:30:01 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45ZkM212Rkz9s3Z;
 Fri, 28 Jun 2019 14:29:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1561696190; bh=v9gdDzxzOyGZKsF49FxNUTiKncwl3bncQoQJwiTx07o=;
 h=Date:From:To:Subject:From;
 b=a1XKgb42Kf6KvbCAyCScVtSzeijU7PS+BldjmVbGhtsKDSBpWwPne7uubwrrEHR+J
 oTVki+d/9zeY8N2uIsBFYAaYYG0hJpZmVCu8JhJy8+6SEKhOlVHh5cx2M3eWLeQp38
 5ZoyODx9I97Xb3fg8XanbdDSm6bNyWBFZfyn1LXTUzr98faeZRntLxbG5Adh9hZSEv
 TotLNJ9Ww78yKpDhj4C/9bRbt24Syg2KV2W2QXzLrUw21jS+ibLiZOKavgzDzbiJvu
 tuli0ZGT4hO9njOQ7tDYwJiaDzLE8kVJ5PlkDTbDbgkDgRmXmhvVel5CAKaz8Knodt
 MErAiS/lUZP6g==
Date: Fri, 28 Jun 2019 14:29:46 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Compiling Samba with system Heimdal?
Message-ID: <20190628142946.7537edfd@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

I'm trying to build Samba with system Heimdal on Debian testing...

$ CFLAGS="-O3" ./configure --picky-developer --abi-check-disable \
    --without-ad-dc  --without-json \
    --with-system-heimdalkrb5
...
'configure' finished successfully (1m1.668s)

$ make
[184/187] Compiling source4/heimdal_build/version.c
[185/187] Compiling source4/heimdal/lib/vers/print_version.c
In file included from ../../source4/heimdal_build/roken.h:156,
                 from ../../source4/heimdal/lib/vers/print_version.c:39:
../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error: roken-common.h: No such file or directory
 #include <roken-common.h>
          ^~~~~~~~~~~~~~~~
compilation terminated.

Waf: Leaving directory `/home/martins/samba/samba/bin/default'
Build failed
 -> task in 'HEIMDAL_VERS_HOSTCC' failed with exit status 1 (run with -v to display more information)
make: *** [Makefile:7: all] Error 1

$ ls /usr/include/heimdal/roken-common.h 
/usr/include/heimdal/roken-common.h

$ make V=1
PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf build
Waf: Entering directory `/home/martins/samba/samba/bin/default'
	Selected system Heimdal build
[185/187] Compiling source4/heimdal/lib/vers/print_version.c
14:25:25 runner ['/home/martins/bin/gcc', '-D_SAMBA_BUILD_=4', '-DHAVE_CONFIG_H=1', '-O3', '-MMD', '-D_GNU_SOURCE=1', '-D_XOPEN_SOURCE_EXTENDED=1', '-DHAVE_CONFIG_H=1', '-DDEVELOPER', '-DDEBUG_PASSWORD', '-fPIC', '-D__STDC_WANT_LIB_EXT1__=1', '-D_REENTRANT', '-D_POSIX_PTHREAD_SEMANTICS', '-DDEVELOPER', '-DDEBUG_PASSWORD', '-fstack-protector-strong', '-fstack-clash-protection', '-g', '-Wall', '-Wshadow', '-Wmissing-prototypes', '-Wmissing-field-initializers', '-Wformat-overflow=2', '-Wcast-align', '-Wcast-qual', '-fno-common', '-Werror=address', '-Werror=strict-prototypes', '-Wstrict-prototypes', '-Werror=write-strings', '-Wwrite-strings', '-Werror-implicit-function-declaration', '-Werror=pointer-arith', '-Wpointer-arith', '-Werror=declaration-after-statement', '-Wdeclaration-after-statement', '-Werror=return-type', '-Wreturn-type', '-Werror=uninitialized', '-Wuninitialized', '-Wimplicit-fallthrough', '-Werror=strict-overflow', '-Wstrict-overflow=2', '-Wformat=2', '-Wno-format-y2k', '
 -Wno-format-zero-length', '-Werror=format-security', '-Wformat-security', '-Werror=format', '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES=NULL', '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES_PROTO=extern void __HEIMDAL_VERS_HOSTCC_dummy_module_proto(void)', '-Isource4/heimdal_build', '-I../../source4/heimdal_build', '-Iinclude/public', '-I../../include/public', '-Isource4', '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib', '-I../../source4/lib', '-Isource4/include', '-I../../source4/include', '-Iinclude', '-I../../include', '-Ilib/replace', '-I../../lib/replace', '-I.', '-I../..', '../../source4/heimdal/lib/vers/print_version.c', '-c', '-o/home/martins/samba/samba/bin/default/source4/heimdal/lib/vers/print_version.c.1.o']
In file included from ../../source4/heimdal_build/roken.h:156,
                 from ../../source4/heimdal/lib/vers/print_version.c:39:
../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error: roken-common.h: No such file or directory
 #include <roken-common.h>
          ^~~~~~~~~~~~~~~~
compilation terminated.

I don't see -I/usr/include/heimdal in there anywhere.  :-(

Can someone please tell me what I'm doing wrong?

Thanks...

peace & happiness,
martin

