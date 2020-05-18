Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE081D8AFD
	for <lists+samba-technical@lfdr.de>; Tue, 19 May 2020 00:32:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=SUy7ociEbNy06B4/m+KgNBikMGavBsrUEPwPAr7Oys4=; b=JjrDINimncMDVWb0qA2k47tfJd
	w0ZP0XFHHtLj7HBifUoxYxoYstcRUOHfXXjsN9FLK4v5RG0bwim1Ji12nH1eAAEfYC3BFhk/MCd3H
	ChhhiuHMEx/rcmdPVZnCNb36bjLpLNJkflJzSRdyVfxm3gVOnYjn4xImj4BtgULHFNTCj00b9Xgia
	FkwoFcpr5jI/CdqI1eFVQnwvtpfuBfWIOvljQy2Fa++G73buZYoPVyp4vBvISOGoDx/29a65+nh0i
	ehINqcDPy0L31THKgXRMJQZ1okjo/WT2JKs4oX7sLWb0W9SkuBhITY+6gOna9QtErBpmBY7oKyEd8
	70xvY35g==;
Received: from localhost ([::1]:51666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jaoIY-005245-CR; Mon, 18 May 2020 22:31:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40866) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jaoIQ-00523y-Te
 for samba-technical@lists.samba.org; Mon, 18 May 2020 22:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=SUy7ociEbNy06B4/m+KgNBikMGavBsrUEPwPAr7Oys4=; b=lkhPrkDNpfyL2qgaq6KnE8SYjM
 bP8/7wBCz8+MxDTMsTRQuLHPyMb2yYNaRUPn6ojG18yDvr7yGsdZpbQ96xHZ9NoePmf3kC/0Ojy7i
 74K4vVXet9Ac8EV6JCNSNGIudUjJtFMDEGORWDXbk+MPn8VaObuJLV+sWomXOm6y2gUG/x7+NuTkN
 EBRydXS/bPpoSQVLxwxxd09slCjmAs5POM9zjqfWOUWmvBO5775bfY6JdKWyZbWEZqSxvbe0A7F07
 tZLF/U8WdnNdd9ERRnEUO3ajq3pKRppkV46BDh9+b6Jmej3UZQxaqhGa9xqIXXagIpaApv3vNWy15
 HAzAC5Xk1VVFksbJia1vzQfbfuvP+0njOMOyCzZp8fY/9Xuo3qtZSwMAr8d70jVGLfRUg4nJPgJyF
 i3CgymA4lu9WPR37DD/kDwliIihp7joTWDSTUEConqLnkhWalIILY7j5+FDczlJrD49Q73brtRrHc
 Yd3atbLC+V7D+zYmMObrjQ+7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jaoIO-0006ad-6S; Mon, 18 May 2020 22:31:40 +0000
Date: Mon, 18 May 2020 15:31:34 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH] SMB2 Compound related chain handling when generation of
 FileId has failed
Message-ID: <20200518223134.GF30317@jeremy-acer>
References: <CAGuNez4rgOrtf_jEX1TC-D-bjaFVRr46=WmMi5N1hdqoYBP1ig@mail.gmail.com>
 <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
 <CAPkcVAEg+PQC1Q5=2oXWZeM7ZvS6JJe46HpERAbxVydM2iz0oQ@mail.gmail.com>
 <d994e36b-614a-06d6-385d-8ca696b37dcd@samba.org>
 <CAPkcVAHPa7fpeDO8BoyBdYr2ekNNROD1uM+_55etG0vugMYETQ@mail.gmail.com>
 <6133c69c-8b85-179b-0f93-380f6d43d853@samba.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6133c69c-8b85-179b-0f93-380f6d43d853@samba.org>
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
Cc: anubhav rakshit <anubhav.rakshit@gmail.com>, hemanth.thummala@nutanix.com,
 "samba-technical@lists.samba.org \(samba-technical@lists.samba.org\)"
 <samba-technical@lists.samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 18, 2020 at 06:06:14PM +0200, Ralph Boehme via samba-technical wrote:
