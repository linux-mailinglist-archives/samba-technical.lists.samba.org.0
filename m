Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027C56B5F
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 15:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=I6g584cxSMOJqvFV1fyy5sbjZIM7AIiJZ6BpGkRghBU=; b=crFSx6MihlQ5IQ90TOY0Vqvqy2
	92fONdN1lEa8j6dCYYclcruQbU0G5ycsoEzxSb/U+itAwzQ1fd1HjChZIqZhzIVptFohr2x/bVRX7
	wEnM1BSVIoIm90fch5V3cp9s5fNnJclaYntIwKwIHBXCavmLpRGFDFaeii2A5hDOR42PPsQPrzQ8T
	6PwZSDkNay/PELAypiPagvK5jRpnP+GZgEse73hZ0CmTwqM+bE1DUabc4G0Rms5UK/oykXJN6mTY3
	t9Kto6hKbgGkyv0mMZ4X4CQtU5FjsdZVak98gmlkruysppJMijJpCMLfam4mScyQQujwe/njPXh/i
	el597FUg==;
Received: from localhost ([::1]:22692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hg8Qs-001tfI-Be; Wed, 26 Jun 2019 13:57:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hg8Qn-001tfB-EH
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 13:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=I6g584cxSMOJqvFV1fyy5sbjZIM7AIiJZ6BpGkRghBU=; b=bdiBGDsOEY7UgZ2k0AwkdOeths
 OmK43VtbHLZvSOb5BOY3k4aTP0Od19hKmtVPdVSWclM2lZBJ3zPrj7hEDFRbsAkvDktQLFAhNy0N9
 +Zpet4uCds2nuRHCGWwvpgCKQanZzlGKW/yIWbRj7LFWAfTgLJ+GkUPqV0vMT0yDtg6k=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hg8Qm-00012l-Ct; Wed, 26 Jun 2019 13:57:48 +0000
Date: Wed, 26 Jun 2019 15:57:46 +0200
To: Jeremy Allison <jra@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Volker Lendecke <Volker.Lendecke@SerNet.DE>
Subject: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
Message-ID: <20190626135745.lk7757wmy26pgy26@inti>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="adlno45n2xihibvt"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--adlno45n2xihibvt
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hi all,

in short:

Samba will adapt a new File-ID generation scheme, based on a file's initial 
creation date instead of using the file's inode number.

Long story follows.

Recently customers have been bitten by a problem that seriously affects 
reliabilitly of Samba as a fileserver for Mac environments.

The problem is providing sane SMB File-IDs to Mac clients. We have two choices:

1) By default Samba uses file inode numbers for the SMB File-ID. As inode 
numbers may be reused, when this happens Mac client get very, very unhappy. Bug 
<https://bugzilla.samba.org/show_bug.cgi?id=12715> has some more details on the 
application level impact and more technical background.

2) To avoid the problems outlined in 1) we return 0 File-IDs to Mac clients (Mac 
clients get detected by virtue of SMB2 AAPL contect negotiation, only Macs do 
this). Returning 0 File-IDs has the same effect as setting the client side 
option "file_ids_off" on the Macs in a config file /etc/nsmb.conf to "yes". In 
both cases the client ignores the server provided File-IDs and applies some 
client side magic.

Unfortunately, this mode seems to have its own serious problems: 
<https://bugzilla.samba.org/show_bug.cgi?id=13999>

I've brought the issue to Apple's attention, but I don't expect a fix for this 
will be available any time soon.

This means we have to find a way to provide clients File-IDs that are never 
reused but are constantly increasing.  metze suggested somehow using a file's 
creation date, given nanosecond granularity, to minimize the risk of ID 
collisions.

We can compress a struct timespec into a 64 bit File-ID with the following logic:

- struct timespec.tv_nsec (nanoseconds) requires 30 bitmap, leaves 34 bit

- set the high bit for creation date based File-IDs, leaves 33 bit

- struct timespec.tv_sec is seconds before/after UNIX epoch, with 33 bit we can 
  encode dates up to year 2106 which should give us some time to develop 
  something even better

