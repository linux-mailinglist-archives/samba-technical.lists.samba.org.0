Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B43E41E5
	for <lists+samba-technical@lfdr.de>; Mon,  9 Aug 2021 10:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=jWzpWOl963UhE4xCngX0AFIc6tZ8eMUbzs671Ov1cjc=; b=AXFiJwpTW5dUBUy23Z2F8lzIAe
	XzBNgFpM0NCTaLMA+O+gRDyis6EEJNOkePeZE/OAlCgPLfzxQSZSHaFiZXbtZSnlmvLBy1EU0VQFN
	J7ZBGiqZBkrebMgpi5mlUBy40esHcFgYFC15HMLWjzOSWCqsoCOMRz/iRxJ6PMJrfT0zsGABuktU6
	67xrjbyIdamEkkvOms6SgEj8kvUvZbO/mDF6rjpOAZg4XjoKtU0n01sk5KHKjtQSmyoQlREf1cikE
	yDgFdADLMugA6fcJwrHpxKdL2KZZZzD8N+BIF2HMrxkSrh+nKRVSAc5I3fcm8GUhn5+M+xVuGZeDB
	GlmzBukg==;
Received: from ip6-localhost ([::1]:34286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mD12d-005HZT-4X; Mon, 09 Aug 2021 08:53:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14988) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mD12W-005HXg-GL
 for samba-technical@lists.samba.org; Mon, 09 Aug 2021 08:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=jWzpWOl963UhE4xCngX0AFIc6tZ8eMUbzs671Ov1cjc=; b=U/x3flGuz5apgiyT9gGcU3q9R1
 Mees22fj89hKvTXe6YerwnWmZpWbmiA/rLw3/Kl5eoMTWQqLyo5UZllMNz0lXDEwSgVo9yFdBJ5TC
 ll5ZJfFOqMtftkwmtVtxaPIrEH/m4BvFvp739tDMKpmusMn90ZzQMp/mK7Ftb88GhxU3bvkeZa9BC
 Ov/7RP5LdakzbtUufMpMRt8bjHVI7xHpM7WIdCXGNywfA2i5uIjqKMflkPSI7N4jxyV5tRAw2O9v/
 FUVHz8VoLa3dcN1NVx2aDSS0Z5v0O2DcCvWBsGE/zwb4guU/A2wB6nfRlRfTmyXzRaJSdWYqXPzyE
 UzUTO9cLOMdl8X3hyLdVnDC42J/SL4nveIxX7UQ5iXIvvYuiwbu6vKV9+FFWFKRSzMKfVSf0GK7b0
 kQ6A1s5BuyAIpOufkuFiH7tZmzWNDrjyaNltBuTyHuQ5dsD35BpM6DQI56yjHsckwtgRpTPwQEgZR
 yPecGaQujUbn1FTnOzAUKP/W;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mD12S-000KJE-1L; Mon, 09 Aug 2021 08:53:40 +0000
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@gmail.com>
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
 <c328766b-d894-517f-966c-fa5305558633@samba.org>
 <a78f79643b03b31afbe505b932df2cc46fb0254d.camel@samba.org>
 <0a68b013c3d1d6988d54ef5473a47e50973d0892.camel@samba.org>
 <fb006a0427d71d5f05a6217ff19e12974a6b647d.camel@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
Message-ID: <376f7f62-7ebd-fa37-45d9-dda065f7517d@samba.org>
Date: Mon, 9 Aug 2021 10:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fb006a0427d71d5f05a6217ff19e12974a6b647d.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="h5ibYGclL689A3Rzo0NsE55V4Cwo6jtAf"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--h5ibYGclL689A3Rzo0NsE55V4Cwo6jtAf
Content-Type: multipart/mixed; boundary="dNtvE1nmmoGwxaogK5Vmt2q0yKO1BVBLd";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@gmail.com>
Message-ID: <376f7f62-7ebd-fa37-45d9-dda065f7517d@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
 <c328766b-d894-517f-966c-fa5305558633@samba.org>
 <a78f79643b03b31afbe505b932df2cc46fb0254d.camel@samba.org>
 <0a68b013c3d1d6988d54ef5473a47e50973d0892.camel@samba.org>
 <fb006a0427d71d5f05a6217ff19e12974a6b647d.camel@samba.org>
In-Reply-To: <fb006a0427d71d5f05a6217ff19e12974a6b647d.camel@samba.org>

