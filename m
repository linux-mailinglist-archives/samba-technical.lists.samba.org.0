Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6598D107417
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 15:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=nuOxQxbtgfIEJq5gXUDAOWZCD29as+MDdreL5wIrkK0=; b=EpJuJP8Yfxu1QN2LLzrLlIo24Y
	23nPENDcn7eGUS3KfWLBOIsBY3hkUsZNu0KV008w+1hdrUeRZCsuZ3bajlj4cwq4NOAJhI4JmmMFF
	/eF8EdQkyujQah8vMg9VuhEUGnDybLl5FXBgFIUFh+7sbvWY06PcszesYTT203OLndUQ4CcjWQ930
	R9VvxZhlMCI96zw5xDr2W43rxL0m7IAwTMu33RcufHWTe68icktwxhtcIbzeW9uJCp/6VypDlAROQ
	86r44ZV8poMfltBHH//9YrW22YMsa/xIu3pOtTc87uEcl/kC46l0df6NJQ64+xtoW6NEFop2KQ9M4
	YeTQEJrQ==;
Received: from localhost ([::1]:30454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iY9zu-00256j-7J; Fri, 22 Nov 2019 14:33:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14500) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY9zp-00256c-8B
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 14:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=nuOxQxbtgfIEJq5gXUDAOWZCD29as+MDdreL5wIrkK0=; b=WFmKcT3TkruYI6bR61ysAkkrth
 ZRdRgJ7ajs/OziREmpF9zJcfnCDTno+JGNYYezOg1/EyvIGP9PLvUunqrHvMvd27IvkeuE6lc7RfA
 h3ak8KuZWi7VtcPaJjZ+i+r4ZNixlvYqsSChq7R9nXXsnLU0g75Bd1rLWYcmvsISo8Zywhl6J665U
 HnFu/uSc6iOEvz9h9v1X5IHnUXbfRVXGRTBx7YWEG1VQDtEPa0Y63bKKKM1D3a33LFQuq+GGVca24
 ShB6Jif/GyZQIgX91ml2xdsj2F4WHywnX/8FHemG/a4MTU73zhCpYpOfHNdI9ormb3T2Qtlx8ho5/
 nItUx/G+PZU1xVCtCAxc1mQt3NNPshR6f0zCKyFdFfwSEZApfzUcPGHqBGnmOqiudIhaH37mKS9cn
 1uLWZi2j5YPAek6f9hQTTiRuoEU3bOmrrSupTPYHsTjcdPeVqO2REmQsmSl7jmcggorsucnPQU+0r
 qJqigMnSzjeUVFloXcCscCqa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY9zo-0005I1-Dy; Fri, 22 Nov 2019 14:33:16 +0000
To: samba-technical@lists.samba.org,
 Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: Re: Automating usage of smbspool_krb5_wrapper
Date: Fri, 22 Nov 2019 15:33:16 +0100
Message-ID: <1574444045.gU553saExv@magrathea>
In-Reply-To: <0a9d2586-38ab-7c6c-7bcc-8ffc94303495@rosalinux.ru>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <5586929.0Fyjv50KOk@magrathea>
 <0a9d2586-38ab-7c6c-7bcc-8ffc94303495@rosalinux.ru>
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

