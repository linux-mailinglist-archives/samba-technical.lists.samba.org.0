Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1A592EF
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 06:36:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=IjbulhKrgOS7aSHf3ECXRXkIpK5qEuBcE/b+1Wxl+P4=; b=4UzUYi9CmzgKg/5Mder6MNvGDC
	vblHCaGxkW0OlFtSywhxqAh69UUXFjQgRJx8fwMn12I0g/y50hgr7VlvSTu+pALMRIbKPKs31dN29
	c8lWtv5xY1t1BiLyAMMEsyrxGoFy2R5PpJREta4esUBSLyVIIL3YuzomU0LhlxxjTLafaUPK5hGHO
	mbuBQ+IzTslMVxjmUNFWCu4Rpsjba2OnpJ97QT0J5bja9jXvcSNdkWd5swDwu6kyK2u7lhLvBNfhS
	5rqyqP1MVwKCC3OQbmNtqjUXywmX7jifvvbNV3zSpxoRDFT8fPD07aO5WZnQa1cNqcTlKZ0KrA/69
	yMA6rKYw==;
Received: from localhost ([::1]:59604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgicV-002GKC-NA; Fri, 28 Jun 2019 04:36:19 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:58655 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgicS-002GK5-3Y
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 04:36:18 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45ZkVL17zFz9s8m;
 Fri, 28 Jun 2019 14:36:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1561696570; bh=YaaUNNcInH2h2T4zZHpRGTkCutQOjFUFrYGCNcM8oHk=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=VK0KJTk7wZAfdNZDhSr52R18S+iVCtGqRGBmOJW4IduU9sfho7aEI6azIRXDbmGtr
 qrIqMQSAT7plgsXS1gLwuhOEc3TTgZhiy28Y2obAL6V4B5eK4ZSCFP/n/iagae34x4
 bqiHo6lQZKl44ZWSdboaVEZxM2Xz8aliKsADw51pzG+tw34h1L+ZoSlQeaoQdIOkdH
 AZ6YFDieMgKDsouvapfb1+Upa3IBZG7CDEB7mIUrqEPMeZparpl+lOSqpce3tSXch7
 XikpbFZ42gnuuPIy7kh1fzfGCR0K5c7bqiU7AMJl7epv8RhFThzyDw2werl8g63L5s
 eXw3mAhZOsLZw==
Date: Fri, 28 Jun 2019 14:36:06 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Re: Compiling Samba with system Heimdal?
Message-ID: <20190628143606.4e223af3@martins.ozlabs.org>
In-Reply-To: <20190628142946.7537edfd@martins.ozlabs.org>
References: <20190628142946.7537edfd@martins.ozlabs.org>
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

On Fri, 28 Jun 2019 14:29:46 +1000, Martin Schwenke <martin@meltin.net>
wrote:

> I'm trying to build Samba with system Heimdal on Debian testing...
> 
> $ CFLAGS="-O3" ./configure --picky-developer --abi-check-disable \
>     --without-ad-dc  --without-json \
>     --with-system-heimdalkrb5
> ...
> 'configure' finished successfully (1m1.668s)
> 
> $ make
> [184/187] Compiling source4/heimdal_build/version.c
> [185/187] Compiling source4/heimdal/lib/vers/print_version.c
> In file included from ../../source4/heimdal_build/roken.h:156,
>                  from ../../source4/heimdal/lib/vers/print_version.c:39:
> ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error: roken-common.h: No such file or directory
>  #include <roken-common.h>
>           ^~~~~~~~~~~~~~~~
> compilation terminated.
> 
> Waf: Leaving directory `/home/martins/samba/samba/bin/default'
> Build failed
>  -> task in 'HEIMDAL_VERS_HOSTCC' failed with exit status 1 (run with -v to display more information)
> make: *** [Makefile:7: all] Error 1
> 
> $ ls /usr/include/heimdal/roken-common.h 
> /usr/include/heimdal/roken-common.h
> 
> $ make V=1
> PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf build
> Waf: Entering directory `/home/martins/samba/samba/bin/default'
> 	Selected system Heimdal build
> [185/187] Compiling source4/heimdal/lib/vers/print_version.c
> 14:25:25 runner ['/home/martins/bin/gcc', '-D_SAMBA_BUILD_=4', '-DHAVE_CONFIG_H=1', '-O3', '-MMD', '-D_GNU_SOURCE=1', '-D_XOPEN_SOURCE_EXTENDED=1', '-DHAVE_CONFIG_H=1', '-DDEVELOPER', '-DDEBUG_PASSWORD', '-fPIC', '-D__STDC_WANT_LIB_EXT1__=1', '-D_REENTRANT', '-D_POSIX_PTHREAD_SEMANTICS', '-DDEVELOPER', '-DDEBUG_PASSWORD', '-fstack-protector-strong', '-fstack-clash-protection', '-g', '-Wall', '-Wshadow', '-Wmissing-prototypes', '-Wmissing-field-initializers', '-Wformat-overflow=2', '-Wcast-align', '-Wcast-qual', '-fno-common', '-Werror=address', '-Werror=strict-prototypes', '-Wstrict-prototypes', '-Werror=write-strings', '-Wwrite-strings', '-Werror-implicit-function-declaration', '-Werror=pointer-arith', '-Wpointer-arith', '-Werror=declaration-after-statement', '-Wdeclaration-after-statement', '-Werror=return-type', '-Wreturn-type', '-Werror=uninitialized', '-Wuninitialized', '-Wimplicit-fallthrough', '-Werror=strict-overflow', '-Wstrict-overflow=2', '-Wformat=2', '-Wno-format-y2k',
  '-Wno-format-zero-length', '-Werror=format-security', '-Wformat-security', '-Werror=format', '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES=NULL', '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES_PROTO=extern void __HEIMDAL_VERS_HOSTCC_dummy_module_proto(void)', '-Isource4/heimdal_build', '-I../../source4/heimdal_build', '-Iinclude/public', '-I../../include/public', '-Isource4', '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib', '-I../../source4/lib', '-Isource4/include', '-I../../source4/include', '-Iinclude', '-I../../include', '-Ilib/replace', '-I../../lib/replace', '-I.', '-I../..', '../../source4/heimdal/lib/vers/print_version.c', '-c', '-o/home/martins/samba/samba/bin/default/source4/heimdal/lib/vers/print_version.c.1.o']
> In file included from ../../source4/heimdal_build/roken.h:156,
>                  from ../../source4/heimdal/lib/vers/print_version.c:39:
> ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error: roken-common.h: No such file or directory
>  #include <roken-common.h>
>           ^~~~~~~~~~~~~~~~
> compilation terminated.
> 
> I don't see -I/usr/include/heimdal in there anywhere.  :-(
> 
> Can someone please tell me what I'm doing wrong?

Note that I asked the same question almost exactly 6 months ago and got
no answer...  :-(

peace & happiness,
martin

