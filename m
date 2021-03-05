Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F8E32DFA7
	for <lists+samba-technical@lfdr.de>; Fri,  5 Mar 2021 03:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/ouMQw4hn703IxWCPfTjylcVrdS2a1+6n0XA7xhMYuc=; b=ng33mAdbd+rCzkKep4CzxZKXLQ
	6r6UKnXEQeEAVxc/aMUYI5c8VTVem75Vpni/SgsKxFhVHzBU8DeOil09D0Olvkw1sZNcCRhURw0++
	OY2PRuh4nxHADvvjcXZ+IrJR6cDHxex9Cd3LZzyyMOZvzlaQ95IuMWnYuOvU2XNKqsW7/z0g2Pmyj
	6gz55dfOC1gT1YdOUCgfXiiD8+6ny6rpLamdLDAAP3z/5vNJxidLLwb7E11cb0k9xwl7R8brv7bWO
	Oinvp5k/8jpDMwKeVP6Fa7iJ3NRLg/7bAY63wOdc9ntRzZFow+2le/Lq/B0rj1rn9C8uifbFR3YDj
	67xp8uNA==;
Received: from ip6-localhost ([::1]:59464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lI0A2-004Ep1-RN; Fri, 05 Mar 2021 02:25:50 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:38357) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lI09x-004Eou-Tf
 for samba-technical@lists.samba.org; Fri, 05 Mar 2021 02:25:48 +0000
Received: by mail-lj1-x233.google.com with SMTP id 2so847747ljr.5
 for <samba-technical@lists.samba.org>; Thu, 04 Mar 2021 18:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/ouMQw4hn703IxWCPfTjylcVrdS2a1+6n0XA7xhMYuc=;
 b=KdQxBQSMPmUcmNTnnDnmfbX1ocHOgytNfsdmy91iCPcmUFbiG161PTr+eZ6UhaIx7v
 07N+tiNmL4u5lJt7905Gyo8/yQ5qRZc4uW+JMZZttWNV/mYPOMa3u1vUUISpmqouTGLW
 HZk/Fn2vOHAQfSw+AM5VwteNYcfDZeSY+uXs9COc8/fJZU0zLLiEn9EVyfKCubplyrTo
 AtzZKj8RRo+fAIhPUHrCads7vRS3dz1BZM802CXEVeLsEs8Qx7Q284kxEFtphfaEyfXy
 BuesNwLgS9Vum7sFopzOPWDQR/LcqkSozppT2JCanxiLj9XJh6rx+F7UTQAe0Hgjacxb
 kptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/ouMQw4hn703IxWCPfTjylcVrdS2a1+6n0XA7xhMYuc=;
 b=SQF4iUxw0HIrRdP8rWhPryvTzhxqXC2IOfTvcv+2qDD/KN9ItW144rEryUje2yKYRF
 AiODw5E9crfxDHwPA7TdA2DuXNEFU6PB3XnsGyG2mHoskIPl9O1s5zIADct6LLBkrmRj
 hxDXgObrMHxymy+JILvkDoMNhfKYu0bIdivF+gWTz5wk+tVC+GBA62c3a8rO75UQoYee
 KXio57Df8EiMKJuHcFc50BTn3RB7h6mgXRE4vlGCHWtZxh4fxh2Ir30d7lhBtJhC5SFI
 rwiQLOwdf298s6Rpd6FGEv6fBq6HFvx2GxpK4dTO5JikvgDcANMVIVIuFrxRR9B3KD1b
 PPow==
X-Gm-Message-State: AOAM530q6MmDeepRgbYV3pABpucYOkAHRxTF47TYKWhqyGL495JKSPPR
 Jx8s9fqduTKfRfr0lohvQmOQpryo7eII7rO1ag8=
X-Google-Smtp-Source: ABdhPJzBbvLmXDO97L+21Wp4opmFuSwKK5iBNZ+Ci8gVoNR+tE86i5W+Du+VZnqLWCdiQE9gxD5duzU3a/sDdQ5Oaok=
X-Received: by 2002:a05:651c:548:: with SMTP id
 q8mr3822433ljp.256.1614911144743; 
 Thu, 04 Mar 2021 18:25:44 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 4 Mar 2021 20:25:33 -0600
Message-ID: <CAH2r5muP7MU3QciheN9sbdJtOFwojfhq1yoradMzbunG7dsCQw@mail.gmail.com>
Subject: [PATCH] cifs: fix credit accounting for extra channel
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000206bfe05bcc0cdb1"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000206bfe05bcc0cdb1
Content-Type: text/plain; charset="UTF-8"

With multichannel, operations like the queries
from "ls -lR" can cause all credits to be used and
errors to be returned since max_credits was not
being set correctly on the secondary channels and
thus the client was requesting 0 credits incorrectly
in some cases (which can lead to not having
enough credits to perform any operation on that
channel).

