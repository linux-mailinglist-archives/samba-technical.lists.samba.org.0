Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B260B1148A5
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 22:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0gtWzgpHOdzGwLy3eEDgJjgSrtuVPf+HqedfG2+sXto=; b=RpyTvNL5b1+9T+k7STBfsdKGkx
	FKEuH3O9PVrpRldJrUflkLSSDQRH3tW2lEWjGZ++ifr+NGUgryN5cESN+ldIT0cBhLCQT772+9hBD
	GkTbVVGY4EEREgk7CB0baFsJZe2t/BUxOkyjGPRsz30uT0899PNbqkH1ONwgXKIMdOlBFE4N5wY2I
	UNLX0+8pObQc3Mp8bCsJqAHTBSoiPoJ9TsfiuT5c+gGDdjPmzA9VbmQ9Hi/AL9sc8cX2vC1e0/zv4
	pQrZZCzstaji+JTl9lgucEdbLZboYTS4V6ZuZlhF6QVxwpUqtDr2s6MBK641h29ZdKBDhp3mYonfr
	bGRbBzcw==;
Received: from localhost ([::1]:50790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icygb-006Kb8-2a; Thu, 05 Dec 2019 21:29:21 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:52712) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1icygW-006Kb1-Ct
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 21:29:18 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id D7C3BC484D588;
 Fri,  6 Dec 2019 00:29:13 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nSYT2jw3HtBt; Fri,  6 Dec 2019 00:29:13 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 285A3CB366B70;
 Fri,  6 Dec 2019 00:29:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 285A3CB366B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1575581353;
 bh=0gtWzgpHOdzGwLy3eEDgJjgSrtuVPf+HqedfG2+sXto=;
 h=From:To:Message-ID:Date:MIME-Version;
 b=iD7vtE5JbRwN9vDyH8UGXVV0HOdAZzPV0fqx6T2gTxF8Y7VuDER1gPxRAFB282cFQ
 iN9x0sSD39D29bIZdiefe35MaAER8inkwfIZ2S/XohII0FlUYGKT/SD90ug2h8t29Y
 1j+dBKW6BkEHddQTXB+zlia7lOSUsE3nsF3gOvB0LaSPnGJJLfyScwtKujaOsNdvKu
 fFJhQkO1InUrp93wHHtYkumvUzSlS10HAZAUVsapkHJtwxk3Bh3H8UTrX7BFD7J7dJ
 j6fe1sBEbnK5Sym4j8AsueFat6gCv7qllJcM6aPDqdQ0c6WwHZKNa4+JQYgPnQG0xn
 sn1XJba9xORTQ==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id weabDq_Gd0dD; Fri,  6 Dec 2019 00:29:13 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-11.ip.moscow.rt.ru
 [90.154.70.11])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 0273EC484D588;
 Fri,  6 Dec 2019 00:29:12 +0300 (MSK)
Subject: Re: [PATH 1/4] Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1574444045.gU553saExv@magrathea>
 <c767314c-4517-20f1-538f-7a34a35c1086@rosalinux.ru>
 <1925046.vXGPc2B9mm@magrathea>
 <2c1be5c9-45c3-7807-2c02-4654a3055305@rosalinux.ru>
Message-ID: <47aa700e-de61-29ba-5118-9fc6a721f619@rosalinux.ru>
Date: Fri, 6 Dec 2019 00:29:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <2c1be5c9-45c3-7807-2c02-4654a3055305@rosalinux.ru>
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


From 3ad5ed9bc31d46360b6bf025773bf8ade4717bf8 Mon Sep 17 00:00:00 2001
From: Andreas Schneider <asn@samba.org>
Date: Mon, 28 Oct 2019 09:35:34 +0100
Subject: [PATCH 1/4] smbspool: Map AUTH_INFO_REQUIRED=3Dnone to anonymous
=C2=A0connection

Signed-off-by: Andreas Schneider <asn@samba.org>
---
=C2=A0source3/client/smbspool.c | 9 +++++++--
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/source3/client/smbspool.c b/source3/client/smbspool.c
index 36f7f67ca94..34def0c91a9 100644
--- a/source3/client/smbspool.c
+++ b/source3/client/smbspool.c
@@ -287,7 +287,7 @@ main(int argc,=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0/* I - Number of command-line arguments */
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0auth_info_required =3D getenv("AUTH_INFO_REQUIRE=
D");
=C2=A0=C2=A0=C2=A0 =C2=A0if (auth_info_required =3D=3D NULL) {
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0auth_info_required =3D "none";
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0auth_info_required =3D "samba";
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/*
@@ -718,7 +718,9 @@ smb_connect(struct cli_state **output_cli,
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0fprintf(stderr,
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0"DEBUG: Tr=
y to connect using username/password ...\n");
-=C2=A0=C2=A0 =C2=A0} else {
+=C2=A0=C2=A0 =C2=A0} else if (strcmp(auth_info_required, "none") =3D=3D =
0) {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto anonymous;
+=C2=A0=C2=A0 =C2=A0} else if (strcmp(auth_info_required, "samba") =3D=3D=
 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (username !=3D NULL) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0flags |=3D=
 CLI_FULL_CONNECTION_FALLBACK_AFTER_KERBEROS;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0} else if (kerberos_ccache_is=
_valid()) {
@@ -731,6 +733,8 @@ smb_connect(struct cli_state **output_cli,
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0"DEBUG: This backend requires credentials!\n");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return NT_=
STATUS_ACCESS_DENIED;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
+=C2=A0=C2=A0 =C2=A0} else {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return NT_STATUS_ACCESS_DENIED;
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0nt_status =3D smb_complete_connection(&cli,
@@ -780,6 +784,7 @@ smb_connect(struct cli_state **output_cli,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * last try. Use an=
onymous authentication
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
=C2=A0
+anonymous:
=C2=A0=C2=A0=C2=A0 =C2=A0nt_status =3D smb_complete_connection(&cli,
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 myname,
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 server,
--=20
2.20.1




