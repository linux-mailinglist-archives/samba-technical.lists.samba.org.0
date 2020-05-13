Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F301D1B17
	for <lists+samba-technical@lfdr.de>; Wed, 13 May 2020 18:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6AmF3gDrD06lXDpRjJj3fJLGd/qjwElQLz65FiD9C64=; b=cwNi1hwxpyTDpgLEDCuY0Qnsxm
	3Swa64PIaHerMn4IqIsks+0d+AK1QkUXAnsw2Pv+DqYVPuE0BZQlF67uoHAwashanHZ4PMc9EH5w+
	DtD6PSQztM2/x4IFyvEbMTBvytP+18z6UtR/Wi8Z2bOIUAXWmntiHpU1rGdMj9EUOM06dMm4DPEHo
	OIjBRu2uqquPrYKdgXorynQ9tNgstVRlK0sElXZUR9EcSCKd+rW6MBBBQqh4lMxTYcQZCDAb6MoU3
	NYGCV9sOy6GufntHjDK6vgxQ6f++PztZcOA1XgcCLKiU/dty32CAk/p/HnMFifjNe3rqlQrwi0tGw
	s5PLWl8Q==;
Received: from localhost ([::1]:38166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYuIg-004DpD-CL; Wed, 13 May 2020 16:32:06 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44012) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYuIV-004Dp4-8s
 for samba-technical@lists.samba.org; Wed, 13 May 2020 16:32:04 +0000
Received: by mail-ed1-x534.google.com with SMTP id g9so10227876edw.10
 for <samba-technical@lists.samba.org>; Wed, 13 May 2020 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6AmF3gDrD06lXDpRjJj3fJLGd/qjwElQLz65FiD9C64=;
 b=ufPeqGj0CgemwMUVy59domCoLSuJEsisOueCx5NArxk9wFuva5x1H7+YeZXirc/5jH
 urDGwhE7OrSe8XvlKlZjLF8mOKikvLtuweP/Gp1Hdl6Klt01yLVKn/tPx+Eyhc7Y53Id
 jug6l/bqsQBZF1fuMpjDdpnx+TlnyNpK8HgqslZO6fj1K2ux7u4qC3aCNTCuZV0J4nX5
 RpxUz5GrL7XHxxf5zlDYVUeD9DYcJwBFTQ+qtmzyLpgEZF7YUT4bH3PUZ5qM9orf6g2B
 6Tm8/UHXSEzkKplSttIOVXqfj4mo99WBG2SO48OfiUY/+iWjJWTX6177NEZaUfTjJWiw
 CJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6AmF3gDrD06lXDpRjJj3fJLGd/qjwElQLz65FiD9C64=;
 b=AtWmix/oxUSUIJt4XyRq/BotCVbmsYoKmNSrDz27PGMgFWaTz6i0Cf3ykSPPUJI/mQ
 AF8RkfDqEKYkex/Vc28vBqhs2EQLWX0ZljwEJhob1QVvWIXvf+oTxoavDlMvkxuv8oWj
 dkGQ44m/RcbpyB+M3Sqfsa0h895TnIBUcEIyI9tSkQUfG5cbTBs5her3Pj2nCc0v9f4l
 gNBuSKaGzknziK5wfrQ+ALov0FpCndxWILZpgH5Iq0uHcmAiYNM8A6TNeetxHruDAlKs
 3sQnFBAQUJiEjOllXXYGeZzLDBEBKe1QAtd8f4yhChGEOIZWdGui0kuGbyInQ79wagfS
 We5g==
X-Gm-Message-State: AOAM532c+btK8AE+ve+BBwEQEtIXyzlsNTiCgEt//g/qwakHVtukg6T9
 JDg6258fbS+BEvUWo7B7pRz01ZZrzPB4GYFbklIU+t8X
X-Google-Smtp-Source: ABdhPJzrNGsKXldVyeyfiU4TwO6aspEPbmvirssygMSCgdo1GyyZukhAyII3xd6R1FXJkEWLRxZ+OTX5b2SsFOORbPA=
X-Received: by 2002:a50:fa87:: with SMTP id w7mr512768edr.0.1589387511275;
 Wed, 13 May 2020 09:31:51 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 13 May 2020 22:01:38 +0530
