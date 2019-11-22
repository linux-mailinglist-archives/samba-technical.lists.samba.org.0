Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C839F106A17
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 11:31:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=SUZx1hAjOcCTbU0OfbxCdvFxT7LE4Ir8VLyijEqPHjU=; b=RcE1m81FGGUF2gk/eSMRg67ecv
	41F9zIX3ng5k5Axjigyd/BzojjCqKUbqLu6uLpGJsKbjX2AQBUilEuJCo9ETwVDpluo9WRPoShJ7t
	Bptbt0H3/tEZ4td8vjigbyRGHU7G9gYoCVkDMELH8QcKOOFfuzE7GamkQp2QwgYuBc7+RM0LLmcZc
	Lvyz4RUThzK3iiSJfsHivQ4ADse7mpWPhAkQpMad3ooTXIFJRjQe9UKKHI95IV9FP6VBMAkXdTnlY
	4/e/qyDKdWBLcLNP32KX/puqLKfDLq9lO2MuxInBptAW/6ZhGywXBv/ujET6G+4inC4jqOMJCxsDd
	6uGyKs8w==;
Received: from localhost ([::1]:54280 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iY6E7-0021Qq-Dd; Fri, 22 Nov 2019 10:31:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19364) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY6E3-0021Qj-DX
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 10:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=SUZx1hAjOcCTbU0OfbxCdvFxT7LE4Ir8VLyijEqPHjU=; b=jo2T58aGWidLgO6/dgOOBiyLA4
 PLoml15YTJVwE37qMCebjM8PqMYIglgXE9y8jGfpxDDEUjE7LIKHdgvTcWNgVOzr2TBpkSypZ0G4p
 23vTOc8BjF3T652+ahcdTuHMjeehZ4YOMmkn3DGpvD2rrqOG4jqNVEpLQPfTnwUa8bFgw6LhEA0Xa
 zou5RZkt58b5sB/5l3+bx8Uf3kUaEzRuYpGNYZvRbl+aLgjO48UB7IqF/AidQOZGZpgjXVUgnD+dS
 UeoAqlEZmBcsL5/h6KjWcRECgoMTzRij4CyFcb20FQF7VgKVobDtnu32QjxrX7sqVQFfQgOmHLg9K
 fMYvue+UqDw1zS7ks0UHNtHhdR0+eDjnql0NJaeAOOcZDTfD2KMmpJ3JOaJy0RV5GJLvgYEoK0xRv
 bPI9VENxzP+sMBiPRuxKEuA9tpCDh4Q/aFIdswNmMVQUh2pm08++udGyaU9FDmOKxfVQ7zN4XqhEy
 jFpPljrrJ3BC8KjoEPP2t3s+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iY6E3-00032C-0K
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 10:31:43 +0000
To: <samba-technical@lists.samba.org>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <18291618.dcJLbluVCs@magrathea>
 <7e571555-5d87-a566-dbf1-4a1c33c67ea8@rosalinux.ru>
 <5586929.0Fyjv50KOk@magrathea>
 <0a9d2586-38ab-7c6c-7bcc-8ffc94303495@rosalinux.ru>
 <c5ef0b5b-a1d2-e3f0-2941-13512029caf3@samba.org>
