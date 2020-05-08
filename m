Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 682BD1CA1CB
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 06:08:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BRhcNRKxWIGR6xPRdFHU3g945vAcB5S8r1g3P8j60Lo=; b=JOIeyY0Mj1VaEQdLTi0nKZMZXH
	FqMPU1hfpmsNpIQHqU3+DXOAkuFADF1dZJkYCSIpCxa8QwVLZNTRT397mYCIatBWYxE5hqMFJo8bQ
	yYqKVUenzVG0bw4ozR3JYWwTGXToLqtjXa+4lThHt3CZ2DN/2Xe5YD3HmzQ48Cy4ev7kjp2fQme1I
	S1lh5+W5qQz5heRfhpT2S68S7+A0KbBf1Ei2cnd/PXnSuesZmOS4RGcO5ek+7raEwFOxfARYipUG3
	JJyM3QCntor/0GS1dGci/CyZamh2RMpYtewDb1jevqn8V09lFvOCnV8OD52NQxkWALGZMC5wfxboe
	P0dyIdAA==;
Received: from localhost ([::1]:53902 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWuIL-003Cjt-4Z; Fri, 08 May 2020 04:07:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64420) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWuID-003Ciu-Ha
 for samba-technical@lists.samba.org; Fri, 08 May 2020 04:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=BRhcNRKxWIGR6xPRdFHU3g945vAcB5S8r1g3P8j60Lo=; b=v3FyAF/OdVSRVzxFovZIDiZODl
 AhG8TOR8OG+IhVF7HB6fwhUVYg1a/66wWy1J+URZd36wjFreHnhkZC7RLmv3JQ+S6g1hFu0z8jmE5
 J3rpU5qt2DBgTCCnukKT/Ug/F3P7M7hp2Q7ba8L/ZOdBPgkPwLKRQt6wZQwNuB1FbPu76DHIfku8o
 IsBkEfHnaPyX/5DTjvjupEp+8BQ2WzhLmaIPZA5ELO33pqwd3StWFCEONQtGeEUMx1vtxI9H6b79o
 M3O5jGh0R25fetR5dlfB4nQ73jtP7RW9JFjm+5aGwZDeIAkG1M4YluiQ2EnxzEtO9UKpjGiBqlEC3
 EW0FL/feaxln+Z49hDFFfWxhfATgCr11sETwUCmHetj9iUIDmqD4tKvaYnQmZKj/yXBppmI5jZx5X
 7RrR5ZRawhk25xEnLNsTpGY/NomofUZAGTVhaWHksfFz2d+I7Kkku9t8Z3IIFY/aoRr5BtnTYlqK2
 cxZx+2QJ6bHzKSK958lltGNe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWuI9-0007af-RZ; Fri, 08 May 2020 04:07:18 +0000
Date: Thu, 7 May 2020 21:07:11 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200508040711.GC3369@jeremy-acer>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline
In-Reply-To: <20200507213002.GG14929@jeremy-acer>
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


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 02:30:02PM -0700, Jeremy Allison wrote:
> On Wed, May 06, 2020 at 03:53:26PM +0530, Anoop C S via samba-technical wrote:
> > > reproduce the issue.
> > 
> > I could reproduce the difference in SHA256 checksum after copying a
> > directory with 100 copies of test file(provided by reporter) from
> > io_uring VFS module enabled share using Windows explorer(right-click-
> > >copy/paste). Only 5 out of 100 files had correct checksum after copy
> > operation :-/
> 
> Anoop,
> 
> I'm working on a fix for the vfs_io_uring module
> to retry short reads/writes.
> 
> Do you still have your test environment so
> you can test what I come up with ? I don't
> have a reproducer here at home so I'll be
> dependent on you to see if the fix works.

Anoop, here is a *MASSIVELY* prototype fix
for the io_uring short read problem. It still
is very ugly and contain extra debugs etc.

