Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FCA295BD4
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 11:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=lnNoNvx8GDF5Xr9NJClJpFN0zWzR0nc3PO3Lir39HcI=; b=5P4+1ljru753kkhaN8C3t9cVbC
	mG8Kk8t/OCHJcONPKZpN9YZDBZD3MBgM5LJrfn6kV6AGmC8MeoODWvKGtZjHyvd/txN2Rn7Cg3fBj
	iUZUS3uQhMIk93G/J+Ea70knKtkblqKzfH1MyQkHe94F0y42KFOV+wYJ9e64d8cidg4QjHTR7THFY
	kOcw7RsFP8//e/Pek2qqEWqKB76+JvOPiKJ5/EXDys9yaZqHLyVeyhwglZ4axqcytSVCpHvAIBlsx
	EGJQPRWZxG5+09FKVVYs9vN9gF0LyAUgS5ci3qWgw4NWbiVTVPSZXf2qI6aRAJFWlmLPgnZ2h0h29
	kewiSgcg==;
Received: from ip6-localhost ([::1]:39436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVWwi-00DFQP-1C; Thu, 22 Oct 2020 09:31:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVWwc-00DFQI-6q
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 09:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=lnNoNvx8GDF5Xr9NJClJpFN0zWzR0nc3PO3Lir39HcI=; b=JBkB/AhB+zwrVqctOnfZmmMYS7
 S+QDWNkFjE7hOtDtMBSuTgy+KPnC/ghoSYGAGFzV1CocF6KlMXfKzHwHksvrv5rH78ahXq+xTnoKn
 LegslsouuAEU0RtsYIQjYfdXvRWYsIrY/GShBCZjgasN1Ie0+j5vJCnDS/OIDddHDdMbdJh4mhE2o
 CXuYzUUXy34iOj7pVsXf+g2i3/jIk4Yppfk2sg1omhBX6SFvcAxxqQC8kcJlJqMonL9hDOmZVq2GW
 n+ZYAXeZhKmVqm8aOZnFEQYFdoOZsR7MW4B0MWW7kuA5dsE8SG+N5OGR1FFIDz0eEX3ihQlaMAkWs
 i8ADkZImQCUC8iObyB/U5MmxUV/btGVyTQn5LGdEekoUBxhlj5Ubil7Kune7t9LBZARq9YZZmEG/i
 k37MGzyhjqQOHTiHLA8WEzWmImVpBcFQ+XkewEA9n6B40YVvbVOVhncFVUlTgKERzqnmKVt7B6E8t
 RwsB1NS4mM+54mn0UY0W05TA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVWwa-0008In-O8; Thu, 22 Oct 2020 09:31:36 +0000
Subject: Re: talloc: Other minor issues/queries
To: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>,
 Arran Cudbard-Bell <a.cudbardb@freeradius.org>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
 <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
 <20201022010855.GA853779@jeremy-acer>
 <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
Message-ID: <4134ee06-d420-bc29-fd88-78550fa5d23a@samba.org>
Date: Thu, 22 Oct 2020 11:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Hcz9WcFRzV0zquY4knKkjMz7CaTIIPkIL"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hcz9WcFRzV0zquY4knKkjMz7CaTIIPkIL
Content-Type: multipart/mixed; boundary="wfq6dR6p3nxnQlDOVGhgP8IBaZkRmoutX"

--wfq6dR6p3nxnQlDOVGhgP8IBaZkRmoutX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10/22/20 um 10:57 AM schrieb Stefan Metzmacher via samba-technical:
> Maybe we could abstract the low level allocation (malloc,realloc,free) =
in talloc and just
> implement the other allocation schemes below the main talloc logic.
>=20
> In order to be able to handle much higher IOPS in our SMB server, we ne=
ed to find ways
> to optimize our talloc/tevent_req handling.
>=20
> These are some ideas, but it will be a long road to get there, so I gue=
ss we need to
> find incremental mini steps...

stuffin all this extra stuff into talloc() is going to make to add a lot
of extra complexity that we'll have to maintain in the future as a team
and ideally not just you, Jeremy and Volker. Therefor I'm asking to
please carefully consider if this is worth it.

Thanks!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--wfq6dR6p3nxnQlDOVGhgP8IBaZkRmoutX--

--Hcz9WcFRzV0zquY4knKkjMz7CaTIIPkIL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl+RUXUACgkQqh6bcSY5
nkbtSRAAqbWBQw7MBHMk/c5424tKzzZRDiu8WazhQUkcq/Y2MgH5Cba9wlvQV/gl
jaT1eX7xKrPv9kam2iDhT/UknDyOEHzAVHgJVekPsxd5MKTUJn9xO3kXrV+dHmiE
d+exWckXB/eRkJQdufX5ye4GD/w3CvFGVjQH7TeUGvgHCSoCQO9Omk//LB3diNqs
zEerxoNK+ls+8uxfG5FzVf74ua7dW6gP+Co5uCrmNyx2/XkZvbuAzY0qefKkusX5
nL/pNO88jDAalqXMuWzH7BM7HAKX/IiTQgbJEEWVYFMBfQOfFxOC6gI3dZ4ZVzGe
MIZnfGKbCRoPOzmKKfhFrfCJNMj+1XYLAdL9Xxhf9Kac1Ypo5RM80NyUrAuA0WfD
SCAMum5Jrlc83zpRi7z7CYBYkO5+h6TrL3FrZZCen2BJmc6ja1BKj+iJje3O7tpf
MneUYrvgyZPvGrSCpJ1BAi/6pNrew1+NGcCWUIng+snQKU1n5TQSWo3M/IVIyT+Q
5K9SHc3gxU2HQpEJx4tKWFoU2AEAYyKO4//iZqKlVSy+RjrnVXBNyYi2HR3YzeQe
sewcPj861lAZ7FmtpoyomPZV05vHKS2a4CPgAByY8EFJ7fjDIAzKtzOlDlCV66Nu
DF6kwqOFbpOZ9rwART/pePwAdRyC2S0d3K6VoQOylm2p4ykJINQ=
=euq1
-----END PGP SIGNATURE-----

--Hcz9WcFRzV0zquY4knKkjMz7CaTIIPkIL--

