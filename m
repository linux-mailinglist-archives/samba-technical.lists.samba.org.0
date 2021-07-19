Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F93CE1DA
	for <lists+samba-technical@lfdr.de>; Mon, 19 Jul 2021 18:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=PQN4aAD205dFmziahskiZjF3c5aBUNcehJI9iYWFNi8=; b=Tap+XVMLeZKMW/enDgNliSbXLc
	RTH/XwVgjO6QXm5kHWl0sKT6S2MCwG5DEgwYK2CUEL3+hdAUA7gy4ejriwH8PvPwVqVJsn3xkAQ3Y
	rkCDDk/JcYXSqeUrvRySFSdL5888654F8K+P5IiSyPORlWm2x3MdX88uZSUjN0tIuD3Ud+igM8U2E
	w1DgC9JfREqzoXyaNVZMLYGwXLSnTLKvKJTwSLojgS3yY74C4h6DIjWAfUfffBfwTKIx9IQVpjcMo
	rfwKNpgfU3RDMfubs/YdYwX7QVo6NvRAXCbH0IR3Ia9djlp5BMkhnafoLfSg1XvRL3k2JfHoLrm0+
	cVDCxt4A==;
Received: from ip6-localhost ([::1]:64378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m5Vs3-00FB4X-Vf; Mon, 19 Jul 2021 16:11:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44324) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m5Vry-00FB4J-Ve; Mon, 19 Jul 2021 16:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=PQN4aAD205dFmziahskiZjF3c5aBUNcehJI9iYWFNi8=; b=WdzNdwX757Nz8W9iX050ccb6L9
 wwFbmxEZF9hMZjFOVs8hHAoXBFm6ZZjR48BoX26VNx3V93w+2JiMKTkUL4HaSAE/s51AV/4Naj5Rs
 4RaRZB9W5T5flQpuusxLi6YTaCPWjvRD8stK7vdBiXmH6E4OGZhvve6WCjqBzaWWzQkBwrtAUYuab
 N/xY59oB1sMnxh5YojuwuAjSxZZDaII9Q7eyeDBI6EOX8Vv4KZfxbOPEEXnl5Qt2C09a31pxxnfvE
 yz3m7RN7bIsGBg+GJulMKED64njAp+w4amudeqTYvdT3sPJvUReDdPesU6Y7/sVWW10jLdASttx6U
 oRX+nrakzp528UcnpzJeAkK1Sv1J9Jo11jR10HUsPkIFKsNwPV37u+1uxhLAmDJRQxS7qIVczOBqa
 3EZ3yVI6FjdtGGTIcep1TIhK4bJxbPFYmXySXmGOcRgEmzXGqKDq0n9282LeNMKoEx7HOgOXDLHND
 NNUqNpkpgMa6URWtT4h6/LsX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m5Vrx-0002Yr-Qq; Mon, 19 Jul 2021 16:11:50 +0000
Date: Mon, 19 Jul 2021 09:11:47 -0700
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: Has anyone checked ceph with 4.15.rc1 ?
Message-ID: <20210719161147.GA2806846@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

I'm guessing enumerating directories will
fail due to me forgetting to remove a

         SMB_ASSERT(fsp_get_pathref_fd(dirfsp) == AT_FDCWD);

inside cephwrap_openat().

Can someone confirm, and I'll log a bug and
add the fix (attached below - the same as
we used from glusterfs).

If the same person can confirm the attached
patch fixes it I'd also be grateful :-).

Cheers,

Jeremy.

--EVF5PPMfhYS0aIcm
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-s3-VFS-ceph.-Fix-enumerating-directories.-dirfsp-fh-.patch"
Content-Transfer-Encoding: quoted-printable

=46rom d457d8e8dc3f4610eff0824357c5efd54b8bc9f7 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Fri, 16 Jul 2021 18:53:24 -0700
Subject: [PATCH] s3: VFS: ceph. Fix enumerating directories. dirfsp->fh->fd=
 !=3D
 AT_FDCWD in this case.

Same as the fix for glusterfs.

BUG: ??? TBD.

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_ceph.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/source3/modules/vfs_ceph.c b/source3/modules/vfs_ceph.c
index 594ebce4b9a..3f55d724143 100644
--- a/source3/modules/vfs_ceph.c
+++ b/source3/modules/vfs_ceph.c
@@ -403,14 +403,23 @@ static int cephwrap_openat(struct vfs_handle_struct *=
handle,
 			   int flags,
 			   mode_t mode)
 {
+	struct smb_filename *name =3D NULL;
 	bool have_opath =3D false;
 	bool became_root =3D false;
 	int result =3D -ENOENT;
=20
 	/*
-	 * cephfs API doesn't have ceph_openat(), so for now assert this.
+	 * ceph doesn't have openat().
 	 */
-	SMB_ASSERT(fsp_get_pathref_fd(dirfsp) =3D=3D AT_FDCWD);
+	if (fsp_get_pathref_fd(dirfsp) !=3D AT_FDCWD) {
+		name =3D full_path_from_dirfsp_atname(talloc_tos(),
+						    dirfsp,
+						    smb_fname);
+		if (name =3D=3D NULL) {
+			return -1;
+		}
+		smb_fname =3D name;
+	}
=20
 	DBG_DEBUG("[CEPH] openat(%p, %s, %p, %d, %d)\n", handle,
 		  smb_fname_str_dbg(smb_fname), fsp, flags, mode);
@@ -438,6 +447,7 @@ static int cephwrap_openat(struct vfs_handle_struct *ha=
ndle,
 	}
=20
 out:
+	TALLOC_FREE(name);
 	fsp->fsp_flags.have_proc_fds =3D false;
 	DBG_DEBUG("[CEPH] open(...) =3D %d\n", result);
 	WRAP_RETURN(result);
--=20
2.27.0


--EVF5PPMfhYS0aIcm--