On Friday, 22 November 2019 03:22:29 CET Mikhail Novosyolov via samba-
technical wrote:
> 14.11.2019 12:51, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sunday, 3 November 2019 01:03:43 CET Mikhail Novosyolov wrote:
> >> 29.10.2019 10:29, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Monday, 28 October 2019 20:38:08 CET Mikhail Novosyolov wrote:
> >>>> 28.10.2019 11:47, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via
> >>>>> samba-technical>
> >>>>>=20
> >>>>> wrote:
> >>>>>> 28.10.2019 10:44, Mikhail Novosyolov =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
> >>>>>>> <...>
> >>>>>>> There are 2 possible solutions:
> >>>>>>>=20
> >>>>>>> 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto
> >>>>>>> smbspool;" if env does not contain "negotiate" instead of chekcing
> >>>>>>> to
> >>>>>>> be either null or 0 - how correct will this be?
> >>>>>>=20
> >>>>>> I mean this:
> >>>>>>=20
> >>>>>> diff --git a/source3/client/smbspool_krb5_wrapper.c
> >>>>>> b/source3/client/smbspool_krb5_wrapper.c
> >>>>>> index bff1df417e8..000a613291e 100644
> >>>>>> --- a/source3/client/smbspool_krb5_wrapper.c
> >>>>>> +++ b/source3/client/smbspool_krb5_wrapper.c
> >>>>>> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
> >>>>>>=20
> >>>>>>             env =3D getenv("AUTH_INFO_REQUIRED");
> >>>>>>            =20
> >>>>>>              /* If not set, then just call smbspool. */
> >>>>>>=20
> >>>>>> -       if (env =3D=3D NULL || env[0] =3D=3D 0) {
> >>>>>> +       if (env =3D=3D NULL || env =3D=3D "none" || env[0] =3D=3D =
0) {
> >>>>>>=20
> >>>>>>                     CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set =
=2D "
> >>>>>>                    =20
> >>>>>>                                    "execute smbspool");
> >>>>>>                    =20
> >>>>>>                     goto smbspool;
> >>>>>=20
> >>>>> This is obviously wrong :-)
> >>>>>=20
> >>>>> Did you see the code below? The question is if we should map
> >>>>>=20
> >>>>> AUTH_INFO_REQUIRED=3Dnone
> >>>>>=20
> >>>>> to anonymous. I've created a patchset you can find here:
> >>>>>=20
> >>>>> https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/head=
s/master-> >>>>> sm
> >>>>> bs
> >>>>> pool
> >>>>>=20
> >>>>>=20
> >>>>> However you need to try all combinations, username/password, kerber=
os
> >>>>> and
> >>>>> none for anonymous.
> >>>>=20
> >>>> Thank you! I did not test these patches yet, first tried to understa=
nd
> >>>> how it works.
> >>>>=20
> >>>> Could you please explain a bit how it works?
> >>>=20
> >>> That's a good question as documentation from CUPS side is missing. So=
 we
> >>> need to find out what CUPS does and then try to write tests for it if
> >>> possible. This allows us to make sure we work correctly. The repo abo=
ve
> >>> shows you where the test is in the samba source code. I've tried to a=
dd
> >>> more tests in the past to avoid regressions and verify we work
> >>> correctly.
> >>> This needs to be extended as much as possible.
> >>>=20
> >>>=20
> >>> The two patches were just a quick shot.
> >>=20
> >> CUPS developer has clearified documentation:
> >>    * https://github.com/apple/cups/issues/5674
> >>    *
> >>=20
> >> https://github.com/apple/cups/commit/025b8ce8f637009f0df7a5bb5fa0a460d=
bb3
> >> 2b
> >> 10
> >>=20
> >> "'negotiate': Kerberos is required - this keyword can only appear by
> >> itself and causes cupsd to collect the UID of the printing user."
> >>=20
> >> I've switched smbspool_krb5_wrapper from failing if value of
> >> AUTH_INFO_REQUIRED is something not known to just ignoring that and
> >> passing the task to smbspool. smbspool will fail itself. Added a test
> >> for that. Patches on top of asn/samba.git/master-smbspool are attached.
> >>=20
> >> I've not tested those changes yet, just checked buildability. Testing
> >> will require making a complex set up, I will try.
> >=20
> > They look fine, let me know if it works!
> >=20
> >=20
> > Thanks.
>=20
> How to make Samba AD domain controller make all local printers available
> only to domain members? I've made a local PDF printer which writes to
> PDF files in CUPS and want to use it for testing and be sure that
> Kerberos authorization is used to access the printer.
>=20
> [printers]
>      path =3D /var/spool/samba/
>      printable =3D yes
>      #guest ok=3Dyes
>      security =3D domain
>=20
> Is it correct? I am not sure about "security =3D domain".

'secruity =3D domain' means it is a NT4-style member :-) That also wont wor=
k on=20
shares.

If you don't specify anything, it requires authentication. You can use 'val=
id=20
users' to restrict the share to certain users or groups.


	Andreas

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