> Am 5/18/20 um 6:00 PM schrieb anubhav rakshit:
> > 
> > 
> > On Mon, May 18, 2020 at 8:37 PM Ralph Boehme <slow@samba.org
> > <mailto:slow@samba.org>> wrote:
> > 
> >     Am 5/18/20 um 5:02 PM schrieb anubhav rakshit:
> >     > Hi Ralph,
> >     > I am attaching additional test case that would verify
> >     > Create(RO)->Read->Write->Read->Close chain. As expected we see Write
> >     > failing with ACCESS DENIED.
> > 
> >     yes, that's as expected. WHat about the read?
> > 
> > Both the Reads succeed.
> 
> cool, slow: 1, metze: 0: :)))
> 
> >     Also, CI fails with the new code:
> > 
> >     https://gitlab.com/samba-team/devel/samba/-/jobs/557045164
> > 
> >     I have no clue to offer atm why this fails in an unrelated test. Sorry!
> > 
> > Let me triage the failure.

Ah, I think I've found the problem.

In smbd_smb2_request_dispatch() when
file_fsp_smb2() fails to find a file
handle you're unconditionally checking
and returning req->compound_create_err
if it's not NULL. You should only check
and return that if it's in a compound
request (req->compound_related == true).

I have an updated patchset that fixes
this (attached). I'm running in gitlab-ci
now.

Before we proceed, have you filled in
the Samba copyright policy form here:

https://www.samba.org/samba/devel/copyright-policy.html

If not, email it in - that way we know we've
got the rights to integrate the code !

Cheers,

	Jeremy.

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=compound-related-fails
Content-Transfer-Encoding: quoted-printable

=46rom cd94878c8bcca38012d4d27099c032e923ef779e Mon Sep 17 00:00:00 2001
=46rom: Anubhav Rakshit <anubhav.rakshit@gmail.com>
Date: Sat, 16 May 2020 00:02:18 +0530
Subject: [PATCH 1/2] Add couple of compound related test cases to verify th=
at
 server should return NTSTATUS of the failed Create for succeeding requests.

We already pass samba3.smb2.compound.related5, but mark related4 as knownfa=
il.

Signed-off-by: Anubhav Rakshit <anubhav.rakshit@gmail.com>
Reviewed-by: Jeremy Allison <jra@samba.org>
---
 selftest/knownfail              |   1 +
 source4/torture/smb2/compound.c | 168 ++++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+)

diff --git a/selftest/knownfail b/selftest/knownfail
index 38e8597deda..10dfd3850cf 100644
--- a/selftest/knownfail
+++ b/selftest/knownfail
@@ -211,6 +211,7 @@
 ^samba3.smb2.session.*reauth5 # some special anonymous checks?
 ^samba3.smb2.compound.interim2 # wrong return code (STATUS_CANCELLED)
 ^samba3.smb2.compound.aio.interim2 # wrong return code (STATUS_CANCELLED)
+^samba3.smb2.compound.related4
 ^samba3.smb2.replay.channel-sequence
 ^samba3.smb2.replay.replay3
 ^samba3.smb2.replay.replay4
diff --git a/source4/torture/smb2/compound.c b/source4/torture/smb2/compoun=
d.c
index fd657a4a16e..ad1c94df04c 100644
--- a/source4/torture/smb2/compound.c
+++ b/source4/torture/smb2/compound.c
@@ -24,6 +24,8 @@
 #include "libcli/smb2/smb2_calls.h"
 #include "torture/torture.h"
 #include "torture/smb2/proto.h"
+#include "libcli/security/security.h"
+#include "librpc/gen_ndr/ndr_security.h"
 #include "../libcli/smb/smbXcli_base.h"
=20
 #define CHECK_STATUS(status, correct) do { \
@@ -441,6 +443,168 @@ done:
 	return ret;
 }
