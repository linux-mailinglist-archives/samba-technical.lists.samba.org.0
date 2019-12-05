Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2DB1148B4
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 22:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=78IHYmb3t1Y80UK7EMcV40bn0KoGBeVgzLTeW7FyNl8=; b=ct8DoQ2vaDf6SK5gS19oMii48y
	5/5Dgq0o/nBBZySaZiB5lnvEgT8owcTZhgKP9mO1bkoDIEd+UeRba2saw8TfvIIjDHT5U8ba1eNcr
	ZqTd9YytCW7YSHvUnRarbdwJd4EHVQTfNSt/hAW3TgYjoo34EuWD6ysGV8W1LwfRIr3iXSIawmCdk
	lZoORh7sg31zvYo3xWBNdWnmx3+rIc+uPZX7xsah9ofN/l0tj/nASGeg/GvC9oezgDwWrym21+c9a
	Ftr1+vRspHfjfZ1aa5dZpk8E8bXd5OP33C1gQ5GFVGkavsS6+I299BB9Lj1lAJuKQP/B7da3L04S6
	bEIt660g==;
Received: from localhost ([::1]:51574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icyhy-006KhZ-7Z; Thu, 05 Dec 2019 21:30:46 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:52860) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1icyht-006KhS-Lo
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 21:30:43 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 1BB07CB366B70
 for <samba-technical@lists.samba.org>; Fri,  6 Dec 2019 00:30:39 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id C7VFDVjEr74Y for <samba-technical@lists.samba.org>;
 Fri,  6 Dec 2019 00:30:38 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 5B15ACB367791
 for <samba-technical@lists.samba.org>; Fri,  6 Dec 2019 00:30:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 5B15ACB367791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1575581438;
 bh=78IHYmb3t1Y80UK7EMcV40bn0KoGBeVgzLTeW7FyNl8=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=hzx/vkq+NMU62xndesBcJy1tZ970ylgcdq5TIVTxbIkrCSr06vNXbc7CHbIDpttAe
 qswQ867pWEnDXXsnm5kxctuiroSokTzjqJ1NyD/NPTXzMTLAdE+wRn75x3pxYh1Xix
 m0m7wcks1vwcrcL2KCn7OvzyVRlHrYIqsgFsLy5exFZ/y3vFqzFasgssoZgRlS2acQ
 0gLSDkwQx5pMYfbp6sc/tyRS1qSdYeiyQN9DmpkUQlNaHX5f26onz336z1iG4wPKqh
 T4uSAkSCfaM1Cp0JgQj684C9p2kI/R2mSbxRj3F2spKk7DHFfkNT0E56OxB7EAODQl
 q1GtE0c0yxFRw==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XBA1cAXXk2sJ for <samba-technical@lists.samba.org>;
 Fri,  6 Dec 2019 00:30:38 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-11.ip.moscow.rt.ru
 [90.154.70.11])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 3DF2FCB366B70
 for <samba-technical@lists.samba.org>; Fri,  6 Dec 2019 00:30:38 +0300 (MSK)
Subject: Re: [PATH 2/4] Automating usage of smbspool_krb5_wrapper
To: samba-technical@lists.samba.org
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1574444045.gU553saExv@magrathea>
 <c767314c-4517-20f1-538f-7a34a35c1086@rosalinux.ru>
 <1925046.vXGPc2B9mm@magrathea>
 <2c1be5c9-45c3-7807-2c02-4654a3055305@rosalinux.ru>
 <47aa700e-de61-29ba-5118-9fc6a721f619@rosalinux.ru>
Message-ID: <a09cfbe4-3f89-c846-027b-929c454442ea@rosalinux.ru>
Date: Fri, 6 Dec 2019 00:30:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <47aa700e-de61-29ba-5118-9fc6a721f619@rosalinux.ru>
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


From 28bbb580dead3f4a523335f89f020ce522458571 Mon Sep 17 00:00:00 2001
From: Andreas Schneider <asn@samba.org>
Date: Mon, 28 Oct 2019 09:38:08 +0100
Subject: [PATCH 2/4] s3:smbspool_krb5_wrapper: Map AUTH_INFO_REQUIRED=3Dn=
one to
=C2=A0anonymous

