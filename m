Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8122B9D35
	for <lists+samba-technical@lfdr.de>; Thu, 19 Nov 2020 22:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=avyE5txwcFPd2RyRxWnG3qtASxX/fjo4KeY1z50zd3E=; b=lrW+QW+U/Q/1cvBjwR5qOkQlot
	hGzeJbb9Ejqb6RluPgBTFdr8M/piRWOCDQ5NtJKu3mtyzRCVYhaXG8iC/4cjKsuvy/pYoPzK7XSfv
	syiZ5WX6LIHIeEKgwvzenkLjCRKY+/geklDUjr72PjZuow3ZQLiB7UdWuWAgE1jCod6BEKfjqZKwc
	yUCZTAr9uYVCvnMy57BO2t+xvC/KpupHIYFly0doKQXzqcjGNM1OSRdSRDroxdaYkRkWGzHj3uCkP
	prqgBkvH6elOPrjFFZS07n7wWUpGKs77ENAhzT8P9nW4KL4nRiQ/wFYx9Nu2NAhC7SSexFKz74SQe
	BoUVvp9g==;
Received: from ip6-localhost ([::1]:55186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kfrvN-0022y1-NV; Thu, 19 Nov 2020 21:57:05 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:48245) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kfrvA-0022xu-E2
 for samba-technical@lists.samba.org; Thu, 19 Nov 2020 21:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1605823013; x=1637359013;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=avyE5txwcFPd2RyRxWnG3qtASxX/fjo4KeY1z50zd3E=;
 b=RPBqn9st2FEnpphCj8ZQQMRHpKdXjl7eipDbDFPC94Q3igoi1Dgpayl8
 j77kXaVYI0FxVF9AM63YqPyH42+SvHUZh0geAEEqBVSI6yDn14Ud+Ss2E
 lggkdxvwqejiKSyOjtxUCZn5xMdBEgnVBW5GIumOqmYnmouPUKnwQChqJ I=;
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 19 Nov 2020 21:40:49 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id 91F57A200F; Thu, 19 Nov 2020 21:40:48 +0000 (UTC)
Received: from EX13D11UEB002.ant.amazon.com (10.43.60.63) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Nov 2020 21:40:48 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D11UEB002.ant.amazon.com (10.43.60.63) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Nov 2020 21:40:47 +0000
Received: from dev-dsk-pboris-1f-f9682a47.us-east-1.amazon.com (10.1.57.236)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 19 Nov 2020 21:40:46 +0000
Received: by dev-dsk-pboris-1f-f9682a47.us-east-1.amazon.com (Postfix,
 from userid 5360108)
 id A20ACBA64F; Thu, 19 Nov 2020 21:40:46 +0000 (UTC)
To: <pboris@amazon.com>
Subject: [PATCH] Extend cifs acl utilities to handle SACLs
Date: Thu, 19 Nov 2020 21:40:42 +0000
Message-ID: <20201119214042.6113-1-pboris@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
MIME-Version: 1.0
Content-Type: text/plain
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
Reply-To: Boris Protopopov <pboris@amazon.com>
Cc: sfrench@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Extend getcifsacl/setcifsacl utilities to handle System ACLs (SACLs)
in addition to Discretionary ACLs (DACLs). The SACL extensions depend
on CIFS client support for system.cifs_ntsd_full extended attribute.

Signed-off-by: Boris Protopopov <pboris@amazon.com>
---
 cifsacl.h         |  57 +++-
 getcifsacl.c      | 206 ++++++++++----
 getcifsacl.rst.in |   4 +-
 setcifsacl.c      | 695 ++++++++++++++++++++++++++++++++--------------
 setcifsacl.rst.in |  27 +-
 5 files changed, 708 insertions(+), 281 deletions(-)

diff --git a/cifsacl.h b/cifsacl.h
index bd0c695..20309ef 100644
--- a/cifsacl.h
+++ b/cifsacl.h
@@ -25,13 +25,19 @@
 #ifndef _CIFSACL_H
 #define _CIFSACL_H
 
-#define BUFSIZE 1024
-#define ATTRNAME	"system.cifs_acl"
-#define ATTRNAME_ACL	ATTRNAME
-#define ATTRNAME_NTSD	"system.cifs_ntsd"
+#define BUFSIZE 		1024
+#define ATTRNAME		"system.cifs_acl"
+#define ATTRNAME_ACL		ATTRNAME
+#define ATTRNAME_NTSD		"system.cifs_ntsd"
+#define ATTRNAME_NTSD_FULL	"system.cifs_ntsd_full"
 
 #define MAX_NUM_AUTHS 6
 
+typedef enum {
+  ACE_KIND_DACL,
+  ACE_KIND_SACL
+} ace_kinds;
+
 /* File specific rights */
 #define READ_DATA	0x00000001 /* R */
 #define WRITE_DATA	0x00000002 /* W */
@@ -82,17 +88,36 @@
 /* WA | WEA | A | W */
 #define ALL_WRITE_BITS	0x40000116
 
-#define OBJECT_INHERIT_FLAG 0x01	/* OI */
-#define CONTAINER_INHERIT_FLAG 0x02	/* CI */
-#define NO_PROPAGATE_INHERIT_FLAG 0x04	/* NP */
-#define INHERIT_ONLY_FLAG 0x08		/* IO */
-#define INHERITED_ACE_FLAG 0x10		/* I */
-#define VFLAGS (OBJECT_INHERIT_FLAG|CONTAINER_INHERIT_FLAG|NO_PROPAGATE_INHERIT_FLAG|INHERIT_ONLY_FLAG|INHERITED_ACE_FLAG)
-
-#define ACCESS_ALLOWED	0		/* ALLOWED */
-#define ACCESS_DENIED	1		/* DENIED */
-#define ACCESS_ALLOWED_OBJECT	5	/* OBJECT_ALLOWED */
-#define ACCESS_DENIED_OBJECT	6	/* OBJECT_DENIED */
+/* R | W | A | REA | WEA | E | DC | RA | EA | D | RC | P | O */
+#define ALL_ACCESS_BITS 0x000f01ff
+
+/* ace flags */
+#define OBJECT_INHERIT_FLAG		0x01	/* OI */
+#define CONTAINER_INHERIT_FLAG		0x02	/* CI */
+#define NO_PROPAGATE_INHERIT_FLAG	0x04	/* NP */
+#define INHERIT_ONLY_FLAG		0x08	/* IO */
+#define INHERITED_ACE_FLAG		0x10	/* I */
+#define DACL_VFLAGS (OBJECT_INHERIT_FLAG|CONTAINER_INHERIT_FLAG|NO_PROPAGATE_INHERIT_FLAG|INHERIT_ONLY_FLAG|INHERITED_ACE_FLAG)
+
+#define SUCCESSFUL_ACCESS		0x40	/* SA */
+#define FAILED_ACCESS			0x80	/* FA */
+#define SACL_VFLAGS (SUCCESSFUL_ACCESS | FAILED_ACCESS)
+
+/* ace types */
+#define ACCESS_ALLOWED			0	/* ALLOWED */
+#define ACCESS_DENIED			1	/* DENIED */
+#define SYSTEM_AUDIT			2	/* AUDIT */
+#define ACCESS_ALLOWED_OBJECT		5	/* OBJECT_ALLOWED */
+#define ACCESS_DENIED_OBJECT		6	/* OBJECT_DENIED */
+#define SYSTEM_AUDIT_OBJECT		7	/* AUDIT_OBJECT */
+#define SYSTEM_AUDIT_CALLBACK		13	/* AUDIT_CALLBACK */
+#define SYSTEM_AUDIT_CALLBACK_OBJECT	15	/* AUDIT_CALLBACK_OBJECT */
+#define SYSTEM_MANDATORY_LABEL		17	/* MANDATORY_LABEL */
+#define SYSTEM_RESOURCE_ATTRIBUTE	18	/* RESOURCE_ATTRIBUTE */
+#define SYSTEM_SCOPED_POLICY_ID		19	/* SCOPED_POLICY_ID */
+
+#define DACL_VTYPES (ACCESS_ALLOWED | ACCESS_DENIED | ACCESS_ALLOWED_OBJECT | ACCESS_DENIED_OBJECT)
+#define SACL_VTYPES (SYSTEM_AUDIT | SYSTEM_AUDIT_OBJECT | SYSTEM_AUDIT_CALLBACK | SYSTEM_AUDIT_CALLBACK_OBJECT | SYSTEM_MANDATORY_LABEL | SYSTEM_RESOURCE_ATTRIBUTE | SYSTEM_SCOPED_POLICY_ID)
 
 #define COMPSID 0x1
 #define COMPTYPE 0x2
@@ -100,6 +125,8 @@
 #define COMPMASK 0x8
 #define COMPALL (COMPSID|COMPTYPE|COMPFLAG|COMPMASK)
 