--dNtvE1nmmoGwxaogK5Vmt2q0yKO1BVBLd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Am 09.08.21 um 03:37 schrieb Andrew Bartlett:
> On Mon, 2021-08-09 at 11:12 +1200, Andrew Bartlett via samba-technical
> wrote:
>> On Fri, 2021-07-09 at 22:29 +1200, Andrew Bartlett via samba-
>> technical
>> wrote:
>>> We now have a mostly-working branch of current Heimdal on current
>>> Samba, compiling on all our supported system, which is pretty
>>> impressive.
>>
>> I just wanted to wrap back to the list with an update.  Thanks to
>> some
>> great work with Luke Howard recently, host of our pull requests with
>> Heimdal have either been merged or will be shortly (as in, I made the
>> requested changes and expect them to be accepted).
>>
>> This means that we are actually fairly close to upstream Heimdal,
>> closer than we ever have been I dare to suggest.
>>
>> The remaining changes outstanding are:
>> ...
>=20
> There are also, which were on the Samba side, the attached.
>=20
> I'm not really sure about them - I think
>=20
> source4/heimdal/lib/krb5/init_creds_pw.c KRB5_NT_ENTERPRISE_PRINCIPAL
> ctx->flags.canonicalize =3D 1
>=20
> is trying to do the same as the Samba-side commit:
>=20
> testprogs/blackbox/ --enterprise --canonicalize
>=20
> Is that the case, and so could we drop the Heimdal side now?

I don't think enterprise principals will work without canonicalize
and we have also non-blackbox cases we need to handle.

Just try and check if all our tests still work.
It seems our C code uses krb5_get_init_creds_opt_set_canonicalize(),
so we may not need that patch.

> I also don't know what=20
> source4/heimdal/lib/krb5/mcache.c anonymous resolving
> is for or fixes.  Can you shed some light on this?

This needed in order to have memory credential caches, which are not
part of the global credential cache collection, but are still available
to be opened by explicit name, which is the exact usage we need for any
in memory caches.

The whole global credential cache collection magic seems to be very dange=
rous
for application like samba, which need to use kerberos on behalf of diffe=
rent unrelated identities.

We already had very strange things happen with MIT, which where very hard=
 to debug,
setenv("KRB5CCNAME", "MEMORY:libads", 1) completely ignores the ':libads'=
 part!
It always iterates over *all* caches with a "MEMORY:" prefix and use the =
first cache
that has a tgt in the used realm, which may means we authenticate as a co=
mpletely
unexpected user (maybe administrator), while we want to do an LDAP operat=
ion
on behalf of the local machine account.

metze


--dNtvE1nmmoGwxaogK5Vmt2q0yKO1BVBLd--

--h5ibYGclL689A3Rzo0NsE55V4Cwo6jtAf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmEQ7Q8ACgkQDbX1YShp
vVZ9sQ//aiC3lDgEuv9r4szJOdKxa4cM14tomuU2GL0ip9Sq+AM5fbeipBMOJeYG
O3RG4NMfHDC7emEymN61W9am9dktw+GwLansJeQ2IK6i9FFgNdp/GGCgMUAY2BVn
mOBrrlWOhiyC7JRy+0yQU0ljtyKrGcqFmfwZN5Ma+98iFwD4qOO0X6su0JHvzePs
TZiYd8Z+amJMn2724vNmPkj3m/47k/HALrH1e/0NPnPJfQr7opvQk/7x+6zDU5H2
0L51v8XSB/PfAAlK/vuM33EakpoW8HDiI05ZzSR/IurWHy2sRZWLZc9Rkw2HTv9B
c8ULSUCEaoucHrqjtbMJa2x8aPOrKHNTCb/LejhP97/gA8JmbOZfFT3SsoGmwoUA
7XNjSmCfmTynceXSpq1VvzpuOAg/pr422JGSOOUJkBvKUPNW3OApsFVX2m+8SnFq
GxHLGQMdVxe4F/zizTn7FZWN2Gdt+Bqn6GJbx+lYzx9HmngdtmBrPSFN/EX0lJnZ
ovuAw1jxXz5L+odzm/JDYv8hoJ7fMQsjMzcH2qzLy6mJ59iRXQqekbxWT+25ui1x
/CUGig5jB3d6OfeRBzr1VNxfxrUD6XLXUTQZJ0pSKl6DtGyaWbBtLqoj9qZjcSPG
JiDykYxyvtYm961sucWi7ZJ2uB7vWGo5YMEszvcQXXmaV2OI6Cw=
=28qZ
-----END PGP SIGNATURE-----

--h5ibYGclL689A3Rzo0NsE55V4Cwo6jtAf--

