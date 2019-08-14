Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936D8CA06
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 06:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=HOxVYKqenyNO+MAo7nwccMvXzNmwNK4ZbMViElrvSJk=; b=JudFdmK4goiB0fSTefP75csyN6
	GpSB3HACjanz1wRBG4H338gk1Dbrq1Z3ZUauNa7Iec24+RzH9qctknusxYgf7v1agxyg2o8WV9nqv
	fzVsRr88R+JWW7rP23n6/9OPlUDjU55N3xpT0vppo//1KxNt2lGXQglpajDNQkgkWcFGg9J8hmkDV
	MMAAxuF+zCLMLpoxk3/oDCH24F0h2YRH1x72XuqKh/1nIFs0jKhwqXbGOGuybYt8gq1nOzvt7AtT+
	J1/4WweMRVtUP1vXnRMTCbSmy/PUphuoZtmreuSHjRAAHfRnfE/cY0nKmjjprHIZndIzoCd+6Jesq
	88hHsf6g==;
Received: from localhost ([::1]:40652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxkWh-006EDz-5e; Wed, 14 Aug 2019 04:04:43 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58281 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxkWb-006EDM-L7
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 04:04:40 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467bZ61lB4z9sML;
 Wed, 14 Aug 2019 14:04:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1565755470; bh=kEkrlm8ALyHohDT2dNKeloY6wzlJrzYMwhgvOtkGpDg=;
 h=Date:From:To:Subject:From;
 b=LZdUzOY4tY/Z2ZnM+tiX4kdiO8vrfC/zEO0PfBxDkCsjthO9znazMh9VS3qM7i8JW
 C7OBDpiAGvwt5lvP7PFoAlNFjRhD2i/ffgvwCa74cFqxXeq5DbXi34kxjRLJ0JTy0C
 5MVpVX0srGHmad4GFfigGTZxHWlpftXGLrz85B3Nrbp+OdiWVJGq7D7D6UtcXHHXV2
 lK+hkkCey1clsj5xfEvJ7yHDixTDOMscDNIMOAlLb7s6wfFMRSJjF8Ce1GesanojfM
 87mOfBe1Q8yluOXecaKtnX95D1E0oBQ5rimGbNa5hpOhbox+1tNXo7A8mvydAwVo/i
 d0+DAkXq4X1VA==
Date: Wed, 14 Aug 2019 14:04:28 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] The last of the easy CTDB csbuild fixups
Message-ID: <20190814140428.5e71c1a4@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/cOjqWUGOwE1cDL4AuSAZgIp"
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--MP_/cOjqWUGOwE1cDL4AuSAZgIp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This is probably the last of the completely trivial csbuild fixups for
CTDB.  Others will require a bit more thought.

Included in this pipeline:

  https://gitlab.com/samba-team/devel/samba/pipelines/76265339

Please review and maybe push...

peace & happiness,
martin

--MP_/cOjqWUGOwE1cDL4AuSAZgIp
Content-Type: text/x-patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ctdb-csbuild.patch

=46rom e8467ee43db4b05ca1f66e7194817dd3492e9c3e Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 1 Aug 2019 10:46:36 +1000
Subject: [PATCH 1/3] ctdb-common: Return value of ctdb_queue_length() should
 be unsigned
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Compiling with -Wsign-compare complains:

ctdb/server/ctdb_daemon.c: scope_hint: In function =E2=80=98daemon_queue_se=
nd=E2=80=99
ctdb/server/ctdb_daemon.c:259:40: warning: comparison of integer expression=
s of different signedness: =E2=80=98int=E2=80=99 and =E2=80=98uint32_t=E2=
=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wsign-compare]
...

The struct ctdb_queue member out_queue_length is actually uint32_t, so
just return that type.

Found by csbuild.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/common/common.h  | 2 +-
 ctdb/common/ctdb_io.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ctdb/common/common.h b/ctdb/common/common.h
index 79f6b9ed03a..c50b52a5eb5 100644
--- a/ctdb/common/common.h
+++ b/ctdb/common/common.h
@@ -27,7 +27,7 @@
 typedef void (*ctdb_queue_cb_fn_t)(uint8_t *data, size_t length,
 				   void *private_data);
