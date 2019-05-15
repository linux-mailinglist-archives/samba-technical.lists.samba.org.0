Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65921FCC9
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 01:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=FBs2aKvn6nBiWx1BXfHDbu2pIbM4RWM4jtIArN+hDpM=; b=x5yklqQbRhAaYgIC+JIkAaFLc9
	Pa7rRJp2EfDPNS+fp1ZE0BDTeoY54g5jLMr9YvBvd1quIIlV/5sV5T2LpXLyB/b6+PwPJBT+r4lWb
	1O2IKoTu9nEgQ4HiO3I28i9U0bA0yR/dlENPuwIhDmKedGwWPr9O8XzDpSZV93OrY2VJiwpnH0J6o
	5q1CaAxFeb39/Ncv7mCehyP45kMyAo5x+eDWA++GxZynezXx+tLiF8l71hrkZzk78K4K7qlyC2QH4
	92jwHmIKzbsk4l6l348CAtMLYnLMOe6F6/NxlbNmbkXv600ehC/HqZ/NCdDtIvmQQX+VNA1fDYdoL
	QQhlZ20g==;
Received: from localhost ([::1]:41410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hR3M2-003tC4-NC; Wed, 15 May 2019 23:30:34 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:44094) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hR3Lv-003tBx-7s
 for samba-technical@lists.samba.org; Wed, 15 May 2019 23:30:32 +0000