Message-ID: <CAGuNez7E0vnWH63JOxCny3eXJNj7DgA9AYRvoACYSZc922Ps0w@mail.gmail.com>
Subject: [RFC] SMB2 Compound related chain handling when generation of FileId
 has failed
To: "samba-technical@lists.samba.org (samba-technical@lists.samba.org)"
 <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000000642da05a58a1ec9"
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
From: Anubhav Rakshit via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anubhav Rakshit <anubhav.rakshit@gmail.com>
Cc: hemanth.thummala@nutanix.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000000642da05a58a1ec9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

=E2=80=9CWhen the current operation requires a FileId and the previous
operation either contains or generates a FileId, if the previous
operation fails with an error, the server SHOULD<223> fail the current
operation with the same error code returned by the previous
operation.=E2=80=9C

I have written a smbtorture test case to verify the above. I also
propose the following fix. I am attaching code for your reference.
Kindly let me know if the changes look reasonable.

+static bool test_compound_related4(struct torture_context *tctx,
+                                   struct smb2_tree *tree) {
+  struct smb2_handle hd;
+  struct smb2_create cr;
+  union smb_setfileinfo set;
+  struct smb2_ioctl io;
+  struct smb2_close cl;
+  struct security_descriptor *sd;
+  NTSTATUS status;
+  const char *fname =3D "compound_related4.dat";
+  struct smb2_request *req[4];
+  bool ret =3D true;
+
+  smb2_util_unlink(tree, fname);
+
+  ZERO_STRUCT(cr);
+  cr.level =3D RAW_OPEN_SMB2;
+  cr.in.create_flags =3D 0;
+  cr.in.desired_access =3D
+      SEC_STD_READ_CONTROL | SEC_STD_WRITE_DAC | SEC_STD_WRITE_OWNER;
+  cr.in.create_options =3D 0;
+  cr.in.file_attributes =3D FILE_ATTRIBUTE_NORMAL;
+  cr.in.share_access =3D NTCREATEX_SHARE_ACCESS_DELETE |
+                       NTCREATEX_SHARE_ACCESS_READ |
+                       NTCREATEX_SHARE_ACCESS_WRITE;
+  cr.in.alloc_size =3D 0;
+  cr.in.create_disposition =3D NTCREATEX_DISP_OPEN_IF;
+  cr.in.impersonation_level =3D NTCREATEX_IMPERSONATION_ANONYMOUS;
+  cr.in.security_flags =3D 0;
+  cr.in.fname =3D fname;
+
+  status =3D smb2_create(tree, tctx, &cr);
+  CHECK_STATUS(status, NT_STATUS_OK);
+  hd =3D cr.out.file.handle;
+  torture_comment(tctx, "set a sec desc allowing no write by CREATOR_OWNER=
\n");
+  sd =3D security_descriptor_dacl_create(tctx,
+                 0, NULL, NULL,
+                 SID_CREATOR_OWNER,
+                 SEC_ACE_TYPE_ACCESS_ALLOWED,
+                 SEC_RIGHTS_FILE_READ | SEC_STD_ALL,
+                 0,
+                 NULL);
+
+  set.set_secdesc.level =3D RAW_SFILEINFO_SEC_DESC;
+  set.set_secdesc.in.file.handle =3D hd;
+  set.set_secdesc.in.secinfo_flags =3D SECINFO_DACL;
+  set.set_secdesc.in.sd =3D sd;
+
+  status =3D smb2_setinfo_file(tree, &set);
+  CHECK_STATUS(status, NT_STATUS_OK);
+
+
+  torture_comment(tctx, "try open for write\n");
+  cr.in.desired_access =3D SEC_FILE_WRITE_DATA;
+  smb2_transport_compound_start(tree->session->transport, 4);
+  req[0] =3D smb2_create_send(tree, &cr);
+  hd.data[0] =3D UINT64_MAX;
+  hd.data[1] =3D UINT64_MAX;
+
+  smb2_transport_compound_set_related(tree->session->transport, true);
+  ZERO_STRUCT(io);
+  io.in.function =3D FSCTL_CREATE_OR_GET_OBJECT_ID;
+  io.in.file.handle =3D hd;
+  io.in.unknown2 =3D 0;
+  io.in.max_response_size =3D 64;
+  io.in.flags =3D 1;
+
+  req[1] =3D smb2_ioctl_send(tree, &io);
+
+  ZERO_STRUCT(cl);
+  cl.in.file.handle =3D hd;
+
+  req[2] =3D smb2_close_send(tree, &cl);
+
+  set.set_secdesc.in.file.handle =3D hd;
+
+  req[3] =3D smb2_setinfo_file_send(tree, &set);
+
+  status =3D smb2_create_recv(req[0], tree, &cr);
+  CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
+  status =3D smb2_ioctl_recv(req[1], tree, &io);
+  CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
+  status =3D smb2_close_recv(req[2], &cl);
+  CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
+  status =3D smb2_setinfo_recv(req[3]);
+  CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
+done:
+  smb2_util_unlink(tree, fname);
+  smb2_tdis(tree);
+  smb2_logoff(tree->session);
+  return ret;
+}
+
 static bool test_compound_padding(struct torture_context *tctx,
                                  struct smb2_tree *tree)
 {
@@ -1111,6 +1206,8 @@ struct torture_suite *torture_smb2_compound_init(void=
)
        torture_suite_add_1smb2_test(suite, "related2", test_compound_relat=
ed2);
        torture_suite_add_1smb2_test(suite, "related3",
                                     test_compound_related3);
+       torture_suite_add_1smb2_test(suite, "related4",
+                                    test_compound_related4);
        torture_suite_add_1smb2_test(suite, "unrelated1",
test_compound_unrelated1);
        torture_suite_add_1smb2_test(suite, "invalid1", test_compound_inval=
id1);
        torture_suite_add_1smb2_test(suite, "invalid2", test_compound_inval=
id2);



diff --git source3/smbd/globals.h source3/smbd/globals.h
index e9bcf45..b85f41a 100644
--- source3/smbd/globals.h
+++ source3/smbd/globals.h
@@ -776,6 +776,8 @@ struct smbd_smb2_request {
        /* Should we encrypt? */
        bool do_encryption;
        bool compound_related;
+       bool create_fail;
+       NTSTATUS compound_create_err;
        bool retry_operation;
        bool interim_response_sent;
        bool has_twrp;
diff --git source3/smbd/smb2_create.c source3/smbd/smb2_create.c
index 0a93dd6..02b1ef6 100644
--- source3/smbd/smb2_create.c
+++ source3/smbd/smb2_create.c
@@ -365,6 +365,8 @@ static void smbd_smb2_request_create_done(struct
tevent_req *tsubreq)
                                       &out_context_blobs);
        if (!NT_STATUS_IS_OK(status)) {
                error =3D smbd_smb2_request_error(smb2req, status);
+               smb2req->create_fail =3D true;
+               smb2req->compound_create_err =3D status;
                if (!NT_STATUS_IS_OK(error)) {
                        smbd_server_connection_terminate(smb2req->xconn,
                                                         nt_errstr(error));
@@ -372,7 +374,8 @@ static void smbd_smb2_request_create_done(struct
tevent_req *tsubreq)
                }
                return;
        }
-
+       smb2req->create_fail =3D false;
+       smb2req->compound_create_err =3D status;
        status =3D smb2_create_blob_push(smb2req, &out_context_buffer,
out_context_blobs);
        if (!NT_STATUS_IS_OK(status)) {
                error =3D smbd_smb2_request_error(smb2req, status);
diff --git source3/smbd/smb2_server.c source3/smbd/smb2_server.c
index 5d9de30..0f771e9 100644
--- source3/smbd/smb2_server.c
+++ source3/smbd/smb2_server.c
@@ -2412,6 +2412,10 @@ NTSTATUS smbd_smb2_request_dispatch(struct
smbd_smb2_request *req)

                fsp =3D file_fsp_smb2(req, file_id_persistent, file_id_vola=
tile);
                if (fsp =3D=3D NULL) {
+                       if (req->compound_related && req->create_fail) {
+                               return smbd_smb2_request_error(req,
+                                               req->compound_create_err);
+                       }
                        if (!call->allow_invalid_fileid) {
                                return smbd_smb2_request_error(req,
                                                NT_STATUS_FILE_CLOSED);

Thanks,
Anubhav

--0000000000000642da05a58a1ec9
Content-Type: application/octet-stream; name="compound_create.diff"
Content-Disposition: attachment; filename="compound_create.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ka5k69580>
X-Attachment-Id: f_ka5k69580

ZGlmZiAtLWdpdCBzb3VyY2UzL3NtYmQvZ2xvYmFscy5oIHNvdXJjZTMvc21iZC9nbG9iYWxzLmgK
aW5kZXggZTliY2Y0NS4uYjg1ZjQxYSAxMDA2NDQKLS0tIHNvdXJjZTMvc21iZC9nbG9iYWxzLmgK
KysrIHNvdXJjZTMvc21iZC9nbG9iYWxzLmgKQEAgLTc3Niw2ICs3NzYsOCBAQCBzdHJ1Y3Qgc21i
ZF9zbWIyX3JlcXVlc3QgewogCS8qIFNob3VsZCB3ZSBlbmNyeXB0PyAqLwogCWJvb2wgZG9fZW5j
cnlwdGlvbjsKIAlib29sIGNvbXBvdW5kX3JlbGF0ZWQ7CisJYm9vbCBjcmVhdGVfZmFpbDsKKwlO
VFNUQVRVUyBjb21wb3VuZF9jcmVhdGVfZXJyOwogCWJvb2wgcmV0cnlfb3BlcmF0aW9uOwogCWJv
b2wgaW50ZXJpbV9yZXNwb25zZV9zZW50OwogCWJvb2wgaGFzX3R3cnA7CmRpZmYgLS1naXQgc291
cmNlMy9zbWJkL3NtYjJfY3JlYXRlLmMgc291cmNlMy9zbWJkL3NtYjJfY3JlYXRlLmMKaW5kZXgg
MGE5M2RkNi4uMDJiMWVmNiAxMDA2NDQKLS0tIHNvdXJjZTMvc21iZC9zbWIyX2NyZWF0ZS5jCisr
KyBzb3VyY2UzL3NtYmQvc21iMl9jcmVhdGUuYwpAQCAtMzY1LDYgKzM2NSw4IEBAIHN0YXRpYyB2
b2lkIHNtYmRfc21iMl9yZXF1ZXN0X2NyZWF0ZV9kb25lKHN0cnVjdCB0ZXZlbnRfcmVxICp0c3Vi
cmVxKQogCQkJCSAgICAgICAmb3V0X2NvbnRleHRfYmxvYnMpOwogCWlmICghTlRfU1RBVFVTX0lT
X09LKHN0YXR1cykpIHsKIAkJZXJyb3IgPSBzbWJkX3NtYjJfcmVxdWVzdF9lcnJvcihzbWIycmVx
LCBzdGF0dXMpOworCQlzbWIycmVxLT5jcmVhdGVfZmFpbCA9IHRydWU7CisJCXNtYjJyZXEtPmNv
bXBvdW5kX2NyZWF0ZV9lcnIgPSBzdGF0dXM7CiAJCWlmICghTlRfU1RBVFVTX0lTX09LKGVycm9y
KSkgewogCQkJc21iZF9zZXJ2ZXJfY29ubmVjdGlvbl90ZXJtaW5hdGUoc21iMnJlcS0+eGNvbm4s
CiAJCQkJCQkJIG50X2VycnN0cihlcnJvcikpOwpAQCAtMzcyLDcgKzM3NCw4IEBAIHN0YXRpYyB2
b2lkIHNtYmRfc21iMl9yZXF1ZXN0X2NyZWF0ZV9kb25lKHN0cnVjdCB0ZXZlbnRfcmVxICp0c3Vi
cmVxKQogCQl9CiAJCXJldHVybjsKIAl9Ci0KKwlzbWIycmVxLT5jcmVhdGVfZmFpbCA9IGZhbHNl
OyAKKwlzbWIycmVxLT5jb21wb3VuZF9jcmVhdGVfZXJyID0gc3RhdHVzOwogCXN0YXR1cyA9IHNt
YjJfY3JlYXRlX2Jsb2JfcHVzaChzbWIycmVxLCAmb3V0X2NvbnRleHRfYnVmZmVyLCBvdXRfY29u
dGV4dF9ibG9icyk7CiAJaWYgKCFOVF9TVEFUVVNfSVNfT0soc3RhdHVzKSkgewogCQllcnJvciA9
IHNtYmRfc21iMl9yZXF1ZXN0X2Vycm9yKHNtYjJyZXEsIHN0YXR1cyk7CmRpZmYgLS1naXQgc291
cmNlMy9zbWJkL3NtYjJfc2VydmVyLmMgc291cmNlMy9zbWJkL3NtYjJfc2VydmVyLmMKaW5kZXgg
NWQ5ZGUzMC4uMGY3NzFlOSAxMDA2NDQKLS0tIHNvdXJjZTMvc21iZC9zbWIyX3NlcnZlci5jCisr
KyBzb3VyY2UzL3NtYmQvc21iMl9zZXJ2ZXIuYwpAQCAtMjQxMiw2ICsyNDEyLDEwIEBAIE5UU1RB
VFVTIHNtYmRfc21iMl9yZXF1ZXN0X2Rpc3BhdGNoKHN0cnVjdCBzbWJkX3NtYjJfcmVxdWVzdCAq
cmVxKQogCiAJCWZzcCA9IGZpbGVfZnNwX3NtYjIocmVxLCBmaWxlX2lkX3BlcnNpc3RlbnQsIGZp
bGVfaWRfdm9sYXRpbGUpOwogCQlpZiAoZnNwID09IE5VTEwpIHsKKwkJCWlmIChyZXEtPmNvbXBv
dW5kX3JlbGF0ZWQgJiYgcmVxLT5jcmVhdGVfZmFpbCkgeworCQkJCXJldHVybiBzbWJkX3NtYjJf
cmVxdWVzdF9lcnJvcihyZXEsCisJCQkJCQlyZXEtPmNvbXBvdW5kX2NyZWF0ZV9lcnIpOworCQkJ
fQogCQkJaWYgKCFjYWxsLT5hbGxvd19pbnZhbGlkX2ZpbGVpZCkgewogCQkJCXJldHVybiBzbWJk
X3NtYjJfcmVxdWVzdF9lcnJvcihyZXEsCiAJCQkJCQlOVF9TVEFUVVNfRklMRV9DTE9TRUQpOwpk
aWZmIC0tZ2l0IHNvdXJjZTQvdG9ydHVyZS9zbWIyL2NvbXBvdW5kLmMgc291cmNlNC90b3J0dXJl
L3NtYjIvY29tcG91bmQuYwppbmRleCBhNTAyMTAzLi5hYWIyZmNmIDEwMDY0NAotLS0gc291cmNl
NC90b3J0dXJlL3NtYjIvY29tcG91bmQuYworKysgc291cmNlNC90b3J0dXJlL3NtYjIvY29tcG91
bmQuYwpAQCAtMjQsNiArMjQsOCBAQAogI2luY2x1ZGUgImxpYmNsaS9zbWIyL3NtYjJfY2FsbHMu
aCIKICNpbmNsdWRlICJ0b3J0dXJlL3RvcnR1cmUuaCIKICNpbmNsdWRlICJ0b3J0dXJlL3NtYjIv
cHJvdG8uaCIKKyNpbmNsdWRlICJsaWJjbGkvc2VjdXJpdHkvc2VjdXJpdHkuaCIKKyNpbmNsdWRl
ICJsaWJycGMvZ2VuX25kci9uZHJfc2VjdXJpdHkuaCIKICNpbmNsdWRlICIuLi9saWJjbGkvc21i
L3NtYlhjbGlfYmFzZS5oIgogCiAjZGVmaW5lIENIRUNLX1NUQVRVUyhzdGF0dXMsIGNvcnJlY3Qp
IGRvIHsgXApAQCAtNDQxLDYgKzQ0Myw5OSBAQCBkb25lOgogCXJldHVybiByZXQ7CiB9CiAKK3N0
YXRpYyBib29sIHRlc3RfY29tcG91bmRfcmVsYXRlZDQoc3RydWN0IHRvcnR1cmVfY29udGV4dCAq
dGN0eCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNtYjJfdHJl
ZSAqdHJlZSkgeworICBzdHJ1Y3Qgc21iMl9oYW5kbGUgaGQ7CisgIHN0cnVjdCBzbWIyX2NyZWF0
ZSBjcjsKKyAgdW5pb24gc21iX3NldGZpbGVpbmZvIHNldDsKKyAgc3RydWN0IHNtYjJfaW9jdGwg
aW87CisgIHN0cnVjdCBzbWIyX2Nsb3NlIGNsOworICBzdHJ1Y3Qgc2VjdXJpdHlfZGVzY3JpcHRv
ciAqc2Q7CisgIE5UU1RBVFVTIHN0YXR1czsKKyAgY29uc3QgY2hhciAqZm5hbWUgPSAiY29tcG91
bmRfcmVsYXRlZDQuZGF0IjsKKyAgc3RydWN0IHNtYjJfcmVxdWVzdCAqcmVxWzRdOworICBib29s
IHJldCA9IHRydWU7CisgIAorICBzbWIyX3V0aWxfdW5saW5rKHRyZWUsIGZuYW1lKTsKKworICBa
RVJPX1NUUlVDVChjcik7CisgIGNyLmxldmVsID0gUkFXX09QRU5fU01CMjsKKyAgY3IuaW4uY3Jl
YXRlX2ZsYWdzID0gMDsKKyAgY3IuaW4uZGVzaXJlZF9hY2Nlc3MgPQorICAgICAgU0VDX1NURF9S
RUFEX0NPTlRST0wgfCBTRUNfU1REX1dSSVRFX0RBQyB8IFNFQ19TVERfV1JJVEVfT1dORVI7Cisg
IGNyLmluLmNyZWF0ZV9vcHRpb25zID0gMDsKKyAgY3IuaW4uZmlsZV9hdHRyaWJ1dGVzID0gRklM
RV9BVFRSSUJVVEVfTk9STUFMOworICBjci5pbi5zaGFyZV9hY2Nlc3MgPSBOVENSRUFURVhfU0hB
UkVfQUNDRVNTX0RFTEVURSB8CisgICAgICAgICAgICAgICAgICAgICAgIE5UQ1JFQVRFWF9TSEFS
RV9BQ0NFU1NfUkVBRCB8CisgICAgICAgICAgICAgICAgICAgICAgIE5UQ1JFQVRFWF9TSEFSRV9B
Q0NFU1NfV1JJVEU7CisgIGNyLmluLmFsbG9jX3NpemUgPSAwOworICBjci5pbi5jcmVhdGVfZGlz
cG9zaXRpb24gPSBOVENSRUFURVhfRElTUF9PUEVOX0lGOworICBjci5pbi5pbXBlcnNvbmF0aW9u
X2xldmVsID0gTlRDUkVBVEVYX0lNUEVSU09OQVRJT05fQU5PTllNT1VTOworICBjci5pbi5zZWN1
cml0eV9mbGFncyA9IDA7CisgIGNyLmluLmZuYW1lID0gZm5hbWU7CisKKyAgc3RhdHVzID0gc21i
Ml9jcmVhdGUodHJlZSwgdGN0eCwgJmNyKTsKKyAgQ0hFQ0tfU1RBVFVTKHN0YXR1cywgTlRfU1RB
VFVTX09LKTsKKyAgaGQgPSBjci5vdXQuZmlsZS5oYW5kbGU7CisgIHRvcnR1cmVfY29tbWVudCh0
Y3R4LCAic2V0IGEgc2VjIGRlc2MgYWxsb3dpbmcgbm8gd3JpdGUgYnkgQ1JFQVRPUl9PV05FUlxu
Iik7CisgIHNkID0gc2VjdXJpdHlfZGVzY3JpcHRvcl9kYWNsX2NyZWF0ZSh0Y3R4LAorCQkgIDAs
IE5VTEwsIE5VTEwsCisJCSAgU0lEX0NSRUFUT1JfT1dORVIsCisJCSAgU0VDX0FDRV9UWVBFX0FD
Q0VTU19BTExPV0VELAorCQkgIFNFQ19SSUdIVFNfRklMRV9SRUFEIHwgU0VDX1NURF9BTEwsCisJ
CSAgMCwKKwkJICBOVUxMKTsKKworICBzZXQuc2V0X3NlY2Rlc2MubGV2ZWwgPSBSQVdfU0ZJTEVJ
TkZPX1NFQ19ERVNDOworICBzZXQuc2V0X3NlY2Rlc2MuaW4uZmlsZS5oYW5kbGUgPSBoZDsKKyAg
c2V0LnNldF9zZWNkZXNjLmluLnNlY2luZm9fZmxhZ3MgPSBTRUNJTkZPX0RBQ0w7CisgIHNldC5z
ZXRfc2VjZGVzYy5pbi5zZCA9IHNkOworCisgIHN0YXR1cyA9IHNtYjJfc2V0aW5mb19maWxlKHRy
ZWUsICZzZXQpOworICBDSEVDS19TVEFUVVMoc3RhdHVzLCBOVF9TVEFUVVNfT0spOworCisKKyAg
dG9ydHVyZV9jb21tZW50KHRjdHgsICJ0cnkgb3BlbiBmb3Igd3JpdGVcbiIpOworICBjci5pbi5k
ZXNpcmVkX2FjY2VzcyA9IFNFQ19GSUxFX1dSSVRFX0RBVEE7CisgIHNtYjJfdHJhbnNwb3J0X2Nv
bXBvdW5kX3N0YXJ0KHRyZWUtPnNlc3Npb24tPnRyYW5zcG9ydCwgNCk7CisgIHJlcVswXSA9IHNt
YjJfY3JlYXRlX3NlbmQodHJlZSwgJmNyKTsKKyAgaGQuZGF0YVswXSA9IFVJTlQ2NF9NQVg7Cisg
IGhkLmRhdGFbMV0gPSBVSU5UNjRfTUFYOworCisgIHNtYjJfdHJhbnNwb3J0X2NvbXBvdW5kX3Nl
dF9yZWxhdGVkKHRyZWUtPnNlc3Npb24tPnRyYW5zcG9ydCwgdHJ1ZSk7CisgIFpFUk9fU1RSVUNU
KGlvKTsKKyAgaW8uaW4uZnVuY3Rpb24gPSBGU0NUTF9DUkVBVEVfT1JfR0VUX09CSkVDVF9JRDsK
KyAgaW8uaW4uZmlsZS5oYW5kbGUgPSBoZDsKKyAgaW8uaW4udW5rbm93bjIgPSAwOworICBpby5p
bi5tYXhfcmVzcG9uc2Vfc2l6ZSA9IDY0OworICBpby5pbi5mbGFncyA9IDE7CisKKyAgcmVxWzFd
ID0gc21iMl9pb2N0bF9zZW5kKHRyZWUsICZpbyk7CisKKyAgWkVST19TVFJVQ1QoY2wpOworICBj
bC5pbi5maWxlLmhhbmRsZSA9IGhkOworCisgIHJlcVsyXSA9IHNtYjJfY2xvc2Vfc2VuZCh0cmVl
LCAmY2wpOworCisgIHNldC5zZXRfc2VjZGVzYy5pbi5maWxlLmhhbmRsZSA9IGhkOworICAKKyAg
cmVxWzNdID0gc21iMl9zZXRpbmZvX2ZpbGVfc2VuZCh0cmVlLCAmc2V0KTsKKworICBzdGF0dXMg
PSBzbWIyX2NyZWF0ZV9yZWN2KHJlcVswXSwgdHJlZSwgJmNyKTsKKyAgQ0hFQ0tfU1RBVFVTKHN0
YXR1cywgTlRfU1RBVFVTX0FDQ0VTU19ERU5JRUQpOworICBzdGF0dXMgPSBzbWIyX2lvY3RsX3Jl
Y3YocmVxWzFdLCB0cmVlLCAmaW8pOworICBDSEVDS19TVEFUVVMoc3RhdHVzLCBOVF9TVEFUVVNf
QUNDRVNTX0RFTklFRCk7CisgIHN0YXR1cyA9IHNtYjJfY2xvc2VfcmVjdihyZXFbMl0sICZjbCk7
CisgIENIRUNLX1NUQVRVUyhzdGF0dXMsIE5UX1NUQVRVU19BQ0NFU1NfREVOSUVEKTsKKyAgc3Rh
dHVzID0gc21iMl9zZXRpbmZvX3JlY3YocmVxWzNdKTsKKyAgQ0hFQ0tfU1RBVFVTKHN0YXR1cywg
TlRfU1RBVFVTX0FDQ0VTU19ERU5JRUQpOworZG9uZToKKyAgc21iMl91dGlsX3VubGluayh0cmVl
LCBmbmFtZSk7CisgIHNtYjJfdGRpcyh0cmVlKTsKKyAgc21iMl9sb2dvZmYodHJlZS0+c2Vzc2lv
bik7CisgIHJldHVybiByZXQ7Cit9CisKIHN0YXRpYyBib29sIHRlc3RfY29tcG91bmRfcGFkZGlu
ZyhzdHJ1Y3QgdG9ydHVyZV9jb250ZXh0ICp0Y3R4LAogCQkJCSAgc3RydWN0IHNtYjJfdHJlZSAq
dHJlZSkKIHsKQEAgLTExMTEsNiArMTIwNiw4IEBAIHN0cnVjdCB0b3J0dXJlX3N1aXRlICp0b3J0
dXJlX3NtYjJfY29tcG91bmRfaW5pdCh2b2lkKQogCXRvcnR1cmVfc3VpdGVfYWRkXzFzbWIyX3Rl
c3Qoc3VpdGUsICJyZWxhdGVkMiIsIHRlc3RfY29tcG91bmRfcmVsYXRlZDIpOwogCXRvcnR1cmVf
c3VpdGVfYWRkXzFzbWIyX3Rlc3Qoc3VpdGUsICJyZWxhdGVkMyIsCiAJCQkJICAgICB0ZXN0X2Nv
bXBvdW5kX3JlbGF0ZWQzKTsKKwl0b3J0dXJlX3N1aXRlX2FkZF8xc21iMl90ZXN0KHN1aXRlLCAi
cmVsYXRlZDQiLAorCQkJCSAgICAgdGVzdF9jb21wb3VuZF9yZWxhdGVkNCk7CiAJdG9ydHVyZV9z
dWl0ZV9hZGRfMXNtYjJfdGVzdChzdWl0ZSwgInVucmVsYXRlZDEiLCB0ZXN0X2NvbXBvdW5kX3Vu
cmVsYXRlZDEpOwogCXRvcnR1cmVfc3VpdGVfYWRkXzFzbWIyX3Rlc3Qoc3VpdGUsICJpbnZhbGlk
MSIsIHRlc3RfY29tcG91bmRfaW52YWxpZDEpOwogCXRvcnR1cmVfc3VpdGVfYWRkXzFzbWIyX3Rl
c3Qoc3VpdGUsICJpbnZhbGlkMiIsIHRlc3RfY29tcG91bmRfaW52YWxpZDIpOwo=
--0000000000000642da05a58a1ec9--

