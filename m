Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D44CD1CA3D9
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 08:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BVUjOCMD2Mn0jWmHZVYSRCxb/dMWrFF+DzB/urS1HDs=; b=v6OgNPWqnYEAfjtaJhJw/cnbQC
	/yqX+3KU1KtHFqF4WVyGklGeGkUNr2KL239QjiUeJcOMBJiEaI1vh15hIjuX06CBXf2EwRNY/ZGx5
	Jl2Ns96ixj/1IL37ZTHvpB5XyCrKRpKKH73qcsKhP7vkdZtZ17Y4U6Rgncrk/DCdw6ervAcAewl2w
	Ba5z0F0LclDu7zJ1sdVdEiV71DPbDP+bCXe4vznEpPknYSzp0oc8sjzRN2Llr6LC2bn25Z5aDVh05
	e2ZKg6V5I2YV3Qrabdj+WR56Sm34DB6wR7FR6cPnPkUyjYM6m0SxJ9jFnB2tZwUmAJ8Xf74mQhysU
	d6ROouFg==;
Received: from localhost ([::1]:56868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWwU8-003DTH-J5; Fri, 08 May 2020 06:27:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49940) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWwTy-003DTA-44
 for samba-technical@lists.samba.org; Fri, 08 May 2020 06:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=BVUjOCMD2Mn0jWmHZVYSRCxb/dMWrFF+DzB/urS1HDs=; b=19MnV4lYeQ56OPsyyGV20sEgR5
 arwl1OdfQdrMjI00WzbL8kT8Ilk4FWAa11+X/Jg3m59Q+gguDSqvwH02ur/Zq57HT72Py51Wpilg/
 dAAfW9Ye9mP3NRTwzFVilzCzaIypG1Jx1IC0lPgz7XYbsjHpF8EzeSTN8xOEazEh4z8oNbSGeNLLl
 QU1BGMwVbH7EmZ9AXHNWv/xUj9wO42U6qmrLJXHUiaYHxmwVB45966Epuzpm3kNG4ROBqPEqPtEDp
 PzJQx0rNxpSmv4lIiKE8VMmPxPciu+dj134/Z2rAU4QWjjLqeqjt3+qniMDWYGs0QWpy2U8xqjxyR
 ErhOTbGNZngxrPZEq3OAxxkuYTrll5r5rAxG7W0zhIZPTOI4gjzEKIOmvY1UnSvdLaLf9FH1c8bjt
 hEMCyOxSiJmex78qfSJIUyLqZ8hnI+CPdfRmcbzITKOyE22v2WdSEpcm0TiaDmfrNhJS1qyyjSJ+Q
 3Lprydh1HnY6pMzJBZbK0IiN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWwTr-0001XX-T1; Fri, 08 May 2020 06:27:35 +0000
Date: Thu, 7 May 2020 23:27:25 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200508062725.GB28687@jeremy-acer>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer>
 <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2020 at 10:39:38AM +0530, Anoop C S wrote:
> 
> Your patch fixes mismatch in SHA256 checksum of 100 bin files copied
> using Windows explorer in my environment.
> 
> > If so I'll fix it up to be production-ready,
> > (for example I think I can get rid of the
> > immediate event useage) fix the pwrite case
> > and then cut it onto bite-sized reviewable chunks.

OK, here's the "production ready" version.
Gets rid of the crappy immediate event.

