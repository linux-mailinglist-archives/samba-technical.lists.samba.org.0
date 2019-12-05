Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0791148BA
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 22:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=dhkaApwn0rTNN8LBmbFfglUxAiEhHVJ9IMRjNTWnuoQ=; b=sWjKnFEng0VEmdeqNIpIxjirhQ
	RkSeO+X4Vt40jO3dZp5k5sVFGxkZvPt1Su19xeWrfL68wqal+M82IlNc2erZxGqFf32I+emHIRYiz
	tkIa58I8PG0AP9tE+HaJlzk7PZeuhqV4EwCCiAJDP+dTHrtFQdn2BGUKRiNrvFwxpaX50O/yHkqjM
	VBEtzIzaCiEh+GQs5EkCpH00MHygD9qi9ExF3nZtfrR7Ns3dojkr+dgDIWBSumWqcMUfNFTM39SQ0
	MkMUilT+IXOI7nVbED7W/8omUDYKCLUpUO11OD+7y22KiMofddwbDcqjvXKbCWMHtvkX0hc/3p7vN
	hEps0byQ==;
Received: from localhost ([::1]:53128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icykC-006KuL-KF; Thu, 05 Dec 2019 21:33:04 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:53374) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1icyk8-006Ku9-BF
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 21:33:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id C966DD534517E;
 Fri,  6 Dec 2019 00:32:57 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KovbsGd3NtDN; Fri,  6 Dec 2019 00:32:57 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 6BCFDD536CBA3;
 Fri,  6 Dec 2019 00:32:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 6BCFDD536CBA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1575581577;
 bh=dhkaApwn0rTNN8LBmbFfglUxAiEhHVJ9IMRjNTWnuoQ=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=k3eVzJHFl75ERxUQR4XPtDjLhbXWLkNBgfFSK8feIzBjWRJMNSHtIee0ygnpCWW8j
 3vyC9XXw9gp6HqBqe9y8ZsYfSlIWvkYYQvktUS8q0F31bU8kCGGCsVfBESz5OdTGD9
 YEO29YGX0mCv1WjADs/oIlpXQkZiDPD84R9mLFyH4SpN0DMIrwuNkaO0qukYS0QzZD
 WBHS1zVJHJaItlMz4sCR460mOJZ4u7vTCePe6bW0BBoU/Al7np9LIwx4g6zMwhfHoF
 +5WvyJza2tTyMILT/jc3XWAAbOZTYp7YZ1ZR5X0bMFNHYaeqPoB7bLEHAtr/TUbTpJ
 GIw+rDkq+VYZg==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gfc6oPkzE07f; Fri,  6 Dec 2019 00:32:57 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-11.ip.moscow.rt.ru
 [90.154.70.11])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 40CCED5345174;
 Fri,  6 Dec 2019 00:32:57 +0300 (MSK)
Subject: Re: [PATH 4/4] Automating usage of smbspool_krb5_wrapper
To: samba-technical@lists.samba.org, Andreas Schneider <asn@samba.org>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1574444045.gU553saExv@magrathea>
 <c767314c-4517-20f1-538f-7a34a35c1086@rosalinux.ru>
 <1925046.vXGPc2B9mm@magrathea>
 <2c1be5c9-45c3-7807-2c02-4654a3055305@rosalinux.ru>
 <47aa700e-de61-29ba-5118-9fc6a721f619@rosalinux.ru>
 <a09cfbe4-3f89-c846-027b-929c454442ea@rosalinux.ru>
 <08e2d67d-21c6-b0f3-8d69-6bb36f516a68@rosalinux.ru>
Message-ID: <c7bf344a-c5e0-fb4b-0461-86a9ae22041f@rosalinux.ru>
Date: Fri, 6 Dec 2019 00:32:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <08e2d67d-21c6-b0f3-8d69-6bb36f516a68@rosalinux.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From 90dec7767aa6aecd303164eaea22656b9fa4e959 Mon Sep 17 00:00:00 2001
From: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Date: Sun, 3 Nov 2019 01:47:51 +0300
Subject: [PATCH 4/4] smbspool: print a hint about smbspool_krb5_wrapper

When I first met with the situation that Kerberos kredentials cache of ro=
ot
user was looked for instead of the one of the printing task creator,
it took a lot of time to understand that smbspool_krb5_wrapper will resol=
ve this.

Signed-off-by: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
---
=C2=A0source3/client/smbspool.c | 4 ++--
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source3/client/smbspool.c b/source3/client/smbspool.c
index 34def0c91a9..5e2d230ab8b 100644
--- a/source3/client/smbspool.c
+++ b/source3/client/smbspool.c
@@ -699,8 +699,8 @@ smb_connect(struct cli_state **output_cli,
=C2=A0=C2=A0=C2=A0 =C2=A0if (strcmp(auth_info_required, "negotiate") =3D=3D=
 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (!kerberos_ccache_is_valid=
()) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0fprintf(st=
derr,
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0"ERROR: No valid Kerberos credential cache "
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0"found!\n");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0"ERROR: No valid Kerberos credential cache found! "
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0"Using smbspool_krb5_wrapper may help.\n");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return NT_=
STATUS_LOGON_FAILURE;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0user =3D jobusername;
--=20
2.20.1




