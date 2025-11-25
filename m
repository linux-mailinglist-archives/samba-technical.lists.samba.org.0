Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B44C866B1
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=C+yCuQ/tHtUBqsWA/gQgsquEPCvdscNyLirwEthrnkk=; b=TrD0+xpAwX5Pm0FlPBEEUkV7cC
	q0uh1NHLXU6lY+eGA6fVXFZ5I3cQ8GSuU++ZPmzQU2TOlNfvgaRUx56LbLwOpFDNUxNI8zX5Tv/8t
	9SDJe8RskhFn2XYmNQnx8mcDr30t7491+zv3kzBdg2Ydc2xEgbj+Je620Qq7P+k6txVEJOXEGMKHk
	IidQfvm5dvBIe6kn2mqbIBTQCPUoef24NPZJS/7oXLrNaxuz5qt7kZzKXmUwLBrFMGvQl6V6+WAit
	ESrHZRMhly/W3Iqr5BOIGjT3HzxPOHnp073PE2Qw3hfRlRMXDH+TDZoDQzAdcFWFgPiqzbnoRjN5g
	R7bdGfmw==;
Received: from ip6-localhost ([::1]:48146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxNl-00D8Ti-PR; Tue, 25 Nov 2025 18:03:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24550) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJn-00D7GI-0P
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=C+yCuQ/tHtUBqsWA/gQgsquEPCvdscNyLirwEthrnkk=; b=qBO6nMMKTCVeeCJKhNSoWtfTkO
 rQqMhzso/KjFSbCBr831pGCNl7BKbLXeZQdik5U/KejZwh67M4J/MyKa5oWNqXOXFcDUMUvKNZQyn
 A9YVESjIlnmfmLQcljW5uL3T8mD4ylNueXSH7XWHkSQvWvReaX2+57DI9Hdt5QIIupGsGBR5ZhVJN
 LwS9yaT7bT7KALhwdNoIM6X86LKXyHwZf4RO7sfI5Mz/ieeojRbdDtbgd14SzPV79hGpWHdJ1627F
 vRja6CQa29NGKJ3oQ0XTvpEMWYVpyN1yIfJba2Mpng34xyxqs6cQzqxxuorZFixjSLz18mFYjVWfi
 7+9R58+VnNcu7kadbXUC1aNmSIbGLeORECZYYdhoniIjYyhCQQErDpVOSJPDOvrCkPmERYG6H5vgL
 EdjJaDlrWQOEKVO1ry/ajypBuwMPWB9i1W/w2tdU0Eoy1+Mq4wB1bHJehJuCpEyiM+foQVBLe45fo
 3tobr9QIxI5SP7jYLUBN2svL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJk-00Fcre-2Q; Tue, 25 Nov 2025 17:59:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 025/145] smb: smbdirect: introduce
 smbdirect_map_sges_from_iter() and helper functions
Date: Tue, 25 Nov 2025 18:54:31 +0100
Message-ID: <b94d9ff27bd796c4f89f8134d54efb7cf372cc24.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>, David Howells <dhowells@redhat.com>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

These are basically copies of smb_extract_iter_to_rdma() and its helpers
in the client, which will be replaced in the next steps.

The goal is to use them also in the server, which will simplify a lot.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: David Howells <dhowells@redhat.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 255 ++++++++++++++++++
 1 file changed, 255 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 17fcc402d0ac..8c056d363b23 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -5,6 +5,19 @@
  */
 
 #include "smbdirect_internal.h"
+#include <linux/folio_queue.h>
+
+struct smbdirect_map_sges {
+	struct ib_sge *sge;
+	size_t num_sge;
+	size_t max_sge;
+	struct ib_device *device;
+	u32 local_dma_lkey;
+	enum dma_data_direction direction;
+};
+
+static ssize_t smbdirect_map_sges_from_iter(struct iov_iter *iter, size_t len,
+					    struct smbdirect_map_sges *state);
 
 static void smbdirect_connection_destroy_mem_pools(struct smbdirect_socket *sc);
 