In-Reply-To: <c5ef0b5b-a1d2-e3f0-2941-13512029caf3@samba.org>
Subject: RE: Automating usage of smbspool_krb5_wrapper
Date: Fri, 22 Nov 2019 11:31:42 +0100
Message-ID: <9AADDDE9251C45DC8E48BED0B6261996@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdWhFdi9F5DtneDxQUeau7nAa/JrMAAAFw6g
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Rowland penny via samba-technical
> Verzonden: vrijdag 22 november 2019 10:19
> Aan: samba-technical@lists.samba.org
> Onderwerp: Re: Automating usage of smbspool_krb5_wrapper
>=20
> On 22/11/2019 02:22, Mikhail Novosyolov via samba-technical wrote:
> > 14.11.2019 12:51, Andreas Schneider ?????:
> >> On Sunday, 3 November 2019 01:03:43 CET Mikhail Novosyolov wrote:
> >>> 29.10.2019 10:29, Andreas Schneider ?????:
> >>>> On Monday, 28 October 2019 20:38:08 CET Mikhail Novosyolov wrote:
> >>>>> 28.10.2019 11:47, Andreas Schneider ?????:
> >>>>>> On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via
> >>>>>> samba-technical>
> >>>>>>
> >>>>>> wrote:
> >>>>>>> 28.10.2019 10:44, Mikhail Novosyolov ?????:
> >>>>>>>> <...>
> >>>>>>>> There are 2 possible solutions:
> >>>>>>>>
> >>>>>>>> 1) either patch=20
> source3/client/smbspool_krb5_wrapper.c to "goto
> >>>>>>>> smbspool;" if env does not contain "negotiate" instead of=20
> >>>>>>>> chekcing to
> >>>>>>>> be either null or 0 - how correct will this be?
> >>>>>>> I mean this:
> >>>>>>>
> >>>>>>> diff --git a/source3/client/smbspool_krb5_wrapper.c
> >>>>>>> b/source3/client/smbspool_krb5_wrapper.c
> >>>>>>> index bff1df417e8..000a613291e 100644
> >>>>>>> --- a/source3/client/smbspool_krb5_wrapper.c
> >>>>>>> +++ b/source3/client/smbspool_krb5_wrapper.c
> >>>>>>> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
> >>>>>>>
> >>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env =3D =
getenv("AUTH_INFO_REQUIRED");
> >>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* If not set, then just=20
> call smbspool. */
> >>>>>>>
> >>>>>>> -=A0=A0=A0=A0=A0=A0 if (env =3D=3D NULL || env[0] =3D=3D 0) {
> >>>>>>> +=A0=A0=A0=A0=A0=A0 if (env =3D=3D NULL || env =3D=3D "none" =
|| env[0] =3D=3D 0) {
> >>>>>>>
> >>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not=20
> >>>>>>> set - "
> >>>>>>> "execute smbspool");
> >>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto smbspool;
> >>>>>> This is obviously wrong :-)
> >>>>>>
> >>>>>> Did you see the code below? The question is if we should map
> >>>>>>
> >>>>>> AUTH_INFO_REQUIRED=3Dnone
> >>>>>>
> >>>>>> to anonymous. I've created a patchset you can find here:
> >>>>>>
> >>>>>>=20
> https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads
/master-sm=20
> >>>>>>
> >>>>>> bs
> >>>>>> pool
> >>>>>>
> >>>>>>
> >>>>>> However you need to try all combinations, username/password,=20
> >>>>>> kerberos
> >>>>>> and
> >>>>>> none for anonymous.
> >>>>> Thank you! I did not test these patches yet, first tried to=20
> >>>>> understand
> >>>>> how it works.
> >>>>>
> >>>>> Could you please explain a bit how it works?
> >>>> That's a good question as documentation from CUPS side=20
> is missing.=20
> >>>> So we
> >>>> need to find out what CUPS does and then try to write=20
> tests for it if
> >>>> possible. This allows us to make sure we work correctly.=20
> The repo=20
> >>>> above
> >>>> shows you where the test is in the samba source code.=20
> I've tried to=20
> >>>> add
> >>>> more tests in the past to avoid regressions and verify we work=20
> >>>> correctly.
> >>>> This needs to be extended as much as possible.
> >>>>
> >>>>
> >>>> The two patches were just a quick shot.
> >>> CUPS developer has clearified documentation:
> >>>
> >>> =A0=A0 * https://github.com/apple/cups/issues/5674
> >>> =A0=A0 *
> >>>=20
> https://github.com/apple/cups/commit/025b8ce8f637009f0df7a5bb5
> fa0a460dbb32b=20
> >>>
> >>> 10
> >>>
> >>> "'negotiate': Kerberos is required - this keyword can=20
> only appear by
> >>> itself and causes cupsd to collect the UID of the printing user."
> >>>
> >>> I've switched smbspool_krb5_wrapper from failing if value of
> >>> AUTH_INFO_REQUIRED is something not known to just=20
> ignoring that and
> >>> passing the task to smbspool. smbspool will fail itself.=20
> Added a test
> >>> for that. Patches on top of asn/samba.git/master-smbspool=20
> are attached.
> >>>
> >>> I've not tested those changes yet, just checked=20
> buildability. Testing
> >>> will require making a complex set up, I will try.
> >>
> >> They look fine, let me know if it works!
> >>
> >>
> >> Thanks.
> >
> > How to make Samba AD domain controller make all local printers=20
> > available only to domain members? I've made a local PDF=20
> printer which=20
> > writes to PDF files in CUPS and want to use it for testing=20
> and be sure=20
> > that Kerberos authorization is used to access the printer.
> >
> > [printers]
> > =A0=A0=A0 path =3D /var/spool/samba/
> > =A0=A0=A0 printable =3D yes
> > =A0=A0=A0 #guest ok=3Dyes
> > =A0=A0=A0 security =3D domain
> >
> > Is it correct? I am not sure about "security =3D domain".
> >
> >
> Sorry, but it isn't,=A0 the 'security' parameter is only valid=20
> in [global]=20
> and if you read 'man smb.conf' it tells you this:
>=20
> PARAMETERS
>=20
> Parameters define the specific attributes of sections.
>=20
> Some parameters are specific to the [global] section (e.g., security).
>=20
> Not being a printing expert, ( Louis will know this ) but is=20
> it possible  to deny access by Windows ACLs ?

Yes, and Deny preffers over Allow, always..=20


In this not related to:=20
https://github.com/samba-team/samba/blob/8c833470fc52332c62220ec9cc38c8a4=
fd7
721f1/source3/client/smbspool.c#L120=20

Where andreas fix things in 4.8.0
(https://bugzilla.redhat.com/show_bug.cgi?id=3D1574177)=20
The other i noticed : =
https://bugzilla.redhat.com/show_bug.cgi?id=3D1772450=20

And I did notice something in the cups protocol parts.
(seen on arch linux: https://bugs.archlinux.org/task/58247 )=20
There is currently a bug in cups, that gives problems with logins.=20
I can confirm this also is on Debian 10.=20

This fix works, so before a lot of code is changed, i might be handy if =
cups
fixes this first.=20

Edit "/etc/cups/cupsd.conf"

Change:
<Limit CUPS-Add-Modify-Printer CUPS-Delete-Printer CUPS-Add-Modify-Class
CUPS-Delete-Class CUPS-Set-Default CUPS-Get-Devices>
AuthType Default
Require user @SYSTEM
Order deny,allow
</Limit>

To:
<Limit CUPS-Add-Modify-Printer CUPS-Delete-Printer CUPS-Add-Modify-Class
CUPS-Delete-Class CUPS-Set-Default CUPS-Get-Devices>
AuthType None
# AuthType Default
# Require user @SYSTEM
Order deny,allow
</Limit>

I hope above help you guys.
Lot is going on in cups/kerberos/smb areas, it hard for me to track them
all..=20


Greetz,=20

Louis







=20