=20
-int ctdb_queue_length(struct ctdb_queue *queue);
+uint32_t ctdb_queue_length(struct ctdb_queue *queue);
=20
 int ctdb_queue_send(struct ctdb_queue *queue, uint8_t *data, uint32_t leng=
th);
=20
diff --git a/ctdb/common/ctdb_io.c b/ctdb/common/ctdb_io.c
index c16eb7f67b7..000f71e4c20 100644
--- a/ctdb/common/ctdb_io.c
+++ b/ctdb/common/ctdb_io.c
@@ -72,7 +72,7 @@ struct ctdb_queue {
=20
=20
=20
-int ctdb_queue_length(struct ctdb_queue *queue)
+uint32_t ctdb_queue_length(struct ctdb_queue *queue)
 {
 	return queue->out_queue_length;
 }
--=20
2.20.1


=46rom 7538c8b6757d4cd3d30ddd69aef9da3d127147a9 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 1 Aug 2019 10:55:39 +1000
Subject: [PATCH 2/3] ctdb-daemon: Avoid signed/unsigned comparison by
 declaring as unsigned
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Compiling with -Wsign-compare complains:

ctdb/server/ctdb_call.c:831:12: warning: comparison of integer expressions =
of different signedness: =E2=80=98int=E2=80=99 and =E2=80=98uint32_t=E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wsign-compare]
  831 |  if (count <=3D ctdb_db->statistics.hot_keys[0].count) {
      |            ^~

and

ctdb/server/ctdb_call.c:844:13: warning: comparison of integer expressions =
of different signedness: =E2=80=98int=E2=80=99 and =E2=80=98uint32_t=E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wsign-compare]
  844 |   if (count <=3D ctdb_db->statistics.hot_keys[i].count) {
      |             ^~

Found by cs-build.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_call.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ctdb/server/ctdb_call.c b/ctdb/server/ctdb_call.c
index 346fe89010e..876ae448cca 100644
--- a/ctdb/server/ctdb_call.c
+++ b/ctdb/server/ctdb_call.c
@@ -822,7 +822,7 @@ ctdb_defer_pinned_down_request(struct ctdb_context *ctd=
b, struct ctdb_db_context
=20
 static void
 ctdb_update_db_stat_hot_keys(struct ctdb_db_context *ctdb_db, TDB_DATA key,
-			     int count)
+			     unsigned int count)
 {
 	int i, id;
 	char *keystr;
@@ -1983,7 +1983,7 @@ static void ctdb_migration_count_handler(TDB_DATA key=
, uint64_t counter,
 {
 	struct ctdb_db_context *ctdb_db =3D talloc_get_type_abort(
 		private_data, struct ctdb_db_context);
-	int value;
+	unsigned int value;
=20
 	value =3D (counter < INT_MAX ? counter : INT_MAX);
 	ctdb_update_db_stat_hot_keys(ctdb_db, key, value);
--=20
2.20.1


=46rom 8830f356632adef004c1588d051f1933a34bda12 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 1 Aug 2019 10:58:42 +1000
Subject: [PATCH 3/3] ctdb-daemon: Avoid signed/unsigned comparison by casti=
ng

Compiling with -Wsign-compare complains:

 1047 |  &&  (call->call_id =3D=3D CTDB_FETCH_WITH_HEADER_FUNC)) {
      |                     ^~

struct ctdb_call is a protocol element, so we can't simply change it.

Found by csbuild.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_call.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/server/ctdb_call.c b/ctdb/server/ctdb_call.c
index 876ae448cca..9e1c51bf57d 100644
--- a/ctdb/server/ctdb_call.c
+++ b/ctdb/server/ctdb_call.c
@@ -1044,7 +1044,7 @@ void ctdb_request_call(struct ctdb_context *ctdb, str=
uct ctdb_req_header *hdr)
 		}
 	}
 	if ((c->flags & CTDB_WANT_READONLY)=20
-	&&  (call->call_id =3D=3D CTDB_FETCH_WITH_HEADER_FUNC)) {
+	&&  ((unsigned int)call->call_id =3D=3D CTDB_FETCH_WITH_HEADER_FUNC)) {
 		TDB_DATA tdata;
=20
 		tdata =3D tdb_fetch(ctdb_db->rottdb, call->key);
--=20
2.20.1


--MP_/cOjqWUGOwE1cDL4AuSAZgIp--