Signed-off-by: Aurelien Aptel <aaptel@suse.com>
CC: <stable@vger.kernel.org> # v5.8+
Reviewed-by: Shyam Prasad N <sprasad@microsoft.com>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/cifs/connect.c | 10 +++++-----
 fs/cifs/sess.c    |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index 112692300fb6..68642e3d4270 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -1429,6 +1429,11 @@ cifs_get_tcp_session(struct smb3_fs_context *ctx)
  tcp_ses->min_offload = ctx->min_offload;
  tcp_ses->tcpStatus = CifsNeedNegotiate;

+ if ((ctx->max_credits < 20) || (ctx->max_credits > 60000))
+ tcp_ses->max_credits = SMB2_MAX_CREDITS_AVAILABLE;
+ else
+ tcp_ses->max_credits = ctx->max_credits;
+
  tcp_ses->nr_targets = 1;
  tcp_ses->ignore_signature = ctx->ignore_signature;
  /* thread spawned, put it on the list */
@@ -2832,11 +2837,6 @@ static int mount_get_conns(struct
smb3_fs_context *ctx, struct cifs_sb_info *cif

  *nserver = server;

- if ((ctx->max_credits < 20) || (ctx->max_credits > 60000))
- server->max_credits = SMB2_MAX_CREDITS_AVAILABLE;
- else
- server->max_credits = ctx->max_credits;
-
  /* get a reference to a SMB session */
  ses = cifs_get_smb_ses(server, ctx);
  if (IS_ERR(ses)) {
diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
index 183a3a868d7b..63d517b9f2ff 100644
--- a/fs/cifs/sess.c
+++ b/fs/cifs/sess.c
@@ -230,6 +230,7 @@ cifs_ses_add_channel(struct cifs_sb_info *cifs_sb,
struct cifs_ses *ses,
  ctx.noautotune = ses->server->noautotune;
  ctx.sockopt_tcp_nodelay = ses->server->tcp_nodelay;
  ctx.echo_interval = ses->server->echo_interval / HZ;
+ ctx.max_credits = ses->server->max_credits;

  /*
  * This will be used for encoding/decoding user/domain/pw

-- 
Thanks,

Steve

--000000000000206bfe05bcc0cdb1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-fix-credit-accounting-for-extra-channel.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-fix-credit-accounting-for-extra-channel.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_klvoe2yx0>
X-Attachment-Id: f_klvoe2yx0

RnJvbSBhYjY0ZDU1NjVkMzAzZWYwMWQxNmRhZDI5ZWNjNjAwMTcxNWQyN2QyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBdXJlbGllbiBBcHRlbCA8YWFwdGVsQHN1c2UuY29tPgpEYXRl
OiBUaHUsIDQgTWFyIDIwMjEgMTc6NDI6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBjaWZzOiBm
aXggY3JlZGl0IGFjY291bnRpbmcgZm9yIGV4dHJhIGNoYW5uZWwKCldpdGggbXVsdGljaGFubmVs
LCBvcGVyYXRpb25zIGxpa2UgdGhlIHF1ZXJpZXMKZnJvbSAibHMgLWxSIiBjYW4gY2F1c2UgYWxs
IGNyZWRpdHMgdG8gYmUgdXNlZCBhbmQKZXJyb3JzIHRvIGJlIHJldHVybmVkIHNpbmNlIG1heF9j
cmVkaXRzIHdhcyBub3QKYmVpbmcgc2V0IGNvcnJlY3RseSBvbiB0aGUgc2Vjb25kYXJ5IGNoYW5u
ZWxzIGFuZAp0aHVzIHRoZSBjbGllbnQgd2FzIHJlcXVlc3RpbmcgMCBjcmVkaXRzIGluY29ycmVj
dGx5CmluIHNvbWUgY2FzZXMgKHdoaWNoIGNhbiBsZWFkIHRvIG5vdCBoYXZpbmcKZW5vdWdoIGNy
ZWRpdHMgdG8gcGVyZm9ybSBhbnkgb3BlcmF0aW9uIG9uIHRoYXQKY2hhbm5lbCkuCgpTaWduZWQt
b2ZmLWJ5OiBBdXJlbGllbiBBcHRlbCA8YWFwdGVsQHN1c2UuY29tPgpDQzogPHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmc+ICMgdjUuOCsKUmV2aWV3ZWQtYnk6IFNoeWFtIFByYXNhZCBOIDxzcHJhc2Fk
QG1pY3Jvc29mdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWlj
cm9zb2Z0LmNvbT4KLS0tCiBmcy9jaWZzL2Nvbm5lY3QuYyB8IDEwICsrKysrLS0tLS0KIGZzL2Np
ZnMvc2Vzcy5jICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9jb25uZWN0LmMgYi9mcy9jaWZzL2Nv
bm5lY3QuYwppbmRleCAxMTI2OTIzMDBmYjYuLjY4NjQyZTNkNDI3MCAxMDA2NDQKLS0tIGEvZnMv
Y2lmcy9jb25uZWN0LmMKKysrIGIvZnMvY2lmcy9jb25uZWN0LmMKQEAgLTE0MjksNiArMTQyOSwx
MSBAQCBjaWZzX2dldF90Y3Bfc2Vzc2lvbihzdHJ1Y3Qgc21iM19mc19jb250ZXh0ICpjdHgpCiAJ
dGNwX3Nlcy0+bWluX29mZmxvYWQgPSBjdHgtPm1pbl9vZmZsb2FkOwogCXRjcF9zZXMtPnRjcFN0
YXR1cyA9IENpZnNOZWVkTmVnb3RpYXRlOwogCisJaWYgKChjdHgtPm1heF9jcmVkaXRzIDwgMjAp
IHx8IChjdHgtPm1heF9jcmVkaXRzID4gNjAwMDApKQorCQl0Y3Bfc2VzLT5tYXhfY3JlZGl0cyA9
IFNNQjJfTUFYX0NSRURJVFNfQVZBSUxBQkxFOworCWVsc2UKKwkJdGNwX3Nlcy0+bWF4X2NyZWRp
dHMgPSBjdHgtPm1heF9jcmVkaXRzOworCiAJdGNwX3Nlcy0+bnJfdGFyZ2V0cyA9IDE7CiAJdGNw
X3Nlcy0+aWdub3JlX3NpZ25hdHVyZSA9IGN0eC0+aWdub3JlX3NpZ25hdHVyZTsKIAkvKiB0aHJl
YWQgc3Bhd25lZCwgcHV0IGl0IG9uIHRoZSBsaXN0ICovCkBAIC0yODMyLDExICsyODM3LDYgQEAg
c3RhdGljIGludCBtb3VudF9nZXRfY29ubnMoc3RydWN0IHNtYjNfZnNfY29udGV4dCAqY3R4LCBz
dHJ1Y3QgY2lmc19zYl9pbmZvICpjaWYKIAogCSpuc2VydmVyID0gc2VydmVyOwogCi0JaWYgKChj
dHgtPm1heF9jcmVkaXRzIDwgMjApIHx8IChjdHgtPm1heF9jcmVkaXRzID4gNjAwMDApKQotCQlz
ZXJ2ZXItPm1heF9jcmVkaXRzID0gU01CMl9NQVhfQ1JFRElUU19BVkFJTEFCTEU7Ci0JZWxzZQot
CQlzZXJ2ZXItPm1heF9jcmVkaXRzID0gY3R4LT5tYXhfY3JlZGl0czsKLQogCS8qIGdldCBhIHJl
ZmVyZW5jZSB0byBhIFNNQiBzZXNzaW9uICovCiAJc2VzID0gY2lmc19nZXRfc21iX3NlcyhzZXJ2
ZXIsIGN0eCk7CiAJaWYgKElTX0VSUihzZXMpKSB7CmRpZmYgLS1naXQgYS9mcy9jaWZzL3Nlc3Mu
YyBiL2ZzL2NpZnMvc2Vzcy5jCmluZGV4IDE4M2EzYTg2OGQ3Yi4uNjNkNTE3YjlmMmZmIDEwMDY0
NAotLS0gYS9mcy9jaWZzL3Nlc3MuYworKysgYi9mcy9jaWZzL3Nlc3MuYwpAQCAtMjMwLDYgKzIz
MCw3IEBAIGNpZnNfc2VzX2FkZF9jaGFubmVsKHN0cnVjdCBjaWZzX3NiX2luZm8gKmNpZnNfc2Is
IHN0cnVjdCBjaWZzX3NlcyAqc2VzLAogCWN0eC5ub2F1dG90dW5lID0gc2VzLT5zZXJ2ZXItPm5v
YXV0b3R1bmU7CiAJY3R4LnNvY2tvcHRfdGNwX25vZGVsYXkgPSBzZXMtPnNlcnZlci0+dGNwX25v
ZGVsYXk7CiAJY3R4LmVjaG9faW50ZXJ2YWwgPSBzZXMtPnNlcnZlci0+ZWNob19pbnRlcnZhbCAv
IEhaOworCWN0eC5tYXhfY3JlZGl0cyA9IHNlcy0+c2VydmVyLT5tYXhfY3JlZGl0czsKIAogCS8q
CiAJICogVGhpcyB3aWxsIGJlIHVzZWQgZm9yIGVuY29kaW5nL2RlY29kaW5nIHVzZXIvZG9tYWlu
L3B3Ci0tIAoyLjI3LjAKCg==
--000000000000206bfe05bcc0cdb1--

