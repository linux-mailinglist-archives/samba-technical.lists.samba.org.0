Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF883305A8
	for <lists+samba-technical@lfdr.de>; Mon,  8 Mar 2021 02:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Zin+tkzgH4hR9q587F08HE/7cRSMcxxn0tydT44MInM=; b=2BMfyMDOQHetDblwaLyjhNij5A
	+xt9m9JSREeAr3OmLCinTj4jFrUl75hNOTN3/aN85844x/ZntKk9yLPjAMeDveiNJD2/MDlUnc8Ik
	RftbzvNwY/L9IXZTuk+JF6qguy6ghPDuMGxXfQIiPXphFP8YmX6ddg7NeeztRCmAmS4MDFTkXwo6R
	uiHPc0b4uLBdZmkj01FCIl/am2EnKBVJSJ3EJPKyd6/zu2wkncZyl1ECPGdJLp+1K+CZptY7FWi7t
	jAyCIuk/h+pTFytsnZxm+1kItj4sepK+LF+2wJh4LqfmxIMwir/2wR4htJQhGZc80I9RX49VpwAtR
	PF0tdDFA==;
Received: from ip6-localhost ([::1]:26496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJ4sZ-004SLN-FF; Mon, 08 Mar 2021 01:40:15 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:44679 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJ4sK-004SLG-0b
 for samba-technical@lists.samba.org; Mon, 08 Mar 2021 01:40:04 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dv1H10rYkz9sWF;
 Mon,  8 Mar 2021 12:39:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1615167586; bh=cF9YHHCVysr72vN4K2DoCO/3m32hN9WX8/mN/4u/pcM=;
 h=Date:From:To:Cc:Subject:From;
 b=OUUEbnUOSvjXi57qbJ0CqhfkMA72khlp2me3up5h3gPNPHXBIZwuD2Un40gwFelUG
 gqOnvMvBk1CZ7OQ7QiJ4GZ8kY64JfMgV7b+Vt3Hw/FPf7f61LuEBpwbgrZpRu0hxqV
 vwVahMo7xSzq7OOL6A33PHzC6vx076XIo1CC8SgfVPpEhLJtAd1+T6P49x+3L8TQ27
 mxYEgRct5KPOFQnlL9r2rCuiXAJnhA5Rvm3XQ5GnFa53yjIGciLwn/D+f/KR5bnty3
 HyeeOZWChLW3vKyNtut06IbV9dKQKkg4Tn3BSlc9c6alKQyHhCdviSoJ05N7veKJkx
 C67czmQNkWPtA==
Date: Mon, 8 Mar 2021 12:39:39 +1100
To: =?UTF-8?B?QmrDtnJu?= Jacke <bj@sernet.de>, Karolin Seeger
 <kseeger@samba.org>
Subject: Commit 996560191ac6bd603901dcd6c0de5d239e019ef4 causes strange
 regression
Message-ID: <20210308123939.56c5db74@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I want to flag this regression as soon as possible (before I really
understand it) because 4.12.12 is due for release on Thursday and this
may be the last 4.12.x release, due to the imminent release of 4.14.0.

This is the commit in question:

commit 996560191ac6bd603901dcd6c0de5d239e019ef4
Author: Bj=C3=B6rn Jacke <bj@sernet.de>
Date:   Tue Mar 2 22:47:35 2021 +0100

    wscript: use --as-needed only if tested successfully
   =20
    Some OSes like Solaris based OmiOS don't support this.
   =20
    BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14288
   =20
    Signed-off-by: Bjoern Jacke <bjacke@samba.org>
    Reviewed-by: Andrew Bartlett <abartlet@samba.org>

* This currently affecting a CTDB test binary but might also be silently
  affecting other binaries that aren't tested after  install.

* It may also be a bug in ctdb/wscript that has been activated by this
  change but I haven't been able to find it.

* So far I only see it on a CentOS 7 test node but it happens in all
  branches where it has been applied.

  I assumed it was a generic installation/linking problem but I can't
  recreate it on Debian testing.

* Reverting the above commit fixes the problem.

It causes a very strange test failure:

--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=
=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--
Running test /usr/local/samba/share/ctdb/tests/UNIT/cunit/reqid_test_001.sh=
 (05:37:56)
--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=
=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--=3D=3D--
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Running "reqid_test"
--------------------------------------------------
Output (Exit status: 127):
--------------------------------------------------
reqid_test: error while loading shared libraries: libgenrand-samba4.so: can=
not open shared object file: No such file or directory
--------------------------------------------------
Required output (Exit status: 0):
--------------------------------------------------
WARNING: attempt to remove unset id 0 in idtree
WARNING: attempt to remove unset id 1 in idtree
WARNING: attempt to remove unset id 2 in idtree
...
WARNING: attempt to remove unset id 1023 in idtree

FAILED
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
TEST FAILED: /usr/local/samba/share/ctdb/tests/UNIT/cunit/reqid_test_001.sh=
 (status 1) (duration: 1s)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is really an installation failure:

[root@testtest1 ~]# ldd /usr/local/samba/libexec/ctdb/tests/reqid_test
        linux-vdso.so.1 (0x00007fff261f6000)
        libsamba-util.so.0 =3D> /usr/local/samba/lib/libsamba-util.so.0 (0x=
00007fc9d9970000)
        libgenrand-samba4.so =3D> not found
        libsocket-blocking-samba4.so =3D> not found
        libutil-setid-samba4.so =3D> not found
        libtevent.so.0 =3D> /lib64/libtevent.so.0 (0x00007fc9d975c000)
        libsamba-debug-samba4.so =3D> not found
        libtime-basic-samba4.so =3D> not found
        libsys-rw-samba4.so =3D> not found
        libtalloc.so.2 =3D> /lib64/libtalloc.so.2 (0x00007fc9d9547000)
        libreplace-samba4.so =3D> not found
        libiov-buf-samba4.so =3D> not found
        libicui18n.so.60 =3D> /lib64/libicui18n.so.60 (0x00007fc9d9086000)
        libgnutls.so.30 =3D> /lib64/libgnutls.so.30 (0x00007fc9d8c95000)
        ...

Other test binaries that also depend on some of the above "not found"
things have no problem:

[root@testtest1 ~]# ldd /usr/local/samba/libexec/ctdb/tests/sock_daemon_test
        linux-vdso.so.1 (0x00007ffe1c6b8000)
        libsocket-blocking-samba4.so =3D> /usr/local/samba/lib/private/libs=
ocket-blocking-samba4.so (0x00007fa8c1f3c000)
        libtevent.so.0 =3D> /usr/local/samba/lib/private/libtevent.so.0 (0x=
00007fa8c1d24000)
        libtevent-util.so.0 =3D> /usr/local/samba/lib/libtevent-util.so.0 (=
0x00007fa8c1b1f000)
        libsys-rw-samba4.so =3D> /usr/local/samba/lib/private/libsys-rw-sam=
ba4.so (0x00007fa8c191c000)
        libtdb.so.1 =3D> /usr/local/samba/lib/private/libtdb.so.1 (0x00007f=
a8c1701000)
        libreplace-samba4.so =3D> /usr/local/samba/lib/private/libreplace-s=
amba4.so (0x00007fa8c14ff000)
        libtalloc.so.2 =3D> /usr/local/samba/lib/private/libtalloc.so.2 (0x=
00007fa8c12f5000)
        libsamba-util.so.0 =3D> /usr/local/samba/lib/libsamba-util.so.0 (0x=
00007fa8c107b000)
        libiov-buf-samba4.so =3D> /usr/local/samba/lib/private/libiov-buf-s=
amba4.so (0x00007fa8c0e79000)
        libsamba-errors.so.1 =3D> /usr/local/samba/lib/libsamba-errors.so.1=
 (0x00007fa8c0b23000)
        libgenrand-samba4.so =3D> /usr/local/samba/lib/private/libgenrand-s=
amba4.so (0x00007fa8c0921000)
        libutil-setid-samba4.so =3D> /usr/local/samba/lib/private/libutil-s=
etid-samba4.so (0x00007fa8c071f000)
        libsamba-debug-samba4.so =3D> /usr/local/samba/lib/private/libsamba=
-debug-samba4.so (0x00007fa8c0515000)
        libtime-basic-samba4.so =3D> /usr/local/samba/lib/private/libtime-b=
asic-samba4.so (0x00007fa8c0313000)
        libicui18n.so.60 =3D> /lib64/libicui18n.so.60 (0x00007fa8bfe52000)
        libicudata.so.60 =3D> /lib64/libicudata.so.60 (0x00007fa8be2a8000)
        ...

For the affected binary, it appears to be unable to find anything
/usr/local/samba/lib/private/.

I'll spend more time on this later... but I'm hoping that someone else
has a clue and is able to understand what is happening.

Thanks...

peace & happiness,
martin

