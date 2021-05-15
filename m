Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EFE3816FE
	for <lists+samba-technical@lfdr.de>; Sat, 15 May 2021 10:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=L/93eEtdki1PiqrLcRRn2Uy2MVr5DJJNDFYAoo1gdY4=; b=ikB4tRtRfMCFDIgnw4GUrEeTp1
	bMsulSidAT9gku+98J4XuT2P/hndA/J6/ZzhqjfqPBlEgCDbViZ2qR4+lqeK7euElo2yG2UQEMilC
	1Va75twy3L0It8U4TdvIktPuxj4MgxUehSmdRBoTg+xZPqtxvu5DegHmfpbtzzLcv/AGJmwmFUh6g
	tn6L3i0PNO7MH6FGnaKy+ySBtaDunu95tU2ZRZWIaUcxbb56X5qTmPsLXaHWgcqF2kgF2cEtnLNx/
	5vloCy8bVm7v7UmCzFH6ZNXKUGX2zBkPrnKqnPHocCjWM5fd+uk8f0eMP3IAac8x6/9dINUYimOdM
	zpIBseaw==;
Received: from ip6-localhost ([::1]:23596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lhpwQ-000Wfw-9Q; Sat, 15 May 2021 08:46:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24278) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lhpwK-000Wfn-Q4
 for samba-technical@lists.samba.org; Sat, 15 May 2021 08:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=L/93eEtdki1PiqrLcRRn2Uy2MVr5DJJNDFYAoo1gdY4=; b=jK9f+E7JUaJxZl6k9Tc4PPCj78
 fwmZ91zisfmhKUJYmTInnZAHCEE2NAplJMdTZqYE849hjABYraGyXBogvPBErwFlv9Ayr/c6zATnu
 7sbj4ZXj1vS1j7iVIw+Rdu/dH2ospt1dVLGueVnSJ8CDmEWoWSjcnRAZLRIVwHtMCgErbM4mhDVWh
 bvz3hyngrU5gyaMWiQdBgjJr2Pf7liqr/nyIJMlb0a3MwkRIh4JE4ON5BDL5lfZ2NZn50DU4OlzkO
 OsLClQSE7jkGcxHmP0MOHpbrFPbWBHEEKslsdTejTTfDprXDXTVybDfoQj0BH91y2vyqA+OSRyYZl
 aoA9kpSULPJkHHieogGByrPuozvyt6D7zyKPhaRZgG+rYqJnOs8jHBe7GKZxrzxqKq9ou3K7n3UbO
 iSblaRkRfoDeYXmBxlr3vsoxkNEeALs2eIaNE4MpS0/eiF7wodVM3GtiNhDlkJo37yDIqnpgXry3L
 GRVFTCi4Qa6EPAzzqf5B0h/F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lhpwJ-0007rQ-Hd; Sat, 15 May 2021 08:46:27 +0000
Subject: Re: Kerberos raw prototol testing
To: Andrew Bartlett <abartlet@samba.org>
References: <3663e2d45ad7855b807286d4d45bba7ef450d9a3.camel@samba.org>
 <a377c5a5-225e-9fc4-a70a-c52145732121@samba.org>
 <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>
 <b08f1fca-9a92-ba28-5515-7918522dc5ff@samba.org>
 <a2a22a8f0c59a86f0ad7f659b1e4d6201a6d7601.camel@samba.org>
 <0085446689a4dbeb12d45ee692fdfb1b52ddfdb6.camel@samba.org>
