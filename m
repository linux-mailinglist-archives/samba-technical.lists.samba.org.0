Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19745E8286
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2019 08:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/ac4vuD804oOtKgm30dOwQxJgXqApEw6ymN5eOSPhx8=; b=PC+xFmB/y3DzL95UiTaWFgF4rz
	ZkklQLgel7Gx2GiYI6EHskTuU8yox/3g/X0IA6PKTLTjda+OVJscsqrSLL43GSAL7wBJbbGAzQZJb
	RlAlqc2+Hw3B5/4C1z1RlGKt0urFxE3zxsY9DjUni/6LwY6TTMnYPIqKIAiTQOXmsnyRNseHc39FV
	gzfyrn72emDjildQ0ty9DVrhmabNkATKvnRb16B9bz4Lg7t+mogaCh1MesqZPSwmhz1FxvUEt+q4C
	S2bTzAwNpoyn1rMzhbdLtNpgU62tq8V2WUfgj/sNxoHRFDICJRLZqXWU33g9uRRMylhgsPPStORD0
	QjM5GYdQ==;
Received: from localhost ([::1]:28030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPLxF-00365k-A7; Tue, 29 Oct 2019 07:30:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20414) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPLwy-00365c-Kv
 for samba-technical@lists.samba.org; Tue, 29 Oct 2019 07:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/ac4vuD804oOtKgm30dOwQxJgXqApEw6ymN5eOSPhx8=; b=JWseoKahNlwdK0NlTpAYoB7DFL
 tywDr50nAlFLbFHFBOD9bzkaeMvnF1nAwmGys3FeBLSGfc40DNZ8VQpDvPP7PfHwFIcWcE+Lxzo+F
 mYDkvtQwvXnzrAWcSkBY6OHl79/LU1/1W4/QOI8VaGxoKJ2FrMTPXsjsF3asBZUIxohr7SAxSmLF6
 LjGVAzs1UsRcGoJNuSKLpF4luyNpboRozJZi/JTI2qk0VxU1Bouz+6k5/bpUbGxzlKYwNH7gIzzyb
 i8Yf6ktGXfX/r1n2H3HpZ4MoaBOOtexJDkh+fVBsscAgtU9uVE50nz4WNxOmXRuVAwDZPsUfQWHat
 BaxDDdk1JKohiVNeE860mnnjxGL1W5VfdywKPqYIU+c7zsh8k73fZFKLW/fZ5SsxRTd2ANOv+oLf+
 /PZ0DgFxZQfbiOUH7sJZNX/Zz9wrA+0fbie3hYjrCftGBd5YqfzQcFOb6iblvZ5EVH4E7Kp+1Xrwd
 tqmODHu8aFm7FLWBbL/kJqie;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPLwx-0003ed-4q; Tue, 29 Oct 2019 07:29:55 +0000
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: Re: Automating usage of smbspool_krb5_wrapper
Date: Tue, 29 Oct 2019 08:29:53 +0100
Message-ID: <18291618.dcJLbluVCs@magrathea>
In-Reply-To: <f21e078f-669f-6590-c0a1-f450f72200be@rosalinux.ru>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1853953.WXbCIQQCWo@magrathea>
 <f21e078f-669f-6590-c0a1-f450f72200be@rosalinux.ru>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 28 October 2019 20:38:08 CET Mikhail Novosyolov wrote:
> 28.10.2019 11:47, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via
> > samba-technical>=20
> > wrote:
> >> 28.10.2019 10:44, Mikhail Novosyolov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> <...>
> >>> There are 2 possible solutions:
> >>>=20
> >>> 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto
> >>> smbspool;" if env does not contain "negotiate" instead of chekcing to
> >>> be either null or 0 - how correct will this be?
> >>=20
> >> I mean this:
> >>=20
> >> diff --git a/source3/client/smbspool_krb5_wrapper.c
> >> b/source3/client/smbspool_krb5_wrapper.c
> >> index bff1df417e8..000a613291e 100644
> >> --- a/source3/client/smbspool_krb5_wrapper.c
> >> +++ b/source3/client/smbspool_krb5_wrapper.c
> >> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
> >>=20
> >>           env =3D getenv("AUTH_INFO_REQUIRED");
> >>          =20
> >>            /* If not set, then just call smbspool. */
> >>=20
> >> -       if (env =3D=3D NULL || env[0] =3D=3D 0) {
> >> +       if (env =3D=3D NULL || env =3D=3D "none" || env[0] =3D=3D 0) {
> >>=20
> >>                   CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set - "
> >>                  =20
> >>                                  "execute smbspool");
> >>                  =20
> >>                   goto smbspool;
> >=20
> > This is obviously wrong :-)
> >=20
> > Did you see the code below? The question is if we should map
> >=20
> > AUTH_INFO_REQUIRED=3Dnone
> >=20
> > to anonymous. I've created a patchset you can find here:
> >=20
> > https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads/ma=
ster-smbs
> > pool
> >=20
> >=20
> > However you need to try all combinations, username/password, kerberos a=
nd
> > none for anonymous.
>=20
> Thank you! I did not test these patches yet, first tried to understand
> how it works.
>=20
> Could you please explain a bit how it works?

That's a good question as documentation from CUPS side is missing. So we ne=
ed=20
to find out what CUPS does and then try to write tests for it if possible.=
=20
This allows us to make sure we work correctly. The repo above shows you whe=
re=20
the test is in the samba source code. I've tried to add more tests in the p=
ast=20
to avoid regressions and verify we work correctly. This needs to be extende=
d=20
as much as possible.


The two patches were just a quick shot.


	Andreas

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



