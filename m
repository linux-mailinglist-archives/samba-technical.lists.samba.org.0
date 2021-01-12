Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5985B2F3B04
	for <lists+samba-technical@lfdr.de>; Tue, 12 Jan 2021 20:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ojxDpljTA/ZymnDhS1z9Q2S/k6u3VxRCMomCG6ytV6A=; b=cPX9Nk4vMwoZpX5U5JMsQfgZtk
	GmE3S7FsRurXmZC5LpflzJYNRuhdF5sF2JeTNLz+PE+Br67U0/h4HLxhdTysl7v0KdNwFVOdn4sDY
	Pyl7C+MI3vx1ySEknumzynr/RCf1qF0Rrj/2eVmzxQwUFQCIDO1A6ZWnqlrrzM+3ci2NuYN4v/k2K
	29GUjtzhli8nv5S+wKhzwJDJlMHR1OsbAGXDZeEdjnhgtBoEsyRmYPKHZ1IQ8j/ot6r+7VFxKrrCl
	k6W9VpYmR5I+MgwyZ+Xa7ApDH/qvyFkoeOa16NIEf8h8nsuQLD7qxgwl1RsltTaD2skykJEbmRnH7
	9GvIePsQ==;
Received: from ip6-localhost ([::1]:43058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kzPfH-005T2D-1t; Tue, 12 Jan 2021 19:49:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzPf7-005T23-14
 for samba-technical@lists.samba.org; Tue, 12 Jan 2021 19:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ojxDpljTA/ZymnDhS1z9Q2S/k6u3VxRCMomCG6ytV6A=; b=osvsNguts7cfVSFxPIwXXUAngE
 H87TU5PlOltAjXNFXMfTunzhs2//JV/VPqMWXhxuwz/u7WUiDVFlly3Fu5XRXcAuwrwDhpgkxS5h+
 RfleeijEqupkkC8j99ImzCxEANw2RiO+ZbZm5llburdzz/wKSVGOjp26rqshyOrg5l4sKcIEqKodA
 TiBdFBrggrocT+jZx8e/fWuwXrxmn2tY7tJNN7d9nSOvyIEq2bu9bDIQ/lG8HR/OmMDwQ4Xrif3Xo
 6nWf+ckoEVx3JY/wQLAX+gV3zh9AH/uo2uYDB23uyGPet+eAZmB3qgGOgzOaQgrMXQYNDWTNeE5Mh
 I+AVHWfXrIAs5SwgV9HIrJFPR9fieWtEOq/RRv0SK7zItucScQkwaZWAVX4NR+mOg6Nvx1eJUBavu
 FCrMmLJda9SIiDeCpZ7E1/zY2drLpRMLkgNmXLMlWL0/0ozPnYETQrZ5U2QTsd9h+RkGvifuvcwQJ
 nOcUi+Wv0gA37n7+fgEYlkR3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzPeo-0006Pp-3D; Tue, 12 Jan 2021 19:48:46 +0000
Date: Tue, 12 Jan 2021 11:48:43 -0800
To: Shilpa K <shilpa.krishnareddy@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: Initializing case based parameters during share switch in
 create_conn_struct_tos_cwd()
Message-ID: <20210112194843.GE1316956@jeremy-acer>
References: <CAHbM3qgJv3he3LSokE-V1yPUttueT1esXF0vNQqHSnRPDtqz9A@mail.gmail.com>
 <20210112191328.GC1316956@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <20210112191328.GC1316956@jeremy-acer>
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Jan 12, 2021 at 11:13:28AM -0800, Jeremy Allison via samba-technical wrote:
>>
>>The case_sensitive and short_case_preserve were null because we were not
>>initializing these values in conn struct to the share configuration that we
>>were switching to. We are using below settings for the share:
>>
>>case sensitive = no
>>preserve case = yes
>>short preserve case = yes
>>default case = lower
>>
>>I used the code changes that are in the below patch and now we return the
>>folder name in the referral as is. Could you please review this patch and
>>let me know if it is fine?
>>
>>Thanks,
>>Shilpa
>
>Thanks Shilpa, this does look correct. It sets up the
>dfs share in the same way as the case options are created
>in source3/smbd/service.c:make_connection_snum().
>
>I think the best fix here would be to factor this code
>out into a function called by both make_connection_snum()
>and create_conn_struct_as_root() so we know they are
>setting things up identically.

Here's what I ended up with if you want to test.

Thanks !

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=bug-14612
Content-Transfer-Encoding: quoted-printable

=46rom 7d39c4d3ef4f440424eb88dcd0a5844f5e4dcca6 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Tue, 12 Jan 2021 11:39:51 -0800
Subject: [PATCH 1/2] s3: smbd: Factor out setting up case parameters for a
 share to a function - conn_setup_case_options().

Will allow it to be reused in the msdfs temporary share code.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14612

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/smbd/conn.c    | 19 +++++++++++++++++++
 source3/smbd/proto.h   |  1 +
 source3/smbd/service.c | 11 +----------
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/source3/smbd/conn.c b/source3/smbd/conn.c
index 003926c97f6..044242d5697 100644
--- a/source3/smbd/conn.c
+++ b/source3/smbd/conn.c
@@ -232,3 +232,22 @@ void conn_free(connection_struct *conn)
=20
 	conn_free_internal(conn);
 }
