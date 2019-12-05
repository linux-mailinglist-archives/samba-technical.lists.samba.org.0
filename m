Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DDA1148B9
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 22:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=pbGKu0/zY12JNIjGygNBtBkYR5LuD7tMIv83GitkSIo=; b=CLI6pSV3fCDytMLxFlU8PEPGqi
	mxo/RjANt/f1SsXZhv67UlTR5KJvi9j5M8RR8yoP1imAqgse5Bl9Z3pcVmvZvRSQ6S831iZCX0ccy
	ucaTj9UFCkd7oxOAEsFlSuMGjPhdN10llCvapcePLiGeJEJrflC+OPQ/NFGOAi1qi//cHfB1xrDKm
	Zw6l6VT2TztaJP5KTFYfNvmDs2kexotul2g1oBGBYtChJ8D/M9cVz8WYfGmJQomRSbFNVo9Rt+vqh
	JjejTjk/UcgbRScTthEooaqXqVV46ku/58e6tsE6G3qqHnThUK0MfJE9qzYj1WYZVfVyv28gWRLcc
	oD92+K9g==;
Received: from localhost ([::1]:52350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icyjL-006Ko0-M1; Thu, 05 Dec 2019 21:32:11 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:53082) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1icyjF-006Knt-KC
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 21:32:08 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 1527FD52D8438;
 Fri,  6 Dec 2019 00:32:03 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tCzNZ8LywuRA; Fri,  6 Dec 2019 00:32:01 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 4FF41D534197F;
 Fri,  6 Dec 2019 00:32:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 4FF41D534197F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1575581521;
 bh=pbGKu0/zY12JNIjGygNBtBkYR5LuD7tMIv83GitkSIo=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=UYTzSW8fG6sNkFG28sGcJsB7zJ8VS4YFNTBLerG8+g5zVAY7t6ogvLABoWavtiKBz
 NeulI8vCmTyXqNTij3N5DJbrgYmkNUR0HH6V2FFdmQDa3kw0v/6olAzTkZ7t1h+Dg6
 TUhB8Jt5t7+DwF9L6aus8KtJn95D++zMTiBAheuYO5CHBvh0IGrGV3BXZSxXM5K0op
 a4NrcooZEdmmGbzVmVfEy46t3Y2OEZZk10hdR6dYQzs0ERWNrcxdeofWMVhVvAPKn2
 3+ifDueS+6RGKlNLNYHZa2GTPqihjurjT12mQPeLqUpt9H9YNkBH+ox0VP8lB21KYE
 ddiA4P0AJGRGg==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KWKjD8zRbKWq; Fri,  6 Dec 2019 00:32:01 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-11.ip.moscow.rt.ru
 [90.154.70.11])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 2C0DED52D8438;
 Fri,  6 Dec 2019 00:32:01 +0300 (MSK)
Subject: Re: [PATH 3/4] Automating usage of smbspool_krb5_wrapper
To: samba-technical@lists.samba.org, Andreas Schneider <asn@samba.org>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1574444045.gU553saExv@magrathea>
 <c767314c-4517-20f1-538f-7a34a35c1086@rosalinux.ru>
 <1925046.vXGPc2B9mm@magrathea>
 <2c1be5c9-45c3-7807-2c02-4654a3055305@rosalinux.ru>
 <47aa700e-de61-29ba-5118-9fc6a721f619@rosalinux.ru>
 <a09cfbe4-3f89-c846-027b-929c454442ea@rosalinux.ru>
Message-ID: <08e2d67d-21c6-b0f3-8d69-6bb36f516a68@rosalinux.ru>
Date: Fri, 6 Dec 2019 00:32:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <a09cfbe4-3f89-c846-027b-929c454442ea@rosalinux.ru>
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

From b2581f0ecc1253fa4d805b962ac8c7191f92e278 Mon Sep 17 00:00:00 2001
From: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Date: Sun, 3 Nov 2019 01:28:13 +0300
Subject: [PATCH 3/4] s3:smbspool_krb5_wrapper: ignore unknown values of
=C2=A0AUTH_INFO_REQUIRED

