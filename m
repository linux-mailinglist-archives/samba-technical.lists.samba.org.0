Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED3E6E7A
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2019 09:49:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=7UnMfZjHOnyF435ZjC8+jajODjR2LFpxXEB5hjYdXhM=; b=sfs+BxeJl0HmfDjmw03C3d+IHX
	21qAZ15+Sw+ohC7NWOSXy8JLJwGQGE+9RxmLcp8AnbABmHAbkRWjp3msmGbGtY1sCrfSDXJP8G4iF
	074e4OIOSNFcbe5DCiHx2KuQVZZeRAclisrUVM6uFDf8gHpWeuoX5c12DLa9k8yMaRxkA6wIBxTc8
	gjqIwXEaoXD/zacIBf92i0NUjbapK4o7osB1rGpcqYo5MQUEW/cJyRSoxKRj+l+jdKts3BYmNBJXK
	GAKqbeObGX0gvfwt3emV4xIAZzcbsIqNCimyMGIDVW3CcukXOdr5NMvCRb9anUZHvaZsxSTe7pqQE
	jln2+kPw==;
Received: from localhost ([::1]:42646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iP0h4-002wW5-47; Mon, 28 Oct 2019 08:48:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iP0h0-002wVy-28
 for samba-technical@lists.samba.org; Mon, 28 Oct 2019 08:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=7UnMfZjHOnyF435ZjC8+jajODjR2LFpxXEB5hjYdXhM=; b=TPEmrmAmOqDkmuow5sXSDJcn4A
 7tM1bqkqV7T6jzwQzF9ULGM8xzfKATLQSmsEogkfSGbqnbJC6lxitKpTS5FJUPwVUPd6IXXVtcWkb
 SUJTKbEwL7Cm9pkAKqQsqMDi4UnzsWmG1aWWVehzj7wPGuVEVQwIzCTg4nP5DXAkStf7aQPZolNiV
 s5ANSNrm5ZqPvfJj+j40VPROB74vd2yo5dOcTog4LXlSZL1Q+If9Qt9f6/fWtq4pIieLkFewYMIFd
 u+YrFSyii6BTGn2Ngd+6eYztOelGcLXqYYAiGSvI/kJiro0msYjDhTplIA0KdHlmBWu75TeFV2tVs
 DlY20g5aCbqsKLY5J6/1XNTPFxr0So2DElycYoa3+LxA6OY1ABVyxVCQciamvQAr3wwHa+F+Y2AQJ
 2DlaDzIavSeJPsThBycD0NLYFflOMQKZQ0k1dqHtmIuqvgC4kK7Td8ddx2wFHkdEjZuxi8JRY2pQR
 qPNn73Wc/jhXcgVvmuk8dJkF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iP0gy-0003RJ-TP; Mon, 28 Oct 2019 08:48:01 +0000
To: samba-technical@lists.samba.org,
 Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: Re: Automating usage of smbspool_krb5_wrapper
Date: Mon, 28 Oct 2019 09:47:59 +0100
Message-ID: <1853953.WXbCIQQCWo@magrathea>
In-Reply-To: <7837d34e-dd46-2f3e-c14c-c9bd6510b940@rosalinux.ru>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <dda32395-9ac0-9dad-5528-7f284f5101df@rosalinux.ru>
 <7837d34e-dd46-2f3e-c14c-c9bd6510b940@rosalinux.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via samba-techni=
cal=20
wrote:
> 28.10.2019 10:44, Mikhail Novosyolov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > <...>
> > There are 2 possible solutions:
> >=20
> > 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto
> > smbspool;" if env does not contain "negotiate" instead of chekcing to
> > be either null or 0 - how correct will this be?
>=20
> I mean this:
>=20
> diff --git a/source3/client/smbspool_krb5_wrapper.c
> b/source3/client/smbspool_krb5_wrapper.c
> index bff1df417e8..000a613291e 100644
> --- a/source3/client/smbspool_krb5_wrapper.c
> +++ b/source3/client/smbspool_krb5_wrapper.c
> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
>          env =3D getenv("AUTH_INFO_REQUIRED");
>=20
>           /* If not set, then just call smbspool. */
> -       if (env =3D=3D NULL || env[0] =3D=3D 0) {
> +       if (env =3D=3D NULL || env =3D=3D "none" || env[0] =3D=3D 0) {
>                  CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set - "
>                                 "execute smbspool");
>                  goto smbspool;

This is obviously wrong :-)

Did you see the code below? The question is if we should map

AUTH_INFO_REQUIRED=3Dnone

to anonymous. I've created a patchset you can find here:

https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads/master=
=2Dsmbspool


However you need to try all combinations, username/password, kerberos and n=
one=20
for anonymous.


	Andreas


=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



