Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DAD10563C
	for <lists+samba-technical@lfdr.de>; Thu, 21 Nov 2019 16:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=7gcWMLvz/MfGeGYt08Ii5FtwWUgxdlwdmGP+seDUfxQ=; b=PzZPSK5XkBDqQ6RgU4NaQllfyW
	4gh/t2wHpT3rW5Mbju5OM9PPFlgYo1d+PBbTjcNqjAmOY6lqtJJOX38pT8OqtMj7+xSUzqhJCDbJw
	e9dK1/02E+jaH/Yyht2FoPddiUBIOcZanVfB88dXH7fZHltkrlEWVWh+Xdk+qykaH+6XDXqJmbzIP
	nUDWz4S71HkqQoi+qreYy9L+mYDDmNrdUh4cbcfC80+yr2PKhdHufTYIjCXB6dEQa/nbiGi8DFEmm
	GUYeudzl7IF5IX21TBmr3c4UlxoKctWSGBe2HSyGQgbrisfH+gOzceNST/zAjvEQKaew6blkWcpHx
	dEzsxqIg==;
Received: from localhost ([::1]:65098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXopp-001uc6-Bg; Thu, 21 Nov 2019 15:57:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52216) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXopj-001ubz-Nk
 for samba-technical@lists.samba.org; Thu, 21 Nov 2019 15:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=7gcWMLvz/MfGeGYt08Ii5FtwWUgxdlwdmGP+seDUfxQ=; b=yXETT1sj+o2V95vSPLqpE/AQI9
 nxQCzbV4MZVt9hNOyDu8bVDoF3hSOTVgYlk4ENMthrWVFx9BK8kWzMMy2G5oZq2eOje7gMC/kQQSY
 OroSLrnfgyhyd8vNf0atmKPpDoFz6p3RZLDseJ4pcFRO/gmmQ+tAyoYG7mlXOPJYWv/doT4kEZlqN
 OVqZ7cx/nqXhOpWTNkvjNqLenxemxobFYcCYRPVwT7S+L6Qq3K/cG/NcmOvoc0F0OOm5JMFxRyW2r
 k0ZPuiJ7tQeuSVUid/cCLhQFlX6MPrM0tUuBeMomCk4yuAvDRsQV3mLVvJccRdIyYrYRFSk7O43bQ
 ppK+9K0S6g/EOlit9mafgttAlIHjbjeqfkyBqKVTaHvyyYl4ifkPaOn02d81Vs/BauK0b7XPRfaR/
 s6v7w7xBHlg14mDpqOIjri2F0u6vwwESS8IE0U0bwDeEE128GYZ0pZc+Csu0vzDks3vtK3kvZVgTC
 R5uNaNu6TzqytdKYULMXEdCU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXoph-00047s-Ep; Thu, 21 Nov 2019 15:57:25 +0000
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
To: Greg Hudson <ghudson@mit.edu>, kitten@ietf.org,
 Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>,
 Isaac Boukris <iboukris@samba.org>
References: <f33d5f68-1fdc-c1bc-c702-70b054880bb4@samba.org>
 <649fa812-aacf-80b6-1976-a719eca60fc2@mit.edu>
 <33c431f5-c36b-c321-de3f-65977d8aa898@samba.org>
 <007c29e8-02b9-4f48-f67e-881cb0985d64@mit.edu>
 <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <d50c2b41-d0de-b47a-b47b-781fe4b1abe3@samba.org>
 <bfaf6ce7-5cb1-8d42-5b49-11b5e1c0b18f@mit.edu>
 <0047cfe1-fd61-d160-f737-686ea42686e1@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <7d798d4b-3ed6-14f7-e5ee-6da66d6dd309@samba.org>
Date: Thu, 21 Nov 2019 16:57:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0047cfe1-fd61-d160-f737-686ea42686e1@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="G1PbuGUWGGQvwJr3KLrBMF2rrO3e4sMlT"
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
--G1PbuGUWGGQvwJr3KLrBMF2rrO3e4sMlT
Content-Type: multipart/mixed; boundary="dZCDgadvdfvSp29FmZeNDM5hpTo12l8Po";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Greg Hudson <ghudson@mit.edu>, kitten@ietf.org,
 Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>,
 Isaac Boukris <iboukris@samba.org>
Message-ID: <7d798d4b-3ed6-14f7-e5ee-6da66d6dd309@samba.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
References: <f33d5f68-1fdc-c1bc-c702-70b054880bb4@samba.org>
 <649fa812-aacf-80b6-1976-a719eca60fc2@mit.edu>
 <33c431f5-c36b-c321-de3f-65977d8aa898@samba.org>
 <007c29e8-02b9-4f48-f67e-881cb0985d64@mit.edu>
 <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <d50c2b41-d0de-b47a-b47b-781fe4b1abe3@samba.org>
 <bfaf6ce7-5cb1-8d42-5b49-11b5e1c0b18f@mit.edu>
 <0047cfe1-fd61-d160-f737-686ea42686e1@samba.org>
In-Reply-To: <0047cfe1-fd61-d160-f737-686ea42686e1@samba.org>

--dZCDgadvdfvSp29FmZeNDM5hpTo12l8Po
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

> I was able to finish all the tests and have a branch here:
> https://github.com/metze-samba/heimdal/tree/heimdal-no-transit-check
>=20
> I'll add a reference to this discussion into some commit messages
> and create a pull request shortly.

Here's the pull request.
https://github.com/heimdal/heimdal/pull/656

Issac can you please have a look at let me know if the modifications
to your changes are fine with you?

Thanks!
metze


--dZCDgadvdfvSp29FmZeNDM5hpTo12l8Po--

--G1PbuGUWGGQvwJr3KLrBMF2rrO3e4sMlT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl3Ws+EACgkQDbX1YShp
vVa1wQ/9EU9VRBLmGJkT5yWdBxzgkkPM3Ima79voCyN3g0uLcjxW9Xg4zw8zq2hR
WV/wTGuOsXVlIBBsVhfDFO2cblUuXiFzpgbPYMvVwmCv9I8nwylhLSGVzRb5AdCS
ES6jl5/T2AHCXs8MvHJ/rPs2HgsGioGmjuhfXxfwGlBB+3H1JXKGN//a54w0J6/C
4nuSvmYAEuxZuoJk3YaVWJDM+ri+skIuTQlROtyqOUP8iWjfjqHFGR+QgFXSKE9S
QDb7fT+JnOcafaWFJVlzGZbgih4g34BwsvJAimZUYLtS1TStLilIdOzfOpm7kRXf
8Bea9ConOuiHYkGLHX+fpZJyqiEc6wMs/mUPhV7yAoGcKBnNMTBXoEpEF9tn01hQ
grGg5Vb1aQEoCX5vGhRToXl0aZYS2RtCVQ4GBH2MZf1IDQ+8nRXxf3YvpLMvoqXa
oahE2ECbFWlOT5vvSCalVl6gY5gyGjvZMcLJ5ec+XCCzICUe8+HDFHR9qirakjMe
oj1feKtoGfJY3nCLv9F/JOCxzN1KqriWA1Yu8yAc+MM/GyaFmuOEc6nx+ehGUzx8
fCRGkHYbr8QGYDnJdaEFBL5vceoweSMpuUJ+yaH8VkRLbk6kU13WecmEv21HPFgR
a2MRMrNMz3Sd1H2ZEpygOiQSm/gVApOFTI1tocc15GFh013r1tw=
=jLrY
-----END PGP SIGNATURE-----

--G1PbuGUWGGQvwJr3KLrBMF2rrO3e4sMlT--

