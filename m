Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FC11147C
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 09:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=wZTqXOF9HbaMjd9eTapc7hvYo3SHwuPuxOUMAYSQmJQ=; b=jw7jCg8jRPMylC+8ENzQ0bvBZO
	+NWcW3IMThpwlC8FPxTijXQJo2Eq8h1tnhoYi1KnGlGufbTmJy3uYCyC555mYOCGX34Cz00qPxYLr
	4zWd5PfoNQ97AsZZwO9dsskeIaevRjVvQf1yetRpN6qzNv6PUy3JeTrQgjxzlnTqZbsc0GzcMYvpT
	T9mAYv282Xd4M97F2O+0VX8PI9+QBXS4eGWHNwCHbxY0L+uMBZkurwEcFASH3fXKvcwH6izKlJStb
	KkXLU/HcBzuvaBP1ifaAbD4GACMUUrWhrqQ5vk4un+AplAD3fjbiWtx/jtPaNAtIKfyvrBxQHcnQx
	HV/EIjAA==;
Received: from localhost ([::1]:22254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hM6QF-001x82-V5; Thu, 02 May 2019 07:46:28 +0000
Received: from mx2.heinlein-support.de ([91.198.250.20]:55936
 helo=mx1.heinlein-support.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hM6QA-001x7v-3k
 for samba-technical@lists.samba.org; Thu, 02 May 2019 07:46:24 +0000
Received: from gerste.heinlein-support.de (gerste.heinlein-support.de
 [91.198.250.173])
 by mx1.heinlein-support.de (Postfix) with ESMTP id 71D2B2E0EB3
 for <samba-technical@lists.samba.org>; Thu,  2 May 2019 09:46:14 +0200 (CEST)
Received: from mx1.heinlein-support.de ([91.198.250.20])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.170])
 (amavisd-new, port 10024)
 with ESMTP id gsrEZ6jI9pQG for <samba-technical@lists.samba.org>;
 Thu,  2 May 2019 09:46:12 +0200 (CEST)
