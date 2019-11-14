Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F43FC310
	for <lists+samba-technical@lfdr.de>; Thu, 14 Nov 2019 10:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=I9wo8b/2a55COuNdTUH7bRbFxCF9mWYps4lUKGzmWOs=; b=aI9KuButCNOm/Qb7LJYG6nddbK
	/Xyz5ph+JGqyLoeaTnLTK/QkWkVN1BVd2FeJW47/gC7PWB+vyRYShKvgZ/CPNzoe0hkaPjcJ6DWlz
	LTsxIZiCjwsPHI3+T3n+1MUBbjmAg+80TQI/927/UFget3zRno+yqd/j3xNm34rwnPCmahWMAJ+AJ
	djia7mXryVh0yuCuLqmlf22PgxxWpPWTNJR6nfrLQa7wD/iIS0E7qNUvexmlsgBJBoyumOXj6bXvQ
	6M0ENjD9278d1MunKP1FpP1aZhcTGi+mts5Q4vLvNg4BkJuHQYfi6xpVR8ZJuV5rlVJXUuqFScDrb
	l8rfGQ8Q==;
Received: from localhost ([::1]:21744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iVBmj-000TLx-3f; Thu, 14 Nov 2019 09:51:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37964) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iVBme-000TLq-8C
 for samba-technical@lists.samba.org; Thu, 14 Nov 2019 09:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=I9wo8b/2a55COuNdTUH7bRbFxCF9mWYps4lUKGzmWOs=; b=wYJmQwyQxXVEsrHtkpj0Pav30Z
 ydbnu9cIBcDhmftd1BW6dcnk+Q3sG9OHhwQLO32bO5tJdruDTyfJtEnWf+iakPFMAmAqWVvWOBZbw
 3JYwnj1JOY71Ml162baWwGUPiFe4WJKE7rOGW+LMWrl9d9WZzwoSLXgh0RzF+WN8FhJRH5Fiyac45
 ioMKKAQWC1/PXmfHESiISW0vYwUQXbkOH7eGQZBFu7KwHoJ3huTyW8R9zYotOOrEAyliIq9j0cB2V
 wdq1/MFnSbuuATB1YCHC2Xl0DUqrOOk0tPoWsV5/UHY5mz2nmUfKuQrYCJ7Sqv4IsUZva5pBMKPnv
 G+WJl01Z0JSR813RGJP2g74lhJtkmdY4UJh1eGPatJvq6p11YYFsp78QvrnB7+ZyJUqLfZmr0qJcZ
 J41xjJ7zx9eevOdw1BXjCpFZFfaKda2XwjNhczWrqBt4dr0rOKoFz9xX0KkEEWoLAOvWFGU5dF5/z
 mrw//5RVlMZjLrZGuqDAPtLM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iVBmc-00059i-KL; Thu, 14 Nov 2019 09:51:22 +0000
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: Re: Automating usage of smbspool_krb5_wrapper
Date: Thu, 14 Nov 2019 10:51:22 +0100
Message-ID: <5586929.0Fyjv50KOk@magrathea>
In-Reply-To: <7e571555-5d87-a566-dbf1-4a1c33c67ea8@rosalinux.ru>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <18291618.dcJLbluVCs@magrathea>
 <7e571555-5d87-a566-dbf1-4a1c33c67ea8@rosalinux.ru>
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

On Sunday, 3 November 2019 01:03:43 CET Mikhail Novosyolov wrote:
> 29.10.2019 10:29, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Monday, 28 October 2019 20:38:08 CET Mikhail Novosyolov wrote:
> >> 28.10.2019 11:47, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via
> >>> samba-technical>
> >>>=20
> >>> wrote:
> >>>> 28.10.2019 10:44, Mikhail Novosyolov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> <...>
> >>>>> There are 2 possible solutions:
> >>>>>=20
> >>>>> 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto
> >>>>> smbspool;" if env does not contain "negotiate" instead of chekcing =
to
> >>>>> be either null or 0 - how correct will this be?
> >>>>=20
> >>>> I mean this:
> >>>>=20
> >>>> diff --git a/source3/client/smbspool_krb5_wrapper.c
> >>>> b/source3/client/smbspool_krb5_wrapper.c
> >>>> index bff1df417e8..000a613291e 100644
> >>>> --- a/source3/client/smbspool_krb5_wrapper.c
> >>>> +++ b/source3/client/smbspool_krb5_wrapper.c
> >>>> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
> >>>>=20
> >>>>            env =3D getenv("AUTH_INFO_REQUIRED");
> >>>>           =20
> >>>>             /* If not set, then just call smbspool. */
> >>>>=20
> >>>> -       if (env =3D=3D NULL || env[0] =3D=3D 0) {
> >>>> +       if (env =3D=3D NULL || env =3D=3D "none" || env[0] =3D=3D 0)=
 {
> >>>>=20
> >>>>                    CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set - "
> >>>>                   =20
> >>>>                                   "execute smbspool");
> >>>>                   =20
> >>>>                    goto smbspool;
> >>>=20
> >>> This is obviously wrong :-)
> >>>=20
> >>> Did you see the code below? The question is if we should map
> >>>=20
> >>> AUTH_INFO_REQUIRED=3Dnone
> >>>=20
> >>> to anonymous. I've created a patchset you can find here:
> >>>=20
> >>> https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads/=
master-sm
> >>> bs
> >>> pool
> >>>=20
> >>>=20
> >>> However you need to try all combinations, username/password, kerberos
> >>> and
> >>> none for anonymous.
> >>=20
> >> Thank you! I did not test these patches yet, first tried to understand
> >> how it works.
> >>=20
> >> Could you please explain a bit how it works?
> >=20
> > That's a good question as documentation from CUPS side is missing. So we
> > need to find out what CUPS does and then try to write tests for it if
> > possible. This allows us to make sure we work correctly. The repo above
> > shows you where the test is in the samba source code. I've tried to add
> > more tests in the past to avoid regressions and verify we work correctl=
y.
> > This needs to be extended as much as possible.
> >=20
> >=20
> > The two patches were just a quick shot.
>=20
> CUPS developer has clearified documentation:
>=20
>   * https://github.com/apple/cups/issues/5674
>   *
> https://github.com/apple/cups/commit/025b8ce8f637009f0df7a5bb5fa0a460dbb3=
2b
> 10
>=20
> "'negotiate': Kerberos is required - this keyword can only appear by
> itself and causes cupsd to collect the UID of the printing user."
>=20
> I've switched smbspool_krb5_wrapper from failing if value of
> AUTH_INFO_REQUIRED is something not known to just ignoring that and
> passing the task to smbspool. smbspool will fail itself. Added a test
> for that. Patches on top of asn/samba.git/master-smbspool are attached.
>=20
> I've not tested those changes yet, just checked buildability. Testing
> will require making a complex set up, I will try.


They look fine, let me know if it works!


Thanks.

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