@@ -326,3 +339,245 @@ static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc
 
 	wake_up(&sc->send_io.pending.dec_wait_queue);
 }
+
+static bool smbdirect_map_sges_single_page(struct smbdirect_map_sges *state,
+					   struct page *page, size_t off, size_t len)
+{
+	struct ib_sge *sge;
+	u64 addr;
+
+	if (state->num_sge >= state->max_sge)
+		return false;
+
+	addr = ib_dma_map_page(state->device, page,
+			       off, len, state->direction);
+	if (ib_dma_mapping_error(state->device, addr))
+		return false;
+
+	sge = &state->sge[state->num_sge++];
+	sge->addr   = addr;
+	sge->length = len;
+	sge->lkey   = state->local_dma_lkey;
+
+	return true;
+}
+
+/*
+ * Extract page fragments from a BVEC-class iterator and add them to an ib_sge
+ * list.  The pages are not pinned.
+ */
+static ssize_t smbdirect_map_sges_from_bvec(struct iov_iter *iter,
+					    struct smbdirect_map_sges *state,
+					    ssize_t maxsize)
+{
+	const struct bio_vec *bv = iter->bvec;
+	unsigned long start = iter->iov_offset;
+	unsigned int i;
+	ssize_t ret = 0;
+
+	for (i = 0; i < iter->nr_segs; i++) {
+		size_t off, len;
+		bool ok;
+
+		len = bv[i].bv_len;
+		if (start >= len) {
+			start -= len;
+			continue;
+		}
+
+		len = min_t(size_t, maxsize, len - start);
+		off = bv[i].bv_offset + start;
+
+		ok = smbdirect_map_sges_single_page(state,
+						    bv[i].bv_page,
+						    off,
+						    len);
+		if (!ok)
+			return -EIO;
+
+		ret += len;
+		maxsize -= len;
+		if (state->num_sge >= state->max_sge || maxsize <= 0)
+			break;
+		start = 0;
+	}
+
+	if (ret > 0)
+		iov_iter_advance(iter, ret);
+	return ret;
+}
+
+/*
+ * Extract fragments from a KVEC-class iterator and add them to an ib_sge list.
+ * This can deal with vmalloc'd buffers as well as kmalloc'd or static buffers.
+ * The pages are not pinned.
+ */
+static ssize_t smbdirect_map_sges_from_kvec(struct iov_iter *iter,
+					    struct smbdirect_map_sges *state,
+					    ssize_t maxsize)
+{
+	const struct kvec *kv = iter->kvec;
+	unsigned long start = iter->iov_offset;
+	unsigned int i;
+	ssize_t ret = 0;
+
+	for (i = 0; i < iter->nr_segs; i++) {
+		struct page *page;
+		unsigned long kaddr;
+		size_t off, len, seg;
+
+		len = kv[i].iov_len;
+		if (start >= len) {
+			start -= len;
+			continue;
+		}
+
+		kaddr = (unsigned long)kv[i].iov_base + start;
+		off = kaddr & ~PAGE_MASK;
+		len = min_t(size_t, maxsize, len - start);
+		kaddr &= PAGE_MASK;
+
+		maxsize -= len;
+		do {
+			bool ok;
+
+			seg = min_t(size_t, len, PAGE_SIZE - off);
+
+			if (is_vmalloc_or_module_addr((void *)kaddr))
+				page = vmalloc_to_page((void *)kaddr);
+			else
+				page = virt_to_page((void *)kaddr);
+
+			ok = smbdirect_map_sges_single_page(state, page, off, seg);
+			if (!ok)
+				return -EIO;
+
+			ret += seg;
+			len -= seg;
+			kaddr += PAGE_SIZE;
+			off = 0;
+		} while (len > 0 && state->num_sge < state->max_sge);
+
+		if (state->num_sge >= state->max_sge || maxsize <= 0)
+			break;
+		start = 0;
+	}
+
+	if (ret > 0)
+		iov_iter_advance(iter, ret);
+	return ret;
+}
+
+/*
+ * Extract folio fragments from a FOLIOQ-class iterator and add them to an
+ * ib_sge list.  The folios are not pinned.
+ */
+static ssize_t smbdirect_map_sges_from_folioq(struct iov_iter *iter,
+					      struct smbdirect_map_sges *state,
+					      ssize_t maxsize)
+{
+	const struct folio_queue *folioq = iter->folioq;
+	unsigned int slot = iter->folioq_slot;
+	ssize_t ret = 0;
+	size_t offset = iter->iov_offset;
+
+	if (WARN_ON_ONCE(!folioq))
+		return -EIO;
+
+	if (slot >= folioq_nr_slots(folioq)) {
+		folioq = folioq->next;
+		if (WARN_ON_ONCE(!folioq))
+			return -EIO;
+		slot = 0;
+	}
+
+	do {
+		struct folio *folio = folioq_folio(folioq, slot);
+		size_t fsize = folioq_folio_size(folioq, slot);
+
+		if (offset < fsize) {
+			size_t part = umin(maxsize, fsize - offset);
+			bool ok;
+
+			ok = smbdirect_map_sges_single_page(state,
+							    folio_page(folio, 0),
+							    offset,
+							    part);
+			if (!ok)
+				return -EIO;
+
+			offset += part;
+			ret += part;
+			maxsize -= part;
+		}
+
+		if (offset >= fsize) {
+			offset = 0;
+			slot++;
+			if (slot >= folioq_nr_slots(folioq)) {
+				if (!folioq->next) {
+					WARN_ON_ONCE(ret < iter->count);
+					break;
+				}
+				folioq = folioq->next;
+				slot = 0;
+			}
+		}
+	} while (state->num_sge < state->max_sge && maxsize > 0);
+
+	iter->folioq = folioq;
+	iter->folioq_slot = slot;
+	iter->iov_offset = offset;
+	iter->count -= ret;
+	return ret;
+}
+
+/*
+ * Extract page fragments from up to the given amount of the source iterator
+ * and build up an ib_sge list that refers to all of those bits.  The ib_sge list
+ * is appended to, up to the maximum number of elements set in the parameter
+ * block.
+ *
+ * The extracted page fragments are not pinned or ref'd in any way; if an
+ * IOVEC/UBUF-type iterator is to be used, it should be converted to a
+ * BVEC-type iterator and the pages pinned, ref'd or otherwise held in some
+ * way.
+ */
+__maybe_unused /* this is temporary while this file is included in others */
+static ssize_t smbdirect_map_sges_from_iter(struct iov_iter *iter, size_t len,
+					    struct smbdirect_map_sges *state)
+{
+	ssize_t ret;
+	size_t before = state->num_sge;
+
+	if (WARN_ON_ONCE(iov_iter_rw(iter) != ITER_SOURCE))
+		return -EIO;
+
+	switch (iov_iter_type(iter)) {
+	case ITER_BVEC:
+		ret = smbdirect_map_sges_from_bvec(iter, state, len);
+		break;
+	case ITER_KVEC:
+		ret = smbdirect_map_sges_from_kvec(iter, state, len);
+		break;
+	case ITER_FOLIOQ:
+		ret = smbdirect_map_sges_from_folioq(iter, state, len);
+		break;
+	default:
+		WARN_ONCE(1, "iov_iter_type[%u]\n", iov_iter_type(iter));
+		return -EIO;
+	}
+
+	if (ret < 0) {
+		while (state->num_sge > before) {
+			struct ib_sge *sge = &state->sge[state->num_sge--];
+
+			ib_dma_unmap_page(state->device,
+					  sge->addr,
+					  sge->length,
+					  state->direction);
+		}
+	}
+
+	return ret;
+}
-- 
2.43.0