Received: from [IPv6:2404:130:0:1000:a8df:9eac:5598:3f05] (unknown
 [IPv6:2404:130:0:1000:a8df:9eac:5598:3f05])
 (Authenticated sender: aaronhaslett@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id E17DE8138F
 for <samba-technical@lists.samba.org>; Thu, 16 May 2019 11:30:16 +1200 (NZST)
Subject: Re: [WIP] [PATCH] ldb: new on-disk pack format
To: samba-technical <samba-technical@lists.samba.org>
References: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
 <1556592935.25595.87.camel@samba.org>
Openpgp: preference=signencrypt
Message-ID: <6211748d-96b9-6775-2551-d4b4509433d7@catalyst.net.nz>
Date: Thu, 16 May 2019 11:29:17 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556592935.25595.87.camel@samba.org>
Content-Type: multipart/mixed; boundary="------------7BAAD38C51BED3163C6C72F3"
Content-Language: en-US
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
From: Aaron Haslett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Aaron Haslett <aaronhaslett@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------7BAAD38C51BED3163C6C72F3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patches setting the stage for this new pack format are in master at
ea7fd52..85b6f71 (6 patches).

This new version (attached) includes many fixes and code for repacking
databases at the appropriate versions.=C2=A0 We made the decision to keep=

GUID indexing and the new pack format linked, meaning a DN indexed
database will assumed to use packing format V1 (LDB will error if it
isn't), and a GUID indexed database will be assumed to use V2, and the
database will be repacked if it isn't.

MR: https://gitlab.com/samba-team/samba/merge_requests/450


On 30/04/19 2:55 PM, Andrew Bartlett wrote:
> On Tue, 2019-04-30 at 14:25 +1200, Aaron Haslett via samba-technical
> wrote:
>> Garming discovered poor performance when recursively calculating group=

>> membership for a user during LDAP bind.=C2=A0 This WIP patch attempts =
to fix
>> the problem by separating values from the rest of the data in our LDB
>> pack format.=C2=A0 This should dramatically reduce the amount of data =
loaded
>> into cache while unpacking with flag LDB_UNPACK_DATA_FLAG_NO_DATA_ALLO=
C.
>>
>> Correctness testing is included and a CI run is here:
>>
>> https://gitlab.com/samba-team/devel/samba/pipelines/59051539
>>
>> To be done:
>>
>>   * Performance testing
>>   * Research into OpenLDAP's pack format and possible modifications to=

>>     ours based on theirs
> I've looked at the OpenLDAP code (mdb_entry_encode()), and the big
> difference is not in the implementation but in the ability to follow
> the code.  Both need more inline comments, but the OL code also avoids
> whitespace (ouch).
>
> Things this code does that OL doesn't do are pack the offsets at
> smaller than 'unsigned int' size.
>
> It looks like OpenLDAP avoids the issue being worked on here (large
> multi-valued attributes needing to be loaded and discarded) by putting
> them in different DB keys with SLAP_ATTR_BIG_MULTI, but it also puts
> the data at the end of the buffer.
>
> So from a 'is there something major we are missing' point of view, I
> think what we are doing is reasonable.
>
> Finally, for a future investigation, I think we should remove the
> 'talloc individual pointers' behaviour entirely, and leave that to the
> 'filter' layer in ldb_key_value (which copies the whole entry).=20
>
> I hope this helps answer these questions,
>
> Andrew Bartlett
>

--------------7BAAD38C51BED3163C6C72F3
Content-Type: text/x-patch;
 name="packing_format_v2.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="packing_format_v2.patch"

=46rom dc036b9e4e760793eb79bae2c9c2cc6a384a63d5 Mon Sep 17 00:00:00 2001
From: Aaron Haslett <aaronhaslett@catalyst.net.nz>
Date: Fri, 10 May 2019 18:10:51 +1200
Subject: [PATCH 1/5] ldb: baseinfo pack format check on init

We will be adding a new packing format in forthcoming commits and there
may be more versions in the future. We need to make sure the database
contains records in a format we know how to read and write.
Done by fetching the @BASEINFO record and reading the first 4
bytes which contain the packing format version.

NOTE: Configure with --abi-check-disable to build this commit. This
patch is part of a set of LDB ABI changes, and the version update is
done on the last commit.

Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
---
 lib/ldb/common/ldb_pack.c            | 23 ++++++++++++++--------
 lib/ldb/include/ldb_module.h         |  9 +++++++++
 lib/ldb/ldb_key_value/ldb_kv.c       |  2 ++
 lib/ldb/ldb_key_value/ldb_kv.h       |  1 +
 lib/ldb/ldb_key_value/ldb_kv_cache.c | 37 ++++++++++++++++++++++++++++++=
++++++
 5 files changed, 64 insertions(+), 8 deletions(-)

diff --git a/lib/ldb/common/ldb_pack.c b/lib/ldb/common/ldb_pack.c
index 5360a36..e59c542 100644
--- a/lib/ldb/common/ldb_pack.c
+++ b/lib/ldb/common/ldb_pack.c
@@ -33,12 +33,6 @@
=20
 #include "ldb_private.h"
=20
-/* change this if the data format ever changes */
-#define LDB_PACKING_FORMAT 0x26011967
-
-/* old packing formats */
-#define LDB_PACKING_FORMAT_NODN 0x26011966
-
 /* use a portable integer format */
 static void put_uint32(uint8_t *p, int ofs, unsigned int val)
 {
@@ -195,7 +189,7 @@ int ldb_unpack_data_flags(struct ldb_context *ldb,
 	size_t remaining;
 	size_t dn_len;
 	unsigned int i, j;
-	unsigned format;
+	uint32_t format;
 	unsigned int nelem =3D 0;
 	size_t len;
 	struct ldb_val *ldb_val_single_array =3D NULL;
@@ -208,7 +202,10 @@ int ldb_unpack_data_flags(struct ldb_context *ldb,
 		goto failed;
 	}
=20
-	format =3D pull_uint32(p, 0);
+	if (ldb_unpack_get_format(data, &format) !=3D LDB_SUCCESS) {
+		errno =3D EIO;
+		goto failed;
+	}
 	message->num_elements =3D pull_uint32(p, 4);
 	p +=3D 8;
=20
@@ -402,6 +399,16 @@ failed:
 	return -1;
 }
=20
+int ldb_unpack_get_format(const struct ldb_val *data,
+			  uint32_t *pack_format_version)
+{
+	if (data->length < 4) {
+		return LDB_ERR_OPERATIONS_ERROR;
+	}
+	*pack_format_version =3D pull_uint32(data->data, 0);
+	return LDB_SUCCESS;
+}
+
 /*
  * Unpack a ldb message from a linear buffer in ldb_val
  *
diff --git a/lib/ldb/include/ldb_module.h b/lib/ldb/include/ldb_module.h
index 759a54a..d9114e9 100644
--- a/lib/ldb/include/ldb_module.h
+++ b/lib/ldb/include/ldb_module.h
@@ -544,12 +544,21 @@ int ldb_unpack_data_flags(struct ldb_context *ldb,
 			  struct ldb_message *message,
 			  unsigned int flags);
=20
+int ldb_unpack_get_format(const struct ldb_val *data,
+			  uint32_t *pack_format_version);
+
 /* currently unused (was NO_DATA_ALLOC)      0x0001 */
 #define LDB_UNPACK_DATA_FLAG_NO_DN           0x0002
 #define LDB_UNPACK_DATA_FLAG_NO_VALUES_ALLOC 0x0004
 #define LDB_UNPACK_DATA_FLAG_NO_ATTRS        0x0008
 #define LDB_UNPACK_DATA_FLAG_READ_LOCKED     0x0010
=20
+/* In-use packing formats */
+#define LDB_PACKING_FORMAT 0x26011967
+
+/* Old packing formats */
+#define LDB_PACKING_FORMAT_NODN 0x26011966
+
 /**
  Forces a specific ldb handle to use the global event context.
=20
diff --git a/lib/ldb/ldb_key_value/ldb_kv.c b/lib/ldb/ldb_key_value/ldb_k=
v.c
index 53c326d..81a77462 100644
--- a/lib/ldb/ldb_key_value/ldb_kv.c
+++ b/lib/ldb/ldb_key_value/ldb_kv.c
@@ -1894,6 +1894,8 @@ int ldb_kv_init_store(struct ldb_kv_private *ldb_kv=
,
=20
 	ldb_kv->sequence_number =3D 0;
=20
+	ldb_kv->pack_format_version =3D LDB_PACKING_FORMAT;
+
 	ldb_kv->pid =3D getpid();
=20
 	ldb_kv->module =3D ldb_module_new(ldb, ldb, name, &ldb_kv_ops);
diff --git a/lib/ldb/ldb_key_value/ldb_kv.h b/lib/ldb/ldb_key_value/ldb_k=
v.h
index 97bdcf0..c9e5532 100644
--- a/lib/ldb/ldb_key_value/ldb_kv.h
+++ b/lib/ldb/ldb_key_value/ldb_kv.h
@@ -63,6 +63,7 @@ struct ldb_kv_private {
 	unsigned int connect_flags;
=20
 	unsigned long long sequence_number;
+	uint32_t pack_format_version;
=20
 	/* the low level tdb seqnum - used to avoid loading BASEINFO when
 	   possible */
diff --git a/lib/ldb/ldb_key_value/ldb_kv_cache.c b/lib/ldb/ldb_key_value=
/ldb_kv_cache.c
index b14697c..c5f6611 100644
--- a/lib/ldb/ldb_key_value/ldb_kv_cache.c
+++ b/lib/ldb/ldb_key_value/ldb_kv_cache.c
@@ -395,6 +395,13 @@ int ldb_kv_cache_reload(struct ldb_module *module)
 	ldb_kv_cache_free(module);
 	return ldb_kv_cache_load(module);
 }
+static int get_pack_format_version(struct ldb_val key,
+				   struct ldb_val data,
+				   void *private_data)
+{
+	uint32_t *v =3D (uint32_t *) private_data;
+	return ldb_unpack_get_format(&data, v);
+}
=20
 /*
   load the cache records
@@ -411,6 +418,8 @@ int ldb_kv_cache_load(struct ldb_module *module)
 	const struct ldb_schema_attribute *a;
 	bool have_write_txn =3D false;
 	int r;
+	uint32_t pack_format_version;
+	struct ldb_val key;
=20
 	ldb =3D ldb_module_get_ctx(module);
=20
@@ -435,6 +444,34 @@ int ldb_kv_cache_load(struct ldb_module *module)
 	if (r !=3D LDB_SUCCESS) {
 		goto failed;
 	}
+
+	key =3D ldb_kv_key_dn(module, baseinfo, baseinfo_dn);
+	if (!key.data) {
+		goto failed_and_unlock;
+	}
+
+	/* Read packing format from first 4 bytes of @BASEINFO record */
+	r =3D ldb_kv->kv_ops->fetch_and_parse(ldb_kv, key,
+					    get_pack_format_version,
+					    &pack_format_version);
+
+	if (r !=3D LDB_ERR_NO_SUCH_OBJECT) {
+		if (r !=3D LDB_SUCCESS) {
+			goto failed_and_unlock;
+		}
+
+		/* Make sure the database has the right format */
+		if (pack_format_version !=3D ldb_kv->pack_format_version) {
+			ldb_debug(ldb, LDB_DEBUG_ERROR,
+				  "Unexpected packing format. "
+				  "Expected: %#010x, Got: %#010x",
+				  pack_format_version,
+				  ldb_kv->pack_format_version);
+			goto failed_and_unlock;
+		}
+	}
+
+	/* Now fetch the whole @BASEINFO record */
 	r =3D ldb_kv_search_dn1(module, baseinfo_dn, baseinfo, 0);
 	if (r !=3D LDB_SUCCESS && r !=3D LDB_ERR_NO_SUCH_OBJECT) {
 		goto failed_and_unlock;
--=20
2.7.4


=46rom 31f7f199361dfb0a36d76a4c41b557d2e3a99355 Mon Sep 17 00:00:00 2001
From: Aaron Haslett <aaronhaslett@catalyst.net.nz>
Date: Wed, 1 May 2019 13:36:36 +1200
Subject: [PATCH 2/5] ldb: unpack function for new pack format

Unpack function for new pack format with values separated from other
data so that while unpacking, the value section (which is probably large)=

doesn't have to be loaded into cache/memory.
Additionally, width of length field can now vary per-element to save spac=
e.
The old unpack routine is still present and is called if the old pack
format version number is found.
LDB torture suite is modified to run relevant tests on both old and new
pack format.

NOTE: Configure with --abi-check-disable to build this commit. This
patch is part of a set of LDB ABI changes, and the version update is
done on the last commit.

Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
---
 lib/ldb/common/ldb_pack.c    | 290 +++++++++++++++++++++++++++++++++++++=
+++---
 lib/ldb/include/ldb_module.h |   1 +
 source4/torture/ldb/ldb.c    | 212 ++++++++++++++++++++++++++++---
 3 files changed, 468 insertions(+), 35 deletions(-)

diff --git a/lib/ldb/common/ldb_pack.c b/lib/ldb/common/ldb_pack.c
index e59c542..03e14b1 100644
--- a/lib/ldb/common/ldb_pack.c
+++ b/lib/ldb/common/ldb_pack.c
@@ -43,6 +43,12 @@ static void put_uint32(uint8_t *p, int ofs, unsigned i=
nt val)
 	p[3] =3D (val>>24) & 0xFF;
 }
=20
+static unsigned int pull_uint16(uint8_t *p, int ofs)
+{
+	p +=3D ofs;
+	return p[0] | (p[1]<<8);
+}
+
 static unsigned int pull_uint32(uint8_t *p, int ofs)
 {
 	p +=3D ofs;
@@ -176,20 +182,17 @@ int ldb_pack_data(struct ldb_context *ldb,
=20
 /*
  * Unpack a ldb message from a linear buffer in ldb_val
- *
- * Providing a list of attributes to this function allows selective unpa=
cking.
- * Giving a NULL list (or a list_size of 0) unpacks all the attributes.
  */
-int ldb_unpack_data_flags(struct ldb_context *ldb,
-			  const struct ldb_val *data,
-			  struct ldb_message *message,
-			  unsigned int flags)
+static int ldb_unpack_data_flags_v1(struct ldb_context *ldb,
+				    const struct ldb_val *data,
+				    struct ldb_message *message,
+				    unsigned int flags,
+				    unsigned format)
 {
 	uint8_t *p;
 	size_t remaining;
 	size_t dn_len;
 	unsigned int i, j;
-	uint32_t format;
 	unsigned int nelem =3D 0;
 	size_t len;
 	struct ldb_val *ldb_val_single_array =3D NULL;
@@ -197,17 +200,11 @@ int ldb_unpack_data_flags(struct ldb_context *ldb,
 	message->elements =3D NULL;
=20
 	p =3D data->data;
-	if (data->length < 8) {
-		errno =3D EIO;
-		goto failed;
-	}
=20
-	if (ldb_unpack_get_format(data, &format) !=3D LDB_SUCCESS) {
-		errno =3D EIO;
-		goto failed;
-	}
-	message->num_elements =3D pull_uint32(p, 4);
-	p +=3D 8;
+	/* Skip first 4 bytes, format already read */
+	p +=3D 4;
+	message->num_elements =3D pull_uint32(p, 0);
+	p +=3D 4;
=20
 	remaining =3D data->length - 8;
=20
@@ -399,6 +396,239 @@ failed:
 	return -1;
 }
=20
+/*
+ * Unpack a ldb message from a linear buffer in ldb_val
+ */
+static int ldb_unpack_data_flags_v2(struct ldb_context *ldb,
+				    const struct ldb_val *data,
+				    struct ldb_message *message,
+				    unsigned int flags)
+{
+	uint8_t *p, *q, *end_p;
+	unsigned int i, j;
+	unsigned int nelem =3D 0;
+	size_t len;
+	struct ldb_val *ldb_val_single_array =3D NULL;
+	uint8_t val_len_width;
+
+	message->elements =3D NULL;
+
+	p =3D data->data;
+	end_p =3D p + data->length;
+
+	/* Skip first 4 bytes, format already read */
+	p +=3D 4;
+	if (p + 8 > end_p) {
+		errno =3D EIO;
+		goto failed;
+	}
+
+	message->num_elements =3D pull_uint32(p, 0);
+	p +=3D 4;
+
+	len =3D pull_uint32(p, 0);
+	p +=3D 4;
+
+	if (p + len + 1 > end_p) {
+		errno =3D EIO;
+		goto failed;
+	}
+
+	if (flags & LDB_UNPACK_DATA_FLAG_NO_DN) {
+		message->dn =3D NULL;
+	} else {
+		struct ldb_val blob;
+		blob.data =3D discard_const_p(uint8_t, p);
+		blob.length =3D len;
+		message->dn =3D ldb_dn_from_ldb_val(message, ldb, &blob);
+		if (message->dn =3D=3D NULL) {
+			errno =3D ENOMEM;
+			goto failed;
+		}
+	}
+
+	p +=3D len + 1;
+
+	/* Now skip the canonicalized DN and its length */
+	len =3D pull_uint32(p, 0) + 1;
+	p +=3D 4;
+
+	if (p + len > end_p) {
+		errno =3D EIO;
+		goto failed;
+	}
+
+	p +=3D len;
+
+	if (*(p-1) !=3D '\0') {
+		errno =3D EINVAL;
+		goto failed;
+	}
+
+	if (flags & LDB_UNPACK_DATA_FLAG_NO_ATTRS) {
+		return 0;
+	}
+
+	if (message->num_elements =3D=3D 0) {
+		return 0;
+	}
+
+	/*
+	 * Sanity check (17 bytes is the minimum element size)
+	 */
+	if (message->num_elements > (end_p - p) / 17) {
+		errno =3D EIO;
+		goto failed;
+	}
+
+	message->elements =3D talloc_zero_array(message, struct ldb_message_ele=
ment,
+					      message->num_elements);
+	if (!message->elements) {
+		errno =3D ENOMEM;
+		goto failed;
+	}
+
+	/*
+	 * In typical use, most values are single-valued.  This makes
+	 * it quite expensive to allocate an array of ldb_val for each
+	 * of these, just to then hold the pointer to the data buffer.
+	 * So with LDB_UNPACK_DATA_FLAG_NO_VALUES_ALLOC we allocate this
+	 * ahead of time and use it for the single values where possible.
+	 * (This is used the the normal search case, but not in the
+	 * index case because of caller requirements).
+	 */
+	if (flags & LDB_UNPACK_DATA_FLAG_NO_VALUES_ALLOC) {
+		ldb_val_single_array =3D talloc_array(message->elements, struct ldb_va=
l,
+						    message->num_elements);
+		if (ldb_val_single_array =3D=3D NULL) {
+			errno =3D ENOMEM;
+			goto failed;
+		}
+	}
+
+	q =3D p + pull_uint32(p, 0);
+	p +=3D 4;
+
+	for (i=3D0;i<message->num_elements;i++) {
+		const char *attr =3D NULL;
+		size_t attr_len;
+		struct ldb_message_element *element =3D NULL;
+
+		if (p + 12 > q) {
+			errno =3D EIO;
+			goto failed;
+		}
+
+		attr_len =3D pull_uint32(p, 0);
+		p +=3D 4;
+
+		if (attr_len =3D=3D 0) {
+			errno =3D EIO;
+			goto failed;
+		}
+		attr =3D (char *)p;
+
+		p +=3D attr_len + 1;
+		if (p + 5 > q) { /* 5 =3D num_values, val_len_width */
+			errno =3D EIO;
+			goto failed;
+		}
+
+		if (*(p-1) !=3D '\0') {
+			errno =3D EINVAL;
+			goto failed;
+		}
+
+		element =3D &message->elements[nelem];
+		element->name =3D attr;
+		element->flags =3D 0;
+
+		element->num_values =3D pull_uint32(p, 0);
+		element->values =3D NULL;
+		if ((flags & LDB_UNPACK_DATA_FLAG_NO_VALUES_ALLOC) && element->num_val=
ues =3D=3D 1) {
+			element->values =3D &ldb_val_single_array[nelem];
+		} else if (element->num_values !=3D 0) {
+			element->values =3D talloc_array(message->elements,
+						       struct ldb_val,
+						       element->num_values);
+			if (!element->values) {
+				errno =3D ENOMEM;
+				goto failed;
+			}
+		}
+		p +=3D 4;
+		val_len_width =3D *p;
+		p +=3D 1;
+
+		if (p + val_len_width * element->num_values > q) {
+			errno =3D EIO;
+			goto failed;
+		}
+
+		/* This is structured weird for compiler opt purposes */
+		if (val_len_width =3D=3D 1) {
+			for (j =3D 0; j < element->num_values; j++) {
+				element->values[j].length =3D *p;
+				p +=3D val_len_width;
+			}
+		} else if (val_len_width =3D=3D 2) {
+			for (j =3D 0; j < element->num_values; j++) {
+				element->values[j].length =3D pull_uint16(p, 0);
+				p +=3D val_len_width;
+			}
+		} else if (val_len_width =3D=3D 4) {
+			for (j =3D 0; j < element->num_values; j++) {
+				element->values[j].length =3D pull_uint32(p, 0);
+				p +=3D val_len_width;
+			}
+		} else {
+			errno =3D ERANGE;
+			goto failed;
+		}
+
+		for (j =3D 0; j < element->num_values; j++) {
+			len =3D element->values[j].length;
+			if (len + 1 < len) {
+				errno =3D EIO;
+				goto failed;
+			}
+			if (q + len + 1 > end_p) {
+				errno =3D EIO;
+				goto failed;
+			}
+
+			element->values[j].data =3D q;
+			q +=3D len + 1;
+		}
+		nelem++;
+	}
+	/*
+	 * Adapt the number of elements to the real number of unpacked elements=
,
+	 * it means that we overallocated elements array.
+	 */
+	message->num_elements =3D nelem;
+
+	/*
+	 * Shrink the allocated size.  On current talloc behaviour
+	 * this will help if we skipped 32 or more attributes.
+	 */
+	message->elements =3D talloc_realloc(message, message->elements,
+					   struct ldb_message_element,
+					   message->num_elements);
+
+	if (q !=3D end_p) {
+		ldb_debug(ldb, LDB_DEBUG_ERROR,
+			  "Error: %zu bytes unread in ldb_unpack_data_flags",
+			  end_p - q);
+	}
+
+	return 0;
+
+failed:
+	talloc_free(message->elements);
+	return -1;
+}
+
 int ldb_unpack_get_format(const struct ldb_val *data,
 			  uint32_t *pack_format_version)
 {
@@ -411,6 +641,30 @@ int ldb_unpack_get_format(const struct ldb_val *data=
,
=20
 /*
  * Unpack a ldb message from a linear buffer in ldb_val
+ */
+int ldb_unpack_data_flags(struct ldb_context *ldb,
+			  const struct ldb_val *data,
+			  struct ldb_message *message,
+			  unsigned int flags)
+{
+	unsigned format;
+
+	if (data->length < 8) {
+		errno =3D EIO;
+		return -1;
+	}
+
+	format =3D pull_uint32(data->data, 0);
+	if (format =3D=3D LDB_PACKING_FORMAT_V2) {
+		return ldb_unpack_data_flags_v2(ldb, data, message, flags);
+	}
+
+	return ldb_unpack_data_flags_v1(ldb, data, message, flags, format);
+}
+
+
+/*
+ * Unpack a ldb message from a linear buffer in ldb_val
  *
  * Free with ldb_unpack_data_free()
  */
diff --git a/lib/ldb/include/ldb_module.h b/lib/ldb/include/ldb_module.h
index d9114e9..db80b28 100644
--- a/lib/ldb/include/ldb_module.h
+++ b/lib/ldb/include/ldb_module.h
@@ -555,6 +555,7 @@ int ldb_unpack_get_format(const struct ldb_val *data,=

=20
 /* In-use packing formats */
 #define LDB_PACKING_FORMAT 0x26011967
+#define LDB_PACKING_FORMAT_V2 0x26011968
=20
 /* Old packing formats */
 #define LDB_PACKING_FORMAT_NODN 0x26011966
diff --git a/source4/torture/ldb/ldb.c b/source4/torture/ldb/ldb.c
index bc3d0ac..5bd58dc 100644
--- a/source4/torture/ldb/ldb.c
+++ b/source4/torture/ldb/ldb.c
@@ -49,7 +49,7 @@ static const char *prefix_map_semi =3D "2:1.2.840.11355=
6.1.2;5:2.16.840.1.101.2.2.
  *   -- adrianc
  */
=20
-static const uint8_t dda1d01d_bin[] =3D {
+static const uint8_t dda1d01d_bin_v1[] =3D {
 	0x67, 0x19, 0x01, 0x26, 0x0d, 0x00, 0x00, 0x00, 0x43, 0x4e, 0x3d, 0x64,=
 0x64, 0x61, 0x31, 0x64,
 	0x30, 0x31, 0x64, 0x2d, 0x34, 0x62, 0x64, 0x37, 0x2d, 0x34, 0x63, 0x34,=
 0x39, 0x2d, 0x61, 0x31,
 	0x38, 0x34, 0x2d, 0x34, 0x36, 0x66, 0x39, 0x32, 0x34, 0x31, 0x62, 0x35,=
 0x36, 0x30, 0x65, 0x2c,
@@ -202,6 +202,167 @@ static const uint8_t dda1d01d_bin[] =3D {
 	0x00
 };
=20
+static const uint8_t dda1d01d_bin_v2[] =3D {
+	0x68, 0x19, 0x01, 0x26, 0x0d, 0x00, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00,=
 0x43, 0x4e, 0x3d, 0x64,
+	0x64, 0x61, 0x31, 0x64, 0x30, 0x31, 0x64, 0x2d, 0x34, 0x62, 0x64, 0x37,=
 0x2d, 0x34, 0x63, 0x34,
+	0x39, 0x2d, 0x61, 0x31, 0x38, 0x34, 0x2d, 0x34, 0x36, 0x66, 0x39, 0x32,=
 0x34, 0x31, 0x62, 0x35,
+	0x36, 0x30, 0x65, 0x2c, 0x43, 0x4e, 0x3d, 0x4f, 0x70, 0x65, 0x72, 0x61,=
 0x74, 0x69, 0x6f, 0x6e,
+	0x73, 0x2c, 0x43, 0x4e, 0x3d, 0x44, 0x6f, 0x6d, 0x61, 0x69, 0x6e, 0x55,=
 0x70, 0x64, 0x61, 0x74,
+	0x65, 0x73, 0x2c, 0x43, 0x4e, 0x3d, 0x53, 0x79, 0x73, 0x74, 0x65, 0x6d,=
 0x2c, 0x44, 0x43, 0x3d,
+	0x61, 0x64, 0x64, 0x63, 0x2c, 0x44, 0x43, 0x3d, 0x73, 0x61, 0x6d, 0x62,=
 0x61, 0x2c, 0x44, 0x43,
+	0x3d, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2c, 0x44, 0x43, 0x3d,=
 0x63, 0x6f, 0x6d, 0x00,
+	0x5b, 0x00, 0x00, 0x00, 0x61, 0x64, 0x64, 0x63, 0x2e, 0x73, 0x61, 0x6d,=
 0x62, 0x61, 0x2e, 0x65,
+	0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x53,=
 0x79, 0x73, 0x74, 0x65,
+	0x6d, 0x2f, 0x44, 0x6f, 0x6d, 0x61, 0x69, 0x6e, 0x55, 0x70, 0x64, 0x61,=
 0x74, 0x65, 0x73, 0x2f,
+	0x4f, 0x70, 0x65, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2f, 0x64,=
 0x64, 0x61, 0x31, 0x64,
+	0x30, 0x31, 0x64, 0x2d, 0x34, 0x62, 0x64, 0x37, 0x2d, 0x34, 0x63, 0x34,=
 0x39, 0x2d, 0x61, 0x31,
+	0x38, 0x34, 0x2d, 0x34, 0x36, 0x66, 0x39, 0x32, 0x34, 0x31, 0x62, 0x35,=
 0x36, 0x30, 0x65, 0x00,
+	0x33, 0x01, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x6f, 0x62, 0x6a, 0x65,=
 0x63, 0x74, 0x43, 0x6c,
+	0x61, 0x73, 0x73, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x03, 0x09, 0x02,=
 0x00, 0x00, 0x00, 0x63,
+	0x6e, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x24, 0x0c, 0x00, 0x00, 0x00,=
 0x69, 0x6e, 0x73, 0x74,
+	0x61, 0x6e, 0x63, 0x65, 0x54, 0x79, 0x70, 0x65, 0x00, 0x01, 0x00, 0x00,=
 0x00, 0x01, 0x01, 0x0b,
+	0x00, 0x00, 0x00, 0x77, 0x68, 0x65, 0x6e, 0x43, 0x72, 0x65, 0x61, 0x74,=
 0x65, 0x64, 0x00, 0x01,
+	0x00, 0x00, 0x00, 0x01, 0x11, 0x0b, 0x00, 0x00, 0x00, 0x77, 0x68, 0x65,=
 0x6e, 0x43, 0x68, 0x61,
+	0x6e, 0x67, 0x65, 0x64, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x11, 0x0a,=
 0x00, 0x00, 0x00, 0x75,
+	0x53, 0x4e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x64, 0x00, 0x01, 0x00,=
 0x00, 0x00, 0x01, 0x04,
+	0x0a, 0x00, 0x00, 0x00, 0x75, 0x53, 0x4e, 0x43, 0x68, 0x61, 0x6e, 0x67,=
 0x65, 0x64, 0x00, 0x01,
+	0x00, 0x00, 0x00, 0x01, 0x04, 0x16, 0x00, 0x00, 0x00, 0x73, 0x68, 0x6f,=
 0x77, 0x49, 0x6e, 0x41,
+	0x64, 0x76, 0x61, 0x6e, 0x63, 0x65, 0x64, 0x56, 0x69, 0x65, 0x77, 0x4f,=
 0x6e, 0x6c, 0x79, 0x00,
+	0x01, 0x00, 0x00, 0x00, 0x01, 0x04, 0x14, 0x00, 0x00, 0x00, 0x6e, 0x54,=
 0x53, 0x65, 0x63, 0x75,
+	0x72, 0x69, 0x74, 0x79, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74,=
 0x6f, 0x72, 0x00, 0x01,
+	0x00, 0x00, 0x00, 0x02, 0x18, 0x05, 0x04, 0x00, 0x00, 0x00, 0x6e, 0x61,=
 0x6d, 0x65, 0x00, 0x01,
+	0x00, 0x00, 0x00, 0x01, 0x24, 0x0a, 0x00, 0x00, 0x00, 0x6f, 0x62, 0x6a,=
 0x65, 0x63, 0x74, 0x47,
+	0x55, 0x49, 0x44, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x10, 0x14, 0x00,=
 0x00, 0x00, 0x72, 0x65,
+	0x70, 0x6c, 0x50, 0x72, 0x6f, 0x70, 0x65, 0x72, 0x74, 0x79, 0x4d, 0x65,=
 0x74, 0x61, 0x44, 0x61,
+	0x74, 0x61, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x90, 0x01, 0x0e, 0x00,=
 0x00, 0x00, 0x6f, 0x62,
+	0x6a, 0x65, 0x63, 0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79,=
 0x00, 0x01, 0x00, 0x00,
+	0x00, 0x01, 0x76, 0x74, 0x6f, 0x70, 0x00, 0x63, 0x6f, 0x6e, 0x74, 0x61,=
 0x69, 0x6e, 0x65, 0x72,
+	0x00, 0x64, 0x64, 0x61, 0x31, 0x64, 0x30, 0x31, 0x64, 0x2d, 0x34, 0x62,=
 0x64, 0x37, 0x2d, 0x34,
+	0x63, 0x34, 0x39, 0x2d, 0x61, 0x31, 0x38, 0x34, 0x2d, 0x34, 0x36, 0x66,=
 0x39, 0x32, 0x34, 0x31,
+	0x62, 0x35, 0x36, 0x30, 0x65, 0x00, 0x34, 0x00, 0x32, 0x30, 0x31, 0x35,=
 0x30, 0x37, 0x30, 0x38,
+	0x32, 0x32, 0x34, 0x33, 0x31, 0x30, 0x2e, 0x30, 0x5a, 0x00, 0x32, 0x30,=
 0x31, 0x35, 0x30, 0x37,
+	0x30, 0x38, 0x32, 0x32, 0x34, 0x33, 0x31, 0x30, 0x2e, 0x30, 0x5a, 0x00,=
 0x33, 0x34, 0x36, 0x37,
+	0x00, 0x33, 0x34, 0x36, 0x37, 0x00, 0x54, 0x52, 0x55, 0x45, 0x00, 0x01,=
 0x00, 0x14, 0x8c, 0x14,
+	0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x4c, 0x00, 0x00, 0x00, 0xc4,=
 0x00, 0x00, 0x00, 0x01,
+	0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x15, 0x00, 0x00, 0x00, 0x9a,=
 0xbd, 0x91, 0x7d, 0xd5,
+	0xe0, 0x11, 0x3c, 0x6e, 0x5e, 0x1a, 0x4b, 0x00, 0x02, 0x00, 0x00, 0x01,=
 0x05, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x05, 0x15, 0x00, 0x00, 0x00, 0x9a, 0xbd, 0x91, 0x7d, 0xd5,=
 0xe0, 0x11, 0x3c, 0x6e,
+	0x5e, 0x1a, 0x4b, 0x00, 0x02, 0x00, 0x00, 0x04, 0x00, 0x78, 0x00, 0x02,=
 0x00, 0x00, 0x00, 0x07,
+	0x5a, 0x38, 0x00, 0x20, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xbe,=
 0x3b, 0x0e, 0xf3, 0xf0,
+	0x9f, 0xd1, 0x11, 0xb6, 0x03, 0x00, 0x00, 0xf8, 0x03, 0x67, 0xc1, 0xa5,=
 0x7a, 0x96, 0xbf, 0xe6,
+	0x0d, 0xd0, 0x11, 0xa2, 0x85, 0x00, 0xaa, 0x00, 0x30, 0x49, 0xe2, 0x01,=
 0x01, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x07, 0x5a, 0x38, 0x00, 0x20,=
 0x00, 0x00, 0x00, 0x03,
+	0x00, 0x00, 0x00, 0xbf, 0x3b, 0x0e, 0xf3, 0xf0, 0x9f, 0xd1, 0x11, 0xb6,=
 0x03, 0x00, 0x00, 0xf8,
+	0x03, 0x67, 0xc1, 0xa5, 0x7a, 0x96, 0xbf, 0xe6, 0x0d, 0xd0, 0x11, 0xa2,=
 0x85, 0x00, 0xaa, 0x00,
+	0x30, 0x49, 0xe2, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,=
 0x00, 0x00, 0x00, 0x04,
+	0x00, 0x54, 0x04, 0x17, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0xff,=
 0x01, 0x0f, 0x00, 0x01,
+	0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x15, 0x00, 0x00, 0x00, 0x9a,=
 0xbd, 0x91, 0x7d, 0xd5,
+	0xe0, 0x11, 0x3c, 0x6e, 0x5e, 0x1a, 0x4b, 0x00, 0x02, 0x00, 0x00, 0x00,=
 0x00, 0x14, 0x00, 0xff,
+	0x01, 0x0f, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x12,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x14, 0x00, 0x94, 0x00, 0x02, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x05, 0x0b,
+	0x00, 0x00, 0x00, 0x05, 0x1a, 0x3c, 0x00, 0x10, 0x00, 0x00, 0x00, 0x03,=
 0x00, 0x00, 0x00, 0x00,
+	0x42, 0x16, 0x4c, 0xc0, 0x20, 0xd0, 0x11, 0xa7, 0x68, 0x00, 0xaa, 0x00,=
 0x6e, 0x05, 0x29, 0x14,
+	0xcc, 0x28, 0x48, 0x37, 0x14, 0xbc, 0x45, 0x9b, 0x07, 0xad, 0x6f, 0x01,=
 0x5e, 0x5f, 0x28, 0x01,
+	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x00, 0x2a,=
 0x02, 0x00, 0x00, 0x05,
+	0x1a, 0x3c, 0x00, 0x10, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,=
 0x42, 0x16, 0x4c, 0xc0,
+	0x20, 0xd0, 0x11, 0xa7, 0x68, 0x00, 0xaa, 0x00, 0x6e, 0x05, 0x29, 0xba,=
 0x7a, 0x96, 0xbf, 0xe6,
+	0x0d, 0xd0, 0x11, 0xa2, 0x85, 0x00, 0xaa, 0x00, 0x30, 0x49, 0xe2, 0x01,=
 0x02, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x00, 0x2a, 0x02, 0x00, 0x00, 0x05,=
 0x1a, 0x3c, 0x00, 0x10,
+	0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x10, 0x20, 0x20, 0x5f, 0xa5,=
 0x79, 0xd0, 0x11, 0x90,
+	0x20, 0x00, 0xc0, 0x4f, 0xc2, 0xd4, 0xcf, 0x14, 0xcc, 0x28, 0x48, 0x37,=
 0x14, 0xbc, 0x45, 0x9b,
+	0x07, 0xad, 0x6f, 0x01, 0x5e, 0x5f, 0x28, 0x01, 0x02, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x05, 0x20,
+	0x00, 0x00, 0x00, 0x2a, 0x02, 0x00, 0x00, 0x05, 0x1a, 0x3c, 0x00, 0x10,=
 0x00, 0x00, 0x00, 0x03,
+	0x00, 0x00, 0x00, 0x10, 0x20, 0x20, 0x5f, 0xa5, 0x79, 0xd0, 0x11, 0x90,=
 0x20, 0x00, 0xc0, 0x4f,
+	0xc2, 0xd4, 0xcf, 0xba, 0x7a, 0x96, 0xbf, 0xe6, 0x0d, 0xd0, 0x11, 0xa2,=
 0x85, 0x00, 0xaa, 0x00,
+	0x30, 0x49, 0xe2, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x20,=
 0x00, 0x00, 0x00, 0x2a,
+	0x02, 0x00, 0x00, 0x05, 0x1a, 0x3c, 0x00, 0x10, 0x00, 0x00, 0x00, 0x03,=
 0x00, 0x00, 0x00, 0x40,
+	0xc2, 0x0a, 0xbc, 0xa9, 0x79, 0xd0, 0x11, 0x90, 0x20, 0x00, 0xc0, 0x4f,=
 0xc2, 0xd4, 0xcf, 0x14,
+	0xcc, 0x28, 0x48, 0x37, 0x14, 0xbc, 0x45, 0x9b, 0x07, 0xad, 0x6f, 0x01,=
 0x5e, 0x5f, 0x28, 0x01,
+	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x00, 0x2a,=
 0x02, 0x00, 0x00, 0x05,
+	0x1a, 0x3c, 0x00, 0x10, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x40,=
 0xc2, 0x0a, 0xbc, 0xa9,
+	0x79, 0xd0, 0x11, 0x90, 0x20, 0x00, 0xc0, 0x4f, 0xc2, 0xd4, 0xcf, 0xba,=
 0x7a, 0x96, 0xbf, 0xe6,
+	0x0d, 0xd0, 0x11, 0xa2, 0x85, 0x00, 0xaa, 0x00, 0x30, 0x49, 0xe2, 0x01,=
 0x02, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x00, 0x2a, 0x02, 0x00, 0x00, 0x05,=
 0x1a, 0x3c, 0x00, 0x10,
+	0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x42, 0x2f, 0xba, 0x59, 0xa2,=
 0x79, 0xd0, 0x11, 0x90,
+	0x20, 0x00, 0xc0, 0x4f, 0xc2, 0xd3, 0xcf, 0x14, 0xcc, 0x28, 0x48, 0x37,=
 0x14, 0xbc, 0x45, 0x9b,
+	0x07, 0xad, 0x6f, 0x01, 0x5e, 0x5f, 0x28, 0x01, 0x02, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x05, 0x20,
+	0x00, 0x00, 0x00, 0x2a, 0x02, 0x00, 0x00, 0x05, 0x1a, 0x3c, 0x00, 0x10,=
 0x00, 0x00, 0x00, 0x03,
+	0x00, 0x00, 0x00, 0x42, 0x2f, 0xba, 0x59, 0xa2, 0x79, 0xd0, 0x11, 0x90,=
 0x20, 0x00, 0xc0, 0x4f,
+	0xc2, 0xd3, 0xcf, 0xba, 0x7a, 0x96, 0xbf, 0xe6, 0x0d, 0xd0, 0x11, 0xa2,=
 0x85, 0x00, 0xaa, 0x00,
+	0x30, 0x49, 0xe2, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x20,=
 0x00, 0x00, 0x00, 0x2a,
+	0x02, 0x00, 0x00, 0x05, 0x1a, 0x3c, 0x00, 0x10, 0x00, 0x00, 0x00, 0x03,=
 0x00, 0x00, 0x00, 0xf8,
+	0x88, 0x70, 0x03, 0xe1, 0x0a, 0xd2, 0x11, 0xb4, 0x22, 0x00, 0xa0, 0xc9,=
 0x68, 0xf9, 0x39, 0x14,
+	0xcc, 0x28, 0x48, 0x37, 0x14, 0xbc, 0x45, 0x9b, 0x07, 0xad, 0x6f, 0x01,=
 0x5e, 0x5f, 0x28, 0x01,
+	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x00, 0x2a,=
 0x02, 0x00, 0x00, 0x05,
+	0x1a, 0x3c, 0x00, 0x10, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xf8,=
 0x88, 0x70, 0x03, 0xe1,
+	0x0a, 0xd2, 0x11, 0xb4, 0x22, 0x00, 0xa0, 0xc9, 0x68, 0xf9, 0x39, 0xba,=
 0x7a, 0x96, 0xbf, 0xe6,
+	0x0d, 0xd0, 0x11, 0xa2, 0x85, 0x00, 0xaa, 0x00, 0x30, 0x49, 0xe2, 0x01,=
 0x02, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x00, 0x2a, 0x02, 0x00, 0x00, 0x05,=
 0x1a, 0x38, 0x00, 0x10,
+	0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x6d, 0x9e, 0xc6, 0xb7, 0xc7,=
 0x2c, 0xd2, 0x11, 0x85,
+	0x4e, 0x00, 0xa0, 0xc9, 0x83, 0xf6, 0x08, 0x86, 0x7a, 0x96, 0xbf, 0xe6,=
 0x0d, 0xd0, 0x11, 0xa2,
+	0x85, 0x00, 0xaa, 0x00, 0x30, 0x49, 0xe2, 0x01, 0x01, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x05, 0x09,
+	0x00, 0x00, 0x00, 0x05, 0x1a, 0x38, 0x00, 0x10, 0x00, 0x00, 0x00, 0x03,=
 0x00, 0x00, 0x00, 0x6d,
+	0x9e, 0xc6, 0xb7, 0xc7, 0x2c, 0xd2, 0x11, 0x85, 0x4e, 0x00, 0xa0, 0xc9,=
 0x83, 0xf6, 0x08, 0x9c,
+	0x7a, 0x96, 0xbf, 0xe6, 0x0d, 0xd0, 0x11, 0xa2, 0x85, 0x00, 0xaa, 0x00,=
 0x30, 0x49, 0xe2, 0x01,
+	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x09, 0x00, 0x00, 0x00, 0x05,=
 0x1a, 0x38, 0x00, 0x10,
+	0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x6d, 0x9e, 0xc6, 0xb7, 0xc7,=
 0x2c, 0xd2, 0x11, 0x85,
+	0x4e, 0x00, 0xa0, 0xc9, 0x83, 0xf6, 0x08, 0xba, 0x7a, 0x96, 0xbf, 0xe6,=
 0x0d, 0xd0, 0x11, 0xa2,
+	0x85, 0x00, 0xaa, 0x00, 0x30, 0x49, 0xe2, 0x01, 0x01, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x05, 0x09,
+	0x00, 0x00, 0x00, 0x05, 0x1a, 0x2c, 0x00, 0x94, 0x00, 0x02, 0x00, 0x02,=
 0x00, 0x00, 0x00, 0x14,
+	0xcc, 0x28, 0x48, 0x37, 0x14, 0xbc, 0x45, 0x9b, 0x07, 0xad, 0x6f, 0x01,=
 0x5e, 0x5f, 0x28, 0x01,
+	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x00, 0x2a,=
 0x02, 0x00, 0x00, 0x05,
+	0x1a, 0x2c, 0x00, 0x94, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x9c,=
 0x7a, 0x96, 0xbf, 0xe6,
+	0x0d, 0xd0, 0x11, 0xa2, 0x85, 0x00, 0xaa, 0x00, 0x30, 0x49, 0xe2, 0x01,=
 0x02, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x00, 0x2a, 0x02, 0x00, 0x00, 0x05,=
 0x1a, 0x2c, 0x00, 0x94,
+	0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0xba, 0x7a, 0x96, 0xbf, 0xe6,=
 0x0d, 0xd0, 0x11, 0xa2,
+	0x85, 0x00, 0xaa, 0x00, 0x30, 0x49, 0xe2, 0x01, 0x02, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x05, 0x20,
+	0x00, 0x00, 0x00, 0x2a, 0x02, 0x00, 0x00, 0x05, 0x12, 0x28, 0x00, 0x30,=
 0x01, 0x00, 0x00, 0x01,
+	0x00, 0x00, 0x00, 0xde, 0x47, 0xe6, 0x91, 0x6f, 0xd9, 0x70, 0x4b, 0x95,=
 0x57, 0xd6, 0x3f, 0xf4,
+	0xf3, 0xcc, 0xd8, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0a,=
 0x00, 0x00, 0x00, 0x00,
+	0x12, 0x24, 0x00, 0xff, 0x01, 0x0f, 0x00, 0x01, 0x05, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x05, 0x15,
+	0x00, 0x00, 0x00, 0x9a, 0xbd, 0x91, 0x7d, 0xd5, 0xe0, 0x11, 0x3c, 0x6e,=
 0x5e, 0x1a, 0x4b, 0x07,
+	0x02, 0x00, 0x00, 0x00, 0x12, 0x18, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01,=
 0x02, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x05, 0x20, 0x00, 0x00, 0x00, 0x2a, 0x02, 0x00, 0x00, 0x00,=
 0x12, 0x18, 0x00, 0xbd,
+	0x01, 0x0f, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x20,=
 0x00, 0x00, 0x00, 0x20,
+	0x02, 0x00, 0x00, 0x00, 0x64, 0x64, 0x61, 0x31, 0x64, 0x30, 0x31, 0x64,=
 0x2d, 0x34, 0x62, 0x64,
+	0x37, 0x2d, 0x34, 0x63, 0x34, 0x39, 0x2d, 0x61, 0x31, 0x38, 0x34, 0x2d,=
 0x34, 0x36, 0x66, 0x39,
+	0x32, 0x34, 0x31, 0x62, 0x35, 0x36, 0x30, 0x65, 0x00, 0x57, 0x93, 0x1e,=
 0x29, 0x25, 0x49, 0xe5,
+	0x40, 0x9d, 0x98, 0x36, 0x07, 0x11, 0x9e, 0xbd, 0xe5, 0x00, 0x01, 0x00,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x7e, 0x38, 0xae, 0x0b, 0x03, 0x00, 0x00, 0x00, 0x9d, 0xcd,=
 0xcd, 0x57, 0xee, 0x58,
+	0x6e, 0x4e, 0x96, 0x99, 0xcc, 0x7d, 0xe1, 0x96, 0xf1, 0x05, 0x8b, 0x0d,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x8b, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,=
 0x02, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x7e, 0x38, 0xae, 0x0b, 0x03, 0x00, 0x00, 0x00, 0x9d, 0xcd,=
 0xcd, 0x57, 0xee, 0x58,
+	0x6e, 0x4e, 0x96, 0x99, 0xcc, 0x7d, 0xe1, 0x96, 0xf1, 0x05, 0x8b, 0x0d,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x8b, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,=
 0x02, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x7e, 0x38, 0xae, 0x0b, 0x03, 0x00, 0x00, 0x00, 0x9d, 0xcd,=
 0xcd, 0x57, 0xee, 0x58,
+	0x6e, 0x4e, 0x96, 0x99, 0xcc, 0x7d, 0xe1, 0x96, 0xf1, 0x05, 0x8b, 0x0d,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x8b, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa9, 0x00,=
 0x02, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x7e, 0x38, 0xae, 0x0b, 0x03, 0x00, 0x00, 0x00, 0x9d, 0xcd,=
 0xcd, 0x57, 0xee, 0x58,
+	0x6e, 0x4e, 0x96, 0x99, 0xcc, 0x7d, 0xe1, 0x96, 0xf1, 0x05, 0x8b, 0x0d,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x8b, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x01,=
 0x02, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x7e, 0x38, 0xae, 0x0b, 0x03, 0x00, 0x00, 0x00, 0x9d, 0xcd,=
 0xcd, 0x57, 0xee, 0x58,
+	0x6e, 0x4e, 0x96, 0x99, 0xcc, 0x7d, 0xe1, 0x96, 0xf1, 0x05, 0x8b, 0x0d,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x8b, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,=
 0x09, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x7e, 0x38, 0xae, 0x0b, 0x03, 0x00, 0x00, 0x00, 0x9d, 0xcd,=
 0xcd, 0x57, 0xee, 0x58,
+	0x6e, 0x4e, 0x96, 0x99, 0xcc, 0x7d, 0xe1, 0x96, 0xf1, 0x05, 0x8b, 0x0d,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x8b, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x03,=
 0x09, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x7e, 0x38, 0xae, 0x0b, 0x03, 0x00, 0x00, 0x00, 0x9d, 0xcd,=
 0xcd, 0x57, 0xee, 0x58,
+	0x6e, 0x4e, 0x96, 0x99, 0xcc, 0x7d, 0xe1, 0x96, 0xf1, 0x05, 0x8b, 0x0d,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x8b, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00,=
 0x00, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x7e, 0x38, 0xae, 0x0b, 0x03, 0x00, 0x00, 0x00, 0x9d, 0xcd,=
 0xcd, 0x57, 0xee, 0x58,
+	0x6e, 0x4e, 0x96, 0x99, 0xcc, 0x7d, 0xe1, 0x96, 0xf1, 0x05, 0x8b, 0x0d,=
 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x8b, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c,=
 0x47, 0x55, 0x49, 0x44,
+	0x3d, 0x35, 0x32, 0x34, 0x32, 0x39, 0x30, 0x33, 0x38, 0x2d, 0x65, 0x34,=
 0x33, 0x35, 0x2d, 0x34,
+	0x66, 0x65, 0x33, 0x2d, 0x39, 0x36, 0x34, 0x65, 0x2d, 0x38, 0x30, 0x64,=
 0x61, 0x31, 0x35, 0x34,
+	0x39, 0x39, 0x63, 0x39, 0x63, 0x3e, 0x3b, 0x43, 0x4e, 0x3d, 0x43, 0x6f,=
 0x6e, 0x74, 0x61, 0x69,
+	0x6e, 0x65, 0x72, 0x2c, 0x43, 0x4e, 0x3d, 0x53, 0x63, 0x68, 0x65, 0x6d,=
 0x61, 0x2c, 0x43, 0x4e,
+	0x3d, 0x43, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74, 0x69,=
 0x6f, 0x6e, 0x2c, 0x44,
+	0x43, 0x3d, 0x61, 0x64, 0x64, 0x63, 0x2c, 0x44, 0x43, 0x3d, 0x73, 0x61,=
 0x6d, 0x62, 0x61, 0x2c,
+	0x44, 0x43, 0x3d, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2c, 0x44,=
 0x43, 0x3d, 0x63, 0x6f,
+	0x6d, 0x00
+};
+
 static const char dda1d01d_ldif[] =3D ""
 "dn: CN=3Ddda1d01d-4bd7-4c49-a184-46f9241b560e,CN=3DOperations,CN=3DDoma=
inUpdates,CN=3DSystem,DC=3Daddc,DC=3Dsamba,DC=3Dexample,DC=3Dcom\n"
 "objectClass: top\n"
@@ -1076,11 +1237,12 @@ static bool helper_ldb_message_compare(struct tor=
ture_context *torture,
 	return true;
 }
=20
-static bool torture_ldb_unpack(struct torture_context *torture)
+static bool torture_ldb_unpack(struct torture_context *torture,
+			       const void *data_p)
 {
 	TALLOC_CTX *mem_ctx =3D talloc_new(torture);
 	struct ldb_context *ldb;
-	struct ldb_val data =3D data_blob_const(dda1d01d_bin, sizeof(dda1d01d_b=
in));
+	struct ldb_val data =3D *discard_const_p(struct ldb_val, data_p);
 	struct ldb_message *msg =3D ldb_msg_new(mem_ctx);
 	const char *ldif_text =3D dda1d01d_ldif;
 	struct ldb_ldif ldif;
@@ -1103,11 +1265,12 @@ static bool torture_ldb_unpack(struct torture_con=
text *torture)
 	return true;
 }
=20
-static bool torture_ldb_unpack_flags(struct torture_context *torture)
+static bool torture_ldb_unpack_flags(struct torture_context *torture,
+				     const void *data_p)
 {
 	TALLOC_CTX *mem_ctx =3D talloc_new(torture);
 	struct ldb_context *ldb;
-	struct ldb_val data =3D data_blob_const(dda1d01d_bin, sizeof(dda1d01d_b=
in));
+	struct ldb_val data =3D *discard_const_p(struct ldb_val, data_p);
 	struct ldb_message *msg =3D ldb_msg_new(mem_ctx);
 	const char *ldif_text =3D dda1d01d_ldif;
 	struct ldb_ldif ldif;
@@ -1144,14 +1307,15 @@ static bool torture_ldb_unpack_flags(struct tortu=
re_context *torture)
 	return true;
 }
=20
-static bool torture_ldb_parse_ldif(struct torture_context *torture)
+static bool torture_ldb_parse_ldif(struct torture_context *torture,
+				   const void *data_p)
 {
 	TALLOC_CTX *mem_ctx =3D talloc_new(torture);
 	const char *ldif_text =3D dda1d01d_ldif;
 	struct ldb_context *ldb;
 	struct ldb_ldif *ldif;
 	struct ldb_val binary;
-	struct ldb_val data =3D data_blob_const(dda1d01d_bin, sizeof(dda1d01d_b=
in));
+	struct ldb_val data =3D *discard_const_p(struct ldb_val, data_p);
 	struct ldb_message *msg =3D ldb_msg_new(mem_ctx);
=20
 	ldb =3D samba_ldb_init(mem_ctx, torture->ev, NULL,NULL,NULL);
@@ -1255,11 +1419,12 @@ static bool torture_ldb_pack_format_perf(struct t=
orture_context *torture)
 	return true;
 }
=20
-static bool torture_ldb_unpack_and_filter(struct torture_context *tortur=
e)
+static bool torture_ldb_unpack_and_filter(struct torture_context *tortur=
e,
+					  const void *data_p)
 {
 	TALLOC_CTX *mem_ctx =3D talloc_new(torture);
 	struct ldb_context *ldb;
-	struct ldb_val data =3D data_blob_const(dda1d01d_bin, sizeof(dda1d01d_b=
in));
+	struct ldb_val data =3D *discard_const_p(struct ldb_val, data_p);
 	struct ldb_message *unpack_msg =3D ldb_msg_new(mem_ctx);
 	struct ldb_message *msg =3D ldb_msg_new(mem_ctx);
 	const char *lookup_names[] =3D {"instanceType", "nonexistant",
@@ -1375,12 +1540,17 @@ static bool torture_ldb_unpack_and_filter(struct =
torture_context *torture)
=20
 struct torture_suite *torture_ldb(TALLOC_CTX *mem_ctx)
 {
+	int i;
+	struct ldb_val *bins =3D talloc_array(NULL, struct ldb_val, 2);
 	struct torture_suite *suite =3D torture_suite_create(mem_ctx, "ldb");
=20
 	if (suite =3D=3D NULL) {
 		return NULL;
 	}
=20
+	bins[0] =3D data_blob_const(dda1d01d_bin_v1, sizeof(dda1d01d_bin_v1));
+	bins[1] =3D data_blob_const(dda1d01d_bin_v2, sizeof(dda1d01d_bin_v2));
+
 	torture_suite_add_simple_test(suite, "attrs", torture_ldb_attrs);
 	torture_suite_add_simple_test(suite, "dn-attrs", torture_ldb_dn_attrs);=

 	torture_suite_add_simple_test(suite, "dn-extended",
@@ -1388,17 +1558,25 @@ struct torture_suite *torture_ldb(TALLOC_CTX *mem=
_ctx)
 	torture_suite_add_simple_test(suite, "dn-invalid-extended",
 				      torture_ldb_dn_invalid_extended);
 	torture_suite_add_simple_test(suite, "dn", torture_ldb_dn);
-	torture_suite_add_simple_test(suite, "unpack-data",
-				      torture_ldb_unpack);
-	torture_suite_add_simple_test(suite, "unpack-data-flags",
-				      torture_ldb_unpack_flags);
-	torture_suite_add_simple_test(suite, "parse-ldif",
-				      torture_ldb_parse_ldif);
-	torture_suite_add_simple_test(suite, "unpack-and-filter",
-				      torture_ldb_unpack_and_filter);
 	torture_suite_add_simple_test(suite, "pack-format-perf",
 				      torture_ldb_pack_format_perf);
=20
+	for (i=3D0; i<2; i++) {
+		torture_suite_add_simple_tcase_const(suite,
+			talloc_asprintf(mem_ctx, "unpack-data-v%d", i+1),
+			torture_ldb_unpack, &bins[i]);
+		torture_suite_add_simple_tcase_const(suite,
+			talloc_asprintf(mem_ctx, "unpack-data-flags-v%d", i+1),
+			torture_ldb_unpack_flags, &bins[i]);
+		torture_suite_add_simple_tcase_const(suite,
+			talloc_asprintf(mem_ctx, "parse-ldif-v%d", i+1),
+			torture_ldb_parse_ldif, &bins[i]);
+		torture_suite_add_simple_tcase_const(suite,
+			talloc_asprintf(mem_ctx,
+					"unpack-data-and-filter-v%d", i+1),
+			torture_ldb_unpack_and_filter, &bins[i]);
+	}
+
 	suite->description =3D talloc_strdup(suite, "LDB (samba-specific behavi=
our) tests");
=20
 	return suite;
--=20
2.7.4


=46rom e5f86143f954094267c27fcca50a2cafc5f9e452 Mon Sep 17 00:00:00 2001
From: Aaron Haslett <aaronhaslett@catalyst.net.nz>
Date: Fri, 10 May 2019 18:10:55 +1200
Subject: [PATCH 3/5] ldb: pack function for new pack format

Pack function for new pack format with values separated from other data
so that while unpacking, the value section (which is probably large)
doesn't have to be loaded into cache/memory.
The new format is disabled for now.
Two tests are added that operate on a detailed binary breakdown of the
new format.

NOTE: Configure with --abi-check-disable to build this commit. This
patch is part of a set of LDB ABI changes, and the version update is
done on the last commit.

Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
---
 lib/ldb/common/ldb_pack.c      | 280 +++++++++++++++++++++++++++++++++++=
++++--
 lib/ldb/include/ldb_module.h   |   3 +-
 lib/ldb/ldb_key_value/ldb_kv.c |   3 +-
 source4/torture/ldb/ldb.c      | 155 ++++++++++++++++++++++-
 4 files changed, 422 insertions(+), 19 deletions(-)

diff --git a/lib/ldb/common/ldb_pack.c b/lib/ldb/common/ldb_pack.c
index 03e14b1..836b583 100644
--- a/lib/ldb/common/ldb_pack.c
+++ b/lib/ldb/common/ldb_pack.c
@@ -33,7 +33,13 @@
=20
 #include "ldb_private.h"
=20
-/* use a portable integer format */
+static void put_uint16(uint8_t *p, int ofs, unsigned int val)
+{
+	p +=3D ofs;
+	p[0] =3D val&0xFF;
+	p[1] =3D (val>>8)  & 0xFF;
+}
+
 static void put_uint32(uint8_t *p, int ofs, unsigned int val)
 {
 	p +=3D ofs;
@@ -64,17 +70,9 @@ static int attribute_storable_values(const struct ldb_=
message_element *el)
 	return el->num_values;
 }
=20
-/*
-  pack a ldb message into a linear buffer in a ldb_val
-
-  note that this routine avoids saving elements with zero values,
-  as these are equivalent to having no element
-
-  caller frees the data buffer after use
-*/
-int ldb_pack_data(struct ldb_context *ldb,
-		  const struct ldb_message *message,
-		  struct ldb_val *data)
+static int ldb_pack_data_v1(struct ldb_context *ldb,
+			    const struct ldb_message *message,
+			    struct ldb_val *data)
 {
 	unsigned int i, j, real_elements=3D0;
 	size_t size, dn_len, attr_len, value_len;
@@ -181,6 +179,264 @@ int ldb_pack_data(struct ldb_context *ldb,
 }
=20
 /*
+ * New pack version designed based on performance profiling of version 1=
=2E
+ * The approach is to separate value data from the rest of the record's =
data.
+ * This improves performance because value data is not needed during unp=
acking
+ * or filtering of the message's attribute list. During filtering we onl=
y copy
+ * attributes which are present in the attribute list, however at the pa=
rse
+ * stage we need to point to all attributes as they may be referenced in=
 the
+ * search expression.
+ * With this new format, we don't lose time loading data (eg via
+ * talloc_memdup()) that is never needed (for the vast majority of attri=
butes
+ * are are never found in either the search expression or attribute list=
).
+ * Additional changes include adding a canonicalized DN (for later
+ * optimizations) and variable width length fields for faster unpacking.=

+ * The pack and unpack performance improvement is tested in the torture
+ * test torture_ldb_pack_format_perf.
+ *
+ * Layout:
+ *
+ * Version (4 bytes)
+ * Number of Elements (4 bytes)
+ * DN length (4 bytes)
+ * DN with null terminator (DN length + 1 bytes)
+ * Canonicalized DN length (4 bytes)
+ * Canonicalized DN with null terminator (Canonicalized DN length + 1 by=
tes)
+ * Number of bytes from here to value data section (4 bytes)
+ * # For each element:
+ * 	Element name length (4 bytes)
+ * 	Element name with null terminator (Element name length + 1 bytes)
+ * 	Number of values (4 bytes)
+ * 	Width of value lengths
+ * 	# For each value:
+ * 		Value data length (#bytes given by width field above)
+ * # For each element:
+ * 	# For each value:
+ *	 	Value data (#bytes given by corresponding length above)
+ */
+static int ldb_pack_data_v2(struct ldb_context *ldb,
+			    const struct ldb_message *message,
+			    struct ldb_val *data)
+{
+	unsigned int i, j, real_elements=3D0;
+	size_t size, dn_len, dn_canon_len, attr_len, value_len;
+	const char *dn, *dn_canon;
+	uint8_t *p, *q;
+	size_t len;
+	size_t max_val_len;
+	uint8_t val_len_width;
+
+	dn =3D ldb_dn_get_linearized(message->dn);
+	if (dn =3D=3D NULL) {
+		errno =3D ENOMEM;
+		return -1;
+	}
+
+	/*
+	 * Initial size.  20 =3D 5 * 4.  5 fixed fields are:
+	 * version, num elements, dn len, canon dn len, attr section len
+	 */
+	size =3D 20;
+
+	dn_len =3D strlen(dn) + 1;
+	if (size + dn_len < size) {
+		errno =3D ENOMEM;
+		return -1;
+	}
+	size +=3D dn_len;
+
+	if (ldb_dn_is_special(message->dn)) {
+		dn_canon_len =3D 1;
+		dn_canon =3D discard_const_p(char, "\0");
+	} else {
+		dn_canon =3D ldb_dn_canonical_string(message->dn, message->dn);
+		if (dn_canon =3D=3D NULL) {
+			errno =3D ENOMEM;
+			return -1;
+		}
+
+		dn_canon_len =3D strlen(dn_canon) + 1;
+		if (size + dn_canon_len < size) {
+			errno =3D ENOMEM;
+			return -1;
+		}
+	}
+	size +=3D dn_canon_len;
+
+	/*
+	 * First calcuate the buffer size we need, and check for
+	 * overflows
+	 */
+	for (i=3D0;i<message->num_elements;i++) {
+		if (attribute_storable_values(&message->elements[i]) =3D=3D 0) {
+			continue;
+		}
+
+		real_elements++;
+
+		attr_len =3D strlen(message->elements[i].name);
+		if (size + attr_len + 9 < size) {
+			errno =3D ENOMEM;
+			return -1;
+		}
+		size +=3D attr_len + 9;
+		max_val_len =3D 0;
+
+		for (j=3D0;j<message->elements[i].num_values;j++) {
+			value_len =3D message->elements[i].values[j].length;
+			if (value_len > max_val_len) {
+				max_val_len =3D value_len;
+			}
+
+			if (size + value_len + 1 < size) {
+				errno =3D ENOMEM;
+				return -1;
+			}
+			size +=3D value_len + 1;
+		}
+
+		if (max_val_len <=3D UCHAR_MAX) {
+			val_len_width =3D 1;
+		} else if (max_val_len <=3D USHRT_MAX) {
+			val_len_width =3D 2;
+		} else if (max_val_len <=3D UINT_MAX) {
+		        val_len_width =3D 4;
+		} else {
+			errno =3D EMSGSIZE;
+			return -1;
+		}
+
+		if (size + val_len_width + 1 < size) {
+			errno =3D ENOMEM;
+			return -1;
+		}
+		size +=3D (val_len_width*message->elements[i].num_values) + 1;
+	}
+
+	/* allocate it */
+	data->data =3D talloc_array(ldb, uint8_t, size);
+	if (!data->data) {
+		errno =3D ENOMEM;
+		return -1;
+	}
+	data->length =3D size;
+
+	p =3D data->data;
+	put_uint32(p, 0, LDB_PACKING_FORMAT_V2);
+	put_uint32(p, 4, real_elements);
+	p +=3D 8;
+
+	/* the dn needs to be packed so we can be case preserving
+	   while hashing on a case folded dn */
+	put_uint32(p, 0, dn_len-1);
+	p +=3D 4;
+	memcpy(p, dn, dn_len);
+	p +=3D dn_len;
+
+	put_uint32(p, 0, dn_canon_len-1);
+	p +=3D 4;
+	memcpy(p, dn_canon, dn_canon_len);
+	p +=3D dn_canon_len;
+
+	q =3D p;
+	p +=3D 4;
+
+	for (i=3D0;i<message->num_elements;i++) {
+		if (attribute_storable_values(&message->elements[i]) =3D=3D 0) {
+			continue;
+		}
+		len =3D strlen(message->elements[i].name);
+		put_uint32(p, 0, len);
+		p +=3D 4;
+		memcpy(p, message->elements[i].name, len+1);
+		p +=3D len + 1;
+		put_uint32(p, 0, message->elements[i].num_values);
+		p +=3D 4;
+		max_val_len =3D 0;
+
+		for (j=3D0;j<message->elements[i].num_values;j++) {
+			value_len =3D message->elements[i].values[j].length;
+			if (value_len > max_val_len) {
+				max_val_len =3D value_len;
+			}
+		}
+
+		if (max_val_len <=3D UCHAR_MAX) {
+			val_len_width =3D 1;
+		} else if (max_val_len <=3D USHRT_MAX) {
+			val_len_width =3D 2;
+		} else if (max_val_len <=3D UINT_MAX) {
+		        val_len_width =3D 4;
+		} else {
+			errno =3D EMSGSIZE;
+			return -1;
+		}
+
+		*p =3D val_len_width & 0xFF;
+		p +=3D 1;
+
+		/* This is structured weirdly for compiler opt purposes */
+		if (val_len_width =3D=3D 1) {
+			for (j=3D0;j<message->elements[i].num_values;j++) {
+				*p =3D message->elements[i].values[j].length &
+				     0xFF;
+				p +=3D val_len_width;
+			}
+		} else if (val_len_width =3D=3D 2) {
+			for (j=3D0;j<message->elements[i].num_values;j++) {
+				put_uint16(p, 0,
+					message->elements[i].values[j].length);
+				p +=3D val_len_width;
+			}
+		} else if (val_len_width =3D=3D 4) {
+			for (j=3D0;j<message->elements[i].num_values;j++) {
+				put_uint32(p, 0,
+					message->elements[i].values[j].length);
+				p +=3D val_len_width;
+			}
+		}
+	}
+	put_uint32(q, 0, p-q);
+
+	for (i=3D0;i<message->num_elements;i++) {
+		if (attribute_storable_values(&message->elements[i]) =3D=3D 0) {
+			continue;
+		}
+		for (j=3D0;j<message->elements[i].num_values;j++) {
+			memcpy(p, message->elements[i].values[j].data,
+			       message->elements[i].values[j].length);
+			p[message->elements[i].values[j].length] =3D 0;
+			p +=3D message->elements[i].values[j].length + 1;
+		}
+	}
+
+	return 0;
+}
+
+/*
+  pack a ldb message into a linear buffer in a ldb_val
+
+  note that this routine avoids saving elements with zero values,
+  as these are equivalent to having no element
+
+  caller frees the data buffer after use
+*/
+int ldb_pack_data(struct ldb_context *ldb,
+		  const struct ldb_message *message,
+		  struct ldb_val *data,
+		  uint32_t pack_format_version) {
+
+	if (pack_format_version =3D=3D LDB_PACKING_FORMAT) {
+		return ldb_pack_data_v1(ldb, message, data);
+	} else if (pack_format_version =3D=3D LDB_PACKING_FORMAT_V2) {
+		return ldb_pack_data_v2(ldb, message, data);
+	} else {
+		errno =3D EINVAL;
+		return -1;
+	}
+}
+
+/*
  * Unpack a ldb message from a linear buffer in ldb_val
  */
 static int ldb_unpack_data_flags_v1(struct ldb_context *ldb,
diff --git a/lib/ldb/include/ldb_module.h b/lib/ldb/include/ldb_module.h
index db80b28..3b72861 100644
--- a/lib/ldb/include/ldb_module.h
+++ b/lib/ldb/include/ldb_module.h
@@ -509,7 +509,8 @@ int ldb_register_extended_match_rule(struct ldb_conte=
xt *ldb,
  */
 int ldb_pack_data(struct ldb_context *ldb,
 		  const struct ldb_message *message,
-		  struct ldb_val *data);
+		  struct ldb_val *data,
+		  uint32_t pack_format_version);
 /*
  * Unpack a ldb message from a linear buffer in ldb_val
  */
diff --git a/lib/ldb/ldb_key_value/ldb_kv.c b/lib/ldb/ldb_key_value/ldb_k=
v.c
index 81a77462..c8f7fd1 100644
--- a/lib/ldb/ldb_key_value/ldb_kv.c
+++ b/lib/ldb/ldb_key_value/ldb_kv.c
@@ -384,7 +384,8 @@ int ldb_kv_store(struct ldb_module *module,
 	}
=20
 	ret =3D ldb_pack_data(ldb_module_get_ctx(module),
-			    msg, &ldb_data);
+			    msg, &ldb_data,
+			    ldb_kv->pack_format_version);
 	if (ret =3D=3D -1) {
 		TALLOC_FREE(key_ctx);
 		return LDB_ERR_OTHER;
diff --git a/source4/torture/ldb/ldb.c b/source4/torture/ldb/ldb.c
index 5bd58dc..8ca7897 100644
--- a/source4/torture/ldb/ldb.c
+++ b/source4/torture/ldb/ldb.c
@@ -1307,6 +1307,145 @@ static bool torture_ldb_unpack_flags(struct tortu=
re_context *torture,
 	return true;
 }
=20
+static bool torture_ldb_pack_data_v2(struct torture_context *torture)
+{
+	TALLOC_CTX *mem_ctx =3D talloc_new(torture);
+	struct ldb_context *ldb;
+	struct ldb_val binary;
+
+	uint8_t bin[] =3D {0x68, 0x19, 0x01, 0x26,//version
+		2, 0, 0, 0,//num elements
+		4, 0, 0, 0,//dn length
+		'D', 'N', '=3D', 'A', 0,//dn with null term
+		2, 0, 0, 0,//canonicalized dn length
+		'/', 'A', 0,//canonicalized dn with null term
+		42, 0, 0, 0,//size of name and sizes section + 4 (this field)
+		3, 0, 0, 0,//el name length
+		'a', 'b', 'c', 0,//name with null term
+		4, 0, 0, 0, 1,//num values and length width
+		1, 1, 1, 1,//value lengths
+		3, 0, 0, 0,//el name length
+		'd', 'e', 'f', 0,//name def with null term
+		4, 0, 0, 0, 2,//num of values and length width
+		1, 0, 1, 0, 1, 0, 0, 1,//value lengths
+		'1', 0, '2', 0, '3', 0, '4', 0,//values for abc
+		'5', 0, '6', 0, '7', 0};//first 3 values for def
+
+	char eight_256[257] =3D\
+		"88888888888888888888888888888888888888888888888888888888888"
+		"88888888888888888888888888888888888888888888888888888888888"
+		"88888888888888888888888888888888888888888888888888888888888"
+		"88888888888888888888888888888888888888888888888888888888888"
+		"88888888888888888888";//def's 4th value
+
+	struct ldb_val vals[4] =3D {{.data=3Ddiscard_const_p(uint8_t, "1"),
+				   .length=3D1},
+				  {.data=3Ddiscard_const_p(uint8_t, "2"),
+				   .length=3D1},
+				  {.data=3Ddiscard_const_p(uint8_t, "3"),
+				   .length=3D1},
+				  {.data=3Ddiscard_const_p(uint8_t, "4"),
+				   .length=3D1}};
+	struct ldb_val vals2[4] =3D {{.data=3Ddiscard_const_p(uint8_t,"5"),
+				   .length=3D1},
+				  {.data=3Ddiscard_const_p(uint8_t, "6"),
+				   .length=3D1},
+				  {.data=3Ddiscard_const_p(uint8_t, "7"),
+				   .length=3D1},
+				  {.data=3Ddiscard_const_p(uint8_t, eight_256),
+				   .length=3D256}};
+	struct ldb_message_element els[2] =3D {{.name=3Ddiscard_const_p(char, "=
abc"),
+					   .num_values=3D4, .values=3Dvals},
+					  {.name=3Ddiscard_const_p(char, "def"),
+					   .num_values=3D4, .values=3Dvals2}};
+	struct ldb_message msg =3D {.num_elements=3D2, .elements=3Dels};
+
+	uint8_t *expect_bin;
+	struct ldb_val expect_bin_ldb;
+	size_t expect_size =3D sizeof(bin) + sizeof(eight_256);
+	expect_bin =3D talloc_size(NULL, expect_size);
+	memcpy(expect_bin, bin, sizeof(bin));
+	memcpy(expect_bin + sizeof(bin), eight_256, sizeof(eight_256));
+	expect_bin_ldb =3D data_blob_const(expect_bin, expect_size);
+
+	ldb =3D samba_ldb_init(mem_ctx, torture->ev, NULL,NULL,NULL);
+	torture_assert(torture, ldb !=3D NULL, "Failed to init ldb");
+
+	msg.dn =3D ldb_dn_new(NULL, ldb, "DN=3DA");
+
+	torture_assert_int_equal(torture,
+				 ldb_pack_data(ldb, &msg, &binary,
+					       LDB_PACKING_FORMAT_V2),
+				 0, "ldb_pack_data failed");
+
+	torture_assert_int_equal(torture, expect_bin_ldb.length,
+				 binary.length,
+				 "packed data length not as expected");
+
+	torture_assert_mem_equal(torture,
+				 expect_bin_ldb.data,
+				 binary.data,
+				 binary.length,
+				 "packed data not as expected");
+	talloc_free(expect_bin);
+
+	return true;
+}
+
+static bool torture_ldb_pack_data_v2_special(struct torture_context *tor=
ture)
+{
+	TALLOC_CTX *mem_ctx =3D talloc_new(torture);
+	struct ldb_context *ldb;
+	struct ldb_val binary;
+
+	uint8_t bin[] =3D {0x68, 0x19, 0x01, 0x26,//version
+		1, 0, 0, 0,//num elements
+		2, 0, 0, 0,//dn length
+		'@', 'A', 0,//dn with null term
+		0, 0, 0, 0,//canonicalized dn length
+		0,//no canonicalized dn, just null term
+		18, 0, 0, 0,//size of name and sizes section + 4 (this field)
+		3, 0, 0, 0,//el name length
+		'a', 'b', 'c', 0,//name with null term
+		1, 0, 0, 0, 1,//num values and length width
+		1,//value lengths
+		'1', 0};//values for abc
+
+	struct ldb_val vals[1] =3D {{.data=3Ddiscard_const_p(uint8_t, "1"),
+				   .length=3D1}};
+	struct ldb_message_element els[1] =3D {{.name=3Ddiscard_const_p(char,
+								    "abc"),
+					      .num_values=3D1, .values=3Dvals}};
+	struct ldb_message msg =3D {.num_elements=3D1, .elements=3Dels};
+
+	struct ldb_val expect_bin_ldb;
+	expect_bin_ldb =3D data_blob_const(bin, sizeof(bin));
+
+	ldb =3D samba_ldb_init(mem_ctx, torture->ev, NULL,NULL,NULL);
+	torture_assert(torture, ldb !=3D NULL, "Failed to init ldb");
+
+	msg.dn =3D ldb_dn_new(NULL, ldb, "@A");
+
+	torture_assert_int_equal(torture,
+				 ldb_pack_data(ldb, &msg, &binary,
+					       LDB_PACKING_FORMAT_V2),
+				 0, "ldb_pack_data failed");
+
+	torture_assert_int_equal(torture, expect_bin_ldb.length,
+				 binary.length,
+				 "packed data length not as expected");
+
+	torture_assert_mem_equal(torture,
+				 expect_bin_ldb.data,
+				 binary.data,
+				 binary.length,
+				 "packed data not as expected");
+
+	return true;
+}
+
+
+
 static bool torture_ldb_parse_ldif(struct torture_context *torture,
 				   const void *data_p)
 {
@@ -1330,8 +1469,9 @@ static bool torture_ldb_parse_ldif(struct torture_c=
ontext *torture,
 	torture_assert_int_equal(torture, ldif->changetype, LDB_CHANGETYPE_NONE=
,
 				 "changetype is incorrect");
 	torture_assert_int_equal(torture,
-				 ldb_pack_data(ldb, ldif->msg, &binary), 0,
-				 "ldb_pack_data failed");
+				 ldb_pack_data(ldb, ldif->msg, &binary,
+					       LDB_PACKING_FORMAT_V2),
+				 0, "ldb_pack_data failed");
=20
 	torture_assert_int_equal(torture, ldb_unpack_data(ldb, &data, msg), 0,
 				 "ldb_unpack_data failed");
@@ -1379,8 +1519,9 @@ static bool torture_ldb_pack_format_perf(struct tor=
ture_context *torture)
 	torture_assert_int_equal(torture, ldif->changetype, LDB_CHANGETYPE_NONE=
,
 				 "changetype is incorrect");
 	torture_assert_int_equal(torture,
-				 ldb_pack_data(ldb, ldif->msg, &binary), 0,
-				 "ldb_pack_data failed");
+				 ldb_pack_data(ldb, ldif->msg, &binary,
+					       LDB_PACKING_FORMAT_V2),
+				 0, "ldb_pack_data failed");
=20
 	ret =3D ldb_unpack_data(ldb, &binary, msg);
 	torture_assert_int_equal(torture, ret, 0,
@@ -1393,7 +1534,7 @@ static bool torture_ldb_pack_format_perf(struct tor=
ture_context *torture)
 	i =3D 0;
 	start =3D clock();
 	while (true) {
-		ldb_pack_data(ldb, ldif->msg, &binary);
+		ldb_pack_data(ldb, ldif->msg, &binary, LDB_PACKING_FORMAT_V2);
 		i++;
=20
 		if (i >=3D 1000) {
@@ -1560,6 +1701,10 @@ struct torture_suite *torture_ldb(TALLOC_CTX *mem_=
ctx)
 	torture_suite_add_simple_test(suite, "dn", torture_ldb_dn);
 	torture_suite_add_simple_test(suite, "pack-format-perf",
 				      torture_ldb_pack_format_perf);
+	torture_suite_add_simple_test(suite, "pack-data-v2",
+				      torture_ldb_pack_data_v2);
+	torture_suite_add_simple_test(suite, "pack-data-special-v2",
+				      torture_ldb_pack_data_v2_special);
=20
 	for (i=3D0; i<2; i++) {
 		torture_suite_add_simple_tcase_const(suite,
--=20
2.7.4


=46rom c4de1d193b6b854a190335dff90494a6ef8a3376 Mon Sep 17 00:00:00 2001
From: Aaron Haslett <aaronhaslett@catalyst.net.nz>
Date: Thu, 16 May 2019 10:53:38 +1200
Subject: [PATCH 4/5] ldb: removing unnecessary module pointer

We want to reuse the reindex context struct for repacking, but it has an
unnecessary module pointer on it. Turns out the existing code doesn't
need it either, so this patch deletes the pointer.

Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
---
 lib/ldb/ldb_key_value/ldb_kv.h       | 1 -
 lib/ldb/ldb_key_value/ldb_kv_index.c | 5 ++---
 lib/ldb/ldb_tdb/ldb_tdb.c            | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/ldb/ldb_key_value/ldb_kv.h b/lib/ldb/ldb_key_value/ldb_k=
v.h
index c9e5532..1186e86 100644
--- a/lib/ldb/ldb_key_value/ldb_kv.h
+++ b/lib/ldb/ldb_key_value/ldb_kv.h
@@ -137,7 +137,6 @@ struct ldb_kv_context {
 };
=20
 struct ldb_kv_reindex_context {
-	struct ldb_module *module;
 	int error;
 	uint32_t count;
 };
diff --git a/lib/ldb/ldb_key_value/ldb_kv_index.c b/lib/ldb/ldb_key_value=
/ldb_kv_index.c
index e1ca1cd..f6b2620 100644
--- a/lib/ldb/ldb_key_value/ldb_kv_index.c
+++ b/lib/ldb/ldb_key_value/ldb_kv_index.c
@@ -3268,7 +3268,7 @@ static int re_key(struct ldb_kv_private *ldb_kv,
 	struct ldb_context *ldb;
 	struct ldb_kv_reindex_context *ctx =3D
 	    (struct ldb_kv_reindex_context *)state;
-	struct ldb_module *module =3D ctx->module;
+	struct ldb_module *module =3D ldb_kv->module;
 	struct ldb_message *msg;
 	int ret;
 	struct ldb_val key2;
@@ -3346,7 +3346,7 @@ static int re_index(struct ldb_kv_private *ldb_kv,
 	struct ldb_context *ldb;
 	struct ldb_kv_reindex_context *ctx =3D
 	    (struct ldb_kv_reindex_context *)state;
-	struct ldb_module *module =3D ctx->module;
+	struct ldb_module *module =3D ldb_kv->module;
 	struct ldb_message *msg;
 	int ret;
 	bool is_record;
@@ -3466,7 +3466,6 @@ int ldb_kv_reindex(struct ldb_module *module)
 		return LDB_ERR_OPERATIONS_ERROR;
 	}
=20
-	ctx.module =3D module;
 	ctx.error =3D 0;
 	ctx.count =3D 0;
=20
diff --git a/lib/ldb/ldb_tdb/ldb_tdb.c b/lib/ldb/ldb_tdb/ldb_tdb.c
index ae0001e..2f0468f 100644
--- a/lib/ldb/ldb_tdb/ldb_tdb.c
+++ b/lib/ldb/ldb_tdb/ldb_tdb.c
@@ -286,7 +286,7 @@ static int ltdb_update_in_iterate(struct ldb_kv_priva=
te *ldb_kv,
 	struct ldb_context *ldb;
 	struct ldb_kv_reindex_context *ctx =3D
 	    (struct ldb_kv_reindex_context *)state;
-	struct ldb_module *module =3D ctx->module;
+	struct ldb_module *module =3D ldb_kv->module;
 	TDB_DATA key =3D {
 		.dptr =3D ldb_key.data,
 		.dsize =3D ldb_key.length
--=20
2.7.4


=46rom 926aadf8111b6b76fe9ffeae7634d06d207a395e Mon Sep 17 00:00:00 2001
From: Aaron Haslett <aaronhaslett@catalyst.net.nz>
Date: Mon, 13 May 2019 16:37:25 +1200
Subject: [PATCH 5/5] ldb: repack old format database on first transaction=


Now that we have a new packing format, we need to update any databases
with old formats to the new version. We do this in the first transaction
and follow the same iterate pattern as with reindexing.
LDB version and ABI updated.

Signed-off-by: Aaron Haslett <aaronhaslett@catalyst.net.nz>
---
 lib/ldb/ldb_key_value/ldb_kv.c       | 15 ++++++-
 lib/ldb/ldb_key_value/ldb_kv.h       |  2 +
 lib/ldb/ldb_key_value/ldb_kv_cache.c | 53 ++++++++++++++++++-------
 lib/ldb/ldb_key_value/ldb_kv_index.c | 76 ++++++++++++++++++++++++++++++=
++++++
 4 files changed, 131 insertions(+), 15 deletions(-)

diff --git a/lib/ldb/ldb_key_value/ldb_kv.c b/lib/ldb/ldb_key_value/ldb_k=
v.c
index c8f7fd1..7aa98fd 100644
--- a/lib/ldb/ldb_key_value/ldb_kv.c
+++ b/lib/ldb/ldb_key_value/ldb_kv.c
@@ -1361,6 +1361,7 @@ static int ldb_kv_start_trans(struct ldb_module *mo=
dule)
 	void *data =3D ldb_module_get_private(module);
 	struct ldb_kv_private *ldb_kv =3D
 	    talloc_get_type(data, struct ldb_kv_private);
+	struct ldb_context *ldb =3D ldb_module_get_ctx(module);
=20
 	pid_t pid =3D getpid();
=20
@@ -1383,6 +1384,18 @@ static int ldb_kv_start_trans(struct ldb_module *m=
odule)
 		return ldb_kv->kv_ops->error(ldb_kv);
 	}
=20
+	if (ldb_kv->repack) {
+		int r;
+		ldb_kv->repack =3D false;
+		ldb_debug(ldb, 0, "Repacking database");
+		r =3D ldb_kv_repack(module);
+		if (r !=3D LDB_SUCCESS) {
+			ldb_debug(ldb, LDB_DEBUG_ERROR,
+				  "Database repack failed.");
+			return LDB_ERR_OPERATIONS_ERROR;
+		}
+	}
+
 	ldb_kv_index_transaction_start(
 		module,
 		ldb_kv->index_transaction_cache_size);
@@ -1895,7 +1908,7 @@ int ldb_kv_init_store(struct ldb_kv_private *ldb_kv=
,
=20
 	ldb_kv->sequence_number =3D 0;
=20
-	ldb_kv->pack_format_version =3D LDB_PACKING_FORMAT;
+	ldb_kv->repack =3D false;
=20
 	ldb_kv->pid =3D getpid();
=20
diff --git a/lib/ldb/ldb_key_value/ldb_kv.h b/lib/ldb/ldb_key_value/ldb_k=
v.h
index 1186e86..2de6f7f 100644
--- a/lib/ldb/ldb_key_value/ldb_kv.h
+++ b/lib/ldb/ldb_key_value/ldb_kv.h
@@ -86,6 +86,7 @@ struct ldb_kv_private {
=20
 	bool warn_unindexed;
 	bool warn_reindex;
+	bool repack;
=20
 	bool read_only;
=20
@@ -226,6 +227,7 @@ int ldb_kv_index_del_value(struct ldb_module *module,=

 			   struct ldb_message_element *el,
 			   unsigned int v_idx);
 int ldb_kv_reindex(struct ldb_module *module);
+int ldb_kv_repack(struct ldb_module *module);
 int ldb_kv_index_transaction_start(
 	struct ldb_module *module,
 	size_t cache_size);
diff --git a/lib/ldb/ldb_key_value/ldb_kv_cache.c b/lib/ldb/ldb_key_value=
/ldb_kv_cache.c
index c5f6611..51e392c 100644
--- a/lib/ldb/ldb_key_value/ldb_kv_cache.c
+++ b/lib/ldb/ldb_key_value/ldb_kv_cache.c
@@ -455,20 +455,10 @@ int ldb_kv_cache_load(struct ldb_module *module)
 					    get_pack_format_version,
 					    &pack_format_version);
=20
-	if (r !=3D LDB_ERR_NO_SUCH_OBJECT) {
-		if (r !=3D LDB_SUCCESS) {
-			goto failed_and_unlock;
-		}
-
-		/* Make sure the database has the right format */
-		if (pack_format_version !=3D ldb_kv->pack_format_version) {
-			ldb_debug(ldb, LDB_DEBUG_ERROR,
-				  "Unexpected packing format. "
-				  "Expected: %#010x, Got: %#010x",
-				  pack_format_version,
-				  ldb_kv->pack_format_version);
-			goto failed_and_unlock;
-		}
+	if (r =3D=3D LDB_ERR_NO_SUCH_OBJECT) {
+		pack_format_version =3D LDB_PACKING_FORMAT;
+	} else if (r !=3D LDB_SUCCESS) {
+		goto failed_and_unlock;
 	}
=20
 	/* Now fetch the whole @BASEINFO record */
@@ -492,6 +482,12 @@ int ldb_kv_cache_load(struct ldb_module *module)
=20
 		have_write_txn =3D true;
=20
+		/*
+		 * We need to write but haven't figured out packing format yet.
+		 * Just go with version 1 and we'll repack if we got it wrong.
+		 */
+		ldb_kv->pack_format_version =3D LDB_PACKING_FORMAT;
+
 		/* error handling for ltdb_baseinfo_init() is by
 		   looking for the record again. */
 		ldb_kv_baseinfo_init(module);
@@ -562,8 +558,25 @@ int ldb_kv_cache_load(struct ldb_module *module)
 		goto failed_and_unlock;
 	}
=20
+	/*
+	 * Initialise packing version and GUID index syntax, and force the
+	 * two to travel together, ie a GUID indexed database must use V2
+	 * packing format and a DN indexed database must use V1. Repack
+	 * database if necessary.
+	 */
 	ldb_kv->GUID_index_syntax =3D NULL;
 	if (ldb_kv->cache->GUID_index_attribute !=3D NULL) {
+
+		/* GUID indexed databases must use packing format V2 */
+		ldb_kv->pack_format_version =3D LDB_PACKING_FORMAT_V2;
+		if (pack_format_version !=3D ldb_kv->pack_format_version) {
+			ldb_debug(ldb, 0,
+				  "GUID-indexed database with version 1 "
+				  "format. Repacking at version 2 on next "
+				  "transaction.");
+			ldb_kv->repack =3D true;
+		}
+
 		/*
 		 * Now the attributes are loaded, set the guid_index_syntax.
 		 * This can't fail, it will return a default at worst
@@ -571,6 +584,18 @@ int ldb_kv_cache_load(struct ldb_module *module)
 		a =3D ldb_schema_attribute_by_name(
 		    ldb, ldb_kv->cache->GUID_index_attribute);
 		ldb_kv->GUID_index_syntax =3D a->syntax;
+	} else if (pack_format_version !=3D LDB_PACKING_FORMAT) {
+		// TODO: Should we error here or repack at V1? Should never
+		// happen. Could print a "this is crazy, trying my best" sort
+		// of error and repack.
+		ldb_debug(ldb, LDB_DEBUG_WARNING,
+			  "Non GUID-indexed database with unexpected packing "
+			  "format: Expected: %#010x, Got: %#010x.",
+			  LDB_PACKING_FORMAT, pack_format_version);
+
+		goto failed_and_unlock;
+	} else {
+		ldb_kv->pack_format_version =3D LDB_PACKING_FORMAT;
 	}
=20
 done:
diff --git a/lib/ldb/ldb_key_value/ldb_kv_index.c b/lib/ldb/ldb_key_value=
/ldb_kv_index.c
index f6b2620..469a357 100644
--- a/lib/ldb/ldb_key_value/ldb_kv_index.c
+++ b/lib/ldb/ldb_key_value/ldb_kv_index.c
@@ -3411,6 +3411,82 @@ static int re_index(struct ldb_kv_private *ldb_kv,=

 	return 0;
 }
=20
+static int re_pack(struct ldb_kv_private *ldb_kv,
+		   struct ldb_val key,
+		   struct ldb_val val,
+		   void *state)
+{
+	struct ldb_context *ldb;
+	struct ldb_message *msg;
+	struct ldb_module *module =3D ldb_kv->module;
+	struct ldb_kv_reindex_context *ctx =3D
+	    (struct ldb_kv_reindex_context *)state;
+	int ret;
+
+	ldb =3D ldb_module_get_ctx(module);
+
+	msg =3D ldb_msg_new(module);
+	if (msg =3D=3D NULL) {
+		return -1;
+	}
+
+	ret =3D ldb_unpack_data(ldb, &val, msg);
+	if (ret !=3D 0) {
+		ldb_debug(ldb, LDB_DEBUG_ERROR, "Repack: unpack failed: %s\n",
+			  ldb_dn_get_linearized(msg->dn));
+		ctx->error =3D ret;
+		talloc_free(msg);
+		return -1;
+	}
+
+	ret =3D ldb_kv_store(module, msg, TDB_MODIFY);
+	if (ret !=3D LDB_SUCCESS) {
+		ldb_debug(ldb, LDB_DEBUG_ERROR, "Repack: store failed: %s\n",
+			  ldb_dn_get_linearized(msg->dn));
+		ctx->error =3D ret;
+		talloc_free(msg);
+		return -1;
+	}
+
+	ctx->count++;
+	if (ctx->count % 10000 =3D=3D 0) {
+		ldb_debug(ldb, LDB_DEBUG_WARNING,
+			  "Repack: re-packed %u records so far",
+			  ctx->count);
+	}
+
+	return 0;
+}
+
+int ldb_kv_repack(struct ldb_module *module)
+{
+	struct ldb_kv_private *ldb_kv =3D talloc_get_type(
+	    ldb_module_get_private(module), struct ldb_kv_private);
+	struct ldb_context *ldb =3D ldb_module_get_ctx(module);
+	struct ldb_kv_reindex_context ctx;
+	int ret;
+
+	ctx.count =3D 0;
+	ctx.error =3D LDB_SUCCESS;
+
+	/* Iterate all database records and repack them in the new format */
+	ldb_debug(ldb, LDB_DEBUG_ERROR, "starting repack iterate");
+	ret =3D ldb_kv->kv_ops->iterate(ldb_kv, re_pack, &ctx);
+	if (ret < 0) {
+		ldb_debug(ldb, LDB_DEBUG_ERROR, "Repack traverse failed: %s",
+			  ldb_errstring(ldb));
+		return LDB_ERR_OPERATIONS_ERROR;
+	}
+
+	if (ctx.error !=3D LDB_SUCCESS) {
+		ldb_debug(ldb, LDB_DEBUG_ERROR, "Repack failed: %s",
+			  ldb_errstring(ldb));
+		return ctx.error;
+	}
+
+	return LDB_SUCCESS;
+}
+
 /*
   force a complete reindex of the database
 */
--=20
2.7.4


--------------7BAAD38C51BED3163C6C72F3--