+#define DEFAULT_ACL_REVISION 0x2
+
 /*
  * While not indicated here, the structs below represent on-the-wire data
  * structures. Any multi-byte values are expected to be little-endian!
diff --git a/getcifsacl.c b/getcifsacl.c
index d58b769..1c72e7c 100644
--- a/getcifsacl.c
+++ b/getcifsacl.c
@@ -47,6 +47,11 @@ static bool raw = false;
 static void
 print_each_ace_mask(uint32_t mask)
 {
+	if ((mask & ALL_ACCESS_BITS) == ALL_ACCESS_BITS) {
+		printf("RWXDPO");
+		return;
+	}
+
 	if ((mask & ALL_READ_BITS) && ((mask & EREAD) != EREAD &&
 			(mask & OREAD) != OREAD && (mask & BREAD) != BREAD)) {
 		printf("0x%x", mask);
@@ -74,32 +79,48 @@ print_each_ace_mask(uint32_t mask)
 }
 
 static void
-print_ace_mask(uint32_t mask, int raw)
+print_ace_mask(uint32_t mask, int raw, ace_kinds ace_kind)
 {
 	if (raw) {
 		printf("0x%x\n", mask);
 		return;
 	}
 
-	if (mask == FULL_CONTROL)
-		printf("FULL");
-	else if (mask == CHANGE)
-		printf("CHANGE");
-	else if (mask == DELETE)
-		printf("D");
-	else if (mask == EREAD)
-		printf("READ");
-	else if (mask & DELDHLD)
-		printf("0x%x", mask);
-	else
-		print_each_ace_mask(mask);
-
+	switch (ace_kind) {
+	case ACE_KIND_SACL:
+		if (mask == FULL_CONTROL)
+			printf("FULL");
+		else if (mask == CHANGE)
+			printf("CHANGE");
+		else if (mask == DELETE)
+			printf("D");
+		else if (mask == EREAD)
+			printf("READ");
+		else
+			print_each_ace_mask(mask);
+	break;
+	case ACE_KIND_DACL:
+	default:
+		if (mask == FULL_CONTROL)
+			printf("FULL");
+		else if (mask == CHANGE)
+			printf("CHANGE");
+		else if (mask == DELETE)
+			printf("D");
+		else if (mask == EREAD)
+			printf("READ");
+		else if (mask & DELDHLD)
+			printf("0x%x", mask);
+		else
+			print_each_ace_mask(mask);
+	break;
+	}
 	printf("\n");
 	return;
 }
 
 static void
-print_ace_flags(uint8_t flags, int raw)
+print_ace_flags(uint8_t flags, int raw, ace_kinds ace_kind)
 {
 	bool mflags = false;
 
@@ -108,37 +129,54 @@ print_ace_flags(uint8_t flags, int raw)
 		return;
 	}
 
-	if (flags & OBJECT_INHERIT_FLAG) {
-		mflags = true;
-		printf("OI");
-	}
-	if (flags & CONTAINER_INHERIT_FLAG) {
-		if (mflags)
-			printf("|");
-		else
-			mflags = true;
-		printf("CI");
-	}
-	if (flags & NO_PROPAGATE_INHERIT_FLAG) {
-		if (mflags)
-			printf("|");
-		else
+	switch (ace_kind) {
+	case ACE_KIND_SACL:
+		if (flags & SUCCESSFUL_ACCESS) {
 			mflags = true;
-		printf("NP");
-	}
-	if (flags & INHERIT_ONLY_FLAG) {
-		if (mflags)
-			printf("|");
-		else
-			mflags = true;
-		printf("IO");
-	}
-	if (flags & INHERITED_ACE_FLAG) {
-		if (mflags)
-			printf("|");
-		else
+			printf("SA");
+		}
+		if (flags & FAILED_ACCESS) {
+			if (mflags)
+				printf("|");
+			else
+				mflags = true;
+			printf("FA");
+		}
+		break;
+	case ACE_KIND_DACL:
+		if (flags & OBJECT_INHERIT_FLAG) {
 			mflags = true;
-		printf("I");
+			printf("OI");
+		}
+		if (flags & CONTAINER_INHERIT_FLAG) {
+			if (mflags)
+				printf("|");
+			else
+				mflags = true;
+			printf("CI");
+		}
+		if (flags & NO_PROPAGATE_INHERIT_FLAG) {
+			if (mflags)
+				printf("|");
+			else
+				mflags = true;
+			printf("NP");
+		}
+		if (flags & INHERIT_ONLY_FLAG) {
+			if (mflags)
+				printf("|");
+			else
+				mflags = true;
+			printf("IO");
+		}
+		if (flags & INHERITED_ACE_FLAG) {
+			if (mflags)
+				printf("|");
+			else
+				mflags = true;
+			printf("I");
+		}
+		break;
 	}
 
 	if (!mflags)
@@ -166,6 +204,27 @@ print_ace_type(uint8_t acetype, int raw)
 	case ACCESS_DENIED_OBJECT:
 		printf("OBJECT_DENIED");
 		break;
+	case SYSTEM_AUDIT:
+		printf("AUDIT");
+		break;
+	case SYSTEM_AUDIT_OBJECT:
+		printf("AUDIT_OBJECT");
+		break;
+	case SYSTEM_AUDIT_CALLBACK:
+		printf("AUDIT_CALLBACK");
+		break;
+	case SYSTEM_AUDIT_CALLBACK_OBJECT:
+		printf("AUDIT_CALLBACK_OBJECT");
+		break;
+	case SYSTEM_MANDATORY_LABEL:
+		printf("MANDATORY_LABEL");
+		break;
+	case SYSTEM_RESOURCE_ATTRIBUTE:
+		printf("RESOURCE_ATTRIBUTE");
+		break;
+	case SYSTEM_SCOPED_POLICY_ID:
+		printf("SCOPED_POLICY_ID");
+		break;
 	default:
 		printf("UNKNOWN");
 		break;
@@ -214,7 +273,7 @@ print_sid_raw:
 }
 
 static void
-print_ace(struct cifs_ace *pace, char *end_of_acl, int raw)
+print_ace(struct cifs_ace *pace, char *end_of_acl, int raw, ace_kinds ace_kind)
 {
 	uint16_t size;
 
@@ -237,15 +296,15 @@ print_ace(struct cifs_ace *pace, char *end_of_acl, int raw)
 	printf(":");
 	print_ace_type(pace->type, raw);
 	printf("/");
-	print_ace_flags(pace->flags, raw);
+	print_ace_flags(pace->flags, raw, ace_kind);
 	printf("/");
-	print_ace_mask(le32toh(pace->access_req), raw);
+	print_ace_mask(le32toh(pace->access_req), raw, ace_kind);
 
 	return;
 }
 
 static void
-parse_dacl(struct cifs_ctrl_acl *pdacl, char *end_of_acl, int raw)
+  parse_acl(struct cifs_ctrl_acl *pacl, char *end_of_acl, int raw, ace_kinds ace_kind)
 {
 	int i;
 	int num_aces = 0;
@@ -253,20 +312,20 @@ parse_dacl(struct cifs_ctrl_acl *pdacl, char *end_of_acl, int raw)
 	char *acl_base;
 	struct cifs_ace *pace;
 
-	if (!pdacl)
+	if (!pacl)
 		return;
 
-	if (end_of_acl < (char *)pdacl + le16toh(pdacl->size))
+	if (end_of_acl < (char *)pacl + le16toh(pacl->size))
 		return;
 
-	acl_base = (char *)pdacl;
+	acl_base = (char *)pacl;
 	acl_size = sizeof(struct cifs_ctrl_acl);
 
-	num_aces = le32toh(pdacl->num_aces);
+	num_aces = le32toh(pacl->num_aces);
 	if (num_aces  > 0) {
 		for (i = 0; i < num_aces; ++i) {
 			pace = (struct cifs_ace *) (acl_base + acl_size);
-			print_ace(pace, end_of_acl, raw);
+			print_ace(pace, end_of_acl, raw, ace_kind);
 			acl_base = (char *)pace;
 			acl_size = le16toh(pace->size);
 		}
@@ -293,10 +352,10 @@ static int
 parse_sec_desc(struct cifs_ntsd *pntsd, ssize_t acl_len, int raw)
 {
 	int rc;
-	uint32_t dacloffset;
+	uint32_t dacloffset, sacloffset;
 	char *end_of_acl = ((char *)pntsd) + acl_len;
 	struct cifs_sid *owner_sid_ptr, *group_sid_ptr;
-	struct cifs_ctrl_acl *dacl_ptr; /* no need for SACL ptr */
+	struct cifs_ctrl_acl *dacl_ptr, *sacl_ptr;
 
 	if (pntsd == NULL)
 		return -EIO;
@@ -307,6 +366,9 @@ parse_sec_desc(struct cifs_ntsd *pntsd, ssize_t acl_len, int raw)
 				le32toh(pntsd->gsidoffset));
 	dacloffset = le32toh(pntsd->dacloffset);
 	dacl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd + dacloffset);
+	sacloffset = le32toh(pntsd->sacloffset);
+	sacl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd + sacloffset);
+
 	printf("REVISION:0x%x\n", le16toh(pntsd->revision));
 	printf("CONTROL:0x%x\n", le16toh(pntsd->type));
 
@@ -318,10 +380,19 @@ parse_sec_desc(struct cifs_ntsd *pntsd, ssize_t acl_len, int raw)
 	if (rc)
 		return rc;
 