As a file's creation time (or btime for birth-time) may be set by clients, this 
would result in changed File-IDs every time a client sets the btime. So we need 
to store an additional copy of a file's original btime. We store the btime as 
part of the DOS attributes xattr, we need an additional field in there, making 
for a new level 4 of the xattr info struct. Looking with samba-tool ntacl 
getdosinfo the new level 4 looks like this:

    xattr_DOSATTRIB: struct xattr_DOSATTRIB
        attrib_hex               : ''
        version                  : 0x0004 (4)
        info                     : union xattr_DosInfo(case 4)
        info4: struct xattr_DosInfo4
            valid_flags              : 0x00000013 (19)
                   1: XATTR_DOSINFO_ATTRIB     
                   1: XATTR_DOSINFO_BIRTH_TIME 
                   1: XATTR_DOSINFO_CREATE_TIME
            attrib                   : 0x00000020 (32)
            birth_time               : Wed Jun 26 15:05:56 2019 CEST
            create_time              : Wed Jun 26 15:05:56 2019 CEST

For any file with an associated level 3 blob that lacks the birth_time field, 
when upgraded to level 4 eg when setting DOS attributes, the level 4 will have 
no birth time set:

      xattr_DOSATTRIB: struct xattr_DOSATTRIB
        attrib_hex               : ''
        version                  : 0x0004 (4)
        info                     : union xattr_DosInfo(case 4)
        info4: struct xattr_DosInfo4
            valid_flags              : 0x00000011 (17)
                   1: XATTR_DOSINFO_ATTRIB     
                   0: XATTR_DOSINFO_BIRTH_TIME 
                   1: XATTR_DOSINFO_CREATE_TIME
            attrib                   : 0x00000002 (2)
            birth_time               : NTTIME(0)
            create_time              : Wed Jun 26 15:12:40 2019 CEST

Only files (and directories of course) that have an immutable birthtime will 
take advantage of the new File-IDS semantics. So generally any existing file 
will still use File-IDs based on the inode number. That shouldn't be a problem 
however, the realworld problems generally only arise with newly created files.

Currently the only backend supporting storage of immutable birthtime is our DOS 
xattr via the VFS default backend. VFS modules can implement the DOS attributes 
VFS function to implement their own logic.

Existing VFS modules that want to take advantage of the new File-ID semantics, 
must either implement an immutable btime natively, and until that happens they 
have to call the VFS NEXT functions to get and set the immutable btime from 
vfs_default. vfs_ceph already does this, but vfs_gpfs needs to be updated.

WIP: <https://gitlab.com/samba-team/devel/samba/commits/slow-fileid> (also 
attached)

Passes CI: <https://gitlab.com/samba-team/devel/samba/pipelines/68050729>

Questions? Remarks? Thoughts?

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

--adlno45n2xihibvt
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="wip-fileid-from-btime.patch"
Content-Transfer-Encoding: quoted-printable

=46rom d6aba65a48b9e666c17a24fe36de75a56af84a5f Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Mon, 24 Jun 2019 13:58:58 +0200
Subject: [PATCH 01/15] idl: remove ununsed XATTR_DOSINFO_EA_SIZE from
 xattr.idl

This has never been used.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 librpc/idl/xattr.idl | 1 -
 1 file changed, 1 deletion(-)