Received: from marchiv.heinlein-support.de (marchiv.heinlein-support.de
 [91.198.250.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.heinlein-support.de (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Thu,  2 May 2019 09:46:12 +0200 (CEST)
Received: from MailAppDispatcher (localhost.localdomain [127.0.0.1])
 by marchiv.heinlein-support.de (Postfix) with ESMTP id 0069848153
 for <samba-technical@lists.samba.org>; Thu,  2 May 2019 09:46:11 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by marchiv.heinlein-support.de (Postfix) with ESMTP id CC79448162
 for <samba-technical@lists.samba.org>; Thu,  2 May 2019 09:46:11 +0200 (CEST)
Received: from marchiv.heinlein-support.de ([127.0.0.1])
 by localhost (marchiv.heinlein-support.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id Hrpj-Fqvyyqf for <samba-technical@lists.samba.org>;
 Thu,  2 May 2019 09:46:11 +0200 (CEST)
Received: from plasma32.jpberlin.de (plasma32.jpberlin.de [80.241.57.8])
 by marchiv.heinlein-support.de (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Thu,  2 May 2019 09:46:11 +0200 (CEST)
Received: from [192.168.102.183] (pD95825C1.dip0.t-ipconnect.de
 [217.88.37.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: r.sander@heinlein-support.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 65CBD1003BC
 for <samba-technical@lists.samba.org>; Thu,  2 May 2019 09:46:11 +0200 (CEST)
Subject: Re: [PATCH] use current working directory instead of share path in
 cephwrap_realpath
To: samba-technical@lists.samba.org
References: <2ccf782c-f2fe-2ed7-23b6-fdf336b1d172@heinlein-support.de>
 <20190501221418.0a115c99@samba.org>
Openpgp: preference=signencrypt
Organization: Heinlein Support GmbH
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <6e3bd727-ec97-e707-fdd6-5799555823d6@heinlein-support.de>
Date: Thu, 2 May 2019 09:46:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501221418.0a115c99@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="jUqGZyXVEBIs3ODaB7kXkIQEP0EUXfeEr"
X-Mailarchiv-ID: 6276860
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
From: Robert Sander via samba-technical <samba-technical@lists.samba.org>
Reply-To: Robert Sander <r.sander@heinlein-support.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jUqGZyXVEBIs3ODaB7kXkIQEP0EUXfeEr
Content-Type: multipart/mixed; boundary="kNHxagFqdWRyExJTIcrJii7kVYJ8NGI6Z";
 protected-headers="v1"
From: Robert Sander <r.sander@heinlein-support.de>
To: samba-technical@lists.samba.org
Message-ID: <6e3bd727-ec97-e707-fdd6-5799555823d6@heinlein-support.de>
Subject: Re: [PATCH] use current working directory instead of share path in
 cephwrap_realpath
References: <2ccf782c-f2fe-2ed7-23b6-fdf336b1d172@heinlein-support.de>
 <20190501221418.0a115c99@samba.org>
In-Reply-To: <20190501221418.0a115c99@samba.org>

--kNHxagFqdWRyExJTIcrJii7kVYJ8NGI6Z
Content-Type: multipart/mixed;
 boundary="------------DBA74B0CDD52E6D82BCBE9BE"
Content-Language: de-DE

This is a multi-part message in MIME format.
--------------DBA74B0CDD52E6D82BCBE9BE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your quick and positive feedback.
I hope the patch has the correct format now.

Kindest Regards
--=20
Robert Sander
Heinlein Support GmbH
Schwedter Str. 8/9b, 10119 Berlin

https://www.heinlein-support.de

Tel: 030 / 405051-43
Fax: 030 / 405051-19

Amtsgericht Berlin-Charlottenburg - HRB 93818 B
Gesch=C3=A4ftsf=C3=BChrer: Peer Heinlein - Sitz: Berlin

--------------DBA74B0CDD52E6D82BCBE9BE
Content-Type: text/x-patch;
 name="ceph-symlinks.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="ceph-symlinks.patch"

=46rom e39ed34985f9a8f17f716e2575b8553f0e644883 Mon Sep 17 00:00:00 2001
From: Robert Sander <r.sander@heinlein-support.de>
Date: Fri, 26 Apr 2019 17:52:58 +0200
Subject: [PATCH] use current working directory instead of share path

Bug: https://bugzilla.samba.org/show_bug.cgi?id=3D13918
Signed-off-by: Robert Sander <r.sander@heinlein-support.de>
---
 source3/modules/vfs_ceph.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/source3/modules/vfs_ceph.c b/source3/modules/vfs_ceph.c
index cf45fb4c919..57de8bc891a 100644
--- a/source3/modules/vfs_ceph.c
+++ b/source3/modules/vfs_ceph.c
@@ -1206,14 +1206,14 @@ static struct smb_filename *cephwrap_realpath(str=
uct vfs_handle_struct *handle,
        } else if ((len >=3D 2) && (path[0] =3D=3D '.') && (path[1] =3D=3D=
 '/')) {
                if (len =3D=3D 2) {
                        r =3D asprintf(&result, "%s",
-                                       handle->conn->connectpath);
+                                       handle->conn->cwd_fname->base_nam=
e);
                } else {
                        r =3D asprintf(&result, "%s/%s",
-                                       handle->conn->connectpath, &path[=
2]);
+                                       handle->conn->cwd_fname->base_nam=
e, &path[2]);
                }
        } else {
                r =3D asprintf(&result, "%s/%s",
-                               handle->conn->connectpath, path);
+                               handle->conn->cwd_fname->base_name, path)=
;
        }
=20
        if (r < 0) {
--=20
2.17.1


--------------DBA74B0CDD52E6D82BCBE9BE--

--kNHxagFqdWRyExJTIcrJii7kVYJ8NGI6Z--

--jUqGZyXVEBIs3ODaB7kXkIQEP0EUXfeEr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEEhVXmaPzvl7l1erVE8LuRWCPeWygFAlzKoEIACgkQ8LuRWCPe
WygGtQ/1GBMslFUROIOkcj5Vg3sQavy5+5b4tBVEykf1RLAQUprldwZppxy79+sv
lJTV9uQ1ECqrJsKd/mo5ev+NzTjrxPM6oaykx0T88LiOPFqNDwJB2IdKnnEJHbyN
aq7Bx5YycHPEw5KprXDRX+yGKvsL/3XwETrkVu2V9UwmDcwuLKgz/d39hyvT6DOf
Wu0GfCBCnytRdNHsNfTYabpkmfbwqd9G4G9GijBQkqfmWUxGq6QEQK/opO5KpBEG
CnTZTiWA2iVhl/w81Tc68hVuwB2exMgz+uDyA+jRFigwGTmzYh5nPsHBjJZPVjdb
CnItiHc4I3L3j1CMqUEDt5sQvEwQMnNGEk2ljOHG0MS5Ys7bgOSOarEZBM9knumu
a9YjuGxqqKqqgsEr3ArBniKVjvpbZ/anCvUvGWtrzMix9N5TI8tlrZDpgMj/Dk5q
zzVcc9w/mMv47SWBZ7FF6CG7Qlhv4PvEAhiT1zR4dddCVSQ8us5fEpSgCDny/tUq
Q+2UTbgSSY0AZVkipz30PHZnDbiogO7y6308rGy0V1X1oPRlO7Q8Fhp7v4vOZJS3
rOS6OfY/zvd054c4sBvxy2a1c9E2iZgXFlNgeclMkW6/A8Pi8FNg2XPf/VO8GvvI
t4bUBPJW8b2LON5UBWotSCWHXSKRxJYNNllkfEflldVQhj4laQ==
=HLYU
-----END PGP SIGNATURE-----

--jUqGZyXVEBIs3ODaB7kXkIQEP0EUXfeEr--