-	if (dacloffset)
-		parse_dacl(dacl_ptr, end_of_acl, raw);
-	else
-		printf("No ACL\n"); /* BB grant all or default perms? */
+	if (dacloffset) {
+		printf("DACL:\n");
+		parse_acl(dacl_ptr, end_of_acl, raw, ACE_KIND_DACL);
+	} else {
+		printf("No DACL\n"); /* BB grant all or default perms? */
+	}
+
+	if (sacloffset) {
+		printf("SACL:\n");
+		parse_acl(sacl_ptr, end_of_acl, raw, ACE_KIND_SACL);
+	} else {
+		printf("No SACL\n");
+	}
 
 	return 0;
 }
@@ -351,6 +422,9 @@ getcifsacl(const char *filename)
 	size_t bufsize = BUFSIZE;
 	char *attrval;
 	int failed = 0;
+	/* use attribute name to fetch the whole descriptor */
+	char *attrname = ATTRNAME_NTSD_FULL;
+
 cifsacl:
 	if (bufsize >= XATTR_SIZE_MAX) {
 		fprintf(stderr, "buffer to allocate exceeds max size of %d\n",
@@ -364,12 +438,24 @@ cifsacl:
 		exit(1);
 	}
 
-	attrlen = getxattr(filename, ATTRNAME, attrval, bufsize);
+getxattr:
+	attrlen = getxattr(filename, attrname, attrval, bufsize);
 	if (attrlen == -1) {
 		if (errno == ERANGE) {
 			free(attrval);
 			bufsize += BUFSIZE;
 			goto cifsacl;
+		} else if ((errno == EPERM || errno == EACCES) &&
+			   !(strcmp(attrname, ATTRNAME_NTSD_FULL))) {
+			/*
+			 * attempt to fetch SACL in addition to owner and DACL via
+			 * ATTRNAME_NTSD_FULL, fall back to owner/DACL via
+			 * ATTRNAME_ACL if not allowed
+			 */
+			fprintf(stderr, "Insufficient permissions to fetch full descriptor for %s\n",
+				filename);
+			attrname = ATTRNAME_ACL;
+			goto getxattr;
 		} else {
 			fprintf(stderr, "Failed to getxattr %s: %s\n", filename,
 				strerror(errno));
diff --git a/getcifsacl.rst.in b/getcifsacl.rst.in
index ffde968..b7645fa 100644
--- a/getcifsacl.rst.in
+++ b/getcifsacl.rst.in
@@ -20,8 +20,8 @@ DESCRIPTION
 This tool is part of the cifs-utils suite.
 
 ``getcifsacl`` is a userspace helper program for the Linux CIFS client
-file system. It is intended to display a security descriptor including
-ACL for a file system object.
+file system. It is intended to display a security descriptor, including
+DACL and SACL for a file system object.
 
 This program uses a plugin to handle the mapping of SIDs to user and
 group names. *@pluginpath@* should be a symlink that points to the
diff --git a/setcifsacl.c b/setcifsacl.c
index 6e5a633..db9cf2c 100644
--- a/setcifsacl.c
+++ b/setcifsacl.c
@@ -20,6 +20,20 @@
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */
 
+/*
+ * This utility modifies various components of the security descriptor. These
+ * actions require different permissions and different SMB protocol-level flags.
+ * The user needs to make sure the share is mounted using the user credentials
+ * for the user who has appropriate permissions and privileges. The kernel
+ * CIFS client knows which flags to use based on the extended attribute name:
+ * - system.cifs_acl - set dacl only
+ * - system.cifs_ndst - set dacl and owner info
+ * - system.cifs_ntsd_full - set dacl, owner, and sacl
+ *
+ * For simplicity, the utility modifies one component of the descriptor:
+ * owner sid, group sid, DACL, or SACL. The rest of the descriptor is unchanged.
+ */
+
 #ifdef HAVE_CONFIG_H
 #include "config.h"
 #endif /* HAVE_CONFIG_H */
@@ -46,7 +60,8 @@ enum setcifsacl_actions {
 	ActAdd,
 	ActSetAcl,
 	ActSetOwner,
-	ActSetGroup
+	ActSetGroup,
+	ActSetSacl
 };
 
 static void *plugin_handle;
@@ -74,20 +89,142 @@ copy_cifs_sid(struct cifs_sid *dst, const struct cifs_sid *src)
 	return size;
 }
 
+static int
+get_cifs_sid_size(const struct cifs_sid *sid)
+{
+	return (2 * sizeof(uint8_t) +
+		sizeof(uint8_t) * NUM_AUTHS +
+		sizeof(uint32_t) * sid->num_subauth);
+}
+
+/*
+ * This function takes a pointer of the fetched (original) descriptor, and
+ * it returns the offset of the ACL in the new descriptor.
+ *
+ * If the original descriptor does not have an ACL, the corresponding offset
+ * is 0, and we need to determine where to place the ACL in the new descriptor.
+ * If SACL offset is zero, and there is DACL (dacloffset is not 0), then we will
+ * put SACL after DACL. If the DACL is not present either, we do not know if the
+ * ACLs should go before or after the owner and group SIDs (see below), and so
+ * we will use the offset right past the group SID.
+ * Similarly, if DACL offset is zero, we will use the offset the past the end
+ * of group SID.
+ * @todo: need to add a command-line argument to know if this is
+ *        Azure-style descriptor or a regular-style descriptor
+ */
+static int get_aces_offset(const struct cifs_ntsd *pntsd, ace_kinds ace_kind) {
+	int dacloffset, sacloffset, acesoffset;
+
+	switch(ace_kind) {
+	case ACE_KIND_SACL:
+		sacloffset = le32toh(pntsd->sacloffset);
+		if (sacloffset) {
+			acesoffset = sacloffset + sizeof(struct cifs_ctrl_acl);
+		} else {
+			dacloffset = le32toh(pntsd->dacloffset);
+			if (dacloffset) {
+				struct cifs_ctrl_acl *dacl_ptr =
+					(struct cifs_ctrl_acl *)((char *)pntsd +
+							dacloffset);
+				acesoffset = dacloffset +
+					le16toh(dacl_ptr->size) +
+					sizeof(struct cifs_ctrl_acl);
+			} else {
+				int gsidoffset = le32toh(pntsd->gsidoffset);
+				struct cifs_sid *group_sid_ptr =
+					(struct cifs_sid *)((char *)pntsd +
+							gsidoffset);
+				int gsidsize = get_cifs_sid_size(group_sid_ptr);
+				acesoffset = gsidoffset + gsidsize +
+					sizeof(struct cifs_ctrl_acl);
+			}
+		}
+		break;
+	case ACE_KIND_DACL:
+	default:
+		dacloffset = le32toh(pntsd->dacloffset);
+		if (dacloffset) {
+			acesoffset = dacloffset + sizeof(struct cifs_ctrl_acl);
+		} else {
+			int gsidoffset = le32toh(pntsd->gsidoffset);
+			struct cifs_sid *group_sid_ptr =
+				(struct cifs_sid *)((char *)pntsd +
+						gsidoffset);
+			int gsidsize = get_cifs_sid_size(group_sid_ptr);
+			acesoffset = gsidoffset + gsidsize +
+				sizeof(struct cifs_ctrl_acl);
+		}
+		break;
+	}
+	return acesoffset;
+}
+
+int get_aces_size(const struct cifs_ntsd *pntsd, ace_kinds ace_kind) {
+	int acloffset, size;
+	struct cifs_ctrl_acl *acl_ptr;
+
+	switch(ace_kind) {
+	case ACE_KIND_SACL:
+		acloffset = le32toh(pntsd->sacloffset);
+		break;
+	case ACE_KIND_DACL:
+	default:
+		acloffset = le32toh(pntsd->dacloffset);
+	}
+	if (acloffset) {
+		acl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd + acloffset);
+		size = le16toh(acl_ptr->size);
+	} else {
+		size = 0;
+	}
+	return size;
+}
+
+uint16_t get_acl_revision(const struct cifs_ntsd *pntsd, ace_kinds ace_kind) {
+	struct cifs_ctrl_acl *acl_ptr;
+	int acloffset;
+	switch(ace_kind) {
+	case ACE_KIND_SACL:
+		acloffset = le32toh(pntsd->sacloffset);
+		if (acloffset) {
+			acl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd +
+							   acloffset);
+			return acl_ptr->revision;
+		}
+	/* intentional fall through */
+	case ACE_KIND_DACL:
+	default:
+		acloffset = le32toh(pntsd->dacloffset);
+		if (acloffset) {
+			acl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd +
+							   acloffset);
+			return acl_ptr->revision;
+		} else {
+			return DEFAULT_ACL_REVISION;
+		}
+		break;
+	}
+}
+
+/*
+ * The actual changes to the ACL specified in ace_kind are performed by the
+ * caller of this function; this function copies/backfills the remaining
+ * relevant compoenents of the security descriptor that remain unchanged.
+ */
 static ssize_t
 copy_sec_desc(const struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
-		int numaces, int acessize)
+		int numaces, int acessize, ace_kinds ace_kind)
 {
-	int size, osidsoffset, gsidsoffset, dacloffset;
+	int size, osidsoffset, gsidsoffset, acloffset, dacloffset;
 	ssize_t bufsize;
 	struct cifs_sid *owner_sid_ptr, *group_sid_ptr;
 	struct cifs_sid *nowner_sid_ptr, *ngroup_sid_ptr;
-	struct cifs_ctrl_acl *dacl_ptr, *ndacl_ptr;
+	struct cifs_ctrl_acl *nacl_ptr, *dacl_ptr;
+	char *ndacl_ptr;
 
 	/* copy security descriptor control portion */
 	osidsoffset = le32toh(pntsd->osidoffset);
 	gsidsoffset = le32toh(pntsd->gsidoffset);
-	dacloffset = le32toh(pntsd->dacloffset);
 
 	size = sizeof(struct cifs_ntsd);
 	pnntsd->revision = pntsd->revision;
@@ -97,26 +234,43 @@ copy_sec_desc(const struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
 	pnntsd->dacloffset = pntsd->dacloffset;
 	bufsize = size;
 
-	dacl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd + dacloffset);
-	ndacl_ptr = (struct cifs_ctrl_acl *)((char *)pnntsd + dacloffset);
+	/* owner and group SIDs in the original defscriptor */
+	owner_sid_ptr = (struct cifs_sid *)((char *)pntsd + osidsoffset);
+	group_sid_ptr = (struct cifs_sid *)((char *)pntsd + gsidsoffset);
+
+	/* get the offset of the acl control structure to initialize */
+	acloffset = get_aces_offset(pntsd, ace_kind) - sizeof(struct cifs_ctrl_acl);
+	if (ace_kind == ACE_KIND_SACL) {
+		/* copy (unchanged) DACL if present, increment bufsize */
+		dacloffset = le32toh(pntsd->dacloffset);
+		if (dacloffset) {
+			dacl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd + dacloffset);
+			ndacl_ptr = (char *)pnntsd + dacloffset;
+			size = sizeof(struct cifs_ctrl_acl) + le16toh(dacl_ptr->size);
+			memcpy(ndacl_ptr, (char *)dacl_ptr, size);
+			bufsize += size;
+		}
+		/* initialize SACL offset */
+		pnntsd->sacloffset = acloffset;
+	}
 