Signed-off-by: Andreas Schneider <asn@samba.org>
---
=C2=A0selftest/target/Samba4.pm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
=C2=A0source3/client/smbspool_krb5_wrapper.c | 18 ++++++++++++------
=C2=A0source3/script/tests/test_smbspool.sh=C2=A0 | 10 +++-------
=C2=A03 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm
index 1310e2ff09f..23dafba1574 100755
--- a/selftest/target/Samba4.pm
+++ b/selftest/target/Samba4.pm
@@ -1845,6 +1845,9 @@ sub provision_ad_dc($$$$$$)
=C2=A0=C2=A0=C2=A0 =C2=A0copy =3D print1
=C2=A0[print3]
=C2=A0=C2=A0=C2=A0 =C2=A0copy =3D print1
+[print4]
+=C2=A0=C2=A0 =C2=A0copy =3D print1
+=C2=A0=C2=A0 =C2=A0guest ok =3D yes
=C2=A0[lp]
=C2=A0=C2=A0=C2=A0 =C2=A0copy =3D print1
=C2=A0";
diff --git a/source3/client/smbspool_krb5_wrapper.c b/source3/client/smbs=
pool_krb5_wrapper.c
index bff1df417e8..bd6319ca9c3 100644
--- a/source3/client/smbspool_krb5_wrapper.c
+++ b/source3/client/smbspool_krb5_wrapper.c
@@ -149,17 +149,19 @@ int main(int argc, char *argv[])
=C2=A0=C2=A0=C2=A0 =C2=A0env =3D getenv("AUTH_INFO_REQUIRED");
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If not set, then just=
 call smbspool. */
-=C2=A0=C2=A0 =C2=A0if (env =3D=3D NULL || env[0] =3D=3D 0) {
+=C2=A0=C2=A0 =C2=A0if (env =3D=3D NULL || env =3D=3D "none" || env[0] =3D=
=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_DEBUG("AUTH_INFO_REQ=
UIRED is not set - "
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "execute smbspool");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto smbspool;
=C2=A0=C2=A0=C2=A0 =C2=A0} else {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_DEBUG("AUTH_INFO_REQ=
UIRED=3D%s", env);
=C2=A0
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0snprintf(auth_info_required,
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 sizeof(auth_in=
fo_required),
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 "%s",
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 env);
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0cmp =3D strcmp(env, "none");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (cmp =3D=3D 0) {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_DEBUG(=
"Authenticate using none (anonymous) - "
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "execute smbspool");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto smbspool;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0cmp =3D strcmp(env, "username=
,password");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (cmp =3D=3D 0) {
@@ -168,13 +170,17 @@ int main(int argc, char *argv[])
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto smbsp=
ool;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0/* if AUTH_INFO_REQUIRED=3Dnone */
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0cmp =3D strcmp(env, "negotiat=
e");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (cmp !=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_E=
RROR("Authentication unsupported");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0fprintf(st=
derr, "ATTR: auth-info-required=3Dnegotiate\n");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return CUP=
S_BACKEND_AUTH_REQUIRED;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
+
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0snprintf(auth_info_required,
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 sizeof(auth_in=
fo_required),
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 "%s",
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 env);
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0uid =3D getuid();
diff --git a/source3/script/tests/test_smbspool.sh b/source3/script/tests=
/test_smbspool.sh
index 7ba03f01fc7..01d72101615 100755
--- a/source3/script/tests/test_smbspool.sh
+++ b/source3/script/tests/test_smbspool.sh
@@ -48,7 +48,7 @@ test_smbspool_noargs()
=C2=A0
=C2=A0test_smbspool_authinforequired_none()
=C2=A0{
-=C2=A0=C2=A0 =C2=A0cmd=3D'$samba_smbspool_krb5 smb://$SERVER_IP/print1 2=
00 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printing/example.ps=
 2>&1'
+=C2=A0=C2=A0 =C2=A0cmd=3D'$samba_smbspool_krb5 smb://$SERVER_IP/print4 2=
00 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printing/example.ps=
 2>&1'
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0AUTH_INFO_REQUIRED=3D"none"
=C2=A0=C2=A0=C2=A0 =C2=A0export AUTH_INFO_REQUIRED
@@ -60,14 +60,10 @@ test_smbspool_authinforequired_none()
=C2=A0=C2=A0=C2=A0 =C2=A0if [ $ret !=3D 0 ]; then
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0echo "$out"
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0echo "failed to execute $smbs=
pool_krb5"
-=C2=A0=C2=A0 =C2=A0fi
-
-=C2=A0=C2=A0 =C2=A0echo "$out" | grep 'ATTR: auth-info-required=3Dnegoti=
ate'
-=C2=A0=C2=A0 =C2=A0ret=3D$?
-=C2=A0=C2=A0 =C2=A0if [ $ret !=3D 0 ] ; then
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0echo "$out"
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return 1
=C2=A0=C2=A0=C2=A0 =C2=A0fi
+
+=C2=A0=C2=A0 =C2=A0return 0
=C2=A0}
=C2=A0
=C2=A0#
--=20
2.20.1




