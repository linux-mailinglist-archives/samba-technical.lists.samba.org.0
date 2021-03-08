Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8A1330A6F
	for <lists+samba-technical@lfdr.de>; Mon,  8 Mar 2021 10:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=KTT8isJ23SZqlrXvHEJ5PvTW6cYGn64XYdV1QAV+9Ts=; b=kAr2/ul+BLQfHYdmsdfE53KLta
	4FHJ5WPk2P1vkoWmque46XUxyqo2Jd2V7y+Y4u7nHyX7al5bu7KTaKE+wg/mPZPNwvUmNmBhtkh7R
	/lDLlYVfH4nCbOI+iBXXWsHmE2gHwmJVeuLPwU/wvj4vr4KFV2BOcvUH9+KQrd7ujaD/6rfXSSbi2
	60y0nFC0ADq9qlkGhEOO9SM/VitiSBKUr3NM77TB0yKdmIBw7Y90HdpThG5ZoNZrfhPJfojJVfQm5
	jMPqYH9Hq5COVWYgPPI2eSazTYM0MN8BmbtzIk/FnUwStwQ1fQICkgUI2KPeV1tI9SQYIs5Y/REGd
	ANt5ZJSA==;
Received: from ip6-localhost ([::1]:28876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJCQL-004TMN-PU; Mon, 08 Mar 2021 09:43:37 +0000
Received: from ozlabs.org ([203.11.71.1]:49627) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJCQF-004TMF-TU
 for samba-technical@lists.samba.org; Mon, 08 Mar 2021 09:43:34 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DvD1228Yzz9sVS;
 Mon,  8 Mar 2021 20:43:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1615196599; bh=MxAeQn8nu4svDE97q/rdXci99wl6pbTYldiu8mQOpGM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nqRY7VUmINuUECfVSGAWeASLYt6NEidUoJM1yRiFK0NXiy9A0kAbMGmSJoiLW2ioe
 wDLL+R1dDCD0KbwGpNLrvjWUAHI4QokidB38QWN1B/HoqHwTZA28sWeixaW2OHsGf5
 STk6NUoU0+6VLCD5P8XhxezmglDawhRSdMoQWbN0NADnkMSBvC3qX6Ou3JJn72K9R8
 MMef4RDBBzg4TD5mi27wrfjy8f81ey1Y6Fqg8898Dwh0X7xKJpRvLKeM40BrZdQvtj
 uhVmVnwQJgMN7FETZRMNzsfAI2y3t35G3N81uo2WOZ/ykKIrJ9CK1H1ZLjGMgBvOUu
 hyiZc4+3g4XxQ==
Date: Mon, 8 Mar 2021 20:43:16 +1100
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Commit 996560191ac6bd603901dcd6c0de5d239e019ef4 causes strange
 regression
Message-ID: <20210308204316.50f1c485@martins.ozlabs.org>
In-Reply-To: <b6478095e3ece98b9cdbf1c7579dc1041d1fe4ee.camel@samba.org>
References: <20210308123939.56c5db74@martins.ozlabs.org>
 <b6478095e3ece98b9cdbf1c7579dc1041d1fe4ee.camel@samba.org>
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
Cc: =?UTF-8?B?QmrDtnJu?= Jacke <bj@sernet.de>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 08 Mar 2021 14:59:14 +1300, Andrew Bartlett
<abartlet@samba.org> wrote:

> On Mon, 2021-03-08 at 12:39 +1100, Martin Schwenke via samba-technical
> wrote:
> > I want to flag this regression as soon as possible (before I really
> > understand it) because 4.12.12 is due for release on Thursday and
> > this
> > may be the last 4.12.x release, due to the imminent release of
> > 4.14.0.  
> 
> Thanks for looking at this.  Bother.
> 
> Can you see if --as-needed is being detected on your host?  Previously
> it was being used only if we were compiling with GCC, now we test, but
> it is possible the test is wrong.
> 
> In short, can you look into the config.log and such?

Detection looks like it works in config.log.

The option is used when building the binaries I previously mentioned...

[4694/6851] Linking bin/default/ctdb/reqid_test.inst
20:16:55 runner ['/usr/lib64/ccache/gcc', 'ctdb/tests/src/reqid_test.c.181.o', '-o/root/samba-4.15.0pre1-GIT-b145434/bin/default/ctdb/reqid
_test.inst', '-Wl,-rpath,/usr/local/samba/lib', '-Wl,-Bstatic', '-Wl,-Bdynamic', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/repl
ace', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/talloc', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/tevent', '-L/roo
t/samba-4.15.0pre1-GIT-b145434/bin/default/lib/util', '-L/usr/local/lib', '-L/usr/local/lib', '-lsamba-util', '-lgenrand-samba4', '-lsocket
-blocking-samba4', '-lutil-setid-samba4', '-ltevent', '-lsamba-debug-samba4', '-ltime-basic-samba4', '-lsys-rw-samba4', '-ltalloc', '-lrepl
ace-samba4', '-liov-buf-samba4', '-licui18n', '-lgnutls', '-licudata', '-licuuc', '-lsystemd', '-lunwind-generic', '-lunwind', '-lbsd', '-l
dl', '-lpthread', '-pie', '-Wl,-z,relro,-z,now', '-Wl,-no-undefined', '-Wl,--export-dynamic', '-Wl,--as-needed']


[4699/6851] Linking bin/default/ctdb/sock_daemon_test.inst
20:16:56 runner ['/usr/lib64/ccache/gcc', 'lib/async_req/async_sock.c.1.o', 'ctdb/tests/src/sock_daemon_test.c.191.o', 'ctdb/common/system_
socket.c.2.o', 'ctdb/common/system.c.2.o', '-o/root/samba-4.15.0pre1-GIT-b145434/bin/default/ctdb/sock_daemon_test.inst', '-Wl,-rpath,/usr/
local/samba/lib', '-Wl,-rpath,/usr/local/samba/lib/private', '-Wl,-Bstatic', '-Wl,-Bdynamic', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/def
ault/libcli/util', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/talloc', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/rep
lace', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/tdb', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/tevent', '-L/root/
samba-4.15.0pre1-GIT-b145434/bin/default/lib/util', '-L/usr/local/lib', '-L/usr/local/lib', '-lsocket-blocking-samba4', '-ltevent', '-lteve
nt-util', '-lsys-rw-samba4', '-ltdb', '-lreplace-samba4', '-ltalloc', '-lsamba-util', '-liov-buf-samba4', '-lsamba-errors', '-lgenrand-samb
a4', '-lutil-setid-samba4', '-lsamba-debug-samba4', '-ltime-basic-samba4', '-licui18n', '-licudata', '-licuuc', '-lunwind-generic', '-lunwi
nd', '-lgnutls', '-lsystemd', '-lbsd', '-ldl', '-lpthread', '-pie', '-Wl,-z,relro,-z,now', '-Wl,-no-undefined', '-Wl,--export-dynamic', '-W
l,--as-needed']

The curious thing is that the broken (1st) one is missing
-Wl,-rpath,/usr/local/samba/lib/private even though -lsamba-util is
going to want a whole lot of stuff from that directory.

This little program seems unique in that it only has "samba-util" as a
dependency.  If I add a redundant dependency on "replace":

diff --git a/ctdb/wscript b/ctdb/wscript
index b76587ac921..6cc0c687e14 100644
--- a/ctdb/wscript
+++ b/ctdb/wscript
@@ -940,7 +940,7 @@ def build(bld):
 
     bld.SAMBA_BINARY('reqid_test',
                      source='tests/src/reqid_test.c',
-                     deps='samba-util',
+                     deps='samba-util replace',
                      install_path='${CTDB_TEST_LIBEXECDIR}')
 
     bld.SAMBA_BINARY('rb_test',


This works around the problem:

[root@testtbuild1 samba-4.15.0pre1-GIT-b145434]# ldd bin/default/ctdb/reqid_test.inst
        linux-vdso.so.1 (0x00007ffdac36a000)
        libsamba-util.so.0 => /usr/local/samba/lib/libsamba-util.so.0 (0x00007fc7737cd000)
        libreplace-samba4.so => /usr/local/samba/lib/private/libreplace-samba4.so (0x00007fc7735cb000)
        libgenrand-samba4.so => /usr/local/samba/lib/private/libgenrand-samba4.so (0x00007fc7733c9000)
        libsocket-blocking-samba4.so => /usr/local/samba/lib/private/libsocket-blocking-samba4.so (0x00007fc7731c7000)
        libutil-setid-samba4.so => /usr/local/samba/lib/private/libutil-setid-samba4.so (0x00007fc772fc5000)
        libtevent.so.0 => /usr/local/samba/lib/private/libtevent.so.0 (0x00007fc772dad000)
        libsamba-debug-samba4.so => /usr/local/samba/lib/private/libsamba-debug-samba4.so (0x00007fc772ba3000)
        libtime-basic-samba4.so => /usr/local/samba/lib/private/libtime-basic-samba4.so (0x00007fc7729a1000)
        libsys-rw-samba4.so => /usr/local/samba/lib/private/libsys-rw-samba4.so (0x00007fc77279e000)
        libtalloc.so.2 => /usr/local/samba/lib/private/libtalloc.so.2 (0x00007fc772594000)
        libiov-buf-samba4.so => /usr/local/samba/lib/private/libiov-buf-samba4.so (0x00007fc772392000)
        libicui18n.so.60 => /lib64/libicui18n.so.60 (0x00007fc771ed1000)
        libgnutls.so.30 => /lib64/libgnutls.so.30 (0x00007fc771ae0000)
        libicudata.so.60 => /lib64/libicudata.so.60 (0x00007fc76ff36000)
        ...


[4689/6851] Linking bin/default/ctdb/reqid_test.inst
20:40:16 ESC[35mrunnerESC[0m ['/usr/lib64/ccache/gcc', 'ctdb/tests/src/reqid_test.c.181.o', '-o/root/samba-4.15.0pre1-GIT-b145434/bin/defau
lt/ctdb/reqid_test.inst', '-Wl,-rpath,/usr/local/samba/lib', '-Wl,-rpath,/usr/local/samba/lib/private', '-Wl,-Bstatic', '-Wl,-Bdynamic', '-
L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/talloc', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/tevent', '-L/root/samba-
4.15.0pre1-GIT-b145434/bin/default/lib/replace', '-L/root/samba-4.15.0pre1-GIT-b145434/bin/default/lib/util', '-L/usr/local/lib', '-L/usr/l
ocal/lib', '-lsamba-util', '-lreplace-samba4', '-lgenrand-samba4', '-lsocket-blocking-samba4', '-lutil-setid-samba4', '-ltevent', '-lsamba-
debug-samba4', '-ltime-basic-samba4', '-lsys-rw-samba4', '-ltalloc', '-liov-buf-samba4', '-licui18n', '-lgnutls', '-licudata', '-licuuc', '
-lsystemd', '-lunwind-generic', '-lunwind', '-lbsd', '-ldl', '-lpthread', '-pie', '-Wl,-z,relro,-z,now', '-Wl,-no-undefined', '-Wl,--export
-dynamic', '-Wl,--as-needed']

So the problem is that directories for recursive dependencies aren't
being processed properly.  Not sure why that commit changed this
behaviour...

peace & happiness,
martin

