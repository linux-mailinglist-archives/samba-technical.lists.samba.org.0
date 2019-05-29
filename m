Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F12DB66
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 13:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2w4Y2s7Z4949Kw0RtlOkWaftqN2G08Ki03+AAE2VarY=; b=58824/x2QbIV7URlIP0eN76jvS
	Vvh6UgX+hL0EspnHv0899krCJ4C4MNN4JjMtnbgxRR7QbpR4bIhORLF24ndUTA5TFlh51ce+QRrGC
	MrH3zk4tQ57ddc0L7XkPFttLndsStttv7S6Fl+dqOSHwKWgHvb0LRZWaDxVzJHcPSDjFqxT8Zku8f
	Ioo5WUy9i01sKSCVMhurgbCcXhwuM/5aiC/jYlc/BMoLpkThWcPHpGNn6C6aoi6xnL3BGSfr8QspI
	HlpQ7sMswjJ0zZDYNDyIsdxHqxrJkhpm5jKsIeI5imSV2Q6fgrKEJgwE8uffHz3EhZcEhV2z/Da5Z
	Rik9iF3g==;
Received: from localhost ([::1]:25794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVwPj-002TOi-TZ; Wed, 29 May 2019 11:06:35 +0000
Received: from [2a01:4f8:192:486::147:1] (port=32738 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVwPd-002TOP-0o; Wed, 29 May 2019 11:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=2w4Y2s7Z4949Kw0RtlOkWaftqN2G08Ki03+AAE2VarY=; b=V7yybzmQdYI56I/JK1aYoXOBXK
 bwGOz9GhPpISqdJzXrdmEJppSPAnANGXbG8XKiFwyyM5CXIiOtzYu1PVTFE3BRUfistNvG4ZGo7pG
 zWA+Dcy6bxrIPiYpbmJoffX4MSW4Lb6pPUNadHex0akAyLXbgFq9EJYMEXi/RiLoeye4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVwPX-00015Y-71; Wed, 29 May 2019 11:06:23 +0000
To: Andrew Bartlett <abartlet@samba.org>
References: <20190529055804.559BC140235@sn.samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: sambadowngradedatabase (Re: [SCM] Samba Shared Repository - branch
 master updated)
Message-ID: <3d4b6b06-ce22-a0ad-cca0-0abe6aa88035@samba.org>
Date: Wed, 29 May 2019 13:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529055804.559BC140235@sn.samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="WhCwj8EubaEgtrFxRPP283T5MinvQI19H"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical@lists.samba.org, samba-cvs@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WhCwj8EubaEgtrFxRPP283T5MinvQI19H
Content-Type: multipart/mixed; boundary="xjEecJTHgEaCyyYmKxIyBf2gMzCfjZZsh";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org, samba-cvs@lists.samba.org
Message-ID: <3d4b6b06-ce22-a0ad-cca0-0abe6aa88035@samba.org>
Subject: sambadowngradedatabase (Re: [SCM] Samba Shared Repository - branch
 master updated)
References: <20190529055804.559BC140235@sn.samba.org>
In-Reply-To: <20190529055804.559BC140235@sn.samba.org>

--xjEecJTHgEaCyyYmKxIyBf2gMzCfjZZsh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

can you please prepare backports of the sambadowngradedatabase changes?
These are needed in the old branches.

Thanks!
metze

Am 29.05.19 um 07:58 schrieb Andrew Bartlett:
> The branch, master has been updated
>        via  8831b06d3d4 ldb: Release ldb 2.0.3
>        via  4a95410a154 downgradedatabase: blackbox: MDB backend
>        via  0942a65b63c downgradedatabase: adding special case for MDB
>        via  4eee09a2c17 dsdb: disable ORDERED_INTEGER with MDB pack for=
mat v1
>        via  6b4abb99521 ldb: pack_format_override option
>        via  68d99187cd5 downgradedatabase: blackbox: database repacked
>        via  8db1312b08e ldb: python test for repack
>        via  73763acf49c ldb: repack old format database if GUID indexin=
g enabled
>        via  d6ded22cb61 downgradedatabase: blackbox: check ordered inte=
ger removed
>        via  08b9d204b6e ldb: binding ordered indexes to GUID indexing
>        via  6005c8cbad7 ldb: only used a->syntax->index_format_fn if GU=
ID indexing is enabled
>        via  74d15c9bf76 downgradedatabase: blackbox test
>        via  09f2a187b3d sambadowngradedatabase: Add "or later" to warni=
ng about using tools from Samba 4.8
>        via  c0b679f6a3f sambaundoguididx: renamed to downgradedatabase
>        via  40ca8ed5a15 sambaundoguididx: fix for -s
>        via  a3101b9704f ldb: Fix segfault parsing new pack formats
>        via  2de0aebed60 ldb: test for parse errors
>       from  73080f255e3 smbd: Adapt brl_pending_overlap to README.Codin=
g


> https://git.samba.org/?p=3Dsamba.git;a=3Dshortlog;h=3Dmaster
>=20
>=20
> - Log -----------------------------------------------------------------=

> commit 8831b06d3d4c1cb5b7732e9863228f8f3aea4e36
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Fri May 24 15:34:43 2019 +1200
>=20
>     ldb: Release ldb 2.0.3
>    =20
>     * Default pack format changed to version 2 for GUID Indexed databas=
es
>       (essentially Samba's sam.ldb). This means faster unpacking for re=
cords
>       with lots of attributes.
>    =20
>     * Enforce link between all new database features, following togglin=
g of
>       GUID indexing. If user toggles GUID indexing on/off, target pack =
format
>       is changed. Likewise the special ORDERED_INTEGER index format is =
used
>       (when GUID indexing on) or behaves like INTEGER (when GUID indexi=
ng off).
>    =20
>     * Database repacked if packing format not as expected.
>    =20
>     * In the case of MDB, since GUID indexing is mandatory, feature tog=
gling
>       provided by pack_format_override LDB option.
>    =20
>     * Check for errors from ldb_unpack_data() in ldb_tdb
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Signed-off-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>     Pair-Programmed-With: Andrew Bartlett <abartlet@samba.org>
>    =20
>     Autobuild-User(master): Andrew Bartlett <abartlet@samba.org>
>     Autobuild-Date(master): Wed May 29 05:56:59 UTC 2019 on sn-devel-18=
4
>=20
> commit 4a95410a1543f854743aac24c6c7dc5ffc423aae
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Fri May 24 14:54:03 2019 +1200
>=20
>     downgradedatabase: blackbox: MDB backend
>    =20
>     When Samba uses TDB as a backend store, all new database features a=
re
>     toggled on/off when GUID indexing is toggled. But, GUID indexing ca=
n't
>     be disabled on MDB, so the other features are toggled separately.
>     Consequently, the downgradedatabase script behaves differently depe=
nding
>     on the database backend. This patch adds testing for the MDB behavi=
our.
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Signed-off-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>     Pair-Programmed-With: Andrew Bartlett <abartlet@samba.org>
>=20
> commit 0942a65b63cc99f36d3eba99e9c9551e10c5782e
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Thu May 23 20:06:56 2019 +1200
>=20
>     downgradedatabase: adding special case for MDB
>    =20
>     Though this script was initially written for undoing GUID indexing =
on
>     TDB databases, we're repurposing it to do a full downgrade of any
>     database. MDB databases can't be DN indexed, but they can have pack=

>     format version 2 and ORDERED_INTEGER data types, which must be remo=
ved
>     during a downgrade.
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Signed-off-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>     Pair-Programmed-With: Andrew Bartlett <abartlet@samba.org>
>=20
> commit 4eee09a2c17d1276b1d0be9f26b23743eec485c2
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Thu May 23 20:13:05 2019 +1200
>=20
>     dsdb: disable ORDERED_INTEGER with MDB pack format v1
>    =20
>     For TDB databases, the new ORDERED_INTEGER type is disabled along w=
ith
>     repacking at format version 1 if GUID indexing is disabled, so all =
the new
>     database features are toggled together. This scheme doesn't work wi=
th
>     MDB because GUID indexing is mandatory when using MDB. However, a
>     downgrade path is still required so in a previous commit we added
>     a pack_format_override option which allows a downgrade script to fo=
rce
>     the database to use an earlier packing format. But, the new
>     ORDERED_INTEGER type would still be present in MDB databases so thi=
s
>     patch reads the pack_format_override opaque and converts ORDERED_IN=
TEGER
>     types in @ATTRIBUTES to INTEGER and doesn't write any indexes of th=
at
>     type to @INDEXLIST. The @INDEXLIST will be refreshed later, on the =
first
>     transaction.
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Signed-off-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>     Pair-Programmed-With: Andrew Bartlett <abartlet@samba.org>
>=20
> commit 6b4abb995215c732ff5c0bfaca2cecb7a374edff
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Thu May 23 19:49:39 2019 +1200
>=20
>     ldb: pack_format_override option
>    =20
>     For TDB databases, toggling GUID indexing mode will also toggle
>     pack format version 2. This provides a convenient downgrade path fo=
r
>     Samba databases, but the process doesn't work for MDB databases bec=
ause
>     GUID indexing cannot be disabled when the MDB backend is used. This=
 patch
>     addresses that corner case by providing support for a pack_format_o=
verride
>     option which will force the database to use pack format version 2.
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Signed-off-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>     Pair-Programmed-With: Andrew Bartlett <abartlet@samba.org>
>=20
> commit 68d99187cd5f85baacbf4af262b26ae0b9682db5
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Thu May 23 14:42:35 2019 +1200
>=20
>     downgradedatabase: blackbox: database repacked
>    =20
>     Now that the database is repacked when GUID indexing is toggled on =
TDB,
>     test that downgradedatabase repacks a TDB-backed database with V2 p=
ack
>     format database with V1.
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit 8db1312b08ebaf8881cf633196f0f40b0badac9a
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Mon May 20 17:59:33 2019 +1200
>=20
>     ldb: python test for repack
>    =20
>     Python test to confirm that after enabling or disabling GUID indexi=
ng,
>     the database is repacked on the next transaction with V1 if GUID
>     indexing was disabled, or V2 if it was enabled.
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit 73763acf49c24727e2deaaa061be8a288ee7b3d5
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Mon May 13 16:37:25 2019 +1200
>=20
>     ldb: repack old format database if GUID indexing enabled
>    =20
>     VERY IMPORTANT PATCH
>     Now that we have a new packing format, we need to enable it by repa=
cking
>     the database. We've decided to link all new database features toget=
her,
>     so once GUID indexing is enabled, the database will be repacked wit=
h
>     version 2 format. Repacking is done following the same iterate patt=
ern as
>     reindexing.
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit d6ded22cb617aeef75a415208b2ce56867b68047
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Thu May 23 14:35:22 2019 +1200
>=20
>     downgradedatabase: blackbox: check ordered integer removed
>    =20
>     Test that when we undo GUID indexing on a TDB-backed database with
>     downgradedatabase, ORDERED_INTEGER is removed from @ATTRIBUTES
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit 08b9d204b6eeda0aedea754f7e4b6f809d358cfe
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Wed May 22 14:07:19 2019 +1200
>=20
>     ldb: binding ordered indexes to GUID indexing
>    =20
>     To reduce the number of potential combinations of database features=
 in
>     ldb, we want to link all new database features since 4.7. GUID inde=
xing,
>     ordered integers, and pack format changes will all upgrade together=
=2E
>     This patch makes ordered integers only function if GUID indexing is=

>     enabled. If GUID indexing is disabled, ORDERED_INTEGER will not be
>     written to @ATTRIBUTES and a syntax's index_format_fn will never be=

>     used.
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit 6005c8cbad77259fa3cb89ab21cb5f26b72413cd
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Tue May 28 13:00:43 2019 +1200
>=20
>     ldb: only used a->syntax->index_format_fn if GUID indexing is enabl=
ed
>    =20
>     Only enable ORDERED_INTEGER and index_format_fn functionality if GU=
ID
>     indexing is enabled.  This is in line with the rest of ldb_kv which=
 binds
>     the new ORDERED_INTEGER to GUID indexed databases, and allows a pra=
ctical
>     way to create the old index format (by disabling the GUID index).
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Signed-off-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>     Pair-Programmed-With: Andrew Bartlett <abartlet@samba.org>
>=20
> commit 74d15c9bf76f0a2fb5fa7b7b1d80971d10c4fe45
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Thu May 23 13:21:19 2019 +1200
>=20
>     downgradedatabase: blackbox test
>    =20
>     This test confirms that running downgradedatabase causes all GUID k=
eys to be
>     replaced with DN keys at the KV level
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit 09f2a187b3d8c161e2c11588499b3256a9dbcc95
> Author: Andrew Bartlett <abartlet@samba.org>
> Date:   Wed May 29 16:36:00 2019 +1200
>=20
>     sambadowngradedatabase: Add "or later" to warning about using tools=
 from Samba 4.8
>    =20
>     Signed-off-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit c0b679f6a3f21e262d03bf38ea63900d30c29bb5
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Fri May 24 14:37:50 2019 +1200
>=20
>     sambaundoguididx: renamed to downgradedatabase
>    =20
>     In forthcoming commits we're going to repurpose this script to do a=
n
>     entire downgrade of a database, disabling all new database features=
=2E
>     downgradedatabase is a more appropriate name.
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit 40ca8ed5a152ae7c5ec039649c09a037a20a4143
> Author: Andrew Bartlett <abartlet@samba.org>
> Date:   Mon May 20 16:29:10 2019 +1200
>=20
>     sambaundoguididx: fix for -s
>    =20
>     Quick fix running this script with -s instead of -H. samdb_url() re=
turns
>     a url with a protocol prefix, which causes issues further down in t=
he
>     script.
>    =20
>     Signed-off-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit a3101b9704f554a350493553336cbbbd7d4ae02e
> Author: Andrew Bartlett <abartlet@samba.org>
> Date:   Wed May 22 16:38:08 2019 +1200
>=20
>     ldb: Fix segfault parsing new pack formats
>    =20
>     We need to check for the errors given by ldb_unpack() et al by pres=
erving
>     the error code from kv_ctx->parser() called by tdb_parse_record() i=
n
>     ltdb_parse_record().
>    =20
>     Otherwise we will silently accept corrupt records and segfault late=
r.
>    =20
>     Likewise new pack formats will confuse the parser but not be
>     detected except by the incomplete struct ldb_message.
>    =20
>     With this patch, the user will see a message like:
>    =20
>      Invalid data for index  DN=3D@BASEINFO
>    =20
>      Failed to connect to 'st/ad_dc/private/sam.ldb' with backend 'tdb'=
: Unable to load ltdb cache records for backend 'ldb_tdb backend'
>      Failed to connect to st/ad_dc/private/sam.ldb - Unable to load ltd=
b cache records for backend 'ldb_tdb backend'
>    =20
>     This can be refined in the future by a specific check for
>     pack format versions in a higher caller, but this much is
>     needed regardless to detect corrupt records.
>    =20
>     BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D13959
>    =20
>     Signed-off-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> commit 2de0aebed60b8e83508f50e5391ede618ce0e595
> Author: Aaron Haslett <aaronhaslett@catalyst.net.nz>
> Date:   Tue May 28 17:22:10 2019 +1200
>=20
>     ldb: test for parse errors
>    =20
>     Parse errors aren't passed up correctly by the tdb backend. This
>     patch modifies a test to expose the issue, next patch will fix it.
>    =20
>     BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D13959
>    =20
>     Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>     Reviewed-by: Garming Sam <garming@catalyst.net.nz>
>=20
> -----------------------------------------------------------------------=

>=20
> Summary of changes:
>  lib/ldb/ABI/{ldb-2.0.2.sigs =3D> ldb-2.0.3.sigs}     |   0
>  ...yldb-util-1.1.10.sigs =3D> pyldb-util-2.0.3.sigs} |   0
>  lib/ldb/ldb_key_value/ldb_kv.c                     |  80 +++++++-
>  lib/ldb/ldb_key_value/ldb_kv.h                     |   9 +
>  lib/ldb/ldb_key_value/ldb_kv_cache.c               |  52 +++---
>  lib/ldb/ldb_key_value/ldb_kv_index.c               |  93 +++++++++-
>  lib/ldb/ldb_tdb/ldb_tdb.c                          |   8 +-
>  lib/ldb/pyldb.c                                    |   2 +
>  lib/ldb/tests/guidindexpackv1.ldb                  | Bin 0 -> 1286144 =
bytes
>  lib/ldb/tests/ldb_kv_ops_test.c                    |  23 +++
>  lib/ldb/tests/python/repack.py                     | 204 +++++++++++++=
++++++++
>  lib/ldb/wscript                                    |   6 +-
>  python/samba/tests/__init__.py                     |   9 +-
>  python/samba/tests/blackbox/downgradedatabase.py   | 158 +++++++++++++=
+++
>  source4/dsdb/schema/schema_set.c                   |  97 +++++++++-
>  .../{sambaundoguididx =3D> sambadowngradedatabase}   |  37 +++-
>  source4/selftest/tests.py                          |   2 +
>  17 files changed, 728 insertions(+), 52 deletions(-)
>  copy lib/ldb/ABI/{ldb-2.0.2.sigs =3D> ldb-2.0.3.sigs} (100%)
>  copy lib/ldb/ABI/{pyldb-util-1.1.10.sigs =3D> pyldb-util-2.0.3.sigs} (=
100%)
>  create mode 100644 lib/ldb/tests/guidindexpackv1.ldb
>  create mode 100644 lib/ldb/tests/python/repack.py
>  create mode 100644 python/samba/tests/blackbox/downgradedatabase.py
>  rename source4/scripting/bin/{sambaundoguididx =3D> sambadowngradedata=
base} (62%)
>=20
>=20
> Changeset truncated at 500 lines:
>=20
> diff --git a/lib/ldb/ABI/ldb-2.0.2.sigs b/lib/ldb/ABI/ldb-2.0.3.sigs
> similarity index 100%
> copy from lib/ldb/ABI/ldb-2.0.2.sigs
> copy to lib/ldb/ABI/ldb-2.0.3.sigs
> diff --git a/lib/ldb/ABI/pyldb-util-1.1.10.sigs b/lib/ldb/ABI/pyldb-uti=
l-2.0.3.sigs
> similarity index 100%
> copy from lib/ldb/ABI/pyldb-util-1.1.10.sigs
> copy to lib/ldb/ABI/pyldb-util-2.0.3.sigs
> diff --git a/lib/ldb/ldb_key_value/ldb_kv.c b/lib/ldb/ldb_key_value/ldb=
_kv.c
> index c8f7fd1396d..d9b7b0af46a 100644
> --- a/lib/ldb/ldb_key_value/ldb_kv.c
> +++ b/lib/ldb/ldb_key_value/ldb_kv.c
> @@ -301,6 +301,34 @@ static int ldb_kv_check_special_dn(struct ldb_modu=
le *module,
>  	return LDB_SUCCESS;
>  }
> =20
> +/*
> + * Called after modifies and when starting a transaction. Checks targe=
t pack
> + * format version and current pack format version, which are set by ca=
che_load,
> + * and repacks if necessary.
> + */
> +static int ldb_kv_maybe_repack(struct ldb_kv_private *ldb_kv) {
> +	/* Override option taken from ldb options */
> +	if (ldb_kv->pack_format_override !=3D 0) {
> +		ldb_kv->target_pack_format_version =3D
> +			ldb_kv->pack_format_override;
> +	}
> +
> +	if (ldb_kv->pack_format_version !=3D
> +	    ldb_kv->target_pack_format_version) {
> +		int r;
> +		struct ldb_context *ldb =3D ldb_module_get_ctx(ldb_kv->module);
> +		ldb_kv->pack_format_version =3D
> +			ldb_kv->target_pack_format_version;
> +		r =3D ldb_kv_repack(ldb_kv->module);
> +		if (r !=3D LDB_SUCCESS) {
> +			ldb_debug(ldb, LDB_DEBUG_ERROR,
> +				  "Database repack failed.");
> +		}
> +		return r;
> +	}
> +
> +	return LDB_SUCCESS;
> +}
> =20
>  /*
>    we've made a modification to a dn - possibly reindex and
> @@ -1447,6 +1475,20 @@ static int ldb_kv_prepare_commit(struct ldb_modu=
le *module)
>  		return ret;
>  	}
> =20
> +	/*
> +	 * If GUID indexing was toggled in this transaction, we repack at
> +	 * format version 2 if GUID indexing was enabled, or version 1 if
> +	 * it was disabled.
> +	 */
> +	ret =3D ldb_kv_maybe_repack(ldb_kv);
> +	if (ret !=3D LDB_SUCCESS) {
> +		ldb_kv_del_trans(module);
> +		ldb_set_errstring(ldb_module_get_ctx(module),
> +				  "Failure during re-pack, so "
> +				  "transaction must be aborted.");
> +		return ret;
> +	}
> +
>  	if (ldb_kv->kv_ops->prepare_write(ldb_kv) !=3D 0) {
>  		ret =3D ldb_kv->kv_ops->error(ldb_kv);
>  		ldb_debug_set(ldb_module_get_ctx(module),
> @@ -1895,10 +1937,10 @@ int ldb_kv_init_store(struct ldb_kv_private *ld=
b_kv,
> =20
>  	ldb_kv->sequence_number =3D 0;
> =20
> -	ldb_kv->pack_format_version =3D LDB_PACKING_FORMAT;
> -
>  	ldb_kv->pid =3D getpid();
> =20
> +	ldb_kv->pack_format_override =3D 0;
> +
>  	ldb_kv->module =3D ldb_module_new(ldb, ldb, name, &ldb_kv_ops);
>  	if (!ldb_kv->module) {
>  		ldb_oom(ldb);
> @@ -1935,6 +1977,40 @@ int ldb_kv_init_store(struct ldb_kv_private *ldb=
_kv,
>  		}
>  	}
> =20
> +	/*
> +	 * Usually the presence of GUID indexing determines the pack format
> +	 * we use but in certain circumstances such as downgrading an
> +	 * MDB-backed database, we want to override the target pack format.
> +	 *
> +	 * We set/get opaques here because in the Samba partitions module,
> +	 * 'options' are not passed correctly so sub-databases can't see
> +	 * the options they need.
> +	 */
> +	{
> +		const char *pack_format_override =3D
> +			ldb_options_find(ldb, options, "pack_format_override");
> +		if (pack_format_override !=3D NULL) {
> +			int ret;
> +			ldb_kv->pack_format_override =3D
> +				strtoul(pack_format_override, NULL, 0);
> +			ret =3D ldb_set_opaque(ldb,
> +					     "pack_format_override",
> +			     (void *)(intptr_t)ldb_kv->pack_format_override);
> +			if (ret !=3D LDB_SUCCESS) {
> +				talloc_free(ldb_kv->module);
> +				return ldb_module_operr(ldb_kv->module);
> +			}
> +		} else {
> +			/*
> +			 * NULL -> 0 is fine, otherwise we get back
> +			 * the number we needed
> +			 */
> +			ldb_kv->pack_format_override
> +				=3D (intptr_t)ldb_get_opaque(ldb,
> +						   "pack_format_override");
> +		}
> +	}
> +
>  	/*
>  	 * Override full DB scans
>  	 *
> diff --git a/lib/ldb/ldb_key_value/ldb_kv.h b/lib/ldb/ldb_key_value/ldb=
_kv.h
> index 1186e86ec9f..8da970fd2f9 100644
> --- a/lib/ldb/ldb_key_value/ldb_kv.h
> +++ b/lib/ldb/ldb_key_value/ldb_kv.h
> @@ -64,6 +64,8 @@ struct ldb_kv_private {
> =20
>  	unsigned long long sequence_number;
>  	uint32_t pack_format_version;
> +	uint32_t target_pack_format_version;
> +	uint32_t pack_format_override;
> =20
>  	/* the low level tdb seqnum - used to avoid loading BASEINFO when
>  	   possible */
> @@ -141,6 +143,12 @@ struct ldb_kv_reindex_context {
>  	uint32_t count;
>  };
> =20
> +struct ldb_kv_repack_context {
> +	int error;
> +	uint32_t count;
> +	bool normal_record_seen;
> +};
> +
> =20
>  /* special record types */
>  #define LDB_KV_INDEX      "@INDEX"
> @@ -226,6 +234,7 @@ int ldb_kv_index_del_value(struct ldb_module *modul=
e,
>  			   struct ldb_message_element *el,
>  			   unsigned int v_idx);
>  int ldb_kv_reindex(struct ldb_module *module);
> +int ldb_kv_repack(struct ldb_module *module);
>  int ldb_kv_index_transaction_start(
>  	struct ldb_module *module,
>  	size_t cache_size);
> diff --git a/lib/ldb/ldb_key_value/ldb_kv_cache.c b/lib/ldb/ldb_key_val=
ue/ldb_kv_cache.c
> index c5f661113fd..3d8a09123e0 100644
> --- a/lib/ldb/ldb_key_value/ldb_kv_cache.c
> +++ b/lib/ldb/ldb_key_value/ldb_kv_cache.c
> @@ -418,7 +418,6 @@ int ldb_kv_cache_load(struct ldb_module *module)
>  	const struct ldb_schema_attribute *a;
>  	bool have_write_txn =3D false;
>  	int r;
> -	uint32_t pack_format_version;
>  	struct ldb_val key;
> =20
>  	ldb =3D ldb_module_get_ctx(module);
> @@ -453,29 +452,7 @@ int ldb_kv_cache_load(struct ldb_module *module)
>  	/* Read packing format from first 4 bytes of @BASEINFO record */
>  	r =3D ldb_kv->kv_ops->fetch_and_parse(ldb_kv, key,
>  					    get_pack_format_version,
> -					    &pack_format_version);
> -
> -	if (r !=3D LDB_ERR_NO_SUCH_OBJECT) {
> -		if (r !=3D LDB_SUCCESS) {
> -			goto failed_and_unlock;
> -		}
> -
> -		/* Make sure the database has the right format */
> -		if (pack_format_version !=3D ldb_kv->pack_format_version) {
> -			ldb_debug(ldb, LDB_DEBUG_ERROR,
> -				  "Unexpected packing format. "
> -				  "Expected: %#010x, Got: %#010x",
> -				  pack_format_version,
> -				  ldb_kv->pack_format_version);
> -			goto failed_and_unlock;
> -		}
> -	}
> -
> -	/* Now fetch the whole @BASEINFO record */
> -	r =3D ldb_kv_search_dn1(module, baseinfo_dn, baseinfo, 0);
> -	if (r !=3D LDB_SUCCESS && r !=3D LDB_ERR_NO_SUCH_OBJECT) {
> -		goto failed_and_unlock;
> -	}
> +					    &ldb_kv->pack_format_version);
> =20
>  	/* possibly initialise the baseinfo */
>  	if (r =3D=3D LDB_ERR_NO_SUCH_OBJECT) {
> @@ -492,15 +469,25 @@ int ldb_kv_cache_load(struct ldb_module *module)
> =20
>  		have_write_txn =3D true;
> =20
> +		/*
> +		 * We need to write but haven't figured out packing format yet.
> +		 * Just go with version 1 and we'll repack if we got it wrong.
> +		 */
> +		ldb_kv->pack_format_version =3D LDB_PACKING_FORMAT;
> +		ldb_kv->target_pack_format_version =3D LDB_PACKING_FORMAT;
> +
>  		/* error handling for ltdb_baseinfo_init() is by
>  		   looking for the record again. */
>  		ldb_kv_baseinfo_init(module);
> =20
> -		if (ldb_kv_search_dn1(module, baseinfo_dn, baseinfo, 0) !=3D
> -		    LDB_SUCCESS) {
> -			goto failed_and_unlock;
> -		}
> +	} else if (r !=3D LDB_SUCCESS) {
> +		goto failed_and_unlock;
> +	}
> =20
> +	/* OK now we definitely have a @BASEINFO record so fetch it */
> +	r =3D ldb_kv_search_dn1(module, baseinfo_dn, baseinfo, 0);
> +	if (r !=3D LDB_SUCCESS) {
> +		goto failed_and_unlock;
>  	}
> =20
>  	/* Ignore the result, and update the sequence number */
> @@ -562,8 +549,15 @@ int ldb_kv_cache_load(struct ldb_module *module)
>  		goto failed_and_unlock;
>  	}
> =20
> +	/*
> +	 * Initialise packing version and GUID index syntax, and force the
> +	 * two to travel together, ie a GUID indexed database must use V2
> +	 * packing format and a DN indexed database must use V1.
> +	 */
>  	ldb_kv->GUID_index_syntax =3D NULL;
>  	if (ldb_kv->cache->GUID_index_attribute !=3D NULL) {
> +		ldb_kv->target_pack_format_version =3D LDB_PACKING_FORMAT_V2;
> +
>  		/*
>  		 * Now the attributes are loaded, set the guid_index_syntax.
>  		 * This can't fail, it will return a default at worst
> @@ -571,6 +565,8 @@ int ldb_kv_cache_load(struct ldb_module *module)
>  		a =3D ldb_schema_attribute_by_name(
>  		    ldb, ldb_kv->cache->GUID_index_attribute);
>  		ldb_kv->GUID_index_syntax =3D a->syntax;
> +	} else {
> +		ldb_kv->target_pack_format_version =3D LDB_PACKING_FORMAT;
>  	}
> =20
>  done:
> diff --git a/lib/ldb/ldb_key_value/ldb_kv_index.c b/lib/ldb/ldb_key_val=
ue/ldb_kv_index.c
> index f6b2620a875..5af248a1931 100644
> --- a/lib/ldb/ldb_key_value/ldb_kv_index.c
> +++ b/lib/ldb/ldb_key_value/ldb_kv_index.c
> @@ -924,7 +924,8 @@ static struct ldb_dn *ldb_kv_index_key(struct ldb_c=
ontext *ldb,
>  			v =3D *value;
>  		} else {
>  			ldb_attr_handler_t fn;
> -			if (a->syntax->index_format_fn) {
> +			if (a->syntax->index_format_fn &&
> +			    ldb_kv->cache->GUID_index_attribute !=3D NULL) {
>  				fn =3D a->syntax->index_format_fn;
>  			} else {
>  				fn =3D a->syntax->canonicalise_fn;
> @@ -3411,6 +3412,96 @@ static int re_index(struct ldb_kv_private *ldb_k=
v,
>  	return 0;
>  }
> =20
> +static int re_pack(struct ldb_kv_private *ldb_kv,
> +		   struct ldb_val key,
> +		   struct ldb_val val,
> +		   void *state)
> +{
> +	struct ldb_context *ldb;
> +	struct ldb_message *msg;
> +	struct ldb_module *module =3D ldb_kv->module;
> +	struct ldb_kv_repack_context *ctx =3D
> +	    (struct ldb_kv_repack_context *)state;
> +	int ret;
> +
> +	ldb =3D ldb_module_get_ctx(module);
> +
> +	msg =3D ldb_msg_new(module);
> +	if (msg =3D=3D NULL) {
> +		return -1;
> +	}
> +
> +	ret =3D ldb_unpack_data(ldb, &val, msg);
> +	if (ret !=3D 0) {
> +		ldb_debug(ldb, LDB_DEBUG_ERROR, "Repack: unpack failed: %s\n",
> +			  ldb_dn_get_linearized(msg->dn));
> +		ctx->error =3D ret;
> +		talloc_free(msg);
> +		return -1;
> +	}
> +
> +	ret =3D ldb_kv_store(module, msg, TDB_MODIFY);
> +	if (ret !=3D LDB_SUCCESS) {
> +		ldb_debug(ldb, LDB_DEBUG_ERROR, "Repack: store failed: %s\n",
> +			  ldb_dn_get_linearized(msg->dn));
> +		ctx->error =3D ret;
> +		talloc_free(msg);
> +		return -1;
> +	}
> +
> +	/*
> +	 * Warn the user that we're repacking the first time we see a normal
> +	 * record. This means we never warn if we're repacking a database wit=
h
> +	 * only @ records. This is because during database initialisation,
> +	 * we might repack as initial settings are written out, and we don't
> +	 * want to spam the log.
> +	 */
> +	if ((!ctx->normal_record_seen) && (!ldb_dn_is_special(msg->dn))) {
> +		ldb_debug(ldb, LDB_DEBUG_WARNING,
> +			  "Repacking database with format %#010x",
> +			  ldb_kv->pack_format_version);
> +		ctx->normal_record_seen =3D true;
> +	}
> +
> +	ctx->count++;
> +	if (ctx->count % 10000 =3D=3D 0) {
> +		ldb_debug(ldb, LDB_DEBUG_WARNING,
> +			  "Repack: re-packed %u records so far",
> +			  ctx->count);
> +	}
> +
> +	return 0;
> +}
> +
> +int ldb_kv_repack(struct ldb_module *module)
> +{
> +	struct ldb_kv_private *ldb_kv =3D talloc_get_type(
> +	    ldb_module_get_private(module), struct ldb_kv_private);
> +	struct ldb_context *ldb =3D ldb_module_get_ctx(module);
> +	struct ldb_kv_repack_context ctx;
> +	int ret;
> +
> +	ctx.count =3D 0;
> +	ctx.error =3D LDB_SUCCESS;
> +	ctx.normal_record_seen =3D false;
> +
> +	/* Iterate all database records and repack them in the new format */
> +	ret =3D ldb_kv->kv_ops->iterate(ldb_kv, re_pack, &ctx);
> +	if (ret < 0) {
> +		ldb_debug(ldb, LDB_DEBUG_ERROR, "Repack traverse failed: %s",
> +			  ldb_errstring(ldb));
> +		return LDB_ERR_OPERATIONS_ERROR;
> +	}
> +
> +	if (ctx.error !=3D LDB_SUCCESS) {
> +		ldb_debug(ldb, LDB_DEBUG_ERROR, "Repack failed: %s",
> +			  ldb_errstring(ldb));
> +		return ctx.error;
> +	}
> +
> +	return LDB_SUCCESS;
> +}
> +
>  /*
>    force a complete reindex of the database
>  */
> diff --git a/lib/ldb/ldb_tdb/ldb_tdb.c b/lib/ldb/ldb_tdb/ldb_tdb.c
> index 2f0468fd40a..6e2cb633a4d 100644
> --- a/lib/ldb/ldb_tdb/ldb_tdb.c
> +++ b/lib/ldb/ldb_tdb/ldb_tdb.c
> @@ -242,6 +242,7 @@ struct kv_ctx {
>  	int (*parser)(struct ldb_val key,
>  		      struct ldb_val data,
>  		      void *private_data);
> +	int parser_ret;
>  };
> =20
>  static int ltdb_traverse_fn_wrapper(struct tdb_context *tdb,
> @@ -350,7 +351,8 @@ static int ltdb_parse_record_wrapper(TDB_DATA tdb_k=
ey,
>  		.data =3D tdb_data.dptr,
>  	};
> =20
> -	return kv_ctx->parser(key, data, kv_ctx->ctx);
> +	kv_ctx->parser_ret =3D kv_ctx->parser(key, data, kv_ctx->ctx);
> +	return kv_ctx->parser_ret;
>  }
> =20
>  static int ltdb_parse_record(struct ldb_kv_private *ldb_kv,
> @@ -374,7 +376,9 @@ static int ltdb_parse_record(struct ldb_kv_private =
*ldb_kv,
> =20
>  	ret =3D tdb_parse_record(
>  	    ldb_kv->tdb, key, ltdb_parse_record_wrapper, &kv_ctx);
> -	if (ret =3D=3D 0) {
> +	if (kv_ctx.parser_ret !=3D LDB_SUCCESS) {
> +		return kv_ctx.parser_ret;
> +	} else if (ret =3D=3D 0) {
>  		return LDB_SUCCESS;
>  	}
>  	return ltdb_err_map(tdb_error(ldb_kv->tdb));
> diff --git a/lib/ldb/pyldb.c b/lib/ldb/pyldb.c
> index cf7779128d4..940e43e3192 100644
> --- a/lib/ldb/pyldb.c
> +++ b/lib/ldb/pyldb.c
> @@ -4430,6 +4430,8 @@ static PyObject* module_init(void)
>  	ADD_LDB_INT(FLG_ENABLE_TRACING);
>  	ADD_LDB_INT(FLG_DONT_CREATE_DB);
> =20
> +	ADD_LDB_INT(PACKING_FORMAT);
> +	ADD_LDB_INT(PACKING_FORMAT_V2);
> =20
>  	/* Historical misspelling */
>  	PyModule_AddIntConstant(m, "ERR_ALIAS_DEREFERINCING_PROBLEM", LDB_ERR=
_ALIAS_DEREFERENCING_PROBLEM);
> diff --git a/lib/ldb/tests/guidindexpackv1.ldb b/lib/ldb/tests/guidinde=
xpackv1.ldb
> new file mode 100644
> index 00000000000..4c79dfedddd
> Binary files /dev/null and b/lib/ldb/tests/guidindexpackv1.ldb differ
> diff --git a/lib/ldb/tests/ldb_kv_ops_test.c b/lib/ldb/tests/ldb_kv_ops=
_test.c
> index c16297e136b..ab9d75bc69c 100644
> --- a/lib/ldb/tests/ldb_kv_ops_test.c
> +++ b/lib/ldb/tests/ldb_kv_ops_test.c
> @@ -206,6 +206,17 @@ static int parse(struct ldb_val key,
>  	return LDB_SUCCESS;
>  }
> =20
> +/*
> + * Parse function that just returns the int we pass it.
> + */
> +static int parse_return(struct ldb_val key,
> +		        struct ldb_val data,
> +		        void *private_data)
> +{
> +	int *rcode =3D private_data;
> +	return *rcode;
> +}
> +
>  /*
>   * Test that data can be written to the kv store and be read back.
>   */
> @@ -228,6 +239,7 @@ static void test_add_get(void **state)
>  	};
> =20
>  	struct ldb_val read;
> +	int rcode;
> =20
>  	int flags =3D 0;
>  	TALLOC_CTX *tmp_ctx;
> @@ -265,6 +277,17 @@ static void test_add_get(void **state)
>  	assert_int_equal(sizeof(value), read.length);
>  	assert_memory_equal(value, read.data, sizeof(value));
> =20
> +	/*
> +	 * Now check that the error code we return in the
> +	 * parse function is returned by fetch_and_parse.
> +	 */
> +	for (rcode=3D0; rcode<50; rcode++) {
> +		ret =3D ldb_kv->kv_ops->fetch_and_parse(ldb_kv, key,
> +						      parse_return,
> +						      &rcode);
> +		assert_int_equal(ret, rcode);
> +	}
> +
>  	ret =3D ldb_kv->kv_ops->unlock_read(test_ctx->ldb->modules);
>  	assert_int_equal(ret, 0);
>  	talloc_free(tmp_ctx);
> diff --git a/lib/ldb/tests/python/repack.py b/lib/ldb/tests/python/repa=
ck.py
> new file mode 100644
> index 00000000000..0844cd24e58
> --- /dev/null
> +++ b/lib/ldb/tests/python/repack.py
> @@ -0,0 +1,204 @@
> +import os
> +from unittest import TestCase
> +import shutil
> +from subprocess import check_output
> +import ldb
> +
> +TDB_PREFIX =3D "tdb://"
> +MDB_PREFIX =3D "mdb://"
> +
> +def tempdir():
> +    import tempfile
> +    try:
> +        dir_prefix =3D os.path.join(os.environ["SELFTEST_PREFIX"], "tm=
p")
> +    except KeyError:
> +        dir_prefix =3D None
> +    return tempfile.mkdtemp(dir=3Ddir_prefix)
> +
> +
> +# Check enabling and disabling GUID indexing works and that the databa=
se is
> +# repacked at version 2 if GUID indexing is enabled, or version 1 if d=
isabled.
> +class GUIDIndexAndPackFormatTests(TestCase):
> +    prefix =3D TDB_PREFIX
> +
> +    def setup_newdb(self):
> +        self.testdir =3D tempdir()
> +        self.filename =3D os.path.join(self.testdir,
> +                                     "guidpackformattest.ldb")
> +        url =3D self.prefix + self.filename
> +        self.l =3D ldb.Ldb(url, options=3D["modules:"])
> +
> +        self.num_recs_added =3D 0
>=20
>=20



--xjEecJTHgEaCyyYmKxIyBf2gMzCfjZZsh--

--WhCwj8EubaEgtrFxRPP283T5MinvQI19H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAlzuZ6oACgkQDbX1YShp
vVaGzBAAqhrp8fQZUqgJXzn7E/1IccYY2qRV+kEo1V8BFzkoz+FUgK8l4uLARaSR
jP5yjypSJwOfvqXDHNzLGYIaCtSOcQuigAbI5s5W34oozSLfDV9zaT5hiCGhxd72
+IFa8IbJ0QzbKI/tcjOl5cCTcr12cQAL1nro271tol3+aNuuj3jhf+DMa1vD0WIh
buI1/o/BT/WzW1tixS3+XhjWvsHS02UYLAEcmTlifLI5exqMPRDFgNy+0FZg+5ib
hXeal2bdmbTCtyeLTJFoVuRXrKhXfiZZbJaNQ5DET7aoQaya/3h4OO9OaxBNxzXM
83sVxDurBThHyT5G4ZAoWJKagwR43hkqfWYtLB6L+Tm4D1J18dFGlhOsvocpdNaz
fTnRCUmRq1cA82jfxDUh0qGAJ0TnUJe2Ok3/pZRpWubbIqEcuYyeFS57l5j0NAwL
z6PtI63oEiPtstXuMcPjWRoJrwzMbMA3mylJK+KnNIelbvM8g69gTUcaaRo9n6n5
jcWPwXbWNWMWinWzGP5CHvqi6NjXXGECCwdg6/wdFum2pGns/D5JibNX+nml1lQ9
n298Wrcf4fY8PT6GD8mdDQKFZAxYqChgsqnrSPGCu1MlNdQRdg6srGVrXgKq9dIk
m0WcM2NcTLQyqHNGNYaEYcqMo0rws+Ug+pBEWHsnB5czBLn+Ico=
=vk6X
-----END PGP SIGNATURE-----

--WhCwj8EubaEgtrFxRPP283T5MinvQI19H--

