Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1103BD7A2
	for <lists+samba-technical@lfdr.de>; Tue,  6 Jul 2021 15:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=DKgx506sIh5B7iR3pzeKArt92LE4h98lBFID/rJdC84=; b=vyj3QmM5SQtaB3fLgu8NCLV5uC
	j0NPjYkO/vghFuT/hTbcJNp1Hu+AfWl2PBdoT3dzC1tzvEXgGtVfZT7xtU9xienm+tun0c+PeLXUR
	Omz3MSQ3Q84kyEx2cEQfLA/8DRxbPxWBwvokl7P9cDJlyiQp1AVPkAreeZpkIP4wxQ5nzrwo9/KFV
	YvYA3O4nSs33DierbtKUYnsT2fGfaxCKGUPkV8BqEwDJ//Gh/6obVa0WZF4GWPGCm7IOEUzy49Iy1
	6mFKI1WP2ZTaJ9qFVE/pyYiClqCWuvQ5jmBVEreEgzjqxn2cFlNTkLfw6X/UEmaGfNoyNns146bLs
	QaLCpmsQ==;
Received: from ip6-localhost ([::1]:59144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m0kz7-00CVOE-Ix; Tue, 06 Jul 2021 13:19:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16072) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0kz0-00CVO4-O1
 for samba-technical@lists.samba.org; Tue, 06 Jul 2021 13:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=DKgx506sIh5B7iR3pzeKArt92LE4h98lBFID/rJdC84=; b=u+H7bSdomsZo6wpqsze6reW6nf
 voD0rSF2bDy30dNzXm+4aVKZEBsmv5bHFnmi9qdfv64d55LyKekiCLTMcYtWauJclULjw8nrtZ1JZ
 BgTGkbFx8TGfhOi5pZYSvsPy1gcYaUc7SL59tr6CewN9Qz+/JvY7NRXEri333tF1nO3mAlXMlylG6
 8X5aOBWlJ//8AUAZdpPI/SIucd1ndde8nmS7RLGc/mpQ/C9kpejelzZCwbMnatN47aEF0jhHGbgqV
 /JvrN396SrBAxXbWJKU30C1D2IJ0YdZPyOkgyPDCj2osXOvRjDs9G9maB81Iz8Q/+Qzi9N+a1o6n9
 3skqWhoWSsvXFlFVwdbQJfcFktqsExOQjMYBbX3y5MyhNBpk880oliRzl1996C+IOZ9PgAiQ1JVOg
 WEF++Qguj8hXFyZ4Jkrg88vUo9i9UrmCPMtxeHSkynGDnETqWE0tvANXC/bp3BE3N7iYjr7va8A/v
 TK58vhN1ZoNYOraYj/PGtnNN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0kyz-0007qw-79; Tue, 06 Jul 2021 13:19:25 +0000
Subject: Re: State of vfs_nfs4acl_xattr.
To: Maciej Bonin <mbonin@phys.ethz.ch>, samba-technical@lists.samba.org
References: <afc32b57e57c35e4d49a2b3904f8d80f@phys.ethz.ch>
Message-ID: <ad9b53d8-74b3-f845-3c0d-8612ff4c3d20@samba.org>
Date: Tue, 6 Jul 2021 15:19:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <afc32b57e57c35e4d49a2b3904f8d80f@phys.ethz.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9DStYgadS1mX68dSH4B6mFH7ksqGB27Zb"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9DStYgadS1mX68dSH4B6mFH7ksqGB27Zb
Content-Type: multipart/mixed; boundary="twWUkpCh70f4zKGDMCbcu46XPVWYemT4I";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Maciej Bonin <mbonin@phys.ethz.ch>, samba-technical@lists.samba.org
Message-ID: <ad9b53d8-74b3-f845-3c0d-8612ff4c3d20@samba.org>
Subject: Re: State of vfs_nfs4acl_xattr.
References: <afc32b57e57c35e4d49a2b3904f8d80f@phys.ethz.ch>
In-Reply-To: <afc32b57e57c35e4d49a2b3904f8d80f@phys.ethz.ch>

--twWUkpCh70f4zKGDMCbcu46XPVWYemT4I
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 06.07.21 um 14:59 schrieb Maciej Bonin via samba-technical:
> I've recently tried to get vfs_nfs4acl_xattr to work for re-exporting o=
f=20
> an nfs4 mount from a linux server.
> As far as I can tell, this is simply not possible at the moment. Am I=20
> correct in that belief ?

last time I worked on the code and had to help a customer debug a setup=20
using the module it did work afair. No idea why it's not working in your =

setup.


Cheers!
-slow

--=20
Ralph Boehme, Samba Team                 https://samba.org/
SerNet Samba Team       https://www.sernet.de/en/team-samba
Samba Development and Support, SerNet Professional Services


--twWUkpCh70f4zKGDMCbcu46XPVWYemT4I--

--9DStYgadS1mX68dSH4B6mFH7ksqGB27Zb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmDkWFwFAwAAAAAACgkQqh6bcSY5nkZz
vw//YJoOM2gbBz7xrgfNxnDpzLOvw0dG+iZpX35W7dsRk+iLpxI6o2vHLAxRXXPT8wH+VUu5VkHf
zxcviqpYq5nmLjHHCtrM2ipvmlYJsTCRJ8ReVNoyeLcHqq8ZpnTrMAhGHSP7CfKoWrlUjwip6Z3R
E7elL2eWcdKTIfHy9tV+o6DmBGP/NpppzIiCqJEJm8G+DLma0h+MCETtMfidU9BIvj6l1WnKtQAW
QAiJH8w5zreRSt59m5XsYN/v32Ph0mCRMnFRuVLHMFPh+GYbSpuCwqDide2CF0Q0v1HgmExgcQWK
l162d0cQ0KgOtj1J37PfQ9acYwgtYbmSFakXp8vCmbkh/aU4nThtBDKvU81g5qm8cJgik2yEGbpk
RIHWbHJbt8UwH3OXnKzQYvKKUCHjhvk9y8XfQ92LXj1IPnM9yklIPPoqGq/7c171N6ty0sPzIER9
BHo1wK0g7StiqLXi0FKOa765/1JXPXq6T1atBNf4e66w9s1wMF3cIHBfQ9WCOZuRakf21mXu7zYR
lw7V7sByUF/fncft5UHgQaIkviapnF2sdb7p1HnxLVE5uZe+yPNa3idloJmE9zCys6msd5dtQyFp
qoWUS/PQqPXd/61+miLnl+Lz+i33z5/1hU1h+FyPZjGfemeDyhs8Pn3KJyg9ZUbgx4kVZKwuoSRE
z/E=
=gDxO
-----END PGP SIGNATURE-----

--9DStYgadS1mX68dSH4B6mFH7ksqGB27Zb--