Message-ID: <9d6213a6-3163-fb45-d443-e8ecd6abd9b5@samba.org>
Date: Sat, 15 May 2021 10:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0085446689a4dbeb12d45ee692fdfb1b52ddfdb6.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="htuB2GNKKkHiP31GjhZflByrivAlYOem1"
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 gary@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--htuB2GNKKkHiP31GjhZflByrivAlYOem1
Content-Type: multipart/mixed; boundary="UrVlpqBLdcQ7HBuUvDI19QL6nDzc5nQQn";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 gary@samba.org
Message-ID: <9d6213a6-3163-fb45-d443-e8ecd6abd9b5@samba.org>
Subject: Re: Kerberos raw prototol testing
References: <3663e2d45ad7855b807286d4d45bba7ef450d9a3.camel@samba.org>
 <a377c5a5-225e-9fc4-a70a-c52145732121@samba.org>
 <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>
 <b08f1fca-9a92-ba28-5515-7918522dc5ff@samba.org>
 <a2a22a8f0c59a86f0ad7f659b1e4d6201a6d7601.camel@samba.org>
 <0085446689a4dbeb12d45ee692fdfb1b52ddfdb6.camel@samba.org>
In-Reply-To: <0085446689a4dbeb12d45ee692fdfb1b52ddfdb6.camel@samba.org>

--UrVlpqBLdcQ7HBuUvDI19QL6nDzc5nQQn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 14.05.21 um 23:37 schrieb Andrew Bartlett:
> On Mon, 2021-05-03 at 12:33 +1200, Andrew Bartlett via samba-technical
> wrote:
>>
>> In this case in particular I've checked the diff and other than of
>> course the pycredentials fix (thanks, obviously good!) this really is
>> quite fine squashed.=20
>>
>> I'm also happy if you keep some of the early preparation patches
>> distinct, eg "python/samba/tests/krb5/rfc4120: better etype
>> dissection"
>> but I wouldn't spend much time beyond that.=20
>>
>> Please propose it squashed down and lets work to get it into master.=20
>=20
> I've done the squash down here:
>=20
> https://gitlab.com/samba-team/samba/-/merge_requests/1953
>=20
> Is this OK?
>=20
> I can fix up the MIT knownfails if that is the only blocker, but I also=

> need your sign-off, particularly as I've written a pile of the commit
> messages for you.=20

Thanks I saw that, I'm in progress to go through them, I'll hopefully pos=
t the result early next week.

metze



--UrVlpqBLdcQ7HBuUvDI19QL6nDzc5nQQn--

--htuB2GNKKkHiP31GjhZflByrivAlYOem1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmCfil8ACgkQDbX1YShp
vVaVrw/+LeZFHXyJ2Yol6aA5mbC/mQyvRDuBu9LU/CcU2o1s9xEOUHXDVOGQAvwU
/dSy2TEiMxsSOJ+/tHjKJrjm3QdQMz6qqLGpsVgy8EALBXCm/BA5h87OlvMmAXh8
Dwwpig4wACKSrdpAb/Mepith7U7SKeJwngDCoZi4Cw+At5fBRGAq0OYPDaieelOR
aacZT8kiSzNmF0cm4XQdzWAsKnL2vjauwtSNTcCdLZ2LpEW7v3ESIr/XI4CHJbpj
XSFcIC7oEP8tZZq29Ieo2YxPD52w2/4VwsOwVJ5PyValwY1171yV3i+LOOOYdGu5
BaqpDJa/VBxn81lBOo/c8uA1hXxJt97lRqnaTShxTFCD8MDmstLHsJOfB4upZJpl
bNwFN7JrU1B8qLkIE/v1KTBNISVzBDWCkeBtyN4U4VD5dma3UeQkUv8aV98G1VHr
bZZwiWQDY0uANiHs2DPZ57hTp2hoWSFAuv8PKQlG1xxRTZAAUuTQiT0C8Se+A0o1
IUJLm+nvi/Vejv8Z4Gc7S12eUbD9ZqIfrMqSktftoz0OVWdp7e86Ysfd6LUeFBAk
jhxLYub3+XkpmsLYyWaz/0WhsYiU4dTsHIaBf4gCMx7P6djmUC2imzizbODtFzlf
XU83f8m0+FVtI1j0ZQxFe2xXNWz2luASUT+MG4887Wh5jOtCh6k=
=+p/8
-----END PGP SIGNATURE-----

--htuB2GNKKkHiP31GjhZflByrivAlYOem1--

