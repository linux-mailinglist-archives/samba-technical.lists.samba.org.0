Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C813161C
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jan 2020 17:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rtA74+unsUR/vqPvRHYSHMJswTlQjiVxGqB2XtBcv8w=; b=G+xOeaG/xIuNhrc3jmpzkeC5Sr
	6A6+kC3DLg3CjLi8+yN/6tvepBsFe0KuS5yvITYWJmXCV9+Chm9MQEIoR38DhESI3cZSxOXDSxubR
	IEocYITOA9p27u0292b9rwt1yM+Q8KLVreUWCNAxF1g+3jB4cZGGnC9heQiOHEYLC0K/uNQWxeZep
	5mMAasDcvWQk/XQw8v4ctFYn9P7q0xvzwH1djYCGtRZjMmsfBT1I5vJugR/2qiy4GGhNIVt1HIle6
	Tg/pg6ZbR7XI7E6hIck4QsvKrPKJx9gRaEg110oUwl0PSwg+C5hsDpI41EYwLKwyLRcDqK7tBVNtD
	iz3XTg/w==;
Received: from localhost ([::1]:46930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ioVI6-002Z7V-6f; Mon, 06 Jan 2020 16:31:42 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:41936) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ioVI0-002Z6t-29
 for samba-technical@lists.samba.org; Mon, 06 Jan 2020 16:31:40 +0000
Received: by mail-qv1-xf41.google.com with SMTP id x1so19253289qvr.8
 for <samba-technical@lists.samba.org>; Mon, 06 Jan 2020 08:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtA74+unsUR/vqPvRHYSHMJswTlQjiVxGqB2XtBcv8w=;
 b=XtcNfCanyw+IvxFQm1MVdbvfK/fBDevsN67ooQaAHrMcrF7YMgzLrIqeUcZO0QxdHv
 cDN96rCNWisU1iwkPoCa3zvFujUhg8x9hRUwEvURXZqJFpeeB2AnuY1nCh8o38Qc3CjN
 y1q1fpabqWMKvvPvA28WkrpQ+gPJRH+gBro3fV88wyyHADBg/EpzMT7okvz+VQN1eIQT
 yNZz2aHVTPe9rVkciV7XKsJw4OG4EGZMxnx4oJxG1401W3/7+QmEzwjSBdGTFyXQLff5
 c0WpZkz02sCxiK/ZoptkMdQ2CmUa7LW22BDaCibF+3HMlH1yRDspzafbfX9OORJvF9pS
 P6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtA74+unsUR/vqPvRHYSHMJswTlQjiVxGqB2XtBcv8w=;
 b=Id2ptpx/frYOVd72B5nG5jW0hhUN3CTjftdRWOJ2oJPWQykK0jVeaBjzm3OBpQzDcJ
 0nhhv7VL5wG2mtPdKzBc0Xo6hxX5ZEkdacasiLd3tu/ZM7HO7HzlOxX2JPMXAsKw2qbF
 zfjkpNT9yyw+bs4+QsvMYdu/aZFNqJRlkkqXqogYf2+H5oAdck/rPDaW9993LWRTGQ9/
 jlCR45hJ8J95MI7XqBAFy9wkZBIRoblxWUPKDR5HqZ/ak8GaoQ853aFW/tTbXL+Wci+9
 tsnt+hlBJx/YFzZfYGLx45G85l41gsZHAAsWkig1NKBoKWgHF3E0djwkXiLOGfSejWTn
 MPpA==
X-Gm-Message-State: APjAAAWS+96GnQ3I20mTejfjAK1ZUNUWvmfHN4zeeLHBx9n+xzNhkpzv
 e5mK5ixUdiaFX+YXJPrArUY=
X-Google-Smtp-Source: APXvYqw/PbrPZ2tQfTYOjU5dDZVI6GcHEncievPMBE8KKO+jNivECjRVy0WmSLwOJcE1umS5bScI+w==
X-Received: by 2002:a05:6214:707:: with SMTP id
 b7mr78530010qvz.97.1578328293934; 
 Mon, 06 Jan 2020 08:31:33 -0800 (PST)
