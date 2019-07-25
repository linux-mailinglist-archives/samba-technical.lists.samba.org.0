Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DDA756D8
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 20:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=d5HZuN371ik8dKkuMV3zGPnuoSrRMLGjc4P3fyk9pxA=; b=jr7isMfm2GgyplLS8UfC8FUu+D
	Zf/XUUFVn6r23LlwONEqnqjTBb6k8b+gn0VCxOLAG8YtH1/Zn3gtm7WcqWdKv+/aKA7uT7Y7z+oj+
	h9QjiR4i1HbEFhBCYy8hOKPTsOeqFOliHBkkN49+MMFSKORWO0B56rxkukrjAfuVN0RIblZ/3PxPc
	Ik894AUO6Vq5OHsGZfx57oEjhtd7P1EeI0wvLdkSPoJIj70iLiJEWSxdbnWVzGTozBxtZGWAC4gts
	+URPnw8dnQE+klqYuJDb/91gwcYHbLCzzxpDavJ4uGFKZECen/zeERdP/pPU2CIJz9uWh5c1i7bWv
	hUhqsmeA==;
Received: from localhost ([::1]:64002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqiQa-000JjB-NW; Thu, 25 Jul 2019 18:25:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqiQX-000Jj4-BG
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 18:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=d5HZuN371ik8dKkuMV3zGPnuoSrRMLGjc4P3fyk9pxA=; b=Ua4U4VrZEAVaAZmwoqzfSAvKLD
 9srG41WG5WK0bBCHGaBK/0oQtmGHwEwuSZWeealfyBHBmXioYsoNO0CVMkcUeBvwwNajesNe6fSSJ
 TQATc/eCxwJEzICrIxTu8EPIqGJGLODC8zc6H/HW4I4EVb5BeKseFo4f5bqf9wbvQiCI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqiQR-000246-Fd; Thu, 25 Jul 2019 18:25:12 +0000
To: David Disseldorp <ddiss@suse.de>, "dev@ceph.io" <dev@ceph.io>
References: <20190725170749.4c4466e7@suse.de>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: libcephfs and supplimentary groups
Message-ID: <abc71097-3c55-4ef2-faed-94659be05c3a@samba.org>
Date: Thu, 25 Jul 2019 20:25:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725170749.4c4466e7@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="FhAKImqfrELZBjcKf19YGgqtA8JuslvEI"
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
Cc: Jeff Layton <jlayton@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FhAKImqfrELZBjcKf19YGgqtA8JuslvEI
Content-Type: multipart/mixed; boundary="rupmtEvFKEnrS7tw2PNDXycOF0lgMR14e";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: David Disseldorp <ddiss@suse.de>, "dev@ceph.io" <dev@ceph.io>
Cc: Jeff Layton <jlayton@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Message-ID: <abc71097-3c55-4ef2-faed-94659be05c3a@samba.org>
Subject: Re: libcephfs and supplimentary groups
References: <20190725170749.4c4466e7@suse.de>
In-Reply-To: <20190725170749.4c4466e7@suse.de>

--rupmtEvFKEnrS7tw2PNDXycOF0lgMR14e
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi David,

> Without calling ceph_mount_perms_set(), libcephfs consumers such as
> Samba can rely upon UserPerm::uid() and UserPerm::gid() to fallback to
> geteuid() and setegid() respectively for things such as ACL enforcement=
=2E
> However, there is no such fallback for supplementary groups, so ACL
> checks for a user which is only permitted path access via a
> supplementary group will result in a permission denied error.
>=20
> Samba ticket: https://bugzilla.samba.org/show_bug.cgi?id=3D14053
>=20
> I've written a patch to address this (it currently omits the get_gids()=

> codepath):
> https://github.com/ddiss/ceph/commit/035a1785ec73d803fead42c7240df01b75=
5a815b
>=20
> Does this approach make sense, or should Samba go down the
> ceph_mount_perms_set() route to avoid this bug? The latter
> would likely be problematic, as user/group details for a mount will
> remain static.

Without looking at the details ceph_mount_perms_set() would be the long
term way to go. My goal is to do impersonation only where needed and not
always by default.

But the patch to ceph would also be good.

metze



--rupmtEvFKEnrS7tw2PNDXycOF0lgMR14e--

--FhAKImqfrELZBjcKf19YGgqtA8JuslvEI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl059AMACgkQDbX1YShp
vVYX6Q/9HGP9B890f+TjYcLvCN7LzJc7zkB1hoFpJN/8La9PHzQG9zlR9DlGlUFi
hv74OWvA0VlimzllAOJkEu+MXV2+5kPOKQ4pWtSnONwGcZgQ3QcHz44Qy0B2EdpV
iQBIBfoSK2y7ADH7JMbyJa8KIXWoVd7txQLXHeUU8xnVOIzSDYJ44aI2C+IBN4lR
uNS092LLqFEDBLMiIWterx+QCnYcZwFNfD6LZO7+utk0qsWl1KvXt5s1CrHeeaXJ
GsvEeHY4xCPYc3HT2695ey4ltnAqBAQz0IIn8p/lZP40xGfVXbsbZ7WjbPhgj581
uNG/vyBR89cOVlrdvyWeGimX/ioPEktiwf9TFSKPY+kNlpuLATv3DzsZV2Kp6X2w
7g9bmhEP1mQNK1hyQUyoWfZf7xHfXQMxuOfcl0HS2uSnaNyNb4R05WZeBuqE9sso
WsDryipXgvETLD6ov3QM0pDQaF8kphHymml5XRssWeyoCdrRqXCrWsbNcWF2LgwP
MzmvGvW/MCVUjvkg9DT9W/IORQ62jHcQIIw8TPplCEvCXxFsbiGTZ+mQiv6GT4NF
uukU6gj/jpawOMNYv7+FF6yZEaMKEykda1S8tn+77ffLauzJ9bbeYlIEOu5pkxMu
Ful//mYEt+kp3mkvKvSLi3K6ZtWqfaGm4ecYOdqOU1aUgeTp8vA=
=Z/Kz
-----END PGP SIGNATURE-----

--FhAKImqfrELZBjcKf19YGgqtA8JuslvEI--

