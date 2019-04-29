Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE2EECC9
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 00:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=K5CQ3+yK4DC4GChHjrsh7oZ4JNrOCSg0x8cu6UVbTQ0=; b=DmK3X8lH//m5ee3PVurz7+g16H
	ODJrhA0d3xW59oZ442MrLHaYxRF7Hsc0wl3wMOGue7c4n4szqyyTsIWLgKBhDbdHv6Rfv0x9HEd7v
	xxLni7agMfL00HnmGpXbTzDyCwGFdPA0z5XGHceizVZ84uvz69ncqZE7+IisNzQNwJtPVndY05fyY
	oOJHt79sS6vY8BvK+vTj2QS+T3b/PzyF6zIqdlZhqKjmsFYlBmE5ZUy+um//dYA7PWthFefzmmwt1
	KSG6etjVztlkZlNr0RuV4SiaxnsJDDOKuQsr7fysBuHOY6MNuVCEUh1ajQmGjYA1dTH8qLGJDeqrM
	WuuvIQ5Q==;
Received: from localhost ([::1]:61776 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLEos-003ld1-UM; Mon, 29 Apr 2019 22:32:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:58964) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLEoo-003lcu-Qk
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 22:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=K5CQ3+yK4DC4GChHjrsh7oZ4JNrOCSg0x8cu6UVbTQ0=; b=ZYADmKKn+HJxdzyit9eMf3gg0x
 GuzzRmVP1HnfWHqj5liiWVXUNYLm5tBxBEOGX2yskFrViTqZaDEpKCQnnFxYjv4Yg7WYXhIQohjwB
 FWd/snoo0RJNw8bRUKvXDWTF82mvaIgDM0YBpPp07vQ+Fo7O2vNV9jTfo9Fj/bigM9Ik=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLEoo-0001cw-0v; Mon, 29 Apr 2019 22:32:14 +0000
Date: Mon, 29 Apr 2019 15:32:11 -0700
To: Ralph =?iso-8859-1?Q?B=F6hme?= <slow@samba.org>,
 Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
Message-ID: <20190429223210.GA23900@samba.org>
References: <20190429193555.GA28948@samba.org>
 <634FD7C2-DD12-4714-9AE8-A95BD3EF40E9@samba.org>
 <20190429200808.GA26142@samba.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190429200808.GA26142@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Apr 29, 2019 at 01:08:09PM -0700, Christof Schmitt via samba-technical wrote:
> On Mon, Apr 29, 2019 at 09:51:53PM +0200, Ralph Böhme wrote:
> > Hey Christof
> > 
> > > Am 29.04.2019 um 21:36 schrieb Christof Schmitt <cs@samba.org>:
> > > 
> > > Revert the patch adding the warnings since that causes problems when
> > > compiling master on RHEL7. Many C99 initializers of nested structs
> > > are flagged as problematic, so it seems easier to remove the
> > > additional compiler checks.
> > 
> > sorry, didn't thought about older compilers...
> > 
> > Can we have a compiler check that ensures {0} works included with
> > nested structs and then only enable the -Wmissing-field-initializers
> > if it does?
> 
> That should be doable. Let met try adding the check.

See attached patch. That works for me on RHEL7 (skipping the compiler
option) and Fedora 29 (using the compiler option).

Christof

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: quoted-printable

=46rom 3c604521632a63a0baf210b6573812466435f024 Mon Sep 17 00:00:00 2001
=46rom: Christof Schmitt <cs@samba.org>
Date: Mon, 29 Apr 2019 13:07:08 -0700
Subject: [PATCH] wafsamba: Add compiler check for missing field initializer
 check

cf79ee15 wafsamba: Enable warnings for missing field initializer

enabled a compiler check for warnings about missing initializers for all
developer builds. This fails with older compilers, e.g. gcc on RHEL7.
Add a waf check around adding the compiler option to avoid the failure
with older compilers.

Signed-off-by: Christof Schmitt <cs@samba.org>
---
 buildtools/wafsamba/samba_autoconf.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/sa=
mba_autoconf.py
index f2b049e40a7..06ec7da333a 100644
--- a/buildtools/wafsamba/samba_autoconf.py
+++ b/buildtools/wafsamba/samba_autoconf.py
@@ -731,7 +731,13 @@ def SAMBA_CONFIG_H(conf, path=3DNone):
         conf.ADD_CFLAGS('-Wall', testflags=3DTrue)
         conf.ADD_CFLAGS('-Wshadow', testflags=3DTrue)
         conf.ADD_CFLAGS('-Wmissing-prototypes', testflags=3DTrue)
-        conf.ADD_CFLAGS('-Wmissing-field-initializers', testflags=3DTrue)
+        if CHECK_CODE(conf,
+                      'struct a { int b; }; struct c { struct a d; } e =3D=
 { };',
+                      'CHECK_C99_INIT',
+                      link=3DFalse,
+                      cflags=3D'-Wmissing-field-initializers -Werror=3Dmis=
sing-field-initializers',
+                      msg=3D"Checking C99 init of nested structs."):
+            conf.ADD_CFLAGS('-Wmissing-field-initializers', testflags=3DTr=
ue)
         conf.ADD_CFLAGS('-Wcast-align -Wcast-qual', testflags=3DTrue)
         conf.ADD_CFLAGS('-fno-common', testflags=3DTrue)
=20
--=20
2.17.0


--OXfL5xGRrasGEqWY--