+	nacl_ptr = (struct cifs_ctrl_acl *)((char *)pnntsd + acloffset);
+	nacl_ptr->revision = get_acl_revision(pntsd, ace_kind);
 	size = acessize + sizeof(struct cifs_ctrl_acl);
-	ndacl_ptr->revision = dacl_ptr->revision;
-	ndacl_ptr->size = htole16(size);
-	ndacl_ptr->num_aces = htole32(numaces);
+	nacl_ptr->size = htole16(size);
+	nacl_ptr->num_aces = htole32(numaces);
 	bufsize += size;
 
 	/* copy owner sid */
-	owner_sid_ptr = (struct cifs_sid *)((char *)pntsd + osidsoffset);
-	group_sid_ptr = (struct cifs_sid *)((char *)pntsd + gsidsoffset);
+
 	/*
 	 * some servers like Azure return the owner and group SIDs at end rather
 	 * than at the beginning of the ACL so don't want to overwrite the last ACEs
          */
-	if (dacloffset <= osidsoffset) {
+	if (acloffset <= osidsoffset) {
 		/* owners placed at end of ACL */
-		nowner_sid_ptr = (struct cifs_sid *)((char *)pnntsd + dacloffset + size);
-		osidsoffset = dacloffset + size;
+		nowner_sid_ptr = (struct cifs_sid *)((char *)pnntsd + acloffset + size);
+		osidsoffset = acloffset + size;
 		pnntsd->osidoffset = htole32(osidsoffset);
 		size = copy_cifs_sid(nowner_sid_ptr, owner_sid_ptr);
 		bufsize += size;
@@ -143,10 +297,9 @@ copy_sec_desc(const struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
 }
 
 /*
- * This function (and the one above) does not need to set the SACL-related
- * fields, and this works fine because on the SMB protocol level, setting owner
- * info, DACL, and SACL requires one to use separate flags that control which
- * part of the descriptor is begin looked at on the server side
+ * This function does not need to set the SACL-related fields, and this works
+ * fine because the code path calling this function picks the 'system.cifs_ntsd'
+ * attribute name. This name tells Linux CIFS client that SACL is not modified.
  */
 static ssize_t
 copy_sec_desc_with_sid(const struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
@@ -187,8 +340,13 @@ copy_sec_desc_with_sid(const struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
 		group_sid_ptr = sid;
 	}
 
-	dacl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd + dacloffset);
-	daclsize = le16toh(dacl_ptr->size) + sizeof(struct cifs_ctrl_acl);
+	if (dacloffset) {
+		dacl_ptr = (struct cifs_ctrl_acl *)((char *)pntsd + dacloffset);
+		daclsize = le16toh(dacl_ptr->size) + sizeof(struct cifs_ctrl_acl);
+	} else {
+		dacl_ptr = NULL;
+		daclsize = 0;
+	}
 
 	/* copy owner sid */
 	nowner_sid_ptr = (struct cifs_sid *)((char *)pnntsd + nosidoffset);
@@ -205,18 +363,21 @@ copy_sec_desc_with_sid(const struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
 	nsidssize += size;
 
 	/* position the dacl control info as in the fetched descriptor */
-	if (dacloffset <= osidoffset)
-		ndacloffset = dacloffset;
-	else
-		ndacloffset = nosidoffset + nsidssize;
-	ndacl_ptr = (struct cifs_ctrl_acl *)((char *)pnntsd + ndacloffset);
-	pnntsd->dacloffset = htole32(ndacloffset);
-
-	/* the DACL control fields do not change */
-	ndacl_ptr->revision = dacl_ptr->revision;
-	ndacl_ptr->size = dacl_ptr->size;
-	ndacl_ptr->num_aces = dacl_ptr->num_aces;
-
+	if (dacloffset) {
+		if (dacloffset <= osidoffset)
+			ndacloffset = dacloffset;
+		else
+			ndacloffset = nosidoffset + nsidssize;
+		ndacl_ptr = (struct cifs_ctrl_acl *)((char *)pnntsd + ndacloffset);
+		pnntsd->dacloffset = htole32(ndacloffset);
+
+		/* the DACL control fields do not change */
+		ndacl_ptr->revision = dacl_ptr->revision;
+		ndacl_ptr->size = dacl_ptr->size;
+		ndacl_ptr->num_aces = dacl_ptr->num_aces;
+	} else {
+		pnntsd->dacloffset = 0;
+	}
 	/*
 	 * add DACL size (control portion and the array of aces) to the
 	 * buffer size
@@ -278,25 +439,44 @@ compare_aces(struct cifs_ace *sace, struct cifs_ace *dace, int compflags)
 	return 1;
 }
 
+/*
+ * This is somewhat suboptimal, but to keep the code simple, we will still
+ * allocate the ACL control headers for DACL and SACL even thought there is
+ * no corresponding ACL (dacloffset = 0 or sacloffset = 0).
+ * When seetting DACL, we allocate sufficient space for the descriptor control
+ * structure, owner and group sids, and the DACL (ACL control structure and
+ * the aces).
+ * When setting SACL, we allocate sufficient space to copy the above components
+ * plus the SACL to be set (ACL controla and aces).
+ */
 static int
 alloc_sec_desc(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd,
-			int aces, size_t *acesoffset)
+		int aces, size_t *acesoffset, ace_kinds ace_kind)
 {
-	unsigned int size, acessize, bufsize, dacloffset;
-
-	size = sizeof(struct cifs_ntsd) +
-		2 * sizeof(struct cifs_sid) +
-		sizeof(struct cifs_ctrl_acl);
-
-	dacloffset = le32toh(pntsd->dacloffset);
+	unsigned int size, acessize, bufsize;
+
+	switch(ace_kind) {
+	case ACE_KIND_SACL:
+		size = sizeof(struct cifs_ntsd) +
+			2 * sizeof(struct cifs_sid) +
+			sizeof(struct cifs_ctrl_acl) +
+			get_aces_size(pntsd, ACE_KIND_DACL) +
+			sizeof(struct cifs_ctrl_acl);
+		break;
+	case ACE_KIND_DACL:
+	default:
+		size = sizeof(struct cifs_ntsd) +
+			2 * sizeof(struct cifs_sid) +
+			sizeof(struct cifs_ctrl_acl);
+		break;
+	}
 
-	*acesoffset = dacloffset + sizeof(struct cifs_ctrl_acl);
+	*acesoffset = get_aces_offset(pntsd, ace_kind);
 	acessize = aces * sizeof(struct cifs_ace);
 	bufsize = size + acessize;
-
 	*npntsd = calloc(1, bufsize);
 	if (!*npntsd) {
-		printf("%s: Memory allocation failure", __func__);
+		fprintf(stderr, "%s: Memory allocation failure", __func__);
 		return errno;
 	}
 
@@ -305,13 +485,13 @@ alloc_sec_desc(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd,
 
 static int
 ace_set(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
-			struct cifs_ace **cacesptr, int numcaces)
+		struct cifs_ace **cacesptr, int numcaces, ace_kinds ace_kind)
 {
 	int i, rc, size = 0, acessize = 0;
 	size_t acesoffset;
 	char *acesptr;
 
-	rc = alloc_sec_desc(pntsd, npntsd, numcaces, &acesoffset);
+	rc = alloc_sec_desc(pntsd, npntsd, numcaces, &acesoffset, ace_kind);
 	if (rc)
 		return rc;
 
@@ -322,7 +502,7 @@ ace_set(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 		acesptr += size;
 	}
 
-	*bufsize = copy_sec_desc(pntsd, *npntsd, numcaces, acessize);
+	*bufsize = copy_sec_desc(pntsd, *npntsd, numcaces, acessize, ace_kind);
 
 	return 0;
 }
@@ -330,14 +510,15 @@ ace_set(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 static int
 ace_add(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 		struct cifs_ace **facesptr, int numfaces,
-		struct cifs_ace **cacesptr, int numcaces)
+		struct cifs_ace **cacesptr, int numcaces,
+		ace_kinds ace_kind)
 {
 	int i, rc, numaces, size, acessize = 0;
 	size_t acesoffset;
 	char *acesptr;
 
 	numaces = numfaces + numcaces;
-	rc = alloc_sec_desc(pntsd, npntsd, numaces, &acesoffset);
+	rc = alloc_sec_desc(pntsd, npntsd, numaces, &acesoffset, ace_kind);
 	if (rc)
 		return rc;
 
@@ -353,7 +534,7 @@ ace_add(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 		acessize += size;
 	}
 
-	*bufsize = copy_sec_desc(pntsd, *npntsd, numaces, acessize);
+	*bufsize = copy_sec_desc(pntsd, *npntsd, numaces, acessize, ace_kind);
 
 	return 0;
 }
@@ -361,18 +542,19 @@ ace_add(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 static int
 ace_modify(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 		struct cifs_ace **facesptr, int numfaces,
-		struct cifs_ace **cacesptr, int numcaces)
+		struct cifs_ace **cacesptr, int numcaces,
+		ace_kinds ace_kind)
 {
 	int i, j, rc, size, acessize = 0;
 	size_t acesoffset;
 	char *acesptr;
 
 	if (numfaces == 0) {
-		printf("%s: No entries to modify", __func__);
+		fprintf(stderr, "%s: No entries to modify", __func__);
 		return -1;
 	}
 
-	rc = alloc_sec_desc(pntsd, npntsd, numfaces, &acesoffset);
+	rc = alloc_sec_desc(pntsd, npntsd, numfaces, &acesoffset, ace_kind);
 	if (rc)
 		return rc;
 
@@ -393,7 +575,7 @@ ace_modify(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 		acessize += size;
 	}
 
-	*bufsize = copy_sec_desc(pntsd, *npntsd, numfaces, acessize);
+	*bufsize = copy_sec_desc(pntsd, *npntsd, numfaces, acessize, ace_kind);
 
 	return 0;
 }
@@ -401,23 +583,24 @@ ace_modify(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 static int
 ace_delete(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 		struct cifs_ace **facesptr, int numfaces,
-		struct cifs_ace **cacesptr, int numcaces)
+		struct cifs_ace **cacesptr, int numcaces,
+		ace_kinds ace_kind)
 {
 	int i, j, numaces = 0, rc, size, acessize = 0;
 	size_t acesoffset;
 	char *acesptr;
 
 	if (numfaces == 0) {
-		printf("%s: No entries to delete\n", __func__);
+		fprintf(stderr, "%s: No entries to delete\n", __func__);
 		return -1;
 	}
 
 	if (numfaces < numcaces) {
-		printf("%s: Invalid entries to delete\n", __func__);
+		fprintf(stderr, "%s: Invalid entries to delete\n", __func__);
 		return -1;
 	}
 
-	rc = alloc_sec_desc(pntsd, npntsd, numfaces, &acesoffset);
+	rc = alloc_sec_desc(pntsd, npntsd, numfaces, &acesoffset, ace_kind);
 	if (rc)
 		return rc;
 
@@ -429,7 +612,7 @@ ace_delete(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 		}
 		if (j == numcaces) {
 			size = copy_ace((struct cifs_ace *)acesptr,
-								facesptr[i]);
+					facesptr[i]);
 			acessize += size;
 			acesptr += size;
 			++numaces;
@@ -437,41 +620,50 @@ ace_delete(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd, ssize_t *bufsize,
 	}
 
 	if (numaces == numfaces) {
-		printf("%s: Nothing to delete\n", __func__);
+		fprintf(stderr, "%s: Nothing to delete\n", __func__);
 		return 1;
 	}
 
-	*bufsize = copy_sec_desc(pntsd, *npntsd, numaces, acessize);
+	*bufsize = copy_sec_desc(pntsd, *npntsd, numaces, acessize, ace_kind);
 
 	return 0;
 }
 
 static int
 get_numfaces(struct cifs_ntsd *pntsd, ssize_t acl_len,
-			struct cifs_ctrl_acl **daclptr)
+		struct cifs_ctrl_acl **aclptr, ace_kinds ace_kind)
 {
 	int numfaces = 0;
-	uint32_t dacloffset;
-	struct cifs_ctrl_acl *ldaclptr;
+	uint32_t acloffset;
+	struct cifs_ctrl_acl *laclptr;
 	char *end_of_acl = ((char *)pntsd) + acl_len;
 
-	dacloffset = le32toh(pntsd->dacloffset);
-	if (!dacloffset)
+	switch(ace_kind) {
+	case ACE_KIND_SACL:
+		acloffset = le32toh(pntsd->sacloffset);
+		break;
+	case ACE_KIND_DACL:
+	default:
+		acloffset = le32toh(pntsd->dacloffset);
+		break;
+	}
+
+	if (!acloffset)
 		return 0;
 
-	ldaclptr = (struct cifs_ctrl_acl *)((char *)pntsd + dacloffset);
+	laclptr = (struct cifs_ctrl_acl *)((char *)pntsd + acloffset);
 
 	/* validate that we do not go past end of acl */
-	if (end_of_acl >= (char *)ldaclptr + le16toh(ldaclptr->size)) {
-		numfaces = le32toh(ldaclptr->num_aces);
-		*daclptr = ldaclptr;
+	if (end_of_acl >= (char *)laclptr + le16toh(laclptr->size)) {
+		numfaces = le32toh(laclptr->num_aces);
+		*aclptr = laclptr;
 	}
 
 	return numfaces;
 }
 
 static struct cifs_ace **
-build_fetched_aces(char *daclptr, int numfaces)
+build_fetched_aces(char *aclptr, int numfaces)
 {
 	int i, acl_size;
 	char *acl_base;
@@ -479,12 +671,12 @@ build_fetched_aces(char *daclptr, int numfaces)
 
 	facesptr = calloc(numfaces, sizeof(struct cifs_aces *));
 	if (!facesptr) {
-		printf("%s: Error %d allocating ACE array",
+		fprintf(stderr, "%s: Error %d allocating ACE array",
 				__func__, errno);
 		return facesptr;
 	}
 
-	acl_base = daclptr;
+	acl_base = aclptr;
 	acl_size = sizeof(struct cifs_ctrl_acl);
 	for (i = 0; i < numfaces; ++i) {
 		facesptr[i] = malloc(sizeof(struct cifs_ace));
@@ -498,7 +690,7 @@ build_fetched_aces(char *daclptr, int numfaces)
 	return facesptr;
 
 build_fetched_aces_err:
-	printf("%s: Invalid fetched ace\n", __func__);
+	fprintf(stderr, "%s: Invalid fetched ace\n", __func__);
 	for (i = 0; i < numfaces; ++i)
 		free(facesptr[i]);
 	free(facesptr);
@@ -506,75 +698,129 @@ build_fetched_aces_err:
 }
 
 static int
-verify_ace_type(char *typestr, uint8_t *typeval)
+verify_ace_type(char *typestr, uint8_t *typeval, ace_kinds ace_kind)
 {
 	int i, len;
 	char *invaltype;
+	uint8_t ace_type_mask;
+
+	switch(ace_kind) {
+	case ACE_KIND_SACL:
+		ace_type_mask = SACL_VTYPES;
+		break;
+	case ACE_KIND_DACL:
+	default:
+		ace_type_mask = DACL_VTYPES;
+		break;
+	}
 
 	if (strstr(typestr, "0x")) { /* hex type value */
 		*typeval = strtol(typestr, &invaltype, 16);
 		if (!strlen(invaltype)) {
-			if (*typeval != ACCESS_ALLOWED &&
-				*typeval != ACCESS_DENIED &&
-				*typeval != ACCESS_ALLOWED_OBJECT &&
-				*typeval != ACCESS_DENIED_OBJECT) {
-					printf("%s: Invalid type: %s\n",
-						__func__, typestr);
-					return 1;
+			/* the type must be a single bit from the bit mask */
+			if (*typeval != (*typeval & ace_type_mask)) {
+				fprintf(stderr, "%s: Invalid type: %s\n",
+					__func__, typestr);
+				return 1;
 			}
 			return 0;
 		}
 	}
 
 	len = strlen(typestr);
-	for (i = 0; i < len; ++i)
-		*(typestr + i) = toupper(*(typestr + i));
-	if (!strcmp(typestr, "ALLOWED"))
-		*typeval = 0x0;
-	else if (!strcmp(typestr, "DENIED"))
-		*typeval = 0x1;
-	else if (!strcmp(typestr, "ALLOWED_OBJECT"))
-		*typeval = 0x5;
-	else if (!strcmp(typestr, "DENIED_OBJECT"))
-		*typeval = 0x6;
-	else {
-		printf("%s: Invalid type: %s\n", __func__, typestr);
-		return 1;
+	switch(ace_kind) {
+	case ACE_KIND_SACL:
+		for (i = 0; i < len; ++i)
+			*(typestr + i) = toupper(*(typestr + i));
+		if (!strcmp(typestr, "AUDIT"))
+			*typeval = SYSTEM_AUDIT;
+		else if (!strcmp(typestr, "AUDIT_OBJECT"))
+			*typeval = SYSTEM_AUDIT_OBJECT;
+		else if (!strcmp(typestr, "AUDIT_CALLBACK"))
+			*typeval = SYSTEM_AUDIT_CALLBACK;
+		else if (!strcmp(typestr, "AUDIT_CALLBACK_OBJECT"))
+			*typeval = SYSTEM_AUDIT_CALLBACK_OBJECT;
+		else if (!strcmp(typestr, "MANDATODY_LABEL"))
+			*typeval = SYSTEM_MANDATORY_LABEL;
+		else if (!strcmp(typestr, "RESOURCE_ATTRIBUTE"))
+			*typeval = SYSTEM_RESOURCE_ATTRIBUTE;
+		else if (!strcmp(typestr, "SCOPED_POLICY_ID"))
+			*typeval = SYSTEM_SCOPED_POLICY_ID;
+		else {
+			fprintf(stderr, "%s: Invalid type: %s\n", __func__,
+				typestr);
+			return 1;
+		}
+		break;
+	case ACE_KIND_DACL:
+	default:
+		for (i = 0; i < len; ++i)
+			*(typestr + i) = toupper(*(typestr + i));
+		if (!strcmp(typestr, "ALLOWED"))
+			*typeval = ACCESS_ALLOWED;
+		else if (!strcmp(typestr, "DENIED"))
+			*typeval = ACCESS_DENIED;
+		else if (!strcmp(typestr, "ALLOWED_OBJECT"))
+			*typeval = ACCESS_ALLOWED_OBJECT;
+		else if (!strcmp(typestr, "DENIED_OBJECT"))
+			*typeval = ACCESS_DENIED_OBJECT;
+		else {
+		fprintf(stderr, "%s: Invalid type: %s\n", __func__, typestr);
+			return 1;
+		}
+		break;
 	}
 
 	return 0;
 }
 
 static uint8_t
-ace_flag_value(char *flagstr)
+ace_flag_value(char *flagstr, ace_kinds ace_kind)
 {
 	uint8_t flagval = 0x0;
 	char *iflag;
 
 	iflag = strtok(flagstr, "|"); /* everything before | */
-	while (iflag) {
-		if (!strcmp(iflag, "OI"))
-			flagval += 0x1;
-		else if (!strcmp(iflag, "CI"))
-			flagval += 0x2;
-		else if (!strcmp(iflag, "NP"))
-			flagval += 0x4;
-		else if (!strcmp(iflag, "IO"))
-			flagval += 0x8;
-		else if (!strcmp(iflag, "I"))
-			flagval += 0x10;
-		else
-			return 0x0; /* Invalid flag */
-		iflag = strtok(NULL, "|"); /* everything before | */
+	switch(ace_kind) {
+	case ACE_KIND_SACL:
+		while (iflag) {
+			if (!strcmp(iflag, "SA"))
+				flagval |= SUCCESSFUL_ACCESS;
+			else if (!strcmp(iflag, "FA"))
+				flagval |= FAILED_ACCESS;
+			else
+				return 0x0; /* Invalid flag */
+			iflag = strtok(NULL, "|"); /* everything before | */
+		}
+		break;
+	case ACE_KIND_DACL:
+	default:
+		while (iflag) {
+			if (!strcmp(iflag, "OI"))
+				flagval |= OBJECT_INHERIT_FLAG;
+			else if (!strcmp(iflag, "CI"))
+				flagval |= CONTAINER_INHERIT_FLAG;
+			else if (!strcmp(iflag, "NP"))
+				flagval |= NO_PROPAGATE_INHERIT_FLAG;
+			else if (!strcmp(iflag, "IO"))
+				flagval |= INHERIT_ONLY_FLAG;
+			else if (!strcmp(iflag, "I"))
+				flagval |= INHERITED_ACE_FLAG;
+			else
+				return 0x0; /* Invalid flag */
+			iflag = strtok(NULL, "|"); /* everything before | */
+		}
+		break;
 	}
 
 	return flagval;
 }
 
 static int
-verify_ace_flags(char *flagstr, uint8_t *flagval)
+verify_ace_flags(char *flagstr, uint8_t *flagval, ace_kinds ace_kind)
 {
 	char *invalflag;
+	uint8_t ace_flag_mask = 0;
 
 	if (!strcmp(flagstr, "0") || !strcmp(flagstr, "0x0"))
 		return 0;
@@ -582,14 +828,24 @@ verify_ace_flags(char *flagstr, uint8_t *flagval)
 	if (strstr(flagstr, "0x")) { /* hex flag value */
 		*flagval = strtol(flagstr, &invalflag, 16);
 		if (strlen(invalflag)) {
-			printf("%s: Invalid flags: %s\n", __func__, flagstr);
+			fprintf(stderr, "%s: Invalid flags: %s\n", __func__,
+				flagstr);
 			return 1;
 		}
 	} else
-		*flagval = ace_flag_value(flagstr);
+		*flagval = ace_flag_value(flagstr, ace_kind);
 
-	if (!*flagval || (*flagval & ~VFLAGS)) {
-		printf("%s: Invalid flag %s and value: 0x%x\n",
+	switch(ace_kind) {
+	case ACE_KIND_SACL:
+		ace_flag_mask = SACL_VFLAGS;
+		break;
+	case ACE_KIND_DACL:
+	default:
+		ace_flag_mask = DACL_VFLAGS;
+		break;
+	}
+	if (!*flagval || (*flagval & ~ace_flag_mask)) {
+		fprintf(stderr, "%s: Invalid flag %s and value: 0x%x\n",
 			__func__, flagstr, *flagval);
 		return 1;
 	}
@@ -609,6 +865,8 @@ ace_mask_value(char *mask)
 		return CHANGE;
 	if (!strcmp(mask, "READ"))
 		return EREAD;
+	if (!strcmp(mask, "RWXDPO"))
+		return ALL_ACCESS_BITS;
 
 	while((cur = *mask++)) {
 		switch(cur) {
@@ -651,7 +909,7 @@ verify_ace_mask(char *maskstr, uint32_t *maskval)
 		*maskval = htole32(ace_mask_value(maskstr));
 
 	if (!*maskval) {
-		printf("%s: Invalid mask %s (value 0x%x)\n", __func__,
+		fprintf(stderr, "%s: Invalid mask %s (value 0x%x)\n", __func__,
 			maskstr, *maskval);
 		return 1;
 	}
@@ -737,7 +995,7 @@ setcifsacl_str_to_sid(const char *str, struct cifs_sid *sid)
 }
 
 static struct cifs_ace **
-build_cmdline_aces(char **arrptr, int numcaces)
+build_cmdline_aces(char **arrptr, int numcaces, ace_kinds ace_kind)
 {
 	int i;
 	char *acesid, *acetype, *aceflag, *acemask;
@@ -745,7 +1003,8 @@ build_cmdline_aces(char **arrptr, int numcaces)
 
 	cacesptr = calloc(numcaces, sizeof(struct cifs_aces *));
 	if (!cacesptr) {
-		printf("%s: Error %d allocating ACE array", __func__, errno);
+		fprintf(stderr, "%s: Error %d allocating ACE array", __func__,
+			errno);
 		return NULL;
 	}
 
@@ -756,36 +1015,38 @@ build_cmdline_aces(char **arrptr, int numcaces)
 		acemask = strtok(NULL, "/");
 
 		if (!acesid || !acetype || !aceflag || !acemask) {
-			printf("%s: Incomplete ACE: %s\n", __func__, arrptr[i]);
+			fprintf(stderr, "%s: Incomplete ACE: %s\n", __func__,
+				arrptr[i]);
 			goto build_cmdline_aces_ret;
 		}
 
 		cacesptr[i] = calloc(1, sizeof(struct cifs_ace));
 		if (!cacesptr[i]) {
-			printf("%s: ACE alloc error %d\n", __func__, errno);
+			fprintf(stderr, "%s: ACE alloc error %d\n", __func__,
+				errno);
 			goto build_cmdline_aces_ret;
 		}
 
 		if (setcifsacl_str_to_sid(acesid, &cacesptr[i]->sid)) {
-			printf("%s: Invalid SID (%s): %s\n", __func__, arrptr[i],
-				plugin_errmsg);
+			fprintf(stderr, "%s: Invalid SID (%s): %s\n", __func__,
+				arrptr[i], plugin_errmsg);
 			goto build_cmdline_aces_ret;
 		}
 
-		if (verify_ace_type(acetype, &cacesptr[i]->type)) {
-			printf("%s: Invalid ACE type: %s\n",
+		if (verify_ace_type(acetype, &cacesptr[i]->type, ace_kind)) {
+			fprintf(stderr, "%s: Invalid ACE type: %s\n",
 					__func__, arrptr[i]);
 			goto build_cmdline_aces_ret;
 		}
 
-		if (verify_ace_flags(aceflag, &cacesptr[i]->flags)) {
-			printf("%s: Invalid ACE flag: %s\n",
+		if (verify_ace_flags(aceflag, &cacesptr[i]->flags, ace_kind)) {
+			fprintf(stderr, "%s: Invalid ACE flag: %s\n",
 				__func__, arrptr[i]);
 			goto build_cmdline_aces_ret;
 		}
 
 		if (verify_ace_mask(acemask, &cacesptr[i]->access_req)) {
-			printf("%s: Invalid ACE mask: %s\n",
+			fprintf(stderr, "%s: Invalid ACE mask: %s\n",
 				__func__, arrptr[i]);
 			goto build_cmdline_aces_ret;
 		}
@@ -810,7 +1071,8 @@ parse_cmdline_aces(char *acelist, int numcaces)
 
 	arrptr = (char **)malloc(numcaces * sizeof(char *));
 	if (!arrptr) {
-		printf("%s: Unable to allocate char array\n", __func__);
+		fprintf(stderr, "%s: Unable to allocate char array\n",
+			__func__);
 		return NULL;
 	}
 
@@ -832,7 +1094,7 @@ parse_cmdline_aces(char *acelist, int numcaces)
 	return arrptr;
 
 parse_cmdline_aces_err:
-	printf("%s: Error parsing ACEs\n", __func__);
+	fprintf(stderr, "%s: Error parsing ACEs\n", __func__);
 	free(arrptr);
 	return NULL;
 }
@@ -857,28 +1119,29 @@ static int
 setacl_action(struct cifs_ntsd *pntsd, struct cifs_ntsd **npntsd,
 		ssize_t *bufsize, struct cifs_ace **facesptr, int numfaces,
 		struct cifs_ace **cacesptr, int numcaces,
-		enum setcifsacl_actions maction)
+		enum setcifsacl_actions maction, ace_kinds ace_kind)
 {
 	int rc = 1;
 
 	switch (maction) {
 	case ActDelete:
 		rc = ace_delete(pntsd, npntsd, bufsize, facesptr,
-				numfaces, cacesptr, numcaces);
+				numfaces, cacesptr, numcaces, ace_kind);
 		break;
 	case ActModify:
 		rc = ace_modify(pntsd, npntsd, bufsize, facesptr,
-				numfaces, cacesptr, numcaces);
+				numfaces, cacesptr, numcaces, ace_kind);
 		break;
 	case ActAdd:
 		rc = ace_add(pntsd, npntsd, bufsize, facesptr,
-				numfaces, cacesptr, numcaces);
+				numfaces, cacesptr, numcaces, ace_kind);
 		break;
 	case ActSetAcl:
-		rc = ace_set(pntsd, npntsd, bufsize, cacesptr, numcaces);
+		rc = ace_set(pntsd, npntsd, bufsize, cacesptr, numcaces,
+				ace_kind);
 		break;
 	default:
-		printf("%s: Invalid action: %d\n", __func__, maction);
+		fprintf(stderr, "%s: Invalid action: %d\n", __func__, maction);
 		break;
 	}
 
@@ -889,12 +1152,15 @@ static void
 setcifsacl_usage(const char *prog)
 {
 	fprintf(stderr,
-	"%s: Alter CIFS/NTFS ACL or owner/group in a security descriptor of a file object\n",
+	"%s: Alter components of CIFS/NTFS security descriptor of a file object\n",
 		prog);
 	fprintf(stderr, "Usage: %s option [<list_of_ACEs>|<SID>] <file_name>\n",
 		prog);
 	fprintf(stderr, "Valid options:\n");
 	fprintf(stderr, "\t-v	Version of the program\n");
+	fprintf(stderr, "\t-U	Used in combination with -a, -D, -M, -S in order to ");
+	fprintf(stderr, "\n\t	apply the actions to SALC (aUdit ACL); if not specified, ");
+	fprintf(stderr, "\n\t	the actions apply to DACL\n");
 	fprintf(stderr, "\n\t-a	Add ACE(s), separated by a comma, to an ACL\n");
 	fprintf(stderr,
 	"\tsetcifsacl -a \"ACL:Administrator:ALLOWED/0x0/FULL\" <file_name>\n");
@@ -931,65 +1197,71 @@ main(const int argc, char *const argv[])
 	ssize_t attrlen, bufsize = BUFSIZE;
 	char *ace_list = NULL, *filename = NULL, *attrval = NULL,
 		**arrptr = NULL, *sid_str = NULL;
-	struct cifs_ctrl_acl *daclptr = NULL;
+	struct cifs_ctrl_acl *aclptr = NULL;
 	struct cifs_ace **cacesptr = NULL, **facesptr = NULL;
 	struct cifs_ntsd *ntsdptr = NULL;
 	struct cifs_sid sid;
 	char *attrname = ATTRNAME_ACL;
+	ace_kinds ace_kind = ACE_KIND_DACL;
 
-	c = getopt(argc, argv, "hvD:M:a:S:o:g:");
-	switch (c) {
-	case 'D':
-		maction = ActDelete;
-		ace_list = optarg;
-		break;
-	case 'M':
-		maction = ActModify;
-		ace_list = optarg;
-		break;
-	case 'a':
-		maction = ActAdd;
-		ace_list = optarg;
-		break;
-	case 'S':
-		maction = ActSetAcl;
-		ace_list = optarg;
-		break;
-	case 'o':
-		maction = ActSetOwner;
-		sid_str = optarg;
-		attrname = ATTRNAME_NTSD;
-		break;
-	case 'g':
-		maction = ActSetGroup;
-		sid_str = optarg;
-		attrname = ATTRNAME_NTSD;
-		break;
-	case 'h':
-		setcifsacl_usage(basename(argv[0]));
-		return 0;
-	case 'v':
-		printf("Version: %s\n", VERSION);
-		return 0;
-	default:
-		setcifsacl_usage(basename(argv[0]));
-		return -1;
+	while ((c = getopt(argc, argv, "hvD:M:a:S:o:g:U")) != -1) {
+		switch (c) {
+		case 'U':
+			ace_kind = ACE_KIND_SACL;
+			attrname = ATTRNAME_NTSD_FULL;
+			break;
+		case 'D':
+			maction = ActDelete;
+			ace_list = optarg;
+			break;
+		case 'M':
+			maction = ActModify;
+			ace_list = optarg;
+			break;
+		case 'a':
+			maction = ActAdd;
+			ace_list = optarg;
+			break;
+		case 'S':
+			maction = ActSetAcl;
+			ace_list = optarg;
+			break;
+		case 'o':
+			maction = ActSetOwner;
+			sid_str = optarg;
+			attrname = ATTRNAME_NTSD;
+			break;
+		case 'g':
+			maction = ActSetGroup;
+			sid_str = optarg;
+			attrname = ATTRNAME_NTSD;
+			break;
+		case 'h':
+			setcifsacl_usage(basename(argv[0]));
+			return 0;
+		case 'v':
+			printf("Version: %s\n", VERSION);
+			return 0;
+		default:
+			setcifsacl_usage(basename(argv[0]));
+			return -1;
+		}
 	}
 
-	/* We expect 1 argument in addition to the option */
-	if (argc != 4) {
+	/* We expect 1 required and one optional argument in addition to the option */
+	if (argc < 4 || argc > 5) {
 		setcifsacl_usage(basename(argv[0]));
 		return -1;
 	}
-	filename = argv[3];
+	filename = argv[argc-1];
 
 	if (!ace_list && maction != ActSetOwner && maction != ActSetGroup) {
-		printf("%s: No valid ACEs specified\n", __func__);
+		fprintf(stderr, "%s: No valid ACEs specified\n", __func__);
 		return -1;
 	}
 
 	if (!sid_str && (maction == ActSetOwner || maction == ActSetGroup)) {
-		printf("%s: No valid SIDs specified\n", __func__);
+		fprintf(stderr, "%s: No valid SIDs specified\n", __func__);
 		return -1;
 	}
 
@@ -1003,10 +1275,15 @@ main(const int argc, char *const argv[])
 	}
 
 	if (maction == ActSetOwner || maction == ActSetGroup) {
+		if (ace_kind == ACE_KIND_SACL) {
+			fprintf(stderr, "WARNING: disregarding -U when setting"
+					" owner/group\n");
+			ace_kind = ACE_KIND_DACL;
+		}
 		/* parse the sid */
 		if (setcifsacl_str_to_sid(sid_str, &sid)) {
-			printf("%s: failed to parce \'%s\' as SID\n", __func__,
-				sid_str);
+			fprintf(stderr, "%s: failed to parce \'%s\' as SID\n",
+				__func__, sid_str);
 			goto setcifsacl_numcaces_ret;
 		}
 	} else {
@@ -1016,20 +1293,21 @@ main(const int argc, char *const argv[])
 		if (!arrptr)
 			goto setcifsacl_numcaces_ret;
 
-		cacesptr = build_cmdline_aces(arrptr, numcaces);
+		cacesptr = build_cmdline_aces(arrptr, numcaces, ace_kind);
 		if (!cacesptr)
 			goto setcifsacl_cmdlineparse_ret;
 	}
 cifsacl:
 	if (bufsize >= XATTR_SIZE_MAX) {
-		printf("%s: Buffer size %zd exceeds max size of %d\n",
+		fprintf(stderr, "%s: Buffer size %zd exceeds max size of %d\n",
 				__func__, bufsize, XATTR_SIZE_MAX);
 		goto setcifsacl_cmdlineverify_ret;
 	}
 
 	attrval = malloc(bufsize * sizeof(char));
 	if (!attrval) {
-		printf("error allocating memory for attribute value buffer\n");
+		fprintf(stderr, "error allocating memory for attribute value "
+			"buffer\n");
 		goto setcifsacl_cmdlineverify_ret;
 	}
 
@@ -1040,7 +1318,7 @@ cifsacl:
 			bufsize += BUFSIZE;
 			goto cifsacl;
 		} else {
-			printf("getxattr error: %d\n", errno);
+			fprintf(stderr, "getxattr error: %d\n", errno);
 			goto setcifsacl_getx_ret;
 		}
 	}
@@ -1048,18 +1326,30 @@ cifsacl:
 	if (maction == ActSetOwner || maction == ActSetGroup) {
 		struct cifs_ntsd *pfntsd = (struct cifs_ntsd *)attrval;
 		int dacloffset = le32toh(pfntsd->dacloffset);
-		struct cifs_ctrl_acl *daclinfo =
-				(struct cifs_ctrl_acl *)(attrval + dacloffset);
-		int numaces = le16toh(daclinfo->num_aces);
-		int acessize = le32toh(daclinfo->size);
+		struct cifs_ctrl_acl *daclinfo;
+		int numaces, acessize;
 		size_t faceoffset, naceoffset;
 		char *faceptr, *naceptr;
-
+		/*
+		 * dacloffset of 0 means "no DACL - all access for everyone"
+		 * if dacloffset is not 0, it is still possible that DACL is
+		 * empty - numaces is zero - "no access for anyone"
+		 */
+		if (dacloffset) {
+			daclinfo = (struct cifs_ctrl_acl *)(attrval + dacloffset);
+			numaces = le16toh(daclinfo->num_aces);
+			acessize = le32toh(daclinfo->size);
+		} else {
+			daclinfo = NULL;
+			numaces = 0;
+			acessize = 0;
+		}
 		/*
 		 * this allocates large enough buffer for max sid size and the
 		 * dacl info from the fetched security descriptor
 		 */
-		rc = alloc_sec_desc(pfntsd, &ntsdptr, numaces, &faceoffset);
+		rc = alloc_sec_desc(pfntsd, &ntsdptr, numaces, &faceoffset,
+				ACE_KIND_DACL);
 		if (rc)
 			goto setcifsacl_numcaces_ret;
 
@@ -1071,37 +1361,40 @@ cifsacl:
 		bufsize = copy_sec_desc_with_sid(pfntsd, ntsdptr, &sid,
 				maction);
 
-		/* copy aces verbatim as they have not changed */
-		faceptr = attrval + faceoffset;
-		naceoffset = le32toh(ntsdptr->dacloffset) +
+		/* copy DACL aces verbatim as they have not changed */
+		if (dacloffset) {
+			faceptr = attrval + faceoffset;
+			naceoffset = le32toh(ntsdptr->dacloffset) +
 				sizeof(struct cifs_ctrl_acl);
-		naceptr = (char *)ntsdptr + naceoffset;
-		memcpy(naceptr, faceptr, acessize);
+			naceptr = (char *)ntsdptr + naceoffset;
+			memcpy(naceptr, faceptr, acessize);
+		}
 	} else {
 		bufsize = 0;
 
 		numfaces = get_numfaces((struct cifs_ntsd *)attrval, attrlen,
-				&daclptr);
+				&aclptr, ace_kind);
 		if (!numfaces && maction != ActAdd) {
 			/* if we are not adding aces */
-			printf("%s: Empty DACL\n", __func__);
+			fprintf(stderr, "%s: Empty DACL\n", __func__);
 			goto setcifsacl_facenum_ret;
 		}
 
-		facesptr = build_fetched_aces((char *)daclptr, numfaces);
+		facesptr = build_fetched_aces((char *)aclptr, numfaces);
 		if (!facesptr)
 			goto setcifsacl_facenum_ret;
 
 		rc = setacl_action((struct cifs_ntsd *)attrval, &ntsdptr,
 				&bufsize, facesptr, numfaces, cacesptr,
-				numcaces, maction);
+				numcaces, maction, ace_kind);
 		if (rc)
 			goto setcifsacl_action_ret;
 	}
 
 	attrlen = setxattr(filename, attrname, ntsdptr, bufsize, 0);
 	if (attrlen == -1) {
-		printf("%s: setxattr error: %s\n", __func__, strerror(errno));
+		fprintf(stderr, "%s: setxattr error: %s\n", __func__,
+			strerror(errno));
 		goto setcifsacl_action_ret;
 	}
 
diff --git a/setcifsacl.rst.in b/setcifsacl.rst.in
index b1b6df6..51b5973 100644
--- a/setcifsacl.rst.in
+++ b/setcifsacl.rst.in
@@ -3,7 +3,7 @@ setcifsacl
 ==========
 
 -------------------------------------------------------------------------------------------------------------------
-Userspace helper to alter an ACL or owner/group SID in a security descriptor for Common Internet File System (CIFS)
+Userspace helper to alter components of a security descriptor for Common Internet File System (CIFS)
 -------------------------------------------------------------------------------------------------------------------
 :Manual section: 1
 
@@ -11,7 +11,7 @@ Userspace helper to alter an ACL or owner/group SID in a security descriptor for
 SYNOPSIS
 ********
 
-  setcifsacl [-v|-a|-D|-M|-S|-o|-g] "{one or more ACEs or a SID}" {file system object}
+  setcifsacl [-v|-U|-a|-D|-M|-S|-o|-g] "{one or more ACEs or a SID}" {file system object}
 
 ***********
 DESCRIPTION
@@ -38,6 +38,10 @@ OPTIONS
 -v
   Print version number and exit.
 
+-U
+  Apply ACE editing actions (-a, -D, -M, -S) to SACL (aUdit ACL). The actions are
+  appliend to DACL if -U is not specified.
+
 -a
   Add one or more ACEs to an ACL of a security descriptor.  An ACE is
   added even if the same ACE exists in the ACL.
@@ -65,7 +69,7 @@ OPTIONS
   Every ACE entry starts with "ACL:" One or more ACEs are specified
   within double quotes.  Multiple ACEs are separated by a comma.
 
-  Following fields of an ACE can be modified with possible values:
+  Following fields of a DACL ACE can be modified with possible values:
 
   - ``SID`` - Either a name or a raw SID value.
   - ``type`` - ALLOWED (0x0), DENIED (0x1), OBJECT_ALLOWED (0x5), OBJECT_DENIED (0x6)
@@ -75,6 +79,14 @@ OPTIONS
     0x10) or a combination/OR of these values.
   - ``mask``  - Either one of FULL, CHANGE, READ, a combination of R W X D P O, or a hex value.
 
+  Following fields of a SACL ACE can be modified with possible values:
+
+  - ``SID`` - Either a name or a raw SID value.
+  - ``type`` - AUDIT (0x2), AUDIT_OBJECT (0x7), AUDIT_CALLBACK (0xD), AUDIT_CALLBACK_OBJECT (0xF),
+    MANDATORY_LABEL (0x11), RESOURCE_ATTRIBUTE (0x12), SCOPED_POLICY_ID (0x13)
+  - ``flags`` - SUCCESSFULL_ACCESS (SA or 0x40), FAILED_ACCESS (FA or 0x80)
+  - ``mask``  - Either one of FULL, CHANGE, READ, a combination of R W X D P O, or a hex value.
+
 ********
 EXAMPLES
 ********
@@ -83,23 +95,32 @@ Add an ACE
 ==========
 
   setcifsacl -a "ACL:CIFSTESTDOM\\user2:DENIED/0x1/D" <file_name>
+
   setcifsacl -a "ACL:CIFSTESTDOM\\user1:ALLOWED/OI|CI|NI/D" <file_name>
 
+  setcifsacl -U -a "ACL:CIFSTESTDOM\\user1:AUDIT/SA/D" <file_name>
+
 Delete an ACE
 =============
 
   setcifsacl -D "ACL:S-1-1-0:0x1/OI/0x1201ff" <file_name>
 
+  setcifsacl -U -D "ACL:S-1-1-0:0x2/FA/0xf01ff" <file_name>
+
 Modify an ACE
 =============
 
   setcifsacl -M "ACL:CIFSTESTDOM\\user1:ALLOWED/0x1f/CHANGE" <file_name>
 
+  setcifsacl -U -M "ACL:CIFSTESTDOM\\user1:AUDIT_OBJECT/SA/CHANGE" <file_name>
+
 Set an ACL
 ==========
 
   setcifsacl -S "ACL:CIFSTESTDOM\\Administrator:0x0/0x0/FULL,ACL:CIFSTESTDOM\\user2:0x0/0x0/FULL" <file_name>
 
+  setcifsacl -U -S "ACL:CIFSTESTDOM\\Administrator:AUDIT/SA/FULL,ACL:CIFSTESTDOM\\user2:0x7/0x80/FULL" <file_name>
+
 Set owner SID
 =============
 
-- 
2.23.3