diff --git a/librpc/idl/xattr.idl b/librpc/idl/xattr.idl
index 38d32fd85b1..24856bdc9db 100644
--- a/librpc/idl/xattr.idl
+++ b/librpc/idl/xattr.idl
@@ -69,7 +69,6 @@ interface xattr
=20
 	typedef [bitmap32bit] bitmap {
 		XATTR_DOSINFO_ATTRIB            =3D 0x00000001,
-		XATTR_DOSINFO_EA_SIZE           =3D 0x00000002,
 		XATTR_DOSINFO_SIZE              =3D 0x00000004,
 		XATTR_DOSINFO_ALLOC_SIZE        =3D 0x00000008,
 		XATTR_DOSINFO_CREATE_TIME       =3D 0x00000010,
--=20
2.21.0


=46rom 12f14d4ff7560298b4a6f54d512b912c10b3042e Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Mon, 24 Jun 2019 13:59:54 +0200
Subject: [PATCH 02/15] idl: remove unused XATTR_DOSINFO_SIZE from xattr.idl

This has never been used.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 librpc/idl/xattr.idl | 1 -
 1 file changed, 1 deletion(-)

diff --git a/librpc/idl/xattr.idl b/librpc/idl/xattr.idl
index 24856bdc9db..0826b614a53 100644
--- a/librpc/idl/xattr.idl
+++ b/librpc/idl/xattr.idl
@@ -69,7 +69,6 @@ interface xattr
=20
 	typedef [bitmap32bit] bitmap {
 		XATTR_DOSINFO_ATTRIB            =3D 0x00000001,
-		XATTR_DOSINFO_SIZE              =3D 0x00000004,
 		XATTR_DOSINFO_ALLOC_SIZE        =3D 0x00000008,
 		XATTR_DOSINFO_CREATE_TIME       =3D 0x00000010,
 		XATTR_DOSINFO_CHANGE_TIME       =3D 0x00000020
--=20
2.21.0


=46rom 9e543406fca4f3740497d5ba42a790524be2718a Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Mon, 24 Jun 2019 14:04:02 +0200
Subject: [PATCH 03/15] idl: remove unused XATTR_DOSINFO_ALLOC_SIZE from
 xattr.idl

This has never been used.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 librpc/idl/xattr.idl | 1 -
 1 file changed, 1 deletion(-)

diff --git a/librpc/idl/xattr.idl b/librpc/idl/xattr.idl
index 0826b614a53..0943225eb2c 100644
--- a/librpc/idl/xattr.idl
+++ b/librpc/idl/xattr.idl
@@ -69,7 +69,6 @@ interface xattr
=20
 	typedef [bitmap32bit] bitmap {
 		XATTR_DOSINFO_ATTRIB            =3D 0x00000001,
-		XATTR_DOSINFO_ALLOC_SIZE        =3D 0x00000008,
 		XATTR_DOSINFO_CREATE_TIME       =3D 0x00000010,
 		XATTR_DOSINFO_CHANGE_TIME       =3D 0x00000020
 	} xattr_DosInfoValidFlags;
--=20
2.21.0


=46rom cb3fad57a17e8a33ee7193a70608e60626bac0c8 Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Mon, 24 Jun 2019 14:04:46 +0200
Subject: [PATCH 04/15] idl: remove unused XATTR_DOSINFO_CHANGE_TIME from
 xattr.idl

This has never been used.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 librpc/idl/xattr.idl | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/librpc/idl/xattr.idl b/librpc/idl/xattr.idl
index 0943225eb2c..da92e0107d4 100644
--- a/librpc/idl/xattr.idl
+++ b/librpc/idl/xattr.idl
@@ -69,8 +69,7 @@ interface xattr
=20
 	typedef [bitmap32bit] bitmap {
 		XATTR_DOSINFO_ATTRIB            =3D 0x00000001,
-		XATTR_DOSINFO_CREATE_TIME       =3D 0x00000010,
-		XATTR_DOSINFO_CHANGE_TIME       =3D 0x00000020
+		XATTR_DOSINFO_CREATE_TIME       =3D 0x00000010
 	} xattr_DosInfoValidFlags;
=20
 	typedef struct {
--=20
2.21.0


=46rom 74baf0e382f75e406408ead58583f03acb22ca2e Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:16:23 +0200
Subject: [PATCH 05/15] idl: add xattr_DosInfo4 to xattr_DosInfo in xattr.idl

---
 librpc/idl/xattr.idl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/librpc/idl/xattr.idl b/librpc/idl/xattr.idl
index da92e0107d4..a29c27a4a56 100644
--- a/librpc/idl/xattr.idl
+++ b/librpc/idl/xattr.idl
@@ -69,6 +69,7 @@ interface xattr
=20
 	typedef [bitmap32bit] bitmap {
 		XATTR_DOSINFO_ATTRIB            =3D 0x00000001,
+		XATTR_DOSINFO_BIRTH_TIME        =3D 0x00000002,
 		XATTR_DOSINFO_CREATE_TIME       =3D 0x00000010
 	} xattr_DosInfoValidFlags;
=20
@@ -82,11 +83,19 @@ interface xattr
 		NTTIME change_time;
 	} xattr_DosInfo3;
=20
+	typedef struct {
+		xattr_DosInfoValidFlags valid_flags;
+		uint32 attrib;
+		NTTIME birth_time;
+		NTTIME create_time;
+	} xattr_DosInfo4;
+
 	typedef [public,switch_type(uint16)] union {
 		[case(0xFFFF)] xattr_DosInfoFFFFCompat compatinfoFFFF;
                 [case(1)] xattr_DosInfo1 info1;
                 [case(2)] xattr_DosInfo2Old oldinfo2;
 		[case(3)] xattr_DosInfo3 info3;
+		[case(4)] xattr_DosInfo4 info4;
         } xattr_DosInfo;
=20
 	typedef [public] struct {
--=20
2.21.0


=46rom b87df2161e15f4d36c920ffe7b951b5c82359b92 Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:15:39 +0200
Subject: [PATCH 06/15] s3/include: add original_btime and file_index to str=
uct
 stat_ex

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/include/includes.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/source3/include/includes.h b/source3/include/includes.h
index c26b75f5791..2f33a6455fe 100644
--- a/source3/include/includes.h
+++ b/source3/include/includes.h
@@ -209,6 +209,21 @@ struct stat_ex {
 	struct timespec st_ex_btime; /* birthtime */
 	/* Is birthtime real, or was it calculated ? */
 	bool		st_ex_calculated_birthtime;
+
+	/*
+	 * Immutable original birth time, set when a file is created,
+	 * may not be set by the client.
+	 */
+	struct timespec st_ex_original_btime;
+
+	/*
+	 * Whether st_ex_original_btime was calculated.
+	 */
+	bool		st_ex_calculated_original_btime;
+
+	bool		st_ex_valid_file_index;
+	uint64_t	st_ex_file_index;
+
 	blksize_t	st_ex_blksize;
 	blkcnt_t	st_ex_blocks;
=20
--=20
2.21.0


=46rom 2777c3821f6a7ba2436f224e5a9c7eb89f44b558 Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 12:44:03 +0200
Subject: [PATCH 07/15] s3/lib: initialize original_btime from btime in
 make_create_timespec()

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/lib/system.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/source3/lib/system.c b/source3/lib/system.c
index 9dd04ca5e3d..72d91fab8fa 100644
--- a/source3/lib/system.c
+++ b/source3/lib/system.c
@@ -313,6 +313,9 @@ static void make_create_timespec(const struct stat *pst=
, struct stat_ex *dst,
 		dst->st_ex_btime =3D calc_create_time_stat(pst);
 		dst->st_ex_calculated_birthtime =3D true;
 	}
+
+	dst->st_ex_original_btime =3D dst->st_ex_btime;
+	dst->st_ex_calculated_original_btime =3D true;
 }
=20
 /*************************************************************************=
***
--=20
2.21.0


=46rom 8b120891cdcb777dbef03d0961f5c0edc68b1787 Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 13:13:08 +0200
Subject: [PATCH 08/15] s3/lib: add update_stat_ex_birth_time()

---
 source3/include/proto.h | 1 +
 source3/lib/system.c    | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/source3/include/proto.h b/source3/include/proto.h
index 484afc959b9..12c5877301a 100644
--- a/source3/include/proto.h
+++ b/source3/include/proto.h
@@ -220,6 +220,7 @@ ssize_t sys_recvfrom(int s, void *buf, size_t len, int =
flags, struct sockaddr *f
 int sys_fcntl_ptr(int fd, int cmd, void *arg);
 int sys_fcntl_long(int fd, int cmd, long arg);
 void update_stat_ex_mtime(struct stat_ex *dst, struct timespec write_ts);
+void update_stat_ex_birth_time(struct stat_ex *dst, struct timespec birth_=
time);
 void update_stat_ex_create_time(struct stat_ex *dst, struct timespec creat=
e_time);
 int sys_stat(const char *fname, SMB_STRUCT_STAT *sbuf,
 	     bool fake_dir_create_times);
diff --git a/source3/lib/system.c b/source3/lib/system.c
index 72d91fab8fa..413e34081de 100644
--- a/source3/lib/system.c
+++ b/source3/lib/system.c
@@ -342,6 +342,13 @@ void update_stat_ex_create_time(struct stat_ex *dst,
 	dst->st_ex_calculated_birthtime =3D false;
 }
=20
+void update_stat_ex_birth_time(struct stat_ex *dst,
+			       struct timespec birth_time)
+{
+	dst->st_ex_original_btime =3D birth_time;
+	dst->st_ex_calculated_original_btime =3D false;
+}
+
 void init_stat_ex_from_stat (struct stat_ex *dst,
 			    const struct stat *src,
 			    bool fake_dir_create_times)
--=20
2.21.0


=46rom 06d4f430a6c1c4e21eea705796ca92e88149d481 Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:24:17 +0200
Subject: [PATCH 09/15] s3/lib: add update_stat_ex_file_index()

---
 source3/include/proto.h | 1 +
 source3/lib/system.c    | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/source3/include/proto.h b/source3/include/proto.h
index 12c5877301a..4289bde0470 100644
--- a/source3/include/proto.h
+++ b/source3/include/proto.h
@@ -222,6 +222,7 @@ int sys_fcntl_long(int fd, int cmd, long arg);
 void update_stat_ex_mtime(struct stat_ex *dst, struct timespec write_ts);
 void update_stat_ex_birth_time(struct stat_ex *dst, struct timespec birth_=
time);
 void update_stat_ex_create_time(struct stat_ex *dst, struct timespec creat=
e_time);
+void update_stat_ex_file_index(struct stat_ex *dst, uint64_t file_index);
 int sys_stat(const char *fname, SMB_STRUCT_STAT *sbuf,
 	     bool fake_dir_create_times);
 int sys_fstat(int fd, SMB_STRUCT_STAT *sbuf,
diff --git a/source3/lib/system.c b/source3/lib/system.c
index 413e34081de..b5266a5cba0 100644
--- a/source3/lib/system.c
+++ b/source3/lib/system.c
@@ -349,6 +349,13 @@ void update_stat_ex_birth_time(struct stat_ex *dst,
 	dst->st_ex_calculated_original_btime =3D false;
 }
=20
+void update_stat_ex_file_index(struct stat_ex *dst,
+			       uint64_t file_index)
+{
+	dst->st_ex_file_index =3D file_index;
+	dst->st_ex_valid_file_index =3D true;
+}
+
 void init_stat_ex_from_stat (struct stat_ex *dst,
 			    const struct stat *src,
 			    bool fake_dir_create_times)
--=20
2.21.0


=46rom 4d7d97cccb757707df3ac43561b0c7f8e041791b Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:13:28 +0200
Subject: [PATCH 10/15] s3/lib: add make_file_index_from_btime()

---
 source3/lib/file_index.c | 55 ++++++++++++++++++++++++++++++++++++++++
 source3/lib/file_index.h | 23 +++++++++++++++++
 source3/wscript_build    |  1 +
 3 files changed, 79 insertions(+)
 create mode 100644 source3/lib/file_index.c
 create mode 100644 source3/lib/file_index.h

diff --git a/source3/lib/file_index.c b/source3/lib/file_index.c
new file mode 100644
index 00000000000..274ba098bf3
--- /dev/null
+++ b/source3/lib/file_index.c
@@ -0,0 +1,55 @@
+/*
+   Unix SMB/CIFS implementation.
+
+   Copyright (C) Ralph Boehme 2019
+
+   This program is free software; you can redistribute it and/or modify
+   it under the terms of the GNU General Public License as published by
+   the Free Software Foundation; either version 3 of the License, or
+   (at your option) any later version.
+
+   This program is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+   GNU General Public License for more details.
+
+   You should have received a copy of the GNU General Public License
+   along with this program.  If not, see <http://www.gnu.org/licenses/>.
+*/
+
+#include "includes.h"
+#include "file_index.h"
+
+uint64_t make_file_index_from_btime(SMB_STRUCT_STAT *st)
+{
+	struct timespec btime =3D st->st_ex_original_btime;
+	ino_t ino =3D st->st_ex_ino;
+	uint64_t file_index_low;
+	uint64_t file_index;
+
+	if (st->st_ex_calculated_original_btime) {
+		return ino;
+	}
+
+	file_index_low =3D btime.tv_nsec;
+	if (file_index_low =3D=3D 0) {
+		/*
+		 * This could be by coincidence, but more likely the filesystem
+		 * is only giving us seconds granularity. We need more fine
+		 * grained granularity for the File-ID, so combine with the
+		 * inode number.
+		 */
+		file_index_low =3D ino & 0x3fffffff;
+	}
+
+	/*
+	 * Set the high bit so ideally File-IDs based on inode numbers and
+	 * File-IDs based on Birth Time use disjoint ranges, given inodes never
+	 * have the high bit set.
+	 */
+	file_index =3D ((uint64_t)1) << 63;
+	file_index |=3D (uint64_t)btime.tv_sec << 30;
+	file_index |=3D file_index_low;
+
+	return file_index;
+}
diff --git a/source3/lib/file_index.h b/source3/lib/file_index.h
new file mode 100644
index 00000000000..0837cbe3d7f
--- /dev/null
+++ b/source3/lib/file_index.h
@@ -0,0 +1,23 @@
+/*
+   Unix SMB/CIFS implementation.
+
+   Copyright (C) Ralph Boehme 2019
+
+   This program is free software; you can redistribute it and/or modify
+   it under the terms of the GNU General Public License as published by
+   the Free Software Foundation; either version 3 of the License, or
+   (at your option) any later version.
+
+   This program is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+   GNU General Public License for more details.
+
+   You should have received a copy of the GNU General Public License
+   along with this program.  If not, see <http://www.gnu.org/licenses/>.
+*/
+
+/*
+ * Make a FileIndex from a timespec
+ */
+uint64_t make_file_index_from_btime(SMB_STRUCT_STAT *st);
diff --git a/source3/wscript_build b/source3/wscript_build
index edd973d6994..6a6aa4ae046 100644
--- a/source3/wscript_build
+++ b/source3/wscript_build
@@ -968,6 +968,7 @@ bld.SAMBA3_LIBRARY('samba3-util',
                           lib/util_malloc.c
                           lib/namearray.c
                           lib/file_id.c
+                          lib/file_index.c
                           lib/cbuf.c
                           lib/per_thread_cwd.c
                           ''',
--=20
2.21.0


=46rom 74f560cb175e40f712a85b402488d265cc4ef22a Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:25:21 +0200
Subject: [PATCH 11/15] s3:smbd: parse xattr_DosInfo4 in
 parse_dos_attribute_blob()

---
 source3/smbd/dosmode.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/source3/smbd/dosmode.c b/source3/smbd/dosmode.c
index a4625718a56..5efd47fcc4b 100644
--- a/source3/smbd/dosmode.c
+++ b/source3/smbd/dosmode.c
@@ -27,6 +27,7 @@
 #include "smbd/smbd.h"
 #include "lib/param/loadparm.h"
 #include "lib/util/tevent_ntstatus.h"
+#include "lib/file_index.h"
=20
 static NTSTATUS get_file_handle_for_metadata(connection_struct *conn,
 				const struct smb_filename *smb_fname,
@@ -325,6 +326,43 @@ NTSTATUS parse_dos_attribute_blob(struct smb_filename =
*smb_fname,
 						      create_time)));
 		}
 		break;
+	case 4:
+	{
+		struct xattr_DosInfo4 *info =3D &dosattrib.info.info4;
+
+		dosattr =3D info->attrib;
+
+		if ((info->valid_flags & XATTR_DOSINFO_CREATE_TIME) &&
+		    !null_nttime(info->create_time))
+		{
+			struct timespec creat_time;
+
+			creat_time =3D nt_time_to_unix_timespec(info->create_time);
+			update_stat_ex_create_time(&smb_fname->st, creat_time);
+
+			DBG_DEBUG("file [%s] creation time [%s]\n",
+				  smb_fname_str_dbg(smb_fname),
+				  display_time(info->create_time));
+		}
+
+		if ((info->valid_flags & XATTR_DOSINFO_BIRTH_TIME) &&
+		    !null_nttime(info->birth_time))
+		{
+			struct timespec birth_time;
+			uint64_t file_index;
+
+			birth_time =3D nt_time_to_unix_timespec(info->birth_time);
+			update_stat_ex_birth_time(&smb_fname->st, birth_time);
+
+			file_index =3D make_file_index_from_btime(&smb_fname->st);
+			update_stat_ex_file_index(&smb_fname->st, file_index);
+
+			DBG_DEBUG("file [%s] birth time [%s]\n",
+				  smb_fname_str_dbg(smb_fname),
+				  display_time(info->birth_time));
+		}
+		break;
+	}
 	default:
 		DBG_WARNING("Badly formed DOSATTRIB on file %s - %s\n",
 			    smb_fname_str_dbg(smb_fname), blob.data);
--=20
2.21.0


=46rom 7584e4cd83f74b6c325b3dbb8f6f68dec4261b2d Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:26:10 +0200
Subject: [PATCH 12/15] s3:smbd: use xattr_DosInfo4 in set_ea_dos_attribute()

original_btime can be calculated with file that were created with dosattrib
versions before 4.
---
 source3/smbd/dosmode.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/source3/smbd/dosmode.c b/source3/smbd/dosmode.c
index 5efd47fcc4b..b688cb86817 100644
--- a/source3/smbd/dosmode.c
+++ b/source3/smbd/dosmode.c
@@ -482,13 +482,19 @@ NTSTATUS set_ea_dos_attribute(connection_struct *conn,
 	ZERO_STRUCT(dosattrib);
 	ZERO_STRUCT(blob);
=20
-	dosattrib.version =3D 3;
-	dosattrib.info.info3.valid_flags =3D XATTR_DOSINFO_ATTRIB|
+	dosattrib.version =3D 4;
+	dosattrib.info.info4.valid_flags =3D XATTR_DOSINFO_ATTRIB |
 					XATTR_DOSINFO_CREATE_TIME;
-	dosattrib.info.info3.attrib =3D dosmode;
-	dosattrib.info.info3.create_time =3D unix_timespec_to_nt_time(
+	dosattrib.info.info4.attrib =3D dosmode;
+	dosattrib.info.info4.create_time =3D unix_timespec_to_nt_time(
 				smb_fname->st.st_ex_btime);
=20
+	if (!smb_fname->st.st_ex_calculated_original_btime) {
+		dosattrib.info.info4.valid_flags |=3D XATTR_DOSINFO_BIRTH_TIME;
+		dosattrib.info.info4.birth_time =3D unix_timespec_to_nt_time(
+			smb_fname->st.st_ex_original_btime);
+	}
+
 	DEBUG(10,("set_ea_dos_attributes: set attribute 0x%x, btime =3D %s on fil=
e %s\n",
 		(unsigned int)dosmode,
 		time_to_asc(convert_timespec_to_time_t(smb_fname->st.st_ex_btime)),
--=20
2.21.0


=46rom 1b002120d8ab9267713a332757b4ebcbdba47c02 Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 12:07:59 +0200
Subject: [PATCH 13/15] s3:smbd: return inode number, not FileIndex for UNIX
 query info level

get_FileIndex() returns a stable and unique numerical identifier when "stor=
e dos
attributes" is enable. It is NOT the same as a file's inode number and is N=
OT
used as the key for locking.tdb (where the inode number is used).

For POSIX clients we should return the inode numbers in the POSIX query info
level and the FileIndex in the corresponding SMB protocol fields (eg SMB2 Q=
FID
create context).

This fix lets test "smbtorture_s3.plain.CLEANUP3" test work with get_FileIn=
dex()
returning something different then the file's inode number.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/smbd/trans2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/source3/smbd/trans2.c b/source3/smbd/trans2.c
index 6a59d9c700b..473832412f9 100644
--- a/source3/smbd/trans2.c
+++ b/source3/smbd/trans2.c
@@ -4525,7 +4525,6 @@ static char *store_file_unix_basic(connection_struct =
*conn,
 				files_struct *fsp,
 				const SMB_STRUCT_STAT *psbuf)
 {
-	uint64_t file_index =3D get_FileIndex(conn, psbuf);
 	dev_t devno;
=20
 	DEBUG(10,("store_file_unix_basic: SMB_QUERY_FILE_UNIX_BASIC\n"));
@@ -4567,7 +4566,7 @@ static char *store_file_unix_basic(connection_struct =
*conn,
 	SIVAL(pdata,4,0);
 	pdata +=3D 8;
=20
-	SINO_T_VAL(pdata,0,(SMB_INO_T)file_index);   /* inode number */
+	SINO_T_VAL(pdata,0,psbuf->st_ex_ino);   /* inode number */
 	pdata +=3D 8;
=20
 	SIVAL(pdata,0, unix_perms_to_wire(psbuf->st_ex_mode));     /* Standard UN=
IX file permissions */
--=20
2.21.0


=46rom 30384329e2f41e49e1cef93c2946a867c9374a2f Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Mon, 24 Jun 2019 17:44:10 +0200
Subject: [PATCH 14/15] s3:smbd: use stored File-ID

---
 source3/smbd/smb2_query_directory.c | 8 ++++++++
 source3/smbd/trans2.c               | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/source3/smbd/smb2_query_directory.c b/source3/smbd/smb2_query_=
directory.c
index 13fb820ce6c..7b52c11a84b 100644
--- a/source3/smbd/smb2_query_directory.c
+++ b/source3/smbd/smb2_query_directory.c
@@ -1023,6 +1023,7 @@ static void fetch_dos_mode_done(struct tevent_req *su=
breq)
 	struct timespec btime_ts =3D {0};
 	off_t dosmode_off;
 	off_t btime_off;
+	off_t file_idx_off;
 	NTSTATUS status;
=20
 	status =3D dos_mode_at_recv(subreq, &dosmode);
@@ -1044,6 +1045,7 @@ static void fetch_dos_mode_done(struct tevent_req *su=
breq)
 	case SMB_FIND_ID_FULL_DIRECTORY_INFO:
 		btime_off =3D 8;
 		dosmode_off =3D 56;
+		file_idx_off =3D 16;
 		break;
=20
 	default:
@@ -1074,6 +1076,12 @@ static void fetch_dos_mode_done(struct tevent_req *s=
ubreq)
 			       (char *)state->entry_marshall_buf + btime_off,
 			       btime_ts);
=20
+	if (state->smb_fname->st.st_ex_valid_file_index) {
+		SBVAL(state->entry_marshall_buf,
+		      file_idx_off,
+		      state->smb_fname->st.st_ex_file_index);
+	}
+
 	tevent_req_done(req);
 	return;
 }
diff --git a/source3/smbd/trans2.c b/source3/smbd/trans2.c
index 473832412f9..1443313f536 100644
--- a/source3/smbd/trans2.c
+++ b/source3/smbd/trans2.c
@@ -150,6 +150,9 @@ uint64_t get_FileIndex(connection_struct *conn, const S=
MB_STRUCT_STAT *psbuf)
 		return 0;
 	}
 	if (conn->base_share_dev =3D=3D psbuf->st_ex_dev) {
+		if (psbuf->st_ex_valid_file_index) {
+			return psbuf->st_ex_file_index;
+		}
 		return (uint64_t)psbuf->st_ex_ino;
 	}
 	file_index =3D ((psbuf->st_ex_ino) & UINT32_MAX); /* FileIndexLow */
--=20
2.21.0


=46rom 83f88f2ce9a95b1ad6b1ce96edb8aace2984b317 Mon Sep 17 00:00:00 2001
=46rom: Ralph Boehme <slow@samba.org>
Date: Wed, 26 Jun 2019 13:40:05 +0200
Subject: [PATCH 15/15] s3:smbd: set the original birthtime if we created a
 file or dir

---
 source3/smbd/open.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/source3/smbd/open.c b/source3/smbd/open.c
index 0d9b2f17d9c..981b1abb131 100644
--- a/source3/smbd/open.c
+++ b/source3/smbd/open.c
@@ -3808,6 +3808,11 @@ static NTSTATUS open_file_ntcreate(connection_struct=
 *conn,
 		fsp->initial_delete_on_close =3D True;
 	}
=20
+	if (info =3D=3D FILE_WAS_CREATED) {
+		update_stat_ex_birth_time(&fsp->fsp_name->st,
+					  fsp->fsp_name->st.st_ex_btime);
+	}
+
 	if (info !=3D FILE_WAS_OPENED) {
 		/* Overwritten files should be initially set as archive */
 		if ((info =3D=3D FILE_WAS_OVERWRITTEN && lp_map_archive(SNUM(conn))) ||
@@ -3955,6 +3960,8 @@ static NTSTATUS mkdir_internal(connection_struct *con=
n,
 		return NT_STATUS_NOT_A_DIRECTORY;
 	}
=20
+	update_stat_ex_birth_time(&smb_dname->st, smb_dname->st.st_ex_btime);
+
 	if (lp_store_dos_attributes(SNUM(conn))) {
 		if (!posix_open) {
 			file_set_dosmode(conn, smb_dname,
--=20
2.21.0


--adlno45n2xihibvt--