Received: from ip-172-31-1-121.ec2.internal
 (ec2-3-231-202-5.compute-1.amazonaws.com. [3.231.202.5])
 by smtp.gmail.com with ESMTPSA id f26sm23434195qtv.77.2020.01.06.08.31.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jan 2020 08:31:33 -0800 (PST)
To: linux-cifs@vger.kernel.org
Subject: [PATCH] Add support for setting owner and group in ntsd
Date: Mon,  6 Jan 2020 16:31:19 +0000
Message-Id: <20200106163119.9083-2-boris.v.protopopov@gmail.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20200106163119.9083-1-boris.v.protopopov@gmail.com>
References: <20200106163119.9083-1-boris.v.protopopov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <boris.v.protopopov@gmail.com>
Cc: sfrench@samba.org, sblbir@amazon.com, samba-technical@lists.samba.org,
 boris.v.protopopov@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Extend setcifsacl utility to allow setting owner and group SIDs
in the security descriptor in addition to setting ACLs. This is
a user-friendly intefrace for setting owner and group SIDs that
takes advantage of the recent extensions in the CIFS kernel
client, and it complements setting raw values via setfattr.

Signed-off-by: Boris Protopopov <boris.v.protopopov@gmail.com>
---
 cifsacl.h         |   4 +-
 setcifsacl.c      | 253 ++++++++++++++++++++++++++++++++++++++++++++----------
 setcifsacl.rst.in |  27 ++++--
 3 files changed, 235 insertions(+), 49 deletions(-)

diff --git a/cifsacl.h b/cifsacl.h
index ca72dd4..bd0c695 100644
--- a/cifsacl.h
+++ b/cifsacl.h
@@ -26,7 +26,9 @@
 #define _CIFSACL_H
 
 #define BUFSIZE 1024
-#define ATTRNAME "system.cifs_acl"
+#define ATTRNAME	"system.cifs_acl"
+#define ATTRNAME_ACL	ATTRNAME
+#define ATTRNAME_NTSD	"system.cifs_ntsd"
 
 #define MAX_NUM_AUTHS 6
 
diff --git a/setcifsacl.c b/setcifsacl.c
index 9a301e2..6e5a633 100644
--- a/setcifsacl.c
+++ b/setcifsacl.c
@@ -44,7 +44,9 @@ enum setcifsacl_actions {
 	ActDelete,
 	ActModify,
 	ActAdd,
-	ActSet
+	ActSetAcl,
+	ActSetOwner,
+	ActSetGroup
 };
 
 static void *plugin_handle;
@@ -140,6 +142,90 @@ copy_sec_desc(const struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
 	return bufsize;
 }
 
