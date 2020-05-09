Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF811CBC9C
	for <lists+samba-technical@lfdr.de>; Sat,  9 May 2020 04:51:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Hi1MbllwtdvpTuLujYD81piKqxHPe3kW/iGJcPXvs9o=; b=O1OhL4A+qDf8ji/X57ejEmIZfV
	UprlnDUxA7AFlVvFDTZ8z3PFnY942lg5YVHF6DfdUW1NuLdTL4yZaVVzGpqsuFKu7GIenJSIZj1DG
	FX9RrDW81aoYHIG3aoojU+LmOJ5RV27+hwGP7nzd/y/JC19Q/kYIlMjquEWcO6ziEOYsjMUGOLF1O
	YHAEWR+NLK1pY/w/i2l4ewMZlUrCqq98RUXEoMaBPvk2dVIOrfJu8umKPd7F944vC0p5wfjlfIrg+
	eYx/A43aD5A/JXvnztfZgrgN0bM3D2W7j6/rrWpahfPFXZ/BXDmWPcwFG2x1ztkLP8YqplmU5jWWi
	hHv8nRMA==;
Received: from localhost ([::1]:57768 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXFZM-003MMS-3S; Sat, 09 May 2020 02:50:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14496) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXFZE-003MML-Qm
 for samba-technical@lists.samba.org; Sat, 09 May 2020 02:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Hi1MbllwtdvpTuLujYD81piKqxHPe3kW/iGJcPXvs9o=; b=JTXR5JHrIK/PJmGHdIc7uTT7O/
 CFnVKZx1u76E4bjxP9xfpipqwWBBffD/NWFNKmb5oUlDHyHzQR1zz7GXyGb+L1lPN4nBf7wZQtH5v
 GKV9oH1pqdbeZX+I1A1IsnSR9Y6VRKFitWIblomRwOcjJiitNmWh/T8xSOU05Gp2uvCQEcanPKX3L
 gP0vtG4yPnp49CLAR581/IiCB3owU3sDYA/jxSlviKtlhYJLDAMzcwY4wWjwkPdYoeMnZMeDYESf9
 CgYQUjJ6uw7oU28ezoeIzGPGdMS/1gEPFq1eJcpIKqcviI5824JEYC0zvm/quX/GzX8JEoC0Ky5tX
 TcUZ2Dkk/7ERTyWToZgTZr9yJ127DbQFuvBidREAlCXmIU/PcYRGYn/zwbmAlvRAbEZ3hE5RCJ29b
 txZNogybDVyB4CYvfDMWpZqmPMokCiqkVQrCfglbbL1n6XKZ/gGhaGs7hVHRSNyH4/bfVTvvh6k4K
 MHL2Mym/6F/UzHpJLBoETQ/L;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXFZC-0003rL-3D; Sat, 09 May 2020 02:50:18 +0000
Date: Fri, 8 May 2020 19:50:10 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200509025010.GA9523@jeremy-acer>
References: <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer>
 <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
 <20200508215055.GA2912@jeremy-acer>
 <9ba6f926-f0b5-6cd1-36f1-2ccdf1c8b5eb@samba.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <9ba6f926-f0b5-6cd1-36f1-2ccdf1c8b5eb@samba.org>
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 09, 2020 at 12:04:55AM +0200, Stefan Metzmacher via samba-technical wrote:
> Am 08.05.20 um 23:50 schrieb Jeremy Allison:
> > RB+ from me if you add a comment header above the function
> > as well as in the commit so it explains what it's doing.
> > 
> > Feel free to crib my ascii art to explain in the header
> > comment too :-).
> > 
> > Thanks for the cleanup !
> 
> I'll do that on Monday.

Here's an updated version with added
comments inside

[PATCH 20/29] vfs_io_uring: avoid stack recursion of vfs_io_uring_queue_run()

so I could actually (hopefully) understand
it if I have to go back and look at it in 5 years time :-).

No other changes.

Jeremy.

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=metze-fixup
Content-Transfer-Encoding: quoted-printable

=46rom e03017545b2f80ac81c7e340c7f771fd32783618 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 13:06:54 +0200
Subject: [PATCH 01/29] lib: util: Add sys_valid_io_range()

This implements the contraints of
[MS-FSA] 2.1.5.2 Server Requests a Read.

The special handling of [MS-FSA] 2.1.5.3 Server Requests a Write
with offset < 0, should be handled by higher layers!
Which means the check can also be used for writes.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 lib/util/sys_rw.c | 24 ++++++++++++++++++++++++
 lib/util/sys_rw.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/lib/util/sys_rw.c b/lib/util/sys_rw.c
index 9a6cdcaa606..6fa7ca57365 100644
--- a/lib/util/sys_rw.c
+++ b/lib/util/sys_rw.c
@@ -24,6 +24,30 @@
 #include "system/filesys.h"
 #include "lib/util/sys_rw.h"
=20
+bool sys_valid_io_range(off_t offset, size_t length)
+{
+	uint64_t last_byte_ofs;
+
+	if (offset < 0) {
+		return false;
+	}
+
+	if (offset > INT64_MAX) {
+		return false;
+	}
+
+	if (length > UINT32_MAX) {
+		return false;
+	}
+
+	last_byte_ofs =3D (uint64_t)offset + (uint64_t)length;
+	if (last_byte_ofs > INT64_MAX) {
+		return false;
+	}
+
+	return true;
+}
+
 /*******************************************************************
 A read wrapper that will deal with EINTR/EWOULDBLOCK
 ********************************************************************/
diff --git a/lib/util/sys_rw.h b/lib/util/sys_rw.h
index ab456d87b22..70864cb2b74 100644
--- a/lib/util/sys_rw.h
+++ b/lib/util/sys_rw.h
@@ -27,6 +27,7 @@
=20
 struct iovec;
=20
+bool sys_valid_io_range(off_t offset, size_t length);
 ssize_t sys_read(int fd, void *buf, size_t count);
 void sys_read_v(int fd, void *buf, size_t count);
 ssize_t sys_write(int fd, const void *buf, size_t count);
--=20
2.20.1


=46rom 7b28d10c95d744b3024aacd4b6e794f37a5a4a7e Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 12:32:48 -0700
Subject: [PATCH 02/29] lib: util: Add sys_pread_full().

A pread wrapper that will deal with EINTR and never return a short
read unless pread returns zero meaning EOF.

Thread-safe so may be used as a replacement for pread
inside pread_do() thread functions.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 lib/util/sys_rw.c | 35 +++++++++++++++++++++++++++++++++++
 lib/util/sys_rw.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/lib/util/sys_rw.c b/lib/util/sys_rw.c
index 6fa7ca57365..87efbfd367c 100644
--- a/lib/util/sys_rw.c
+++ b/lib/util/sys_rw.c
@@ -143,6 +143,41 @@ ssize_t sys_pread(int fd, void *buf, size_t count, off=
_t off)
 	return ret;
 }
=20
+/*******************************************************************
+ A pread wrapper that will deal with EINTR and never return a short
+ read unless pread returns zero meaning EOF.
+********************************************************************/
+
+ssize_t sys_pread_full(int fd, void *buf, size_t count, off_t off)
+{
+	ssize_t total_read =3D 0;
+	uint8_t *curr_buf =3D (uint8_t *)buf;
+	size_t curr_count =3D count;
+	off_t curr_off =3D off;
+
+	while (curr_count !=3D 0) {
+		ssize_t ret =3D sys_pread(fd,
+					curr_buf,
+					curr_count,
+					curr_off);
+
+		if (ret =3D=3D -1) {
+			return -1;
+		}
+		if (ret =3D=3D 0) {
+			/* EOF */
+			break;
+		}
+
+		curr_buf +=3D ret;
+		curr_count -=3D ret;
+		curr_off +=3D ret;
+
+		total_read +=3D ret;
+	}
+	return total_read;
+}
+
 /*******************************************************************
 A write wrapper that will deal with EINTR
 ********************************************************************/
diff --git a/lib/util/sys_rw.h b/lib/util/sys_rw.h
index 70864cb2b74..1e0dd3730a6 100644
--- a/lib/util/sys_rw.h
+++ b/lib/util/sys_rw.h
@@ -34,6 +34,7 @@ ssize_t sys_write(int fd, const void *buf, size_t count);
 void sys_write_v(int fd, const void *buf, size_t count);
 ssize_t sys_writev(int fd, const struct iovec *iov, int iovcnt);
 ssize_t sys_pread(int fd, void *buf, size_t count, off_t off);
+ssize_t sys_pread_full(int fd, void *buf, size_t count, off_t off);
 ssize_t sys_pwrite(int fd, const void *buf, size_t count, off_t off);
=20
 #endif
--=20
2.20.1