To make smbspool_krb5_wrapper usable as a default destination for symlink
/usr/lib/cups/backend/smb in Linux ditros, it has to be well-prepared
for any possible values of AUTH_INFO_REQUIRED set by cupsd and correctly
pass printing tasks to smbspool if it sees that Kerberos authentication
is not needed.

Discussed here: https://lists.samba.org/archive/samba-technical/2019-Octo=
ber/134470.html

Signed-off-by: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
---
=C2=A0source3/client/smbspool_krb5_wrapper.c | 34 ++++++++++++++++++++---=
---
=C2=A0source3/script/tests/test_smbspool.sh=C2=A0 | 28 ++++++++++++++++++=
+++
=C2=A02 files changed, 55 insertions(+), 7 deletions(-)

diff --git a/source3/client/smbspool_krb5_wrapper.c b/source3/client/smbs=
pool_krb5_wrapper.c
index bd6319ca9c3..a2851d7fbc1 100644
--- a/source3/client/smbspool_krb5_wrapper.c
+++ b/source3/client/smbspool_krb5_wrapper.c
@@ -145,36 +145,56 @@ int main(int argc, char *argv[])
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0snprintf(device_uri, sizeof(d=
evice_uri), "%s", env);
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
-=C2=A0=C2=A0 =C2=A0/* Check if AuthInfoRequired is set to negotiate */
+=C2=A0=C2=A0 =C2=A0/* We must handle the following values of AUTH_INFO_R=
EQUIRED:
+=C2=A0=C2=A0 =C2=A0 *=C2=A0 none: Anonymous/guest printing
+=C2=A0=C2=A0 =C2=A0 *=C2=A0 username,password: A username (of the form "=
username" or "DOMAIN\username")
+=C2=A0=C2=A0 =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and=
 password are required
+=C2=A0=C2=A0 =C2=A0 *=C2=A0 negotiate: Kerberos authentication
+=C2=A0=C2=A0 =C2=A0 *=C2=A0 NULL (not set): will never happen when calle=
d from cupsd
+=C2=A0=C2=A0 =C2=A0 * https://www.cups.org/doc/spec-ipp.html#auth-info-r=
equired
+=C2=A0=C2=A0 =C2=A0 * https://github.com/apple/cups/issues/5674
+=C2=A0=C2=A0 =C2=A0 */
=C2=A0=C2=A0=C2=A0 =C2=A0env =3D getenv("AUTH_INFO_REQUIRED");
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If not set, then just=
 call smbspool. */