+/*
+ * This function (and the one above) does not need to set the SACL-related
+ * fields, and this works fine because on the SMB protocol level, setting owner
+ * info, DACL, and SACL requires one to use separate flags that control which
+ * part of the descriptor is begin looked at on the server side
+ */
+static ssize_t
+copy_sec_desc_with_sid(const struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
+		struct cifs_sid *sid, int maction)
+{
+	int size, daclsize;
+	int osidoffset, gsidoffset, dacloffset;
+	int nosidoffset, ngsidoffset, ndacloffset, nsidssize;
+	ssize_t bufsize;
+	struct cifs_sid *owner_sid_ptr, *group_sid_ptr;
+	struct cifs_sid *nowner_sid_ptr, *ngroup_sid_ptr;
+	struct cifs_ctrl_acl *dacl_ptr, *ndacl_ptr;
+
+	/* copy security descriptor control portion */
+	osidoffset = le32toh(pntsd->osidoffset);
+	gsidoffset = le32toh(pntsd->gsidoffset);
+	dacloffset = le32toh(pntsd->dacloffset);
+	/*
+	 * the size of the owner or group sid might be different from the old
+	 * one, so the group sid offest might change, and if the owner is
+	 * positioned before the DACL, the dacl offset might change as well;
+	 * note however, that the owner sid offset does not change
+	 */
+	nosidoffset = osidoffset;
+	size = sizeof(struct cifs_ntsd);
+	pnntsd->revision = pntsd->revision;
+	pnntsd->type = pntsd->type;
+	pnntsd->osidoffset = pntsd->osidoffset;
+	bufsize = size;
+
+	/* set the pointers for source sids */
+	if (maction == ActSetOwner) {
+		owner_sid_ptr = sid;
+		group_sid_ptr = (struct cifs_sid *)((char *)pntsd + gsidoffset);
+	}
+	if (maction == ActSetGroup) {
+		owner_sid_ptr = (struct cifs_sid *)((char *)pntsd + osidoffset);
+		group_sid_ptr = sid;
+	}
+
+	dacl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd + dacloffset);
+	daclsize = le16toh(dacl_ptr->size) + sizeof(struct cifs_ctrl_acl);
+
+	/* copy owner sid */
+	nowner_sid_ptr = (struct cifs_sid *)((char *)pnntsd + nosidoffset);
+	size = copy_cifs_sid(nowner_sid_ptr, owner_sid_ptr);
+	bufsize += size;
+	nsidssize = size;
+
+	/* copy group sid */
+	ngsidoffset = nosidoffset + size;
+	ngroup_sid_ptr = (struct cifs_sid *)((char *)pnntsd + ngsidoffset);
+	pnntsd->gsidoffset = htole32(ngsidoffset);
+	size = copy_cifs_sid(ngroup_sid_ptr, group_sid_ptr);
+	bufsize += size;
+	nsidssize += size;
+
+	/* position the dacl control info as in the fetched descriptor */
+	if (dacloffset <= osidoffset)
+		ndacloffset = dacloffset;
+	else
+		ndacloffset = nosidoffset + nsidssize;
+	ndacl_ptr = (struct cifs_ctrl_acl *)((char *)pnntsd + ndacloffset);
+	pnntsd->dacloffset = htole32(ndacloffset);
+
+	/* the DACL control fields do not change */
+	ndacl_ptr->revision = dacl_ptr->revision;
+	ndacl_ptr->size = dacl_ptr->size;
+	ndacl_ptr->num_aces = dacl_ptr->num_aces;
+
+	/*
+	 * add DACL size (control portion and the array of aces) to the
+	 * buffer size
+	 */
+	bufsize += daclsize;
+
+	return bufsize;
+}
+
 static int
 copy_ace(struct cifs_ace *dace, struct cifs_ace *sace)
 {
@@ -788,7 +874,7 @@ setacl_action(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd,
 		rc = ace_add(pntsd, npntsd, bufsize, facesptr,
 				numfaces, cacesptr, numcaces);
 		break;
-	case ActSet:
+	case ActSetAcl:
 		rc = ace_set(pntsd, npntsd, bufsize, cacesptr, numcaces);
 		break;
 	default:
@@ -803,9 +889,10 @@ static void
 setcifsacl_usage(const char *prog)
 {
 	fprintf(stderr,
-	"%s: Alter CIFS/NTFS ACL in a security descriptor of a file object\n",
+	"%s: Alter CIFS/NTFS ACL or owner/group in a security descriptor of a file object\n",
+		prog);
+	fprintf(stderr, "Usage: %s option [<list_of_ACEs>|<SID>] <file_name>\n",
 		prog);
-	fprintf(stderr, "Usage: %s option <list_of_ACEs> <file_name>\n", prog);
 	fprintf(stderr, "Valid options:\n");
 	fprintf(stderr, "\t-v	Version of the program\n");
 	fprintf(stderr, "\n\t-a	Add ACE(s), separated by a comma, to an ACL\n");
@@ -825,21 +912,32 @@ setcifsacl_usage(const char *prog)
 	"\n\t-S	Replace existing ACL with ACE(s), separated by a comma\n");
 	fprintf(stderr,
 	"\tsetcifsacl -S \"ACL:Administrator:ALLOWED/0x0/D\" <file_name>\n");
+	fprintf(stderr,
+	"\n\t-o	Set owner using specified SID (name or raw format)\n");
+	fprintf(stderr,
+	"\tsetcifsacl -o \"Administrator\" <file_name>\n");
+	fprintf(stderr,
+	"\n\t-g	Set group using specified SID (name or raw format)\n");
+	fprintf(stderr,
+	"\tsetcifsacl -g \"Administrators\" <file_name>\n");
 	fprintf(stderr, "\nRefer to setcifsacl(1) manpage for details\n");
 }
 
 int
 main(const int argc, char *const argv[])
 {
-	int i, rc, c, numcaces, numfaces;
+	int i, rc, c, numcaces = 0, numfaces = 0;
 	enum setcifsacl_actions maction = ActUnknown;
 	ssize_t attrlen, bufsize = BUFSIZE;
-	char *ace_list, *filename, *attrval, **arrptr = NULL;
+	char *ace_list = NULL, *filename = NULL, *attrval = NULL,
+		**arrptr = NULL, *sid_str = NULL;
 	struct cifs_ctrl_acl *daclptr = NULL;
 	struct cifs_ace **cacesptr = NULL, **facesptr = NULL;
 	struct cifs_ntsd *ntsdptr = NULL;
+	struct cifs_sid sid;
+	char *attrname = ATTRNAME_ACL;
 
-	c = getopt(argc, argv, "hvD:M:a:S:");
+	c = getopt(argc, argv, "hvD:M:a:S:o:g:");
 	switch (c) {
 	case 'D':
 		maction = ActDelete;
@@ -854,9 +952,19 @@ main(const int argc, char *const argv[])
 		ace_list = optarg;
 		break;
 	case 'S':
-		maction = ActSet;
+		maction = ActSetAcl;
 		ace_list = optarg;
 		break;
+	case 'o':
+		maction = ActSetOwner;
+		sid_str = optarg;
+		attrname = ATTRNAME_NTSD;
+		break;
+	case 'g':
+		maction = ActSetGroup;
+		sid_str = optarg;
+		attrname = ATTRNAME_NTSD;
+		break;
 	case 'h':
 		setcifsacl_usage(basename(argv[0]));
 		return 0;
@@ -875,11 +983,16 @@ main(const int argc, char *const argv[])
 	}
 	filename = argv[3];
 
-	if (!ace_list) {
+	if (!ace_list && maction != ActSetOwner && maction != ActSetGroup) {
 		printf("%s: No valid ACEs specified\n", __func__);
 		return -1;
 	}
 
+	if (!sid_str && (maction == ActSetOwner || maction == ActSetGroup)) {
+		printf("%s: No valid SIDs specified\n", __func__);
+		return -1;
+	}
+
 	if (init_plugin(&plugin_handle)) {
 		fprintf(stderr, "WARNING: unable to initialize idmapping "
 				"plugin. Only \"raw\" SID strings will be "
@@ -889,16 +1002,24 @@ main(const int argc, char *const argv[])
 		plugin_loaded = true;
 	}
 
-	numcaces = get_numcaces(ace_list);
-
-	arrptr = parse_cmdline_aces(ace_list, numcaces);
-	if (!arrptr)
-		goto setcifsacl_numcaces_ret;
+	if (maction == ActSetOwner || maction == ActSetGroup) {
+		/* parse the sid */
+		if (setcifsacl_str_to_sid(sid_str, &sid)) {
+			printf("%s: failed to parce \'%s\' as SID\n", __func__,
+				sid_str);
+			goto setcifsacl_numcaces_ret;
+		}
+	} else {
+		numcaces = get_numcaces(ace_list);
 
-	cacesptr = build_cmdline_aces(arrptr, numcaces);
-	if (!cacesptr)
-		goto setcifsacl_cmdlineparse_ret;
+		arrptr = parse_cmdline_aces(ace_list, numcaces);
+		if (!arrptr)
+			goto setcifsacl_numcaces_ret;
 
+		cacesptr = build_cmdline_aces(arrptr, numcaces);
+		if (!cacesptr)
+			goto setcifsacl_cmdlineparse_ret;
+	}
 cifsacl:
 	if (bufsize >= XATTR_SIZE_MAX) {
 		printf("%s: Buffer size %zd exceeds max size of %d\n",
@@ -912,7 +1033,7 @@ cifsacl:
 		goto setcifsacl_cmdlineverify_ret;
 	}
 
-	attrlen = getxattr(filename, ATTRNAME, attrval, bufsize);
+	attrlen = getxattr(filename, attrname, attrval, bufsize);
 	if (attrlen == -1) {
 		if (errno == ERANGE) {
 			free(attrval);
@@ -924,26 +1045,64 @@ cifsacl:
 		}
 	}
 
-	numfaces = get_numfaces((struct cifs_ntsd *)attrval, attrlen, &daclptr);
-	if (!numfaces && maction != ActAdd) { /* if we are not adding aces */
-		printf("%s: Empty DACL\n", __func__);
-		goto setcifsacl_facenum_ret;
-	}
+	if (maction == ActSetOwner || maction == ActSetGroup) {
+		struct cifs_ntsd *pfntsd = (struct cifs_ntsd *)attrval;
+		int dacloffset = le32toh(pfntsd->dacloffset);
+		struct cifs_ctrl_acl *daclinfo =
+				(struct cifs_ctrl_acl *)(attrval + dacloffset);
+		int numaces = le16toh(daclinfo->num_aces);
+		int acessize = le32toh(daclinfo->size);
+		size_t faceoffset, naceoffset;
+		char *faceptr, *naceptr;
 
-	facesptr = build_fetched_aces((char *)daclptr, numfaces);
-	if (!facesptr)
-		goto setcifsacl_facenum_ret;
+		/*
+		 * this allocates large enough buffer for max sid size and the
+		 * dacl info from the fetched security descriptor
+		 */
+		rc = alloc_sec_desc(pfntsd, &ntsdptr, numaces, &faceoffset);
+		if (rc)
+			goto setcifsacl_numcaces_ret;
 
-	bufsize = 0;
-	rc = setacl_action((struct cifs_ntsd *)attrval, &ntsdptr, &bufsize,
-		facesptr, numfaces, cacesptr, numcaces, maction);
-	if (rc)
-		goto setcifsacl_action_ret;
+		/*
+		 * copy the control structures from the fetched descriptor, the
+		 * sid specified by the user, and adjust the offsets/move dacl
+		 * control structure if needed
+		 */
+		bufsize = copy_sec_desc_with_sid(pfntsd, ntsdptr, &sid,
+				maction);
+
+		/* copy aces verbatim as they have not changed */
+		faceptr = attrval + faceoffset;
+		naceoffset = le32toh(ntsdptr->dacloffset) +
+				sizeof(struct cifs_ctrl_acl);
+		naceptr = (char *)ntsdptr + naceoffset;
+		memcpy(naceptr, faceptr, acessize);
+	} else {
+		bufsize = 0;
+
+		numfaces = get_numfaces((struct cifs_ntsd *)attrval, attrlen,
+				&daclptr);
+		if (!numfaces && maction != ActAdd) {
+			/* if we are not adding aces */
+			printf("%s: Empty DACL\n", __func__);
+			goto setcifsacl_facenum_ret;
+		}
+
+		facesptr = build_fetched_aces((char *)daclptr, numfaces);
+		if (!facesptr)
+			goto setcifsacl_facenum_ret;
 
-	attrlen = setxattr(filename, ATTRNAME, ntsdptr, bufsize, 0);
+		rc = setacl_action((struct cifs_ntsd *)attrval, &ntsdptr,
+				&bufsize, facesptr, numfaces, cacesptr,
+				numcaces, maction);
+		if (rc)
+			goto setcifsacl_action_ret;
+	}
+
+	attrlen = setxattr(filename, attrname, ntsdptr, bufsize, 0);
 	if (attrlen == -1) {
 		printf("%s: setxattr error: %s\n", __func__, strerror(errno));
-		goto setcifsacl_facenum_ret;
+		goto setcifsacl_action_ret;
 	}
 
 	if (plugin_loaded)
@@ -951,25 +1110,33 @@ cifsacl:
 	return 0;
 
 setcifsacl_action_ret:
-	free(ntsdptr);
+	if (ntsdptr)
+		free(ntsdptr);
 
 setcifsacl_facenum_ret:
-	for (i = 0; i < numfaces; ++i)
-		free(facesptr[i]);
-	free(facesptr);
+	if (facesptr) {
+		for (i = 0; i < numfaces; ++i)
+			free(facesptr[i]);
+		free(facesptr);
+	}
 
 setcifsacl_getx_ret:
-	free(attrval);
+	if (attrval)
+		free(attrval);
 
 setcifsacl_cmdlineverify_ret:
-	for (i = 0; i < numcaces; ++i)
-		free(cacesptr[i]);
-	free(cacesptr);
+	if (cacesptr) {
+		for (i = 0; i < numcaces; ++i)
+			free(cacesptr[i]);
+		free(cacesptr);
+	}
 
 setcifsacl_cmdlineparse_ret:
-	free(arrptr);
+	if (arrptr)
+		free(arrptr);
 
 setcifsacl_numcaces_ret:
-	exit_plugin(plugin_handle);
+	if (plugin_loaded)
+		exit_plugin(plugin_handle);
 	return -1;
 }
diff --git a/setcifsacl.rst.in b/setcifsacl.rst.in
index de9c758..985af7c 100644
--- a/setcifsacl.rst.in
+++ b/setcifsacl.rst.in
@@ -2,16 +2,16 @@
 setcifsacl
 ==========
 
-------------------------------------------------------------------------------------------------
-Userspace helper to alter an ACL in a security descriptor for Common Internet File System (CIFS)
-------------------------------------------------------------------------------------------------
+-------------------------------------------------------------------------------------------------------------------
+Userspace helper to alter an ACL or owner/group SID in a security descriptor for Common Internet File System (CIFS)
+-------------------------------------------------------------------------------------------------------------------
 :Manual section: 1
 
 ********
 SYNOPSIS
 ********
 
-  setcifsacl [-v|-a|-D|-M|-S] "{one or more ACEs}" {file system object}
+  setcifsacl [-v|-a|-D|-M|-S|-o|-g] "{one or more ACEs or a SID}" {file system object}
 
 ***********
 DESCRIPTION
@@ -20,7 +20,7 @@ DESCRIPTION
 This tool is part of the cifs-utils suite.
 
 ``setcifsacl`` is a userspace helper program for the Linux CIFS client
-file system. It is intended to alter an ACL of a security descriptor
+file system. It is intended to alter an ACL or set owner/group SID of a security descriptor
 for a file system object. Whether a security descriptor to be set is
 applied or not is determined by the CIFS/SMB server.
 
@@ -55,6 +55,13 @@ OPTIONS
   Set an ACL of security descriptor with the list of ACEs Existing ACL
   is replaced entirely with the specified ACEs.
 
+-o
+  Set owner SID to one specified as a command line argument.
+
+-g
+  Set group SID to one specified as a command line argument.
+
+  The owner/group SID can be specified as a name or a raw SID value.
   Every ACE entry starts with "ACL:" One or more ACEs are specified
   within double quotes.  Multiple ACEs are separated by a comma.
 
@@ -93,6 +100,16 @@ Set an ACL
 
   setcifsacl -S "ACL:CIFSTESTDOM\Administrator:0x0/0x0/FULL,ACL:CIFSTESTDOM\user2:0x0/0x0/FULL" <file_name>
 
+Set owner SID
+=============
+
+  setcifsacl -o "S-1-5-21-3338130290-3403600371-1423429424-2102" <file_name>
+
+Set group SID
+=============
+
+  setcifsacl -g "Administrators@BUILTIN" <file_name>
+
 *****
 NOTES
 *****
-- 
2.14.5