=46rom 3324354036b095661b4b7d4038fdcb1cc06e50db Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 13:09:50 +0200
Subject: [PATCH 03/29] sq pread_full

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 lib/util/sys_rw.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/util/sys_rw.c b/lib/util/sys_rw.c
index 87efbfd367c..bfeb2e6b466 100644
--- a/lib/util/sys_rw.c
+++ b/lib/util/sys_rw.c
@@ -154,6 +154,13 @@ ssize_t sys_pread_full(int fd, void *buf, size_t count=
, off_t off)
 	uint8_t *curr_buf =3D (uint8_t *)buf;
 	size_t curr_count =3D count;
 	off_t curr_off =3D off;
+	bool ok;
+
+	ok =3D sys_valid_io_range(off, count);
+	if (!ok) {
+		errno =3D EINVAL;
+		return -1;
+	}
=20
 	while (curr_count !=3D 0) {
 		ssize_t ret =3D sys_pread(fd,
@@ -169,12 +176,18 @@ ssize_t sys_pread_full(int fd, void *buf, size_t coun=
t, off_t off)
 			break;
 		}
=20
+		if (ret > curr_count) {
+			errno =3D EIO;
+			return -1;
+		}
+
 		curr_buf +=3D ret;
 		curr_count -=3D ret;
 		curr_off +=3D ret;
=20
 		total_read +=3D ret;
 	}
+
 	return total_read;
 }
=20
--=20
2.20.1


=46rom 4a5c932f8042560b3e3e1a2ce602b6e9efe143d5 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 12:34:32 -0700
Subject: [PATCH 04/29] lib: util: Add sys_pwrite_full().

A pwrite wrapper that will deal with EINTR and never return a short
write unless the file system returns an error. Copes with the
unspecified edge condition of pwrite returning zero by changing
the return to -1, errno =3D ENOSPC.

Thread-safe so may be used as a replacement for pwrite
inside pwrite_do() thread functions.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 lib/util/sys_rw.c | 35 +++++++++++++++++++++++++++++++++++
 lib/util/sys_rw.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/lib/util/sys_rw.c b/lib/util/sys_rw.c
index bfeb2e6b466..6d39bd3afb0 100644
--- a/lib/util/sys_rw.c
+++ b/lib/util/sys_rw.c
@@ -204,3 +204,38 @@ ssize_t sys_pwrite(int fd, const void *buf, size_t cou=
nt, off_t off)
 	} while (ret =3D=3D -1 && errno =3D=3D EINTR);
 	return ret;
 }
+
+/*******************************************************************
+ A pwrite wrapper that will deal with EINTR and never allow a short
+ write unless the file system returns an error.
+********************************************************************/
+
+ssize_t sys_pwrite_full(int fd, const void *buf, size_t count, off_t off)
+{
+	ssize_t total_written =3D 0;
+	const uint8_t *curr_buf =3D (const uint8_t *)buf;
+	size_t curr_count =3D count;
+	off_t curr_off =3D off;
+
+	while (curr_count !=3D 0) {
+		ssize_t ret =3D sys_pwrite(fd,
+					 curr_buf,
+					 curr_count,
+					 curr_off);
+
+		if (ret =3D=3D -1) {
+			return -1;
+		}
+		if (ret =3D=3D 0) {
+			/* Ensure we can never spin. */
+			errno =3D ENOSPC;
+			return -1;
+		}
+		curr_buf +=3D ret;
+		curr_count -=3D ret;
+		curr_off +=3D ret;
+
+		total_written +=3D ret;
+	}
+	return total_written;
+}
diff --git a/lib/util/sys_rw.h b/lib/util/sys_rw.h
index 1e0dd3730a6..b224ecb30ac 100644
--- a/lib/util/sys_rw.h
+++ b/lib/util/sys_rw.h
@@ -36,5 +36,6 @@ ssize_t sys_writev(int fd, const struct iovec *iov, int i=
ovcnt);
 ssize_t sys_pread(int fd, void *buf, size_t count, off_t off);
 ssize_t sys_pread_full(int fd, void *buf, size_t count, off_t off);
 ssize_t sys_pwrite(int fd, const void *buf, size_t count, off_t off);
+ssize_t sys_pwrite_full(int fd, const void *buf, size_t count, off_t off);
=20
 #endif
--=20
2.20.1


=46rom cf55e0a597acf602ffa67bbe4f2a168f0aa42905 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 13:10:14 +0200
Subject: [PATCH 05/29] sq pwrite_full

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 lib/util/sys_rw.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/util/sys_rw.c b/lib/util/sys_rw.c
index 6d39bd3afb0..d74395fc409 100644
--- a/lib/util/sys_rw.c
+++ b/lib/util/sys_rw.c
@@ -216,6 +216,13 @@ ssize_t sys_pwrite_full(int fd, const void *buf, size_=
t count, off_t off)
 	const uint8_t *curr_buf =3D (const uint8_t *)buf;
 	size_t curr_count =3D count;
 	off_t curr_off =3D off;
+	bool ok;
+
+	ok =3D sys_valid_io_range(off, count);
+	if (!ok) {
+		errno =3D EINVAL;
+		return -1;
+	}
=20
 	while (curr_count !=3D 0) {
 		ssize_t ret =3D sys_pwrite(fd,
@@ -231,11 +238,18 @@ ssize_t sys_pwrite_full(int fd, const void *buf, size=
_t count, off_t off)
 			errno =3D ENOSPC;
 			return -1;
 		}
+
+		if (ret > curr_count) {
+			errno =3D EIO;
+			return -1;
+		}
+
 		curr_buf +=3D ret;
 		curr_count -=3D ret;
 		curr_off +=3D ret;
=20
 		total_written +=3D ret;
 	}
+
 	return total_written;
 }
--=20
2.20.1


=46rom 7b45aa946f1ac9fb9075b1deb0edf7a2d3242b8e Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 12:42:10 -0700
Subject: [PATCH 06/29] s3: VFS: aio_fork: Change sys_pread() ->
 sys_pread_full() to protect against short reads.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_aio_fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source3/modules/vfs_aio_fork.c b/source3/modules/vfs_aio_fork.c
index a1fed5c0655..285b331ff9c 100644
--- a/source3/modules/vfs_aio_fork.c
+++ b/source3/modules/vfs_aio_fork.c
@@ -342,7 +342,7 @@ static void aio_child_loop(int sockfd, struct mmap_area=
 *map)