Still doesn't fix the io_uring pwrite issue
but if can confirm that this version also fixes
the problem (and it's a much cleaner patchset :-)
then I'll add the pwrite fixes next and I'll
try running in CI.

Then we should have a fix for io_uring in 4.12 !

Cheers,

Jeremy.

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=io_uring_short_read
Content-Transfer-Encoding: quoted-printable

=46rom f3c7199d6f7513c549e6acfaef2e49e555089ae9 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 22:39:13 -0700
Subject: [PATCH 1/7] s3: VFS: io_uring. Add opcode field to struct
 vfs_io_uring_request.

Fill it in in the callers. The callback is going to need to
know what kind of operation just completed in order to cope
with short IO read/writes.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_io_uring.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 378e48d112f..124704fc7bf 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -37,10 +37,17 @@ struct vfs_io_uring_config {
 	struct vfs_io_uring_request *pending;
 };
=20
+enum vfs_io_uring_opcode {
+	SMB_VFS_IO_URING_PREAD,
+	SMB_VFS_IO_URING_PWRITE,
+	SMB_VFS_IO_URING_FSYNC
+};
+
 struct vfs_io_uring_request {
 	struct vfs_io_uring_request *prev, *next;
 	struct vfs_io_uring_request **list_head;
 	struct vfs_io_uring_config *config;
+	enum vfs_io_uring_opcode opcode;
 	struct tevent_req *req;
 	void *state;
 	struct io_uring_sqe sqe;
@@ -319,6 +326,7 @@ static struct tevent_req *vfs_io_uring_pread_send(struc=
t vfs_handle_struct *hand
 	state->ur.config =3D config;
 	state->ur.req =3D req;
 	state->ur.state =3D state;
+	state->ur.opcode =3D SMB_VFS_IO_URING_PREAD;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
 				     state->ur.profile_bytes, n);
@@ -399,6 +407,7 @@ static struct tevent_req *vfs_io_uring_pwrite_send(stru=
ct vfs_handle_struct *han
 	state->ur.config =3D config;
 	state->ur.req =3D req;
 	state->ur.state =3D state;
+	state->ur.opcode =3D SMB_VFS_IO_URING_PWRITE;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pwrite, profile_p,
 				     state->ur.profile_bytes, n);
@@ -476,6 +485,7 @@ static struct tevent_req *vfs_io_uring_fsync_send(struc=
t vfs_handle_struct *hand
 	state->ur.config =3D config;
 	state->ur.req =3D req;
 	state->ur.state =3D state;
+	state->ur.opcode =3D SMB_VFS_IO_URING_FSYNC;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_fsync, profile_p,
 				     state->ur.profile_bytes, 0);
--=20
2.20.1


=46rom 4503a5fb6dae2065e27596dd725460953bbc8038 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 22:42:57 -0700
Subject: [PATCH 2/7] s3: VFS: Rename vfs_io_uring_queue_run() ->
 _vfs_io_uring_queue_run().

Call from a wrapper function. We'll need this as
eventually we'll need to call this in a loop for
short IO retries.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_io_uring.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 124704fc7bf..047b534b384 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -226,7 +226,7 @@ static int vfs_io_uring_connect(vfs_handle_struct *hand=
le, const char *service,
 	return 0;
 }
=20
-static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
+static void _vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
 {
 	struct vfs_io_uring_request *cur =3D NULL, *next =3D NULL;
 	struct io_uring_cqe *cqe =3D NULL;
@@ -283,6 +283,11 @@ static void vfs_io_uring_queue_run(struct vfs_io_uring=
_config *config)
 	io_uring_cq_advance(&config->uring, nr);
 }
=20
+static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
+{
+	_vfs_io_uring_queue_run(config);
+}
+
 static void vfs_io_uring_fd_handler(struct tevent_context *ev,
 				    struct tevent_fd *fde,
 				    uint16_t flags,
--=20
2.20.1


=46rom 0af4ecfa3d49987c3626ea9cab3ec70135e873f4 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 22:46:11 -0700
Subject: [PATCH 3/7] s3: VFS: io_uring. Change _vfs_io_uring_queue_run()
 funtion to return a bool.

If true, it means retry the submit calls. Currently
always returns false.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_io_uring.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 047b534b384..d1a5af6c7a7 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -226,7 +226,7 @@ static int vfs_io_uring_connect(vfs_handle_struct *hand=
le, const char *service,
 	return 0;
 }
=20
-static void _vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
+static bool _vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
 {
 	struct vfs_io_uring_request *cur =3D NULL, *next =3D NULL;
 	struct io_uring_cqe *cqe =3D NULL;
@@ -235,12 +235,13 @@ static void _vfs_io_uring_queue_run(struct vfs_io_uri=
ng_config *config)
 	struct timespec start_time;
 	struct timespec end_time;
 	int ret;
+	bool need_retry =3D false;
=20
 	PROFILE_TIMESTAMP(&start_time);
=20
 	if (config->uring.ring_fd =3D=3D -1) {
 		vfs_io_uring_config_destroy(config, -ESTALE, __location__);
-		return;
+		return false;
 	}
=20
 	for (cur =3D config->queue; cur !=3D NULL; cur =3D next) {
@@ -269,7 +270,7 @@ static void _vfs_io_uring_queue_run(struct vfs_io_uring=
_config *config)
 		/* We just retry later */
 	} else if (ret < 0) {
 		vfs_io_uring_config_destroy(config, ret, __location__);
-		return;
+		return false;
 	}
=20
 	PROFILE_TIMESTAMP(&end_time);
@@ -281,11 +282,16 @@ static void _vfs_io_uring_queue_run(struct vfs_io_uri=
ng_config *config)
 	}
=20
 	io_uring_cq_advance(&config->uring, nr);
+	return need_retry;
 }
=20
 static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
 {
-	_vfs_io_uring_queue_run(config);
+	bool need_retry;
+
+	do {
+		need_retry =3D _vfs_io_uring_queue_run(config);
+	} while (need_retry);
 }
=20
 static void vfs_io_uring_fd_handler(struct tevent_context *ev,
--=20
2.20.1


=46rom 8a4eebb653279a8458a95cf2d99f7262203c1ffa Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 22:50:07 -0700
Subject: [PATCH 4/7] s3: VFS: Extend struct vfs_io_uring_pread_state to sto=
re
 the original request values.

We'll need these later when we decide if a read was short or not.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_io_uring.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index d1a5af6c7a7..18dee5e59d5 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -312,6 +312,12 @@ static void vfs_io_uring_fd_handler(struct tevent_cont=
ext *ev,
 struct vfs_io_uring_pread_state {
 	struct vfs_io_uring_request ur;
 	struct iovec iov;
+	/* We have to remember the original values in case of short read. */
+	struct files_struct *fsp;
+	void *data;
+	size_t total_toread;
+	ssize_t total_read;
+	off_t offset;
 };
=20
 static struct tevent_req *vfs_io_uring_pread_send(struct vfs_handle_struct=
 *handle,
@@ -338,6 +344,10 @@ static struct tevent_req *vfs_io_uring_pread_send(stru=
ct vfs_handle_struct *hand
 	state->ur.req =3D req;
 	state->ur.state =3D state;
 	state->ur.opcode =3D SMB_VFS_IO_URING_PREAD;
+	state->fsp =3D fsp;
+	state->data =3D data;
+	state->total_toread =3D n;
+	state->offset =3D offset;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
 				     state->ur.profile_bytes, n);
--=20
2.20.1


=46rom dc14398334d7db8c9e88db49a9600ea9aa4f1422 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 23:00:42 -0700
Subject: [PATCH 5/7] s3: VFS: io_uring. Add is_io_uring_pread_complete()
 funtion to check for short reads.

Currently commented out, not called.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_io_uring.c | 56 ++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 18dee5e59d5..0afd8c0ed60 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -226,6 +226,25 @@ static int vfs_io_uring_connect(vfs_handle_struct *han=
dle, const char *service,
 	return 0;
 }
=20
+#if 0
+static bool is_io_uring_pread_complete(struct vfs_io_uring_request *cur,
+				const struct io_uring_cqe *cqe);
+
+/*
+ * Return true if it was a pread and the bytes transferred
+ * are less than requested.
+ */
+
+static bool vfs_io_uring_complete(struct vfs_io_uring_request *cur,
+				const struct io_uring_cqe *cqe)
+{
+	if (cur->opcode =3D=3D SMB_VFS_IO_URING_PREAD) {
+		return is_io_uring_pread_complete(cur, cqe);
+	}
+	return true;
+}
+#endif
+
 static bool _vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
 {
 	struct vfs_io_uring_request *cur =3D NULL, *next =3D NULL;
@@ -400,6 +419,43 @@ static ssize_t vfs_io_uring_pread_recv(struct tevent_r=
eq *req,
 	return ret;
 }
=20
+#if 0
+/* Returns false if more to read. Updates the total_read count. */
+
+static bool is_io_uring_pread_complete(struct vfs_io_uring_request *cur,
+				const struct io_uring_cqe *cqe)
+{
+	struct tevent_req *req =3D talloc_get_type_abort(cur->req,
+				struct tevent_req);
+	struct vfs_io_uring_pread_state *state =3D tevent_req_data(
+				req, struct vfs_io_uring_pread_state);
+
+	if (cqe->res < 0) {
+		/* Error. Deal with it as normal. */
+		return true;
+	}
+
+	if (cqe->res =3D=3D 0) {
+		/* EOF. Deal with it as normal. */
+		return true;
+	}
+
+	state->total_read +=3D cqe->res;
+
+	if (state->total_read < state->total_toread ) {
+		/* More needed. */
+		DBG_DEBUG("file %s short read, wanted 0x%"PRIx64" at "
+			"offset 0x%"PRIx64" got 0x%"PRIx64"\n",
+			fsp_str_dbg(state->fsp),
+			(uint64_t)state->total_toread,
+			(uint64_t)state->offset,
+			(uint64_t)state->total_read);
+		return false;
+	}
+	return true;
+}
+#endif
+
 struct vfs_io_uring_pwrite_state {
 	struct vfs_io_uring_request ur;
 	struct iovec iov;
--=20
2.20.1


=46rom cb869ac6da3c00727559cee93942015b65bd7ba9 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 23:07:47 -0700
Subject: [PATCH 6/7] s3: VFS: io_uring. Add vfs_io_uring_pread_op_reschedul=
e()

Reschedules short IO to completion. Not yet called
so commented out.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_io_uring.c | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 0afd8c0ed60..87a8f838247 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -243,6 +243,17 @@ static bool vfs_io_uring_complete(struct vfs_io_uring_=
request *cur,
 	}
 	return true;
 }
+
+static void vfs_io_uring_pread_op_reschedule(struct vfs_io_uring_config *c=
onfig,
+				struct vfs_io_uring_request *cur);
+
+static void vfs_io_uring_op_reschedule(struct vfs_io_uring_config *config,
+				struct vfs_io_uring_request *cur)
+{
+	if (cur->opcode =3D=3D SMB_VFS_IO_URING_PREAD) {
+		vfs_io_uring_pread_op_reschedule(config, cur);
+	}
+}
 #endif
=20
 static bool _vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
@@ -454,6 +465,40 @@ static bool is_io_uring_pread_complete(struct vfs_io_u=
ring_request *cur,
 	}
 	return true;
 }
+
+/*
+ * Reschedule short read. Adjust the buffer, length
+ * and offsets and resubmit.
+ */
+
+static void vfs_io_uring_pread_op_reschedule(struct vfs_io_uring_config *c=
onfig,
+				struct vfs_io_uring_request *cur)
+{
+	struct tevent_req *req =3D talloc_get_type_abort(cur->req,
+				struct tevent_req);
+	struct vfs_io_uring_pread_state *state =3D tevent_req_data(
+				req, struct vfs_io_uring_pread_state);
+	off_t offset;
+	uint8_t *new_base =3D (uint8_t *)state->data + state->total_read;
+
+	/* Set up the parameters for the remaining IO. */
+	state->iov.iov_base =3D (void *)new_base;
+	state->iov.iov_len =3D state->total_toread - state->total_read;
+	offset =3D state->offset + state->total_read;
+
+	DBG_DEBUG("reschedule read on file %s. Get 0x%"PRIx64" at "
+			"offset 0x%"PRIx64"\n",
+			fsp_str_dbg(state->fsp),
+			(uint64_t)state->iov.iov_len,
+			(uint64_t)offset);
+
+	io_uring_prep_readv(&cur->sqe,
+			state->fsp->fh->fd,
+			&state->iov,
+			1,
+			offset);
+	io_uring_sqe_set_data(&cur->sqe, cur);
+}
 #endif
=20
 struct vfs_io_uring_pwrite_state {
--=20
2.20.1


=46rom 6f58fd4d442bf043f83dcc0c160a1943aea31743 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 23:12:53 -0700
Subject: [PATCH 7/7] s3: VFS: io_uring. On cqe completion, check for short
 reads.

If any occurred, call the resheduling functions and cause
_vfs_io_uring_queue_run() to be retried.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_io_uring.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 87a8f838247..80ef1ac0161 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -226,7 +226,6 @@ static int vfs_io_uring_connect(vfs_handle_struct *hand=
le, const char *service,
 	return 0;
 }
=20
-#if 0
 static bool is_io_uring_pread_complete(struct vfs_io_uring_request *cur,
 				const struct io_uring_cqe *cqe);
=20
@@ -254,7 +253,6 @@ static void vfs_io_uring_op_reschedule(struct vfs_io_ur=
ing_config *config,
 		vfs_io_uring_pread_op_reschedule(config, cur);
 	}
 }
-#endif
=20
 static bool _vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
 {
@@ -307,7 +305,24 @@ static bool _vfs_io_uring_queue_run(struct vfs_io_urin=
g_config *config)
=20
 	io_uring_for_each_cqe(&config->uring, cqhead, cqe) {
 		cur =3D (struct vfs_io_uring_request *)io_uring_cqe_get_data(cqe);
-		vfs_io_uring_finish_req(cur, cqe, end_time, __location__);
+		if (vfs_io_uring_complete(cur, cqe)) {
+			/* Full IO completed. We're done. */
+			vfs_io_uring_finish_req(cur, cqe, end_time, __location__);
+		} else {
+			/* Short read or write. We must reschedule. */
+			/* Take us off the pending list. */
+			DLIST_REMOVE(config->pending, cur);
+			cur->list_head =3D NULL;
+
+			vfs_io_uring_op_reschedule(config, cur);
+
+			/* Put us back on the queued list. */
+			DLIST_ADD_END(config->queue, cur);
+			cur->list_head =3D &config->queue;
+
+			/* Cause the caller to call us again. */
+			need_retry =3D true;
+		}
 		nr++;
 	}
=20
@@ -423,14 +438,13 @@ static ssize_t vfs_io_uring_pread_recv(struct tevent_=
req *req,
 		ret =3D -1;
 	} else {
 		vfs_aio_state->error =3D 0;
-		ret =3D state->ur.cqe.res;
+		ret =3D state->total_read;
 	}
=20
 	tevent_req_received(req);
 	return ret;
 }
=20
-#if 0
 /* Returns false if more to read. Updates the total_read count. */
=20
 static bool is_io_uring_pread_complete(struct vfs_io_uring_request *cur,
@@ -499,7 +513,6 @@ static void vfs_io_uring_pread_op_reschedule(struct vfs=
_io_uring_config *config,
 			offset);
 	io_uring_sqe_set_data(&cur->sqe, cur);
 }
-#endif
=20
 struct vfs_io_uring_pwrite_state {
 	struct vfs_io_uring_request ur;
--=20
2.20.1


--VbJkn9YxBvnuCH5J--