It works for me here if I enable the JRATEST
code that forces short reads if read_len > 4096,
but I never was able to reproduce the Windows
issue (my kernel isn't modern enough).

Can you test it on your Windows environment
and see if it fixes the SHA256 checksum problem
after copying 100 test files ?

If so I'll fix it up to be production-ready,
(for example I think I can get rid of the
immediate event useage) fix the pwrite case
and then cut it onto bite-sized reviewable chunks.

Cheers,

Jeremy.

--Y7xTucakfITjPcLV
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-WIP-io_uring-short-read-fix.patch"
Content-Transfer-Encoding: quoted-printable

=46rom baac8d196cf72a6264f865ceb7fd93f0d903609b Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 18:35:14 -0700
Subject: [PATCH] WIP: io_uring short read fix.

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_io_uring.c | 183 ++++++++++++++++++++++++++++++++-
 1 file changed, 181 insertions(+), 2 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 378e48d112f..3a53a955a11 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -32,15 +32,24 @@ struct vfs_io_uring_request;
=20
 struct vfs_io_uring_config {
 	struct io_uring uring;
+	struct tevent_context *ev;
 	struct tevent_fd *fde;
+	struct tevent_immediate *im;
 	struct vfs_io_uring_request *queue;
 	struct vfs_io_uring_request *pending;
 };
=20
+enum vfs_io_uring_opcode {
+	VFS_IO_URING_PREAD,
+	VFS_IO_URING_PWRITE,
+	VFS_IO_URING_FSYNC
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
@@ -147,6 +156,10 @@ static void vfs_io_uring_fd_handler(struct tevent_cont=
ext *ev,
 				    uint16_t flags,
 				    void *private_data);
=20
+static void vfs_io_uring_reschedule_run_handler(struct tevent_context *ctx,
+						struct tevent_immediate *im,
+						void *private_data);
+
 static int vfs_io_uring_connect(vfs_handle_struct *handle, const char *ser=
vice,
 			    const char *user)
 {
@@ -216,9 +229,56 @@ static int vfs_io_uring_connect(vfs_handle_struct *han=
dle, const char *service,
 		return -1;
 	}
=20
+	config->ev =3D handle->conn->sconn->ev_ctx;
+
+	config->im =3D tevent_create_immediate(config);
+	if (config->im =3D=3D NULL) {
+		ret =3D errno;
+		SMB_VFS_NEXT_DISCONNECT(handle);
+		errno =3D ret;
+		return -1;
+	}
 	return 0;
 }
=20
+static bool is_io_uring_pread_complete(struct vfs_io_uring_request *cur,
+				       const struct io_uring_cqe *cqe);
+
+#if 0
+static bool is_io_uring_pwrite_complete(struct vfs_io_uring_request *cur,
+					const struct io_uring_cqe *cqe);
+#endif
+
+/*
+ * Return true if it was a pread/pwrite and the bytes transferred
+ * are less than requested.
+ */
+
+static bool vfs_io_uring_complete(struct vfs_io_uring_request *cur,
+				  const struct io_uring_cqe *cqe)
+{
+	if (cur->opcode =3D=3D VFS_IO_URING_PREAD) {
+		return is_io_uring_pread_complete(cur, cqe);
+	}
+#if 0
+	} else if (cur->opcode =3D=3D VFS_IO_URING_PWRITE) {
+		return is_io_uring_pwrite_complete(cur, cqe);
+	}
+#endif
+	return true;
+}
+
+static void vfs_io_uring_pread_op_reschedule(struct vfs_io_uring_config *c=
onfig,
+					     struct vfs_io_uring_request *cur);
+
+static void vfs_io_uring_op_reschedule(struct vfs_io_uring_config *config,
+				       struct vfs_io_uring_request *cur)
+{
+	if (cur->opcode =3D=3D VFS_IO_URING_PREAD) {
+		vfs_io_uring_pread_op_reschedule(config, cur);
+	}
+}
+
 static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
 {
 	struct vfs_io_uring_request *cur =3D NULL, *next =3D NULL;
@@ -228,6 +288,7 @@ static void vfs_io_uring_queue_run(struct vfs_io_uring_=
config *config)
 	struct timespec start_time;
 	struct timespec end_time;
 	int ret;
+	bool need_resubmit =3D false;
=20
 	PROFILE_TIMESTAMP(&start_time);
=20
@@ -269,11 +330,34 @@ static void vfs_io_uring_queue_run(struct vfs_io_urin=
g_config *config)
=20
 	io_uring_for_each_cqe(&config->uring, cqhead, cqe) {
 		cur =3D (struct vfs_io_uring_request *)io_uring_cqe_get_data(cqe);
-		vfs_io_uring_finish_req(cur, cqe, end_time, __location__);
+		if (vfs_io_uring_complete(cur, cqe)) {
+			/* Done. */
+			vfs_io_uring_finish_req(cur, cqe, end_time, __location__);
+		} else {
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
+			need_resubmit =3D true;
+		}
 		nr++;
 	}
=20
 	io_uring_cq_advance(&config->uring, nr);
+
+	if (need_resubmit) {
+		/* This is essentially the same as GOTO top, but cleaner :-). */
+		tevent_schedule_immediate(config->im,
+					  config->ev,
+					  vfs_io_uring_reschedule_run_handler,
+					  config);
+	}
 }
=20
 static void vfs_io_uring_fd_handler(struct tevent_context *ev,
@@ -291,9 +375,25 @@ static void vfs_io_uring_fd_handler(struct tevent_cont=
ext *ev,
 	vfs_io_uring_queue_run(config);
 }
=20
+static void vfs_io_uring_reschedule_run_handler(struct tevent_context *ctx,
+						struct tevent_immediate *im,
+						void *private_data)
+{
+	struct vfs_io_uring_config *config =3D (struct vfs_io_uring_config *)
+						private_data;
+
+	vfs_io_uring_queue_run(config);
+}
+
 struct vfs_io_uring_pread_state {
 	struct vfs_io_uring_request ur;
 	struct iovec iov;
+	/* We have to remember the original values in case of short read. */
+	struct files_struct *fsp;
+	void *data;
+	size_t count;
+	ssize_t total_read;
+	off_t offset;
 };
=20
 static struct tevent_req *vfs_io_uring_pread_send(struct vfs_handle_struct=
 *handle,
@@ -319,6 +419,11 @@ static struct tevent_req *vfs_io_uring_pread_send(stru=
ct vfs_handle_struct *hand
 	state->ur.config =3D config;
 	state->ur.req =3D req;
 	state->ur.state =3D state;
+	state->ur.opcode =3D VFS_IO_URING_PREAD;
+	state->fsp =3D fsp;
+	state->data =3D data;
+	state->count =3D n;
+	state->offset =3D offset;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
 				     state->ur.profile_bytes, n);
@@ -326,6 +431,15 @@ static struct tevent_req *vfs_io_uring_pread_send(stru=
ct vfs_handle_struct *hand
=20
 	state->iov.iov_base =3D (void *)data;
 	state->iov.iov_len =3D n;
+
+#if 0
+/* JRATEST */
+	if (n > 4096) {
+		state->iov.iov_len -=3D 4096;
+	}
+/* JRATEST */
+#endif
+
 	io_uring_prep_readv(&state->ur.sqe,
 			    fsp->fh->fd,
 			    &state->iov, 1,
@@ -364,13 +478,76 @@ static ssize_t vfs_io_uring_pread_recv(struct tevent_=
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
+/* Returns false if more to read. Updates the total_read count. */
+
+static bool is_io_uring_pread_complete(struct vfs_io_uring_request *cur,
+			      const struct io_uring_cqe *cqe)
+{
+	struct tevent_req *req =3D talloc_get_type_abort(cur->req,
+					struct tevent_req);
+	struct vfs_io_uring_pread_state *state =3D tevent_req_data(
+			req, struct vfs_io_uring_pread_state);
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
+	if (state->total_read < state->count ) {
+		/* More needed. */
+		DBG_DEBUG("short read, %p wanted %u at offset %u, got %u\n",
+			state->iov.iov_base,
+			(unsigned int)state->count,
+			(unsigned int)state->offset,
+			(unsigned int)state->total_read);
+		return false;
+	}
+	return true;
+}
+
+/* Short read. Adjust the buffer, length and offsets and resubmit. */
+static void vfs_io_uring_pread_op_reschedule(struct vfs_io_uring_config *c=
onfig,
+					     struct vfs_io_uring_request *cur)
+{
+	struct tevent_req *req =3D talloc_get_type_abort(cur->req,
+					struct tevent_req);
+	struct vfs_io_uring_pread_state *state =3D tevent_req_data(
+			req, struct vfs_io_uring_pread_state);
+	off_t offset;
+	uint8_t *new_base =3D (uint8_t *)state->data + state->total_read;
+
+	/* Set up the parameters for the remaining IO. */
+	state->iov.iov_base =3D (void *)new_base;
+	state->iov.iov_len =3D state->count - state->total_read;
+	offset =3D state->offset + state->total_read;
+
+	DBG_DEBUG("reschedule, %p get %u, at offset %u\n",
+			state->iov.iov_base,
+			(unsigned int)state->iov.iov_len,
+			(unsigned int)offset);
+
+	io_uring_prep_readv(&cur->sqe,
+			    state->fsp->fh->fd,
+			    &state->iov,
+			    1,
+			    offset);
+	io_uring_sqe_set_data(&cur->sqe, cur);
+}
+
 struct vfs_io_uring_pwrite_state {
 	struct vfs_io_uring_request ur;
 	struct iovec iov;
@@ -399,6 +576,7 @@ static struct tevent_req *vfs_io_uring_pwrite_send(stru=
ct vfs_handle_struct *han
 	state->ur.config =3D config;
 	state->ur.req =3D req;
 	state->ur.state =3D state;
+	state->ur.opcode =3D VFS_IO_URING_PWRITE;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pwrite, profile_p,
 				     state->ur.profile_bytes, n);
@@ -476,6 +654,7 @@ static struct tevent_req *vfs_io_uring_fsync_send(struc=
t vfs_handle_struct *hand
 	state->ur.config =3D config;
 	state->ur.req =3D req;
 	state->ur.state =3D state;
+	state->ur.opcode =3D VFS_IO_URING_FSYNC;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_fsync, profile_p,
 				     state->ur.profile_bytes, 0);
--=20
2.20.1


--Y7xTucakfITjPcLV--