=20
 		switch (cmd_struct.cmd) {
 		case READ_CMD:
-			ret_struct.size =3D sys_pread(
+			ret_struct.size =3D sys_pread_full(
 				fd, discard_const(map->ptr), cmd_struct.n,
 				cmd_struct.offset);
 #if 0
--=20
2.20.1


=46rom 12153e3dc04b0b270d2da488a07fefa4b8d6440e Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 12:42:53 -0700
Subject: [PATCH 07/29] TODO s3: VFS: aio_fork: Change sys_pwrite() ->
 sys_pwrite_full() to protect against short writes.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>

TODO: check how clients behave...
TODO: where do we handle offset < 0 ???, see MS-FSA 2.1.5.3 Server Requests=
 a Write
---
 source3/modules/vfs_aio_fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source3/modules/vfs_aio_fork.c b/source3/modules/vfs_aio_fork.c
index 285b331ff9c..7c6f4b00fd0 100644
--- a/source3/modules/vfs_aio_fork.c
+++ b/source3/modules/vfs_aio_fork.c
@@ -353,7 +353,7 @@ static void aio_child_loop(int sockfd, struct mmap_area=
 *map)
 #endif
 			break;
 		case WRITE_CMD:
-			ret_struct.size =3D sys_pwrite(
+			ret_struct.size =3D sys_pwrite_full(
 				fd, discard_const(map->ptr), cmd_struct.n,
 				cmd_struct.offset);
 			break;
--=20
2.20.1


=46rom 55dfbe7b78431310a5881bd13170512c0dff88bc Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 12:43:34 -0700
Subject: [PATCH 08/29] s3: VFS: default. Change sys_pread() ->
 sys_pread_full() in SMB_VFS_PREAD() to protect against short reads.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_default.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source3/modules/vfs_default.c b/source3/modules/vfs_default.c
index c7f2020a9ea..26db45dccd0 100644
--- a/source3/modules/vfs_default.c
+++ b/source3/modules/vfs_default.c
@@ -734,7 +734,7 @@ static ssize_t vfswrap_pread(vfs_handle_struct *handle,=
 files_struct *fsp, void
=20
 #if defined(HAVE_PREAD) || defined(HAVE_PREAD64)
 	START_PROFILE_BYTES(syscall_pread, n);
-	result =3D sys_pread(fsp->fh->fd, data, n, offset);
+	result =3D sys_pread_full(fsp->fh->fd, data, n, offset);
 	END_PROFILE_BYTES(syscall_pread);
=20
 	if (result =3D=3D -1 && errno =3D=3D ESPIPE) {
--=20
2.20.1


=46rom 7b936fd911f07a711cdda8305083197e468d5f67 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 12:44:26 -0700
Subject: [PATCH 09/29] TODO: s3: VFS: default. Change sys_pwrite() ->
 sys_pwrite_full() in SMB_VFS_PWRITE() to protect against short writes.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>

TODO: check how clients behave...
TODO: where do we handle offset < 0 ???, see MS-FSA 2.1.5.3 Server Requests=
 a Write
---
 source3/modules/vfs_default.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source3/modules/vfs_default.c b/source3/modules/vfs_default.c
index 26db45dccd0..7f49e4f26c3 100644
--- a/source3/modules/vfs_default.c
+++ b/source3/modules/vfs_default.c
@@ -758,7 +758,7 @@ static ssize_t vfswrap_pwrite(vfs_handle_struct *handle=
, files_struct *fsp, cons
=20
 #if defined(HAVE_PWRITE) || defined(HAVE_PRWITE64)
 	START_PROFILE_BYTES(syscall_pwrite, n);
-	result =3D sys_pwrite(fsp->fh->fd, data, n, offset);
+	result =3D sys_pwrite_full(fsp->fh->fd, data, n, offset);
 	END_PROFILE_BYTES(syscall_pwrite);
=20
 	if (result =3D=3D -1 && errno =3D=3D ESPIPE) {
--=20
2.20.1


=46rom f33522e6d8e71f96d3736594e92a367e5104491f Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 12:45:10 -0700
Subject: [PATCH 10/29] s3: VFS: default. Change pread() -> sys_pread_full()=
 in
 SMB_VFS_PREAD_SEND() to protect against short reads.

Note that as sys_pread_full() deals with the EINTR case
we can remove the do {} while loop here.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 source3/modules/vfs_default.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/source3/modules/vfs_default.c b/source3/modules/vfs_default.c
index 7f49e4f26c3..a17eb0ce75c 100644
--- a/source3/modules/vfs_default.c
+++ b/source3/modules/vfs_default.c
@@ -838,10 +838,10 @@ static void vfs_pread_do(void *private_data)
=20
 	PROFILE_TIMESTAMP(&start_time);
=20
-	do {
-		state->ret =3D pread(state->fd, state->buf, state->count,
-				   state->offset);
-	} while ((state->ret =3D=3D -1) && (errno =3D=3D EINTR));
+	state->ret =3D sys_pread_full(state->fd,
+				    state->buf,
+				    state->count,
+				    state->offset);
=20
 	if (state->ret =3D=3D -1) {
 		state->vfs_aio_state.error =3D errno;
--=20
2.20.1


=46rom e083f8cf942b1b916915aaa447d5e0304f8dd271 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Thu, 7 May 2020 12:48:49 -0700
Subject: [PATCH 11/29] TODO: s3: VFS: default. Change pwrite() ->
 sys_pwrite_full() in SMB_VFS_PWRITE_SEND() to protect against short writes.

Note that as sys_pwrite_full() deals with the EINTR case
we can remove the do {} while loop here.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Jeremy Allison <jra@samba.org>

TODO: check how clients behave...
TODO: where do we handle offset < 0 ???, see MS-FSA 2.1.5.3 Server Requests=
 a Write
---
 source3/modules/vfs_default.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/source3/modules/vfs_default.c b/source3/modules/vfs_default.c
index a17eb0ce75c..522ea03260c 100644
--- a/source3/modules/vfs_default.c
+++ b/source3/modules/vfs_default.c
@@ -966,10 +966,10 @@ static void vfs_pwrite_do(void *private_data)
=20
 	PROFILE_TIMESTAMP(&start_time);
=20
-	do {
-		state->ret =3D pwrite(state->fd, state->buf, state->count,
-				   state->offset);
-	} while ((state->ret =3D=3D -1) && (errno =3D=3D EINTR));
+	state->ret =3D sys_pwrite_full(state->fd,
+				     state->buf,
+				     state->count,
+				     state->offset);
=20
 	if (state->ret =3D=3D -1) {
 		state->vfs_aio_state.error =3D errno;
--=20
2.20.1


=46rom ce51934834f57a11f809de6c591ea8559297edc4 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Wed, 6 May 2020 03:05:47 -0700
Subject: [PATCH 12/29] vfs_io_uring: fix the prefix for parametric options
 from 'vfs_io_uring' to 'io_uring'

This is what the manpage describes.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 378e48d112f..b409d075337 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -172,13 +172,13 @@ static int vfs_io_uring_connect(vfs_handle_struct *ha=
ndle, const char *service,
 	}
=20
 	num_entries =3D lp_parm_ulong(SNUM(handle->conn),
-				    "vfs_io_uring",
+				    "io_uring",
 				    "num_entries",
 				    128);
 	num_entries =3D MAX(num_entries, 1);
=20
 	sqpoll =3D lp_parm_bool(SNUM(handle->conn),
-			     "vfs_io_uring",
+			     "io_uring",
 			     "sqpoll",
 			     false);
 	if (sqpoll) {
--=20
2.20.1


=46rom 9bab78b4a836d5e34fba54e9ce0f16b350c66866 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 10:39:52 +0200
Subject: [PATCH 13/29] vfs_io_uring: replace vfs_io_uring_request->state wi=
th
 _tevent_req_data()

We don't need a direct pointer to the state...

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index b409d075337..988b309da52 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -42,7 +42,6 @@ struct vfs_io_uring_request {
 	struct vfs_io_uring_request **list_head;
 	struct vfs_io_uring_config *config;
 	struct tevent_req *req;
-	void *state;
 	struct io_uring_sqe sqe;
 	struct io_uring_cqe cqe;
 	struct timespec start_time;
@@ -58,8 +57,9 @@ static void vfs_io_uring_finish_req(struct vfs_io_uring_r=
equest *cur,
 	struct tevent_req *req =3D
 		talloc_get_type_abort(cur->req,
 		struct tevent_req);
+	void *state =3D _tevent_req_data(req);
=20
-	talloc_set_destructor(cur->state, NULL);
+	talloc_set_destructor(state, NULL);
 	if (cur->list_head !=3D NULL) {
 		DLIST_REMOVE((*cur->list_head), cur);
 		cur->list_head =3D NULL;
@@ -238,6 +238,7 @@ static void vfs_io_uring_queue_run(struct vfs_io_uring_=
config *config)
=20
 	for (cur =3D config->queue; cur !=3D NULL; cur =3D next) {
 		struct io_uring_sqe *sqe =3D NULL;
+		void *state =3D _tevent_req_data(cur->req);
=20
 		next =3D cur->next;
=20
@@ -246,7 +247,7 @@ static void vfs_io_uring_queue_run(struct vfs_io_uring_=
config *config)
 			break;
 		}
=20
-		talloc_set_destructor(cur->state,
+		talloc_set_destructor(state,
 			vfs_io_uring_request_state_deny_destructor);
 		DLIST_REMOVE(config->queue, cur);
 		*sqe =3D cur->sqe;
@@ -318,7 +319,6 @@ static struct tevent_req *vfs_io_uring_pread_send(struc=
t vfs_handle_struct *hand
 	}
 	state->ur.config =3D config;
 	state->ur.req =3D req;
-	state->ur.state =3D state;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
 				     state->ur.profile_bytes, n);
@@ -398,7 +398,6 @@ static struct tevent_req *vfs_io_uring_pwrite_send(stru=
ct vfs_handle_struct *han
 	}
 	state->ur.config =3D config;
 	state->ur.req =3D req;
-	state->ur.state =3D state;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pwrite, profile_p,
 				     state->ur.profile_bytes, n);
@@ -475,7 +474,6 @@ static struct tevent_req *vfs_io_uring_fsync_send(struc=
t vfs_handle_struct *hand
 	}
 	state->ur.config =3D config;
 	state->ur.req =3D req;
-	state->ur.state =3D state;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_fsync, profile_p,
 				     state->ur.profile_bytes, 0);
--=20
2.20.1


=46rom 5f358ddb06a75f8088c682f1780ddc21ba762374 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 10:42:59 +0200
Subject: [PATCH 14/29] vfs_io_uring: introduce
 vfs_io_uring_request->completion_fn()

We'll need to add more logic than a simple _tevent_req_done()

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 49 +++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 988b309da52..abdd4d16e9f 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -44,6 +44,8 @@ struct vfs_io_uring_request {
 	struct tevent_req *req;
 	struct io_uring_sqe sqe;
 	struct io_uring_cqe cqe;
+	void (*completion_fn)(struct vfs_io_uring_request *cur,
+			      const char *location);
 	struct timespec start_time;
 	struct timespec end_time;
 	SMBPROFILE_BYTES_ASYNC_STATE(profile_bytes);
@@ -74,7 +76,7 @@ static void vfs_io_uring_finish_req(struct vfs_io_uring_r=
equest *cur,
 	 * or tevent_req_defer_callback() being called
 	 * already.
 	 */
-	_tevent_req_done(req, location);
+	cur->completion_fn(cur, location);
 }
=20
 static void vfs_io_uring_config_destroy(struct vfs_io_uring_config *config,
@@ -297,6 +299,9 @@ struct vfs_io_uring_pread_state {
 	struct iovec iov;
 };
=20
+static void vfs_io_uring_pread_completion(struct vfs_io_uring_request *cur,
+					  const char *location);
+
 static struct tevent_req *vfs_io_uring_pread_send(struct vfs_handle_struct=
 *handle,
 					     TALLOC_CTX *mem_ctx,
 					     struct tevent_context *ev,
@@ -319,6 +324,7 @@ static struct tevent_req *vfs_io_uring_pread_send(struc=
t vfs_handle_struct *hand
 	}
 	state->ur.config =3D config;
 	state->ur.req =3D req;
+	state->ur.completion_fn =3D vfs_io_uring_pread_completion;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
 				     state->ur.profile_bytes, n);
@@ -344,6 +350,17 @@ static struct tevent_req *vfs_io_uring_pread_send(stru=
ct vfs_handle_struct *hand
 	return req;
 }
=20
+static void vfs_io_uring_pread_completion(struct vfs_io_uring_request *cur,
+					  const char *location)
+{
+	/*
+	 * We rely on being inside the _send() function
+	 * or tevent_req_defer_callback() being called
+	 * already.
+	 */
+	_tevent_req_done(cur->req, location);
+}
+
 static ssize_t vfs_io_uring_pread_recv(struct tevent_req *req,
 				  struct vfs_aio_state *vfs_aio_state)
 {
@@ -376,6 +393,9 @@ struct vfs_io_uring_pwrite_state {
 	struct iovec iov;
 };
=20
+static void vfs_io_uring_pwrite_completion(struct vfs_io_uring_request *cu=
r,
+					   const char *location);
+
 static struct tevent_req *vfs_io_uring_pwrite_send(struct vfs_handle_struc=
t *handle,
 					      TALLOC_CTX *mem_ctx,
 					      struct tevent_context *ev,
@@ -398,6 +418,7 @@ static struct tevent_req *vfs_io_uring_pwrite_send(stru=
ct vfs_handle_struct *han
 	}
 	state->ur.config =3D config;
 	state->ur.req =3D req;
+	state->ur.completion_fn =3D vfs_io_uring_pwrite_completion;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pwrite, profile_p,
 				     state->ur.profile_bytes, n);
@@ -423,6 +444,17 @@ static struct tevent_req *vfs_io_uring_pwrite_send(str=
uct vfs_handle_struct *han
 	return req;
 }
=20
+static void vfs_io_uring_pwrite_completion(struct vfs_io_uring_request *cu=
r,
+					   const char *location)
+{
+	/*
+	 * We rely on being inside the _send() function
+	 * or tevent_req_defer_callback() being called
+	 * already.
+	 */
+	_tevent_req_done(cur->req, location);
+}
+
 static ssize_t vfs_io_uring_pwrite_recv(struct tevent_req *req,
 				   struct vfs_aio_state *vfs_aio_state)
 {
@@ -454,6 +486,9 @@ struct vfs_io_uring_fsync_state {
 	struct vfs_io_uring_request ur;
 };
=20
+static void vfs_io_uring_fsync_completion(struct vfs_io_uring_request *cur,
+					  const char *location);
+
 static struct tevent_req *vfs_io_uring_fsync_send(struct vfs_handle_struct=
 *handle,
 					     TALLOC_CTX *mem_ctx,
 					     struct tevent_context *ev,
@@ -474,6 +509,7 @@ static struct tevent_req *vfs_io_uring_fsync_send(struc=
t vfs_handle_struct *hand
 	}
 	state->ur.config =3D config;
 	state->ur.req =3D req;
+	state->ur.completion_fn =3D vfs_io_uring_fsync_completion;
=20
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_fsync, profile_p,
 				     state->ur.profile_bytes, 0);
@@ -496,6 +532,17 @@ static struct tevent_req *vfs_io_uring_fsync_send(stru=
ct vfs_handle_struct *hand
 	return req;
 }
=20
+static void vfs_io_uring_fsync_completion(struct vfs_io_uring_request *cur,
+					  const char *location)
+{
+	/*
+	 * We rely on being inside the _send() function
+	 * or tevent_req_defer_callback() being called
+	 * already.
+	 */
+	_tevent_req_done(cur->req, location);
+}
+
 static int vfs_io_uring_fsync_recv(struct tevent_req *req,
 			      struct vfs_aio_state *vfs_aio_state)
 {
--=20
2.20.1


=46rom 3e98c34fa89bd6e7a6e6f0c24a91c58e9b957f83 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 10:52:52 +0200
Subject: [PATCH 15/29] vfs_io_uring: move error handling out of
 vfs_io_uring_pread_recv()

We should do that as early as possible and that's in
vfs_io_uring_pread_completion().

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index abdd4d16e9f..0d8e1833009 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -297,6 +297,7 @@ static void vfs_io_uring_fd_handler(struct tevent_conte=
xt *ev,
 struct vfs_io_uring_pread_state {
 	struct vfs_io_uring_request ur;
 	struct iovec iov;
+	size_t nread;
 };
=20
 static void vfs_io_uring_pread_completion(struct vfs_io_uring_request *cur,
@@ -353,12 +354,23 @@ static struct tevent_req *vfs_io_uring_pread_send(str=
uct vfs_handle_struct *hand
 static void vfs_io_uring_pread_completion(struct vfs_io_uring_request *cur,
 					  const char *location)
 {
+	struct vfs_io_uring_pread_state *state =3D tevent_req_data(
+		cur->req, struct vfs_io_uring_pread_state);
+
 	/*
 	 * We rely on being inside the _send() function
 	 * or tevent_req_defer_callback() being called
 	 * already.
 	 */
-	_tevent_req_done(cur->req, location);
+
+	if (cur->cqe.res < 0) {
+		int err =3D -cur->cqe.res;
+		_tevent_req_error(cur->req, err, location);
+		return;
+	}
+
+	state->nread =3D state->ur.cqe.res;
+	tevent_req_done(cur->req);
 }
=20
 static ssize_t vfs_io_uring_pread_recv(struct tevent_req *req,
@@ -366,23 +378,19 @@ static ssize_t vfs_io_uring_pread_recv(struct tevent_=
req *req,
 {
 	struct vfs_io_uring_pread_state *state =3D tevent_req_data(
 		req, struct vfs_io_uring_pread_state);
-	int ret;
+	ssize_t ret;
=20
 	SMBPROFILE_BYTES_ASYNC_END(state->ur.profile_bytes);
 	vfs_aio_state->duration =3D nsec_time_diff(&state->ur.end_time,
 						 &state->ur.start_time);
=20
 	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
+		tevent_req_received(req);
 		return -1;
 	}
=20
-	if (state->ur.cqe.res < 0) {
-		vfs_aio_state->error =3D -state->ur.cqe.res;
-		ret =3D -1;
-	} else {
-		vfs_aio_state->error =3D 0;
-		ret =3D state->ur.cqe.res;
-	}
+	vfs_aio_state->error =3D 0;
+	ret =3D state->nread;
=20
 	tevent_req_received(req);
 	return ret;
--=20
2.20.1


=46rom 9dec703313c3ba1fb15eebbb470eed75149d1f47 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 10:52:52 +0200
Subject: [PATCH 16/29] vfs_io_uring: move error handling out of
 vfs_io_uring_pwrite_recv()

We should do that as early as possible and that's in
vfs_io_uring_pwrite_completion().

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 0d8e1833009..a8da341e7b7 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -399,6 +399,7 @@ static ssize_t vfs_io_uring_pread_recv(struct tevent_re=
q *req,
 struct vfs_io_uring_pwrite_state {
 	struct vfs_io_uring_request ur;
 	struct iovec iov;
+	size_t nwritten;
 };
=20
 static void vfs_io_uring_pwrite_completion(struct vfs_io_uring_request *cu=
r,
@@ -455,12 +456,23 @@ static struct tevent_req *vfs_io_uring_pwrite_send(st=
ruct vfs_handle_struct *han
 static void vfs_io_uring_pwrite_completion(struct vfs_io_uring_request *cu=
r,
 					   const char *location)
 {
+	struct vfs_io_uring_pwrite_state *state =3D tevent_req_data(
+		cur->req, struct vfs_io_uring_pwrite_state);
+
 	/*
 	 * We rely on being inside the _send() function
 	 * or tevent_req_defer_callback() being called
 	 * already.
 	 */
-	_tevent_req_done(cur->req, location);
+
+	if (cur->cqe.res < 0) {
+		int err =3D -cur->cqe.res;
+		_tevent_req_error(cur->req, err, location);
+		return;
+	}
+
+	state->nwritten =3D state->ur.cqe.res;
+	tevent_req_done(cur->req);
 }
=20
 static ssize_t vfs_io_uring_pwrite_recv(struct tevent_req *req,
@@ -468,23 +480,19 @@ static ssize_t vfs_io_uring_pwrite_recv(struct tevent=
_req *req,
 {
 	struct vfs_io_uring_pwrite_state *state =3D tevent_req_data(
 		req, struct vfs_io_uring_pwrite_state);
-	int ret;
+	ssize_t ret;
=20
 	SMBPROFILE_BYTES_ASYNC_END(state->ur.profile_bytes);
 	vfs_aio_state->duration =3D nsec_time_diff(&state->ur.end_time,
 						 &state->ur.start_time);
=20
 	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
+		tevent_req_received(req);
 		return -1;
 	}
=20
-	if (state->ur.cqe.res < 0) {
-		vfs_aio_state->error =3D -state->ur.cqe.res;
-		ret =3D -1;
-	} else {
-		vfs_aio_state->error =3D 0;
-		ret =3D state->ur.cqe.res;
-	}
+	vfs_aio_state->error =3D 0;
+	ret =3D state->nwritten;
=20
 	tevent_req_received(req);
 	return ret;
--=20
2.20.1


=46rom d8b4dc27877ea2ef9f9ac769e07af2f93d43c39e Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 10:52:52 +0200
Subject: [PATCH 17/29] vfs_io_uring: move error handling out of
 vfs_io_uring_fsync_recv()

We should do that as early as possible and that's in
vfs_io_uring_fsync_completion().

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index a8da341e7b7..0f560c95b67 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -556,7 +556,14 @@ static void vfs_io_uring_fsync_completion(struct vfs_i=
o_uring_request *cur,
 	 * or tevent_req_defer_callback() being called
 	 * already.
 	 */
-	_tevent_req_done(cur->req, location);
+
+	if (cur->cqe.res < 0) {
+		int err =3D -cur->cqe.res;
+		_tevent_req_error(cur->req, err, location);
+		return;
+	}
+
+	tevent_req_done(cur->req);
 }
=20
 static int vfs_io_uring_fsync_recv(struct tevent_req *req,
@@ -564,26 +571,20 @@ static int vfs_io_uring_fsync_recv(struct tevent_req =
*req,
 {
 	struct vfs_io_uring_fsync_state *state =3D tevent_req_data(
 		req, struct vfs_io_uring_fsync_state);
-	int ret;
=20
 	SMBPROFILE_BYTES_ASYNC_END(state->ur.profile_bytes);
 	vfs_aio_state->duration =3D nsec_time_diff(&state->ur.end_time,
 						 &state->ur.start_time);
=20
 	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
+		tevent_req_received(req);
 		return -1;
 	}
=20
-	if (state->ur.cqe.res < 0) {
-		vfs_aio_state->error =3D -state->ur.cqe.res;
-		ret =3D -1;
-	} else {
-		vfs_aio_state->error =3D 0;
-		ret =3D state->ur.cqe.res;
-	}
+	vfs_aio_state->error =3D 0;
=20
 	tevent_req_received(req);
-	return ret;
+	return 0;
 }
=20
 static struct vfs_fn_pointers vfs_io_uring_fns =3D {
--=20
2.20.1


=46rom 7c4b76eefc3208a003607af54871286d948fb8b9 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 13:17:05 +0200
Subject: [PATCH 18/29] vfs_io_uring: make use of sys_valid_io_range() in
 vfs_io_uring_pread_send()

This makes the follow up commits easier as we don't have to care
about overflows.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 0f560c95b67..c7565b8c39d 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -25,6 +25,7 @@
 #include "smbd/smbd.h"
 #include "smbd/globals.h"
 #include "lib/util/tevent_unix.h"
+#include "lib/util/sys_rw.h"
 #include "smbprofile.h"
 #include <liburing.h>
=20
@@ -313,6 +314,7 @@ static struct tevent_req *vfs_io_uring_pread_send(struc=
t vfs_handle_struct *hand
 	struct tevent_req *req =3D NULL;
 	struct vfs_io_uring_pread_state *state =3D NULL;
 	struct vfs_io_uring_config *config =3D NULL;
+	bool ok;
=20
 	SMB_VFS_HANDLE_GET_DATA(handle, config,
 				struct vfs_io_uring_config,
@@ -331,6 +333,12 @@ static struct tevent_req *vfs_io_uring_pread_send(stru=
ct vfs_handle_struct *hand
 				     state->ur.profile_bytes, n);
 	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->ur.profile_bytes);
=20
+	ok =3D sys_valid_io_range(offset, n);
+	if (!ok) {
+		tevent_req_error(req, EINVAL);
+		return tevent_req_post(req, ev);
+	}
+
 	state->iov.iov_base =3D (void *)data;
 	state->iov.iov_len =3D n;
 	io_uring_prep_readv(&state->ur.sqe,
--=20
2.20.1


=46rom 63b259771e71772c953d56f1106e61ef1220b055 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 13:17:05 +0200
Subject: [PATCH 19/29] vfs_io_uring: make use of sys_valid_io_range() in
 vfs_io_uring_pwrite_send()

This makes the follow up commits easier as we don't have to care
about overflows.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index c7565b8c39d..ee23449c63c 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -423,6 +423,7 @@ static struct tevent_req *vfs_io_uring_pwrite_send(stru=
ct vfs_handle_struct *han
 	struct tevent_req *req =3D NULL;
 	struct vfs_io_uring_pwrite_state *state =3D NULL;
 	struct vfs_io_uring_config *config =3D NULL;
+	bool ok;
=20
 	SMB_VFS_HANDLE_GET_DATA(handle, config,
 				struct vfs_io_uring_config,
@@ -441,6 +442,12 @@ static struct tevent_req *vfs_io_uring_pwrite_send(str=
uct vfs_handle_struct *han
 				     state->ur.profile_bytes, n);
 	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->ur.profile_bytes);
=20
+	ok =3D sys_valid_io_range(offset, n);
+	if (!ok) {
+		tevent_req_error(req, EINVAL);
+		return tevent_req_post(req, ev);
+	}
+
 	state->iov.iov_base =3D discard_const(data);
 	state->iov.iov_len =3D n;
 	io_uring_prep_writev(&state->ur.sqe,
--=20
2.20.1


=46rom 025f51f61b0555dfc7cb470812758fd7ae7796da Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 21:29:53 +0200
Subject: [PATCH 20/29] vfs_io_uring: avoid stack recursion of
 vfs_io_uring_queue_run()

Instead we remember if recursion was triggered and jump to
the start of the function again from the end.

This should make it safe to be called from the completion_fn().

This is hideously complex stuff, so document the hell
out of it.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 93 +++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index ee23449c63c..f94453d9995 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -34,6 +34,10 @@ struct vfs_io_uring_request;
 struct vfs_io_uring_config {
 	struct io_uring uring;
 	struct tevent_fd *fde;
+	/* recursion guard. See comment above vfs_io_uring_queue_run() */
+	bool busy;
+	/* recursion guard. See comment above vfs_io_uring_queue_run() */
+	bool need_retry;
 	struct vfs_io_uring_request *queue;
 	struct vfs_io_uring_request *pending;
 };
@@ -222,7 +226,7 @@ static int vfs_io_uring_connect(vfs_handle_struct *hand=
le, const char *service,
 	return 0;
 }
=20
-static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
+static void _vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
 {
 	struct vfs_io_uring_request *cur =3D NULL, *next =3D NULL;
 	struct io_uring_cqe *cqe =3D NULL;
@@ -280,6 +284,93 @@ static void vfs_io_uring_queue_run(struct vfs_io_uring=
_config *config)
 	io_uring_cq_advance(&config->uring, nr);
 }
=20
+/*
+ * Wrapper function to prevent recursion which could happen
+ * if we called _vfs_io_uring_queue_run() directly without
+ * recursion checks.
+ *
+ * Looking at the pread call, we can have:
+ *
+ * vfs_io_uring_pread_send()
+ *        ->vfs_io_uring_pread_submit()  <--------------------------------=
---
+ *                ->vfs_io_uring_request_submit()                         =
  |
+ *                        ->vfs_io_uring_queue_run()                      =
  |
+ *                                ->_vfs_io_uring_queue_run()             =
  |
+ *                                                                        =
  |
+ * But inside _vfs_io_uring_queue_run() looks like:                       =
  |
+ *                                                                        =
  |
+ * _vfs_io_uring_queue_run() {                                            =
  |
+ *      if (THIS_IO_COMPLETED) {                                          =
  |
+ *              ->vfs_io_uring_finish_req()                               =
  |
+ *                      ->cur->completion_fn()                            =
  |
+ *      }                                                                 =
  |
+ * }                                                                      =
  |
+ *                                                                        =
  |
+ * cur->completion_fn() for pread is set to vfs_io_uring_pread_completion(=
) |
+ *                                                                        =
  |
+ * vfs_io_uring_pread_completion() {                                      =
  |
+ *      if (READ_TERMINATED) {                                            =
  |
+ *              -> tevent_req_done() - We're done, go back up the stack.  =
  |
+ *              return;                                                   =
  |
+ *      }                                                                 =
  |
+ *                                                                        =
  |
+ *      We have a short read - adjust the io vectors                      =
  |
+ *                                                                        =
  |
+ *      ->vfs_io_uring_pread_submit() ------------------------------------=
---
+ * }
+ *
+ * So before calling _vfs_io_uring_queue_run() we backet it with setting
+ * a flag config->busy, and unset it once _vfs_io_uring_queue_run() finally
+ * exits the retry loop.
+ *
+ * If we end up back into vfs_io_uring_queue_run() we notice we've done so
+ * as config->busy is set and don't recurse into _vfs_io_uring_queue_run().
+ *
+ * We set the second flag config->need_retry that tells us to loop in the
+ * vfs_io_uring_queue_run() call above us in the stack and return.
+ *
+ * When the outer call to _vfs_io_uring_queue_run() returns we are in
+ * a loop checking if config->need_retry was set. That happens if
+ * the short read case occurs and _vfs_io_uring_queue_run() ended up
+ * recursing into vfs_io_uring_queue_run().
+ *
+ * Once vfs_io_uring_pread_completion() finishes without a short
+ * read (the READ_TERMINATED case, tevent_req_done() is called)
+ * then config->need_retry is left as false, we exit the loop,
+ * set config->busy to false so the next top level call into
+ * vfs_io_uring_queue_run() won't think it's a recursed call
+ * and return.
+ *
+ */
+
+static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
+{
+	if (config->busy) {
+		/*
+		 * We've recursed due to short read/write.
+		 * Set need_retry to ensure we retry the
+		 * io_uring_submit().
+		 */
+		config->need_retry =3D true;
+		return;
+	}
+
+	/*
+	 * Bracket the loop calling _vfs_io_uring_queue_run()
+	 * with busy =3D true / busy =3D false.
+	 * so we can detect recursion above.
+	 */
+
+	config->busy =3D true;
+
+	do {
+		config->need_retry =3D false;
+		_vfs_io_uring_queue_run(config);
+	} while (config->need_retry);
+
+	config->busy =3D false;
+}
+
 static void vfs_io_uring_fd_handler(struct tevent_context *ev,
 				    struct tevent_fd *fde,
 				    uint16_t flags,
--=20
2.20.1


=46rom 59dba68d69b98de24c218748919c6adbf59ceeab Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 11:17:51 +0200
Subject: [PATCH 21/29] vfs_io_uring: split out a vfs_io_uring_request_submi=
t()
 function

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index f94453d9995..1d48bd192fe 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -371,6 +371,17 @@ static void vfs_io_uring_queue_run(struct vfs_io_uring=
_config *config)
 	config->busy =3D false;
 }
=20
+static void vfs_io_uring_request_submit(struct vfs_io_uring_request *cur)
+{
+	struct vfs_io_uring_config *config =3D cur->config;
+
+	io_uring_sqe_set_data(&cur->sqe, cur);
+	DLIST_ADD_END(config->queue, cur);
+	cur->list_head =3D &config->queue;
+
+	vfs_io_uring_queue_run(config);
+}
+
 static void vfs_io_uring_fd_handler(struct tevent_context *ev,
 				    struct tevent_fd *fde,
 				    uint16_t flags,
@@ -436,11 +447,7 @@ static struct tevent_req *vfs_io_uring_pread_send(stru=
ct vfs_handle_struct *hand
 			    fsp->fh->fd,
 			    &state->iov, 1,
 			    offset);
-	io_uring_sqe_set_data(&state->ur.sqe, &state->ur);
-	DLIST_ADD_END(config->queue, &state->ur);
-	state->ur.list_head =3D &config->queue;
-
-	vfs_io_uring_queue_run(config);
+	vfs_io_uring_request_submit(&state->ur);
=20
 	if (!tevent_req_is_in_progress(req)) {
 		return tevent_req_post(req, ev);
@@ -545,11 +552,7 @@ static struct tevent_req *vfs_io_uring_pwrite_send(str=
uct vfs_handle_struct *han
 			     fsp->fh->fd,
 			     &state->iov, 1,
 			     offset);
-	io_uring_sqe_set_data(&state->ur.sqe, &state->ur);
-	DLIST_ADD_END(config->queue, &state->ur);
-	state->ur.list_head =3D &config->queue;
-
-	vfs_io_uring_queue_run(config);
+	vfs_io_uring_request_submit(&state->ur);
=20
 	if (!tevent_req_is_in_progress(req)) {
 		return tevent_req_post(req, ev);
@@ -640,11 +643,7 @@ static struct tevent_req *vfs_io_uring_fsync_send(stru=
ct vfs_handle_struct *hand
 	io_uring_prep_fsync(&state->ur.sqe,
 			    fsp->fh->fd,
 			    0); /* fsync_flags */
-	io_uring_sqe_set_data(&state->ur.sqe, &state->ur);
-	DLIST_ADD_END(config->queue, &state->ur);
-	state->ur.list_head =3D &config->queue;
-
-	vfs_io_uring_queue_run(config);
+	vfs_io_uring_request_submit(&state->ur);
=20
 	if (!tevent_req_is_in_progress(req)) {
 		return tevent_req_post(req, ev);
--=20
2.20.1


=46rom a91a5574379184026043c453ba11ba12769a77f9 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 11:17:51 +0200
Subject: [PATCH 22/29] vfs_io_uring: split out a vfs_io_uring_pread_submit()
 function

This can be reused when we add handling for short reads.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 1d48bd192fe..19e268e63db 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -399,10 +399,13 @@ static void vfs_io_uring_fd_handler(struct tevent_con=
text *ev,
=20
 struct vfs_io_uring_pread_state {
 	struct vfs_io_uring_request ur;
+	struct files_struct *fsp;
+	off_t offset;
 	struct iovec iov;
 	size_t nread;
 };
=20
+static void vfs_io_uring_pread_submit(struct vfs_io_uring_pread_state *sta=
te);
 static void vfs_io_uring_pread_completion(struct vfs_io_uring_request *cur,
 					  const char *location);
=20
@@ -441,13 +444,11 @@ static struct tevent_req *vfs_io_uring_pread_send(str=
uct vfs_handle_struct *hand
 		return tevent_req_post(req, ev);
 	}
=20
+	state->fsp =3D fsp;
+	state->offset =3D offset;
 	state->iov.iov_base =3D (void *)data;
 	state->iov.iov_len =3D n;
-	io_uring_prep_readv(&state->ur.sqe,
-			    fsp->fh->fd,
-			    &state->iov, 1,
-			    offset);
-	vfs_io_uring_request_submit(&state->ur);
+	vfs_io_uring_pread_submit(state);
=20
 	if (!tevent_req_is_in_progress(req)) {
 		return tevent_req_post(req, ev);
@@ -457,6 +458,15 @@ static struct tevent_req *vfs_io_uring_pread_send(stru=
ct vfs_handle_struct *hand
 	return req;
 }
=20
+static void vfs_io_uring_pread_submit(struct vfs_io_uring_pread_state *sta=
te)
+{
+	io_uring_prep_readv(&state->ur.sqe,
+			    state->fsp->fh->fd,
+			    &state->iov, 1,
+			    state->offset);
+	vfs_io_uring_request_submit(&state->ur);
+}
+
 static void vfs_io_uring_pread_completion(struct vfs_io_uring_request *cur,
 					  const char *location)
 {
--=20
2.20.1


=46rom e4fd6c3341fd9381ad8fe0e98dd0f127018a46e3 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 11:17:51 +0200
Subject: [PATCH 23/29] vfs_io_uring: split out a vfs_io_uring_pwrite_submit=
()
 function

This can be reused when we add handling for short writes.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 19e268e63db..3e004f48aa0 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -514,10 +514,13 @@ static ssize_t vfs_io_uring_pread_recv(struct tevent_=
req *req,
=20
 struct vfs_io_uring_pwrite_state {
 	struct vfs_io_uring_request ur;
+	struct files_struct *fsp;
+	off_t offset;
 	struct iovec iov;
 	size_t nwritten;
 };
=20
+static void vfs_io_uring_pwrite_submit(struct vfs_io_uring_pwrite_state *s=
tate);
 static void vfs_io_uring_pwrite_completion(struct vfs_io_uring_request *cu=
r,
 					   const char *location);
=20
@@ -556,13 +559,11 @@ static struct tevent_req *vfs_io_uring_pwrite_send(st=
ruct vfs_handle_struct *han
 		return tevent_req_post(req, ev);
 	}
=20
+	state->fsp =3D fsp;
+	state->offset =3D offset;
 	state->iov.iov_base =3D discard_const(data);
 	state->iov.iov_len =3D n;
-	io_uring_prep_writev(&state->ur.sqe,
-			     fsp->fh->fd,
-			     &state->iov, 1,
-			     offset);
-	vfs_io_uring_request_submit(&state->ur);
+	vfs_io_uring_pwrite_submit(state);
=20
 	if (!tevent_req_is_in_progress(req)) {
 		return tevent_req_post(req, ev);
@@ -572,6 +573,15 @@ static struct tevent_req *vfs_io_uring_pwrite_send(str=
uct vfs_handle_struct *han
 	return req;
 }
=20
+static void vfs_io_uring_pwrite_submit(struct vfs_io_uring_pwrite_state *s=
tate)
+{
+	io_uring_prep_writev(&state->ur.sqe,
+			     state->fsp->fh->fd,
+			     &state->iov, 1,
+			     state->offset);
+	vfs_io_uring_request_submit(&state->ur);
+}
+
 static void vfs_io_uring_pwrite_completion(struct vfs_io_uring_request *cu=
r,
 					   const char *location)
 {
--=20
2.20.1


=46rom b0a2da91d196285a6b3321c953761bdb3cd2be55 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 11:38:56 +0200
Subject: [PATCH 24/29] vfs_io_uring: protect vfs_io_uring_pread_completion()
 against invalid results

We should never get back more than we asked for.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 3e004f48aa0..46fab116e9d 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -26,6 +26,7 @@
 #include "smbd/globals.h"
 #include "lib/util/tevent_unix.h"
 #include "lib/util/sys_rw.h"
+#include "lib/util/iov_buf.h"
 #include "smbprofile.h"
 #include <liburing.h>
=20
@@ -472,6 +473,9 @@ static void vfs_io_uring_pread_completion(struct vfs_io=
_uring_request *cur,
 {
 	struct vfs_io_uring_pread_state *state =3D tevent_req_data(
 		cur->req, struct vfs_io_uring_pread_state);
+	struct iovec *iov =3D &state->iov;
+	int num_iov =3D 1;
+	bool ok;
=20
 	/*
 	 * We rely on being inside the _send() function
@@ -485,6 +489,16 @@ static void vfs_io_uring_pread_completion(struct vfs_i=
o_uring_request *cur,
 		return;
 	}
=20
+	ok =3D iov_advance(&iov, &num_iov, cur->cqe.res);
+	if (!ok) {
+		/* This is not expected! */
+		DBG_ERR("iov_advance() failed cur->cqe.res=3D%d > iov_len=3D%d\n",
+			(int)cur->cqe.res,
+			(int)state->iov.iov_len);
+		tevent_req_error(cur->req, EIO);
+		return;
+	}
+
 	state->nread =3D state->ur.cqe.res;
 	tevent_req_done(cur->req);
 }
--=20
2.20.1


=46rom 3998bf57d12d63eec44273551cae22967b9656c7 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 11:38:56 +0200
Subject: [PATCH 25/29] vfs_io_uring: protect vfs_io_uring_pwrite_completion=
()
 against invalid results

We should never get more acked than we asked for.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 46fab116e9d..0ea785aae85 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -601,6 +601,9 @@ static void vfs_io_uring_pwrite_completion(struct vfs_i=
o_uring_request *cur,
 {
 	struct vfs_io_uring_pwrite_state *state =3D tevent_req_data(
 		cur->req, struct vfs_io_uring_pwrite_state);
+	struct iovec *iov =3D &state->iov;
+	int num_iov =3D 1;
+	bool ok;
=20
 	/*
 	 * We rely on being inside the _send() function
@@ -614,6 +617,16 @@ static void vfs_io_uring_pwrite_completion(struct vfs_=
io_uring_request *cur,
 		return;
 	}
=20
+	ok =3D iov_advance(&iov, &num_iov, cur->cqe.res);
+	if (!ok) {
+		/* This is not expected! */
+		DBG_ERR("iov_advance() failed cur->cqe.res=3D%d > iov_len=3D%d\n",
+			(int)cur->cqe.res,
+			(int)state->iov.iov_len);
+		tevent_req_error(cur->req, EIO);
+		return;
+	}
+
 	state->nwritten =3D state->ur.cqe.res;
 	tevent_req_done(cur->req);
 }
--=20
2.20.1


=46rom 5bc29822bbead41b7f9db65b158ad0657428eb68 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 11:38:56 +0200
Subject: [PATCH 26/29] vfs_io_uring: protect vfs_io_uring_fsync_completion()
 against invalid results

We should never get back a value > 0.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 0ea785aae85..0b1583f962a 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -715,6 +715,13 @@ static void vfs_io_uring_fsync_completion(struct vfs_i=
o_uring_request *cur,
 		return;
 	}
=20
+	if (cur->cqe.res > 0) {
+		/* This is not expected! */
+		DBG_ERR("got cur->cqe.res=3D%d\n", (int)cur->cqe.res);
+		tevent_req_error(cur->req, EIO);
+		return;
+	}
+
 	tevent_req_done(cur->req);
 }
=20
--=20
2.20.1


=46rom 55670232dfc69d4f3493ac0a0e97f9873c256f9b Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 13:30:17 +0200
Subject: [PATCH 27/29] vfs_io_uring: retry after a short read in
 vfs_io_uring_pread_completion()

We need to be prepared for short reads from the kernel depending on
the state of the page cache. Windows and Mac clients don't
expect short reads for files, so we need to retry ourself.

For the future we may be able to play with some io_uring flags
in order to avoid the retries in userspace, but for now we just fix
the data corruption bug...

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 source3/modules/vfs_io_uring.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 0b1583f962a..f16c9ae56d3 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -489,6 +489,14 @@ static void vfs_io_uring_pread_completion(struct vfs_i=
o_uring_request *cur,
 		return;
 	}
=20
+	if (cur->cqe.res =3D=3D 0) {
+		/*
+		 * We reached EOF, we're done
+		 */
+		tevent_req_done(cur->req);
+		return;
+	}
+
 	ok =3D iov_advance(&iov, &num_iov, cur->cqe.res);
 	if (!ok) {
 		/* This is not expected! */
@@ -499,8 +507,20 @@ static void vfs_io_uring_pread_completion(struct vfs_i=
o_uring_request *cur,
 		return;
 	}
=20
-	state->nread =3D state->ur.cqe.res;
-	tevent_req_done(cur->req);
+	/* sys_valid_io_range() already checked the boundaries */
+	state->nread +=3D state->ur.cqe.res;
+	if (num_iov =3D=3D 0) {
+		/* We're done */
+		tevent_req_done(cur->req);
+		return;
+	}
+
+	/*
+	 * sys_valid_io_range() already checked the boundaries
+	 * now try to get the rest.
+	 */
+	state->offset +=3D state->ur.cqe.res;
+	vfs_io_uring_pread_submit(state);
 }
=20
 static ssize_t vfs_io_uring_pread_recv(struct tevent_req *req,
--=20
2.20.1


=46rom 546b6ed4590e9c3631b40130b347f1c3598b471e Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Fri, 8 May 2020 13:30:17 +0200
Subject: [PATCH 28/29] TODO: vfs_io_uring: retry after a short writes in
 vfs_io_uring_pwrite_completion()

We need to be prepared for short writes from the kernel depending on
the state of the page cache.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14361

TODO: check how clients handle short writes...
TODO: where do we handle offset < 0 ???, see MS-FSA 2.1.5.3 Server Requests=
 a Write
---
 source3/modules/vfs_io_uring.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index f16c9ae56d3..4625e16c37e 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -637,6 +637,14 @@ static void vfs_io_uring_pwrite_completion(struct vfs_=
io_uring_request *cur,
 		return;
 	}
=20
+	if (cur->cqe.res =3D=3D 0) {
+		/*
+		 * Ensure we can never spin.
+		 */
+		tevent_req_error(cur->req, ENOSPC);
+		return;
+	}
+
 	ok =3D iov_advance(&iov, &num_iov, cur->cqe.res);
 	if (!ok) {
 		/* This is not expected! */
@@ -647,8 +655,20 @@ static void vfs_io_uring_pwrite_completion(struct vfs_=
io_uring_request *cur,
 		return;
 	}
=20
-	state->nwritten =3D state->ur.cqe.res;
-	tevent_req_done(cur->req);
+	/* sys_valid_io_range() already checked the boundaries */
+	state->nwritten +=3D state->ur.cqe.res;
+	if (num_iov =3D=3D 0) {
+		/* We're done */
+		tevent_req_done(cur->req);
+		return;
+	}
+
+	/*
+	 * sys_valid_io_range() already checked the boundaries
+	 * now try to write the rest.
+	 */
+	state->offset +=3D state->ur.cqe.res;
+	vfs_io_uring_pwrite_submit(state);
 }
=20
 static ssize_t vfs_io_uring_pwrite_recv(struct tevent_req *req,
--=20
2.20.1


=46rom 0a187c6a55c16d12845f268d7d635d3e9882ed04 Mon Sep 17 00:00:00 2001
=46rom: Stefan Metzmacher <metze@samba.org>
Date: Wed, 6 May 2020 03:12:24 -0700
Subject: [PATCH 29/29] HACK vfs_io_uring: add debugging for bug 14361

---
 source3/modules/vfs_io_uring.c | 105 ++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 4625e16c37e..5947b8f58b9 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -41,6 +41,10 @@ struct vfs_io_uring_config {
 	bool need_retry;
 	struct vfs_io_uring_request *queue;
 	struct vfs_io_uring_request *pending;
+	bool nowait_pread;
+	bool force_async_pread;
+	bool force_async_pread_retry;
+	size_t truncate_pread;
 };
=20
 struct vfs_io_uring_request {
@@ -96,6 +100,7 @@ static void vfs_io_uring_config_destroy(struct vfs_io_ur=
ing_config *config,
 		.res =3D ret,
 	};
=20
+DBG_ERR("ret=3D%d %s\n", ret, location);
 	PROFILE_TIMESTAMP(&start_time);
=20
 	if (config->uring.ring_fd !=3D -1) {
@@ -196,6 +201,8 @@ static int vfs_io_uring_connect(vfs_handle_struct *hand=
le, const char *service,
 	ret =3D io_uring_queue_init(num_entries, &config->uring, flags);
 	if (ret < 0) {
 		SMB_VFS_NEXT_DISCONNECT(handle);
+		DBG_ERR("io_uring_queue_init(flags=3D0x%x) failed - %d %s\n",
+			flags, ret, strerror(-ret));
 		errno =3D -ret;
 		return -1;
 	}
@@ -206,6 +213,8 @@ static int vfs_io_uring_connect(vfs_handle_struct *hand=
le, const char *service,
 	ret =3D io_uring_ring_dontfork(&config->uring);
 	if (ret < 0) {
 		SMB_VFS_NEXT_DISCONNECT(handle);
+		DBG_ERR("io_uring_ring_dontfork() failed - %d %s\n",
+			ret, strerror(-ret));
 		errno =3D -ret;
 		return -1;
 	}
@@ -224,6 +233,22 @@ static int vfs_io_uring_connect(vfs_handle_struct *han=
dle, const char *service,
 		return -1;
 	}
=20
+	config->nowait_pread =3D lp_parm_bool(SNUM(handle->conn),
+			     "io_uring",
+			     "nowait_pread",
+			     false);
+	config->force_async_pread =3D lp_parm_bool(SNUM(handle->conn),
+			     "io_uring",
+			     "force_async_pread",
+			     false);
+	config->force_async_pread_retry =3D lp_parm_bool(SNUM(handle->conn),
+			     "io_uring",
+			     "force_async_pread_retry",
+			     false);
+	config->truncate_pread =3D lp_parm_ulonglong(SNUM(handle->conn),
+				    "io_uring",
+				    "truncate_pread",
+				    UINT32_MAX);
 	return 0;
 }
=20
@@ -270,6 +295,8 @@ static void _vfs_io_uring_queue_run(struct vfs_io_uring=
_config *config)
 	if (ret =3D=3D -EAGAIN || ret =3D=3D -EBUSY) {
 		/* We just retry later */
 	} else if (ret < 0) {
+		DBG_ERR("io_uring_submit() failed - %d %s\n",
+			ret, strerror(-ret));
 		vfs_io_uring_config_destroy(config, ret, __location__);
 		return;
 	}
@@ -403,7 +430,9 @@ struct vfs_io_uring_pread_state {
 	struct files_struct *fsp;
 	off_t offset;
 	struct iovec iov;
+	struct iovec tmp_iov;
 	size_t nread;
+	bool nowait_pread;
 };
=20
 static void vfs_io_uring_pread_submit(struct vfs_io_uring_pread_state *sta=
te);
@@ -449,6 +478,7 @@ static struct tevent_req *vfs_io_uring_pread_send(struc=
t vfs_handle_struct *hand
 	state->offset =3D offset;
 	state->iov.iov_base =3D (void *)data;
 	state->iov.iov_len =3D n;
+	state->nowait_pread =3D config->nowait_pread;
 	vfs_io_uring_pread_submit(state);
=20
 	if (!tevent_req_is_in_progress(req)) {
@@ -461,10 +491,27 @@ static struct tevent_req *vfs_io_uring_pread_send(str=
uct vfs_handle_struct *hand
=20
 static void vfs_io_uring_pread_submit(struct vfs_io_uring_pread_state *sta=
te)
 {
+	struct vfs_io_uring_config *config =3D state->ur.config;
+	unsigned flags =3D 0;
+
+	state->tmp_iov =3D state->iov;
+	state->tmp_iov.iov_len =3D MIN(state->tmp_iov.iov_len,
+				     config->truncate_pread);
+
 	io_uring_prep_readv(&state->ur.sqe,
 			    state->fsp->fh->fd,
-			    &state->iov, 1,
+			    &state->tmp_iov, 1,
 			    state->offset);
+	if (state->nowait_pread) {
+		state->ur.sqe.rw_flags |=3D RWF_NOWAIT;
+	}
+	if (config->force_async_pread) {
+		flags |=3D IOSQE_ASYNC;
+	}
+	if (state->nread > 0 && config->force_async_pread_retry) {
+		flags |=3D IOSQE_ASYNC;
+	}
+	io_uring_sqe_set_flags(&state->ur.sqe, flags);
 	vfs_io_uring_request_submit(&state->ur);
 }
=20
@@ -485,10 +532,66 @@ static void vfs_io_uring_pread_completion(struct vfs_=
io_uring_request *cur,
=20
 	if (cur->cqe.res < 0) {
 		int err =3D -cur->cqe.res;
+		DBG_ERR("%p: Invalid last_read=3D%zu (0x%zx) ofs=3D%zu (0x%zx) len=3D%zu=
 (0x%zx) err=3D%d %s eof=3D%zu (0x%zx) blks=3D%zu blocks=3D%zu %s %s\n",
+			state,
+			(size_t)state->nread,
+			(size_t)state->nread,
+			(size_t)state->offset,
+			(size_t)state->offset,
+			(size_t)state->iov.iov_len,
+			(size_t)state->iov.iov_len,
+			err, strerror(err),
+			(size_t)state->fsp->fsp_name->st.st_ex_size,
+			(size_t)state->fsp->fsp_name->st.st_ex_size,
+			(size_t)state->fsp->fsp_name->st.st_ex_blksize,
+			(size_t)state->fsp->fsp_name->st.st_ex_blocks,
+			fsp_str_dbg(state->fsp),
+			fsp_fnum_dbg(state->fsp));
+		if (err =3D=3D EAGAIN && state->nowait_pread) {
+			state->nowait_pread =3D false;
+			vfs_io_uring_pread_submit(state);
+			return;
+		}
 		_tevent_req_error(cur->req, err, location);
 		return;
 	}
=20
+	if ((size_t)cur->cqe.res !=3D (size_t)state->iov.iov_len) {
+		DBG_ERR("%p: Invalid last_read=3D%zu (0x%zx) ofs=3D%zu (0x%zx) len=3D%zu=
 (0x%zx) nread=3D%zu (0x%zx) eof=3D%zu (0x%zx) blks=3D%zu blocks=3D%zu %s %=
s\n",
+			state,
+			(size_t)state->nread,
+			(size_t)state->nread,
+			(size_t)state->offset,
+			(size_t)state->offset,
+			(size_t)state->iov.iov_len,
+			(size_t)state->iov.iov_len,
+			(size_t)cur->cqe.res,
+			(size_t)cur->cqe.res,
+			(size_t)state->fsp->fsp_name->st.st_ex_size,
+			(size_t)state->fsp->fsp_name->st.st_ex_size,
+			(size_t)state->fsp->fsp_name->st.st_ex_blksize,
+			(size_t)state->fsp->fsp_name->st.st_ex_blocks,
+			fsp_str_dbg(state->fsp),
+			fsp_fnum_dbg(state->fsp));
+	} else {
+		DBG_WARNING("%p: last_read=3D%zu (0x%zx) ofs=3D%zu (0x%zx) len=3D%zu (0x=
%zx) nread=3D%zu (0x%zx) eof=3D%zu (0x%zx) blks=3D%zu blocks=3D%zu %s %s\n",
+			state,
+			(size_t)state->nread,
+			(size_t)state->nread,
+			(size_t)state->offset,
+			(size_t)state->offset,
+			(size_t)state->iov.iov_len,
+			(size_t)state->iov.iov_len,
+			(size_t)cur->cqe.res,
+			(size_t)cur->cqe.res,
+			(size_t)state->fsp->fsp_name->st.st_ex_size,
+			(size_t)state->fsp->fsp_name->st.st_ex_size,
+			(size_t)state->fsp->fsp_name->st.st_ex_blksize,
+			(size_t)state->fsp->fsp_name->st.st_ex_blocks,
+			fsp_str_dbg(state->fsp),
+			fsp_fnum_dbg(state->fsp));
+	}
+
 	if (cur->cqe.res =3D=3D 0) {
 		/*
 		 * We reached EOF, we're done
--=20
2.20.1


--IJpNTDwzlM2Ie8A6--

