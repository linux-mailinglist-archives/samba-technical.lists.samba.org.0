Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEA21F3EA8
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 16:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=WoKNdh3QIJCAuYsJcyZY6kIMDQJm3/JkWWOgl3lX2Rc=; b=wDG2s4Mt392fyBfVOrvjM3UztK
	S/BvsgLhy6mh19ZEEfZssZvOMm+8uKN340B/+DV96iBV4sx0BR1S2riTY6xnpt93L/5aP57B9ybJg
	vXQujm1eXqZ00v6CdPv6nup/SaugBLPBW0V4YmksKyWvXLUKcdxypeqr7i7wSnoP8CSUPiVhqtXdK
	kGBYN3m0MBblFO++uvDwkfmdD0HlL05BwPblaGlvTHTOziweFcmXqr98xjDfRO3d/+DdRlv/9B1ic
	a+5yS7BR50Bo/fm96bzw3Z6UrklDHmkoS4ACQrYaGTwvCQ8k76L/DBAesAFe9ooj/u+TQlspQnT0m
	GXxGFgCw==;
Received: from localhost ([::1]:50080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jife0-009dIt-SX; Tue, 09 Jun 2020 14:54:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38802) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jifdv-009dIm-7B
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 14:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=WoKNdh3QIJCAuYsJcyZY6kIMDQJm3/JkWWOgl3lX2Rc=; b=iyeQr18v0//qTMMzf+P6GT77j9
 7aT0mz4Avhqgevu3g7SQIQJRDTf6vXj+yjr8ScWUBsIS/be4GqPblMnTViUn7ObIPAq13UfM3yRDp
 ei6BajHpea03CppELbL1lwf2Ncprb1tL5HSdmz21gt6fbehv3tv9BmJ1S6ObUWEwuJtX5jTXJagRt
 a8Cq03SwdNzMc9Y98hDsQ7HbA5mEmyK6v23STE61otl33w6zRHuMo0DtVwYxzIFjz8KGgO9s+Opi5
 YFGbQin07U2islc0g63vqJb0qhmJvS5LPicbM0xj86DSvcPUK/Rk7COq8lVri5ZoMcRj+XuFnsRaK
 mhmY3rP60kJPoLKBe3uy01We4AeLBtYoFlc/Vg6bwep2686SNkwryNlBx4cL8zKEW4zrWSYUPeUCP
 C5M4dAiQC9bc5znc2uKutUbqrxN1pTWi8SwU7PX4S94NSALBMLvG+J9UR9VyLE1RlvaTBsW6QG9sw
 Xv1T71XZdZeAiZx4EkuQ+Tte;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jifdu-0004GG-Bu; Tue, 09 Jun 2020 14:54:22 +0000
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
Subject: Re: Schema updates and modern Samba AD
Message-ID: <e70dc906-1bbc-858e-ece8-80bcd6f60769@samba.org>
Date: Tue, 9 Jun 2020 16:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="XfIBIl9O622S1hdkPSZuXwcFRUFKzW9vI"
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
--XfIBIl9O622S1hdkPSZuXwcFRUFKzW9vI
Content-Type: multipart/mixed; boundary="w7VG5PWQOSesL1pSs3ATshcIVMs7MqTH2";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <e70dc906-1bbc-858e-ece8-80bcd6f60769@samba.org>
Subject: Re: Schema updates and modern Samba AD
References: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
In-Reply-To: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>

--w7VG5PWQOSesL1pSs3ATshcIVMs7MqTH2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> A long time ago I remember asking if we could change the default for
> "dsdb:schema updates allowed" to true, so that this is no longer
> guarded in Samba.
>=20
> At the time you said, from memory, that while schema loading was much
> better than it has been in the past, there are still ways to break your=

> directory with new schema, so we can't change it quite yet.
>=20
> What I can't remember (or find in the list archive) is what those
> issues are!
>=20
> Can you remind me?

The last time I looked at it I had this wip branch (ignore the smbdirect
stuff)

> https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/he=
ads/master4-schema

One important thing is the usage of schemaUpgradeInProgress instead of
controls. We need to be able to "samba-tool domain schemaupgrade"
against a remote server (it should also work against Windows!).

While trying to finish the patchset I got more and more open questions,
e.g. I proved that linked attributes are possible on schema objects,
see the schema_object-bla*.ldif files. We need to make sure we correctly
replicate this stuff, I also got very strange things from a Windows
server, maybe they have bugs there and it only work by accident.

Before we can enable this, we need to be 100% sure that an administrator
(or even SYSTEM via ldbedit or incoming replication) is not able to
break the local schema.

The first thing is to verify we can load it again before we store it,
I think we have parts of this, but I don't believe it complete.

We need to reject any change to ldapDisplayName attributes (Windows
allows them, but we'll just break as we use them in our database).

We need to implement all known constraints regarding schema changes we
can find anywhere in MS-ADTS (there are a lot of places...) in
the schema_data.c I added some of this in that branch.

It also turns out that we don't have good schema tests, I tried
some of them against Windows, but they just fail. They seem to be
more like fantasy, than anything useful.

metze


--w7VG5PWQOSesL1pSs3ATshcIVMs7MqTH2--

--XfIBIl9O622S1hdkPSZuXwcFRUFKzW9vI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl7fopoACgkQDbX1YShp
vVaTWxAAgQ1OjfPC9Ys+FBefxvjm0smHu4pHdpSfpIP0v6lv6YRKfutUNooLEhqC
kk6VvBak3WnH0lXx80VJRPqlbhD22KtwbT+5y8KWD/0Wxr3SjhQc+scbmdk/59/a
DBqmjRFfvR+BgnZVo0jxSE/4HMdp97LDKeiQ+7zYqrc+fBcOsPVAFxDvz86ijDDn
9/HS0ZHthuk7momIN3ifA3KhKLDoL254I5VpJMBZndZuon7d0lsY/dtEh255t/bk
sKXvVm6MKnJDER5uYoLzNSdpxRXWQqzvbY3iddYxh3A+XhyYAQyVoVSIxcp4lRdX
QuqxpGdTrR8mODGHS5Ac4sFrwZGZukFmTjUL887+E3J1h0slM/SQee8Xca6w3fS5
zTn1nQUYkZdCWS4t6QdVO7icnYCwchyQnZqWNkXBpCyA/YGMCWcGVeA56YPzdcjK
POMmityg+P8sjTdl2SFJhLZxJwyyy65LjcDhhflqOC3Eelzy2F6B8ZSRVLRhGNwf
qz6ViQDRExHzRPe8WChomE5ue/iI7jNMWcuM8m+KyUDbHJnbFr0Drep/pd/Q6g2R
8OttZZZMP90CuLsq6Fa4BuuAPhRPqkbp8Pah5O18mqJ19IyKABRa3rfFQigzSmWj
o6yRc/Wg3Ympd7ev19FoNhEf7FZKhwMzQxO+/lQT9hxaL4F0cDI=
=JGTS
-----END PGP SIGNATURE-----

--XfIBIl9O622S1hdkPSZuXwcFRUFKzW9vI--

