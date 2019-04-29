Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ED7EAF8
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2019 21:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=05WTv2UvmTwXWr+bBABzBU4JkPIOC5ZslgZ2I2A3BLI=; b=rbzmsgvMcUspvtArZts7F61al6
	J556W2ICcAo5YG/CCA8R6iEXXkAb39ieLADA1Yrv7lr7ZHazOMWCuN0nQQSXpyrGBSGIa8ijSrgY6
	vvOYKLhZ5XshNdT6jjuUXCaCGTg7JuXt0nkgypE8Q/6dBhgedSz96lqQDWLRF0M7OKhmH3QyP80yR
	ABK222KRmyXwCoqQgcY4POQWRjJNE3B/omD1WUgJvA+wuKCMH6qFGCJwVCHbpkKYW9+mXXZhiGJTb
	SA8aTte3HOjMZuF1rjGwg2B07+MjjJebfab5I4Hm+ADC58C+Qs3UXZsM8/ALUf2BAY+mBJXo9/mJZ
	wf7xBMuQ==;
Received: from localhost ([::1]:46636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLC55-003jX7-3O; Mon, 29 Apr 2019 19:36:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:64448) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLC4z-003jX0-2G
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 19:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=05WTv2UvmTwXWr+bBABzBU4JkPIOC5ZslgZ2I2A3BLI=; b=G7Ja7NUmkcDEhrS2TMAyc7QHzR
 YiwLnoEdU1NvpF0B6L5f63zt+YgT6TtpCDZ3CK+ADvctTULT2ctC1PWwvLnxLpRia9sj/hkEhjxea
 pIr1Qy/xLdiMY2bxzieqmxcqY+C2EuxAu44V1XTpJimKFo/8REFKsEPn8pyxmWWToziQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLC4y-0008Fw-30; Mon, 29 Apr 2019 19:36:44 +0000
Date: Mon, 29 Apr 2019 12:36:39 -0700
To: samba-technical@lists.samba.org
Subject: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
Message-ID: <20190429193555.GA28948@samba.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
Fnitializer"rom: Christof Schmitt <cs@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Revert the patch adding the warnings since that causes problems when
compiling master on RHEL7. Many C99 initializers of nested structs are
flagged as problematic, so it seems easier to remove the additional
compiler checks.

Christof

--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: quoted-printable

=46rom ac1ea9cbf5f70db05498de618b8a0bd096e76c9f Mon Sep 17 00:00:00 2001
=46rom: Christof Schmitt <cs@samba.org>
Date: Mon, 29 Apr 2019 12:16:31 -0700
Subject: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

This reverts commit cf79ee15bd2e669d881f92bfd1a1ab1034615480.

The additional warning triggers many false positives with
gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-36)
which then result in compiler errors with --pick-developer

One example:

=2E./../libcli/auth/netlogon_creds_cli.c: In function =E2=80=98netlogon_cre=
ds_cli_ServerGetTrustInfo_done=E2=80=99:
=2E./../libcli/auth/netlogon_creds_cli.c:3117:15: error: missing initialize=
r for field =E2=80=98hash=E2=80=99 of =E2=80=98const struct samr_Password=
=E2=80=99 [-Werror=3Dmissing-field-initializers]
  const struct samr_Password zero =3D {};
               ^
In file included from ./librpc/gen_ndr/netlogon.h:12:0,
                 from ../../libcli/auth/libcli_auth.h:20,
                 from ../../source4/../libcli/auth/schannel.h:23,
                 from ../../libcli/auth/netlogon_creds_cli.c:31:
=2E/librpc/gen_ndr/samr.h:541:10: note: =E2=80=98hash=E2=80=99 declared here
  uint8_t hash[16];

Signed-off-by: Christof Schmitt <cs@samba.org>
---
 buildtools/wafsamba/samba_autoconf.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/sa=
mba_autoconf.py
index f2b049e40a7..98ffdfea458 100644
--- a/buildtools/wafsamba/samba_autoconf.py
+++ b/buildtools/wafsamba/samba_autoconf.py
@@ -731,7 +731,6 @@ def SAMBA_CONFIG_H(conf, path=3DNone):
         conf.ADD_CFLAGS('-Wall', testflags=3DTrue)
         conf.ADD_CFLAGS('-Wshadow', testflags=3DTrue)
         conf.ADD_CFLAGS('-Wmissing-prototypes', testflags=3DTrue)
-        conf.ADD_CFLAGS('-Wmissing-field-initializers', testflags=3DTrue)
         conf.ADD_CFLAGS('-Wcast-align -Wcast-qual', testflags=3DTrue)
         conf.ADD_CFLAGS('-fno-common', testflags=3DTrue)
=20
--=20
2.17.0


--yNb1oOkm5a9FJOVX--