=C2=A0=C2=A0=C2=A0 =C2=A0if (env =3D=3D NULL || env =3D=3D "none" || env[=
0] =3D=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_DEBUG("AUTH_INFO_REQ=
UIRED is not set - "
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "execute smbspool");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "executing smbspool");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0/* Pass this printing task to smbs=
pool without Kerberos auth */
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto smbspool;
=C2=A0=C2=A0=C2=A0 =C2=A0} else {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_DEBUG("AUTH_INFO_REQ=
UIRED=3D%s", env);
=C2=A0
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0/* First test the value of AUTH_IN=
FO_REQUIRED
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 * against known possible values
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 */
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0cmp =3D strcmp(env, "none");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (cmp =3D=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_D=
EBUG("Authenticate using none (anonymous) - "
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "execute smbspool");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "executing smbspool");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto smbsp=
ool;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0cmp =3D strcmp(env, "username=
,password");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (cmp =3D=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_D=
EBUG("Authenticate using username/password - "
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "execute smbspool");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "executing smbspool");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto smbsp=
ool;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0/* Now, if 'goto smbspool' still h=
as not happened,
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 * there are only two variants lef=
t:
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 * 1) AUTH_INFO_REQUIRED is "negot=
iate" and then
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 *=C2=A0=C2=A0=C2=A0 we have to co=
ntinue working
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 * 2) or it is something not known=
 to us, then Kerberos
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 *=C2=A0=C2=A0=C2=A0 authenticatio=
n is not required, so just also pass
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 *=C2=A0=C2=A0=C2=A0 this task to =
smbspool
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 */
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0cmp =3D strcmp(env, "negotiat=
e");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (cmp !=3D 0) {
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_ERROR(=
"Authentication unsupported");
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0fprintf(stderr,=
 "ATTR: auth-info-required=3Dnegotiate\n");
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return CUPS_BAC=
KEND_AUTH_REQUIRED;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_DEBUG(=
"Value of AUTH_INFO_REQUIRED is not known "
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "to smbspool_krb5_wrapper, execut=
ing smbspool");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto smbspool;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0snprintf(auth_info_required,
diff --git a/source3/script/tests/test_smbspool.sh b/source3/script/tests=
/test_smbspool.sh
index 01d72101615..c32ace6682e 100755
--- a/source3/script/tests/test_smbspool.sh
+++ b/source3/script/tests/test_smbspool.sh
@@ -66,6 +66,30 @@ test_smbspool_authinforequired_none()
=C2=A0=C2=A0=C2=A0 =C2=A0return 0
=C2=A0}
=C2=A0
+test_smbspool_authinforequired_unknown()
+{
+=C2=A0=C2=A0 =C2=A0cmd=3D'$samba_smbspool_krb5 smb://$SERVER_IP/print4 2=
00 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printing/example.ps=
 2>&1'
+
+=C2=A0=C2=A0 =C2=A0# smbspool_krb5_wrapper must ignore AUTH_INFO_REQUIRE=
D unknown to him and pass the task to smbspool
+=C2=A0=C2=A0 =C2=A0# smbspool must fail with NT_STATUS_ACCESS_DENIED (22=
)
+=C2=A0=C2=A0 =C2=A0# "jjf4wgmsbc0" is just a random string
+=C2=A0=C2=A0 =C2=A0AUTH_INFO_REQUIRED=3D"jjf4wgmsbc0"
+=C2=A0=C2=A0 =C2=A0export AUTH_INFO_REQUIRED
+=C2=A0=C2=A0 =C2=A0eval echo "$cmd"
+=C2=A0=C2=A0 =C2=A0out=3D$(eval $cmd)
+=C2=A0=C2=A0 =C2=A0ret=3D$?
+=C2=A0=C2=A0 =C2=A0unset AUTH_INFO_REQUIRED
+
+=C2=A0=C2=A0 =C2=A0case "$ret" in
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A022 ) return 0 ;;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* )
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0echo "$out"
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0echo "failed to=
 test $smbspool_krb5 against unknown value of AUTH_INFO_REQUIRED"
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return 1
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0;;
+=C2=A0=C2=A0 =C2=A0esac
+}
+
=C2=A0#
=C2=A0# The test enviornment uses 'vlp' (virtual lp) as the printing back=
end.
=C2=A0#
@@ -187,6 +211,10 @@ testit "smbspool_krb5_wrapper AuthInfoRequired=3Dnon=
e" \
=C2=A0=C2=A0=C2=A0 =C2=A0test_smbspool_authinforequired_none || \
=C2=A0=C2=A0=C2=A0 =C2=A0failed=3D$(expr $failed + 1)
=C2=A0
+testit "smbspool_krb5_wrapper AuthInfoRequired=3D(sth unknown)" \
+=C2=A0=C2=A0 =C2=A0test_smbspool_authinforequired_unknown || \
+=C2=A0=C2=A0 =C2=A0failed=3D$(expr $failed + 1)
+
=C2=A0testit "smbspool print example.ps" \
=C2=A0=C2=A0=C2=A0 =C2=A0$samba_smbspool smb://$USERNAME:$PASSWORD@$SERVE=
R_IP/print1 200 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printi=
ng/example.ps || \
=C2=A0=C2=A0=C2=A0 =C2=A0failed=3D$(expr $failed + 1)
--=20
2.20.1