+
+/*
+ * Correctly initialize a share with case options.
+ */
+void conn_setup_case_options(connection_struct *conn)
+{
+	int snum =3D conn->params->service;
+
+	if (lp_case_sensitive(snum) =3D=3D Auto) {
+		/* We will be setting this per packet. Set to be case
+		* insensitive for now. */
+		conn->case_sensitive =3D false;
+	} else {
+		conn->case_sensitive =3D (bool)lp_case_sensitive(snum);
+	}
+
+	conn->case_preserve =3D lp_preserve_case(snum);
+	conn->short_case_preserve =3D lp_short_preserve_case(snum);
+}
diff --git a/source3/smbd/proto.h b/source3/smbd/proto.h
index 7d6f8eda607..879ec71ae94 100644
--- a/source3/smbd/proto.h
+++ b/source3/smbd/proto.h
@@ -156,6 +156,7 @@ connection_struct *conn_new(struct smbd_server_connecti=
on *sconn);
 bool conn_idle_all(struct smbd_server_connection *sconn, time_t t);
 void conn_clear_vuid_caches(struct smbd_server_connection *sconn, uint64_t=
 vuid);
 void conn_free(connection_struct *conn);
+void conn_setup_case_options(connection_struct *conn);
 void conn_force_tdis(
 	struct smbd_server_connection *sconn,
 	bool (*check_fn)(struct connection_struct *conn,
diff --git a/source3/smbd/service.c b/source3/smbd/service.c
index b1ea0ea6a88..afdea38b016 100644
--- a/source3/smbd/service.c
+++ b/source3/smbd/service.c
@@ -557,16 +557,7 @@ static NTSTATUS make_connection_snum(struct smbXsrv_co=
nnection *xconn,
 		      ( lp_enable_asu_support() && strequal(dev,"ADMIN$")) );
=20
 	/* Case options for the share. */
-	if (lp_case_sensitive(snum) =3D=3D Auto) {
-		/* We will be setting this per packet. Set to be case
-		 * insensitive for now. */
-		conn->case_sensitive =3D False;
-	} else {
-		conn->case_sensitive =3D (bool)lp_case_sensitive(snum);
-	}
-
-	conn->case_preserve =3D lp_preserve_case(snum);
-	conn->short_case_preserve =3D lp_short_preserve_case(snum);
+	conn_setup_case_options(conn);
=20
 	conn->encrypt_level =3D lp_server_smb_encrypt(snum);
 	if (conn->encrypt_level > SMB_ENCRYPTION_OFF) {
--=20
2.27.0


=46rom 5c11f165a04e7686856edee572c5a0fe7c4fcca3 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Tue, 12 Jan 2021 11:44:44 -0800
Subject: [PATCH 2/2] s3: smbd: Add call to conn_setup_case_options() to
 create_conn_struct_as_root().

Ensures temporary DFS share doesn't leave the case parameters set
as zero (i.e.:

conn->case sensitive =3D 0
conn->share_case_preserve =3D 0
and default case is lower

which can cause problems doing a DFS_GET_REFERRALS request).

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14612

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/smbd/msdfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/source3/smbd/msdfs.c b/source3/smbd/msdfs.c
index 7b5ea251501..dc07727f007 100644
--- a/source3/smbd/msdfs.c
+++ b/source3/smbd/msdfs.c
@@ -317,6 +317,8 @@ static NTSTATUS create_conn_struct_as_root(TALLOC_CTX *=
ctx,
 		vfs_user =3D get_current_username();
 	}
=20
+	conn_setup_case_options(conn);
+
 	set_conn_connectpath(conn, connpath);
=20
 	/*
--=20
2.27.0


--u3/rZRmxL6MmkK24--