=20
+static bool test_compound_related4(struct torture_context *tctx,
+			struct smb2_tree *tree)
+{
+	struct smb2_handle hd;
+	struct smb2_create cr;
+	union smb_setfileinfo set;
+	struct smb2_ioctl io;
+	struct smb2_close cl;
+	struct security_descriptor *sd;
+	NTSTATUS status;
+	const char *fname =3D "compound_related4.dat";
+	struct smb2_request *req[4];
+	bool ret =3D true;
+
+	smb2_util_unlink(tree, fname);
+
+	ZERO_STRUCT(cr);
+	cr.level =3D RAW_OPEN_SMB2;
+	cr.in.create_flags =3D 0;
+	cr.in.desired_access =3D SEC_STD_READ_CONTROL |
+				SEC_STD_WRITE_DAC |
+				SEC_STD_WRITE_OWNER;
+	cr.in.create_options =3D 0;
+	cr.in.file_attributes =3D FILE_ATTRIBUTE_NORMAL;
+	cr.in.share_access =3D NTCREATEX_SHARE_ACCESS_DELETE |
+				NTCREATEX_SHARE_ACCESS_READ |
+				NTCREATEX_SHARE_ACCESS_WRITE;
+	cr.in.alloc_size =3D 0;
+	cr.in.create_disposition =3D NTCREATEX_DISP_OPEN_IF;
+	cr.in.impersonation_level =3D NTCREATEX_IMPERSONATION_ANONYMOUS;
+	cr.in.security_flags =3D 0;
+	cr.in.fname =3D fname;
+
+	status =3D smb2_create(tree, tctx, &cr);
+	CHECK_STATUS(status, NT_STATUS_OK);
+	hd =3D cr.out.file.handle;
+	torture_comment(tctx, "set a sec desc allowing no write by CREATOR_OWNER\=
n");
+	sd =3D security_descriptor_dacl_create(tctx,
+			0, NULL, NULL,
+			SID_CREATOR_OWNER,
+			SEC_ACE_TYPE_ACCESS_ALLOWED,
+			SEC_RIGHTS_FILE_READ | SEC_STD_ALL,
+			0,
+			NULL);
+	if (sd =3D=3D NULL) {
+		ret =3D false;
+		goto done;
+	}
+
+	set.set_secdesc.level =3D RAW_SFILEINFO_SEC_DESC;
+	set.set_secdesc.in.file.handle =3D hd;
+	set.set_secdesc.in.secinfo_flags =3D SECINFO_DACL;
+	set.set_secdesc.in.sd =3D sd;
+
+	status =3D smb2_setinfo_file(tree, &set);
+	CHECK_STATUS(status, NT_STATUS_OK);
+
+	torture_comment(tctx, "try open for write\n");
+	cr.in.desired_access =3D SEC_FILE_WRITE_DATA;
+	smb2_transport_compound_start(tree->session->transport, 4);
+	req[0] =3D smb2_create_send(tree, &cr);
+	if (req[0] =3D=3D NULL) {
+		ret =3D false;
+		goto done;
+	}
+	hd.data[0] =3D UINT64_MAX;
+	hd.data[1] =3D UINT64_MAX;
+
+	smb2_transport_compound_set_related(tree->session->transport, true);
+	ZERO_STRUCT(io);
+	io.in.function =3D FSCTL_CREATE_OR_GET_OBJECT_ID;
+	io.in.file.handle =3D hd;
+	io.in.flags =3D 1;
+
+	req[1] =3D smb2_ioctl_send(tree, &io);
+	if (req[1] =3D=3D NULL) {
+		ret =3D false;
+		goto done;
+	}
+
+	ZERO_STRUCT(cl);
+	cl.in.file.handle =3D hd;
+
+	req[2] =3D smb2_close_send(tree, &cl);
+	if (req[2] =3D=3D NULL) {
+		ret =3D false;
+		goto done;
+	}
+
+	set.set_secdesc.in.file.handle =3D hd;
+
+	req[3] =3D smb2_setinfo_file_send(tree, &set);
+	if (req[3] =3D=3D NULL) {
+		ret =3D false;
+		goto done;
+	}
+
+	status =3D smb2_create_recv(req[0], tree, &cr);
+	CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
+	status =3D smb2_ioctl_recv(req[1], tree, &io);
+	CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
+	status =3D smb2_close_recv(req[2], &cl);
+	CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
+	status =3D smb2_setinfo_recv(req[3]);
+	CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
+
+  done:
+	smb2_util_unlink(tree, fname);
+	smb2_tdis(tree);
+	smb2_logoff(tree->session);
+	return ret;
+}
+
+static bool test_compound_related5(struct torture_context *tctx,
+				   struct smb2_tree *tree)
+{
+	struct smb2_handle hd;
+	struct smb2_ioctl io;
+	struct smb2_close cl;
+	struct smb2_request *req[2];
+	NTSTATUS status;
+	bool ret =3D false;
+
+	smb2_transport_compound_start(tree->session->transport, 2);
+
+	hd.data[0] =3D UINT64_MAX;
+	hd.data[1] =3D UINT64_MAX;
+
+	ZERO_STRUCT(io);
+	io.in.function =3D FSCTL_CREATE_OR_GET_OBJECT_ID;
+	io.in.file.handle =3D hd;
+	io.in.flags =3D 1;
+
+	req[0] =3D smb2_ioctl_send(tree, &io);
+	if (req[0] =3D=3D NULL) {
+		goto done;
+	}
+
+	smb2_transport_compound_set_related(tree->session->transport, true);
+
+	ZERO_STRUCT(cl);
+	cl.in.file.handle =3D hd;
+
+	req[1] =3D smb2_close_send(tree, &cl);
+	if (req[1] =3D=3D NULL) {
+		goto done;
+	}
+
+	status =3D smb2_ioctl_recv(req[0], tree, &io);
+	CHECK_STATUS(status, NT_STATUS_FILE_CLOSED);
+	status =3D smb2_close_recv(req[1], &cl);
+	CHECK_STATUS(status, NT_STATUS_FILE_CLOSED);
+
+	ret =3D true;
+
+done:
+
+	smb2_tdis(tree);
+	smb2_logoff(tree->session);
+	return ret;
+}
+
 static bool test_compound_padding(struct torture_context *tctx,
 				  struct smb2_tree *tree)
 {
@@ -1436,6 +1600,10 @@ struct torture_suite *torture_smb2_compound_init(TAL=
LOC_CTX *ctx)
 	torture_suite_add_1smb2_test(suite, "related2", test_compound_related2);
 	torture_suite_add_1smb2_test(suite, "related3",
 				     test_compound_related3);
+	torture_suite_add_1smb2_test(suite, "related4",
+				     test_compound_related4);
+	torture_suite_add_1smb2_test(suite, "related5",
+				     test_compound_related5);
 	torture_suite_add_1smb2_test(suite, "unrelated1", test_compound_unrelated=
1);
 	torture_suite_add_1smb2_test(suite, "invalid1", test_compound_invalid1);
 	torture_suite_add_1smb2_test(suite, "invalid2", test_compound_invalid2);
--=20
2.20.1


=46rom 5bb03576d527b0c774ed3a14b57ee88c290baaec Mon Sep 17 00:00:00 2001
=46rom: Anubhav Rakshit <anubhav.rakshit@gmail.com>
Date: Sat, 16 May 2020 02:09:16 +0530
Subject: [PATCH 2/2] SMB2 Compound related chain handling when generation of
 FileId has failed

Issue:
We have a scenario where an application sends a Compound Related chain
consisting of:
SMB2_CREATE
SMB2_IOCTL
SMB2_SET_INFO
SMB2_CLOSE

SMB2_CREATE failed with NT_STATUS_ACCESS_DENIED and subsequent
requests all fail. In Samba they return NT_STATUS_FILE_CLOSED.

When I tried the same against a Win2k12 server, I noticed that all the
failed requests of the chain would return NT_STATUS_ACCESS_DENIED.

I believe this behaviour is also mentioned in the [MS-SMB2] Specs
3.3.5.2.7.2: Handling Compounded Related Requests

"When the current operation requires a FileId and the previous
operation either contains or generates a FileId, if the previous
operation fails with an error, the server SHOULD<223> fail the current
operation with the same error code returned by the previous
operation."

Fix:
Save NTATUS of a failed Create request. When we process subsequent
requests of the chain we check if the previous Create has failed. In
case of a Create failure we returned the saved NTSTATUS.

Signed-off-by: Anubhav Rakshit <anubhav.rakshit@gmail.com>
Reviewed-by: Jeremy Allison <jra@samba.org>
---
 selftest/knownfail         | 1 -
 source3/smbd/globals.h     | 1 +
 source3/smbd/smb2_create.c | 2 ++
 source3/smbd/smb2_server.c | 5 +++++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/selftest/knownfail b/selftest/knownfail
index 10dfd3850cf..38e8597deda 100644
--- a/selftest/knownfail
+++ b/selftest/knownfail
@@ -211,7 +211,6 @@
 ^samba3.smb2.session.*reauth5 # some special anonymous checks?
 ^samba3.smb2.compound.interim2 # wrong return code (STATUS_CANCELLED)
 ^samba3.smb2.compound.aio.interim2 # wrong return code (STATUS_CANCELLED)
-^samba3.smb2.compound.related4
 ^samba3.smb2.replay.channel-sequence
 ^samba3.smb2.replay.replay3
 ^samba3.smb2.replay.replay4
diff --git a/source3/smbd/globals.h b/source3/smbd/globals.h
index d3b6ac2ffe6..76eb4a9fa87 100644
--- a/source3/smbd/globals.h
+++ b/source3/smbd/globals.h
@@ -708,6 +708,7 @@ struct smbd_smb2_request {
 	bool do_encryption;
 	struct tevent_timer *async_te;
 	bool compound_related;
+	NTSTATUS compound_create_err;
=20
 	/*
 	 * Give the implementation of an SMB2 req a way to tell the SMB2 request
diff --git a/source3/smbd/smb2_create.c b/source3/smbd/smb2_create.c
index f3fa6fba646..a971ae7dfea 100644
--- a/source3/smbd/smb2_create.c
+++ b/source3/smbd/smb2_create.c
@@ -332,6 +332,7 @@ static void smbd_smb2_request_create_done(struct tevent=
_req *tsubreq)
 				       &out_context_blobs);
 	if (!NT_STATUS_IS_OK(status)) {
 		error =3D smbd_smb2_request_error(smb2req, status);
+		smb2req->compound_create_err =3D status;
 		if (!NT_STATUS_IS_OK(error)) {
 			smbd_server_connection_terminate(smb2req->xconn,
 							 nt_errstr(error));
@@ -340,6 +341,7 @@ static void smbd_smb2_request_create_done(struct tevent=
_req *tsubreq)
 		return;
 	}
=20
+	smb2req->compound_create_err =3D status;
 	status =3D smb2_create_blob_push(smb2req, &out_context_buffer, out_contex=
t_blobs);
 	if (!NT_STATUS_IS_OK(status)) {
 		error =3D smbd_smb2_request_error(smb2req, status);
diff --git a/source3/smbd/smb2_server.c b/source3/smbd/smb2_server.c
index c11cc66a710..dd370b7e047 100644
--- a/source3/smbd/smb2_server.c
+++ b/source3/smbd/smb2_server.c
@@ -2792,6 +2792,11 @@ NTSTATUS smbd_smb2_request_dispatch(struct smbd_smb2=
_request *req)
=20
 		fsp =3D file_fsp_smb2(req, file_id_persistent, file_id_volatile);
 		if (fsp =3D=3D NULL) {
+			if (req->compound_related &&
+			    !NT_STATUS_IS_OK(req->compound_create_err)) {
+				return smbd_smb2_request_error(req,
+						req->compound_create_err);
+			}
 			if (!call->allow_invalid_fileid) {
 				return smbd_smb2_request_error(req,
 						NT_STATUS_FILE_CLOSED);
--=20
2.20.1


--17pEHd4RhPHOinZp--

