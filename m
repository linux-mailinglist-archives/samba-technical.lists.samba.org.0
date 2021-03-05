Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 403C732DFA3
	for <lists+samba-technical@lfdr.de>; Fri,  5 Mar 2021 03:25:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=izqGTB5AQoglP4QvVy6KVIwtE++VulsPi9zMDQrAZXc=; b=m7Jtyx+uv03PLj2WfrX1i7In/H
	DQ52wymBj7mDUbfZgJm7UXGiL4238SVu0G+W2nC4K1rj2j3Ueni+vxotfyeJ5XnQfB3fDlZckdEHp
	M7PcD649aAVVfg8nx89znHY7ksCgUQF83aw7yhELOxJjIAbiDM8wFQqlPbpYIxpNSakbfY86AqjZe
	e+IHPH6SuZ/qG5A78BE/BJYJtCy53DO/5Izh40AVsLprZf8c4k6B61s20qxO+bfMCnr6pV0ofDLzI
	b3+UKdiu2juJfHgRXCBXfjYLUx7NB+nHeyjkB7OTQin20XhlzXADAJ7pwGCRVuRfKHtWHIvgvBh2X
	//ZGDKtg==;
Received: from ip6-localhost ([::1]:58766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lI098-004EjA-VU; Fri, 05 Mar 2021 02:24:55 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:40280) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lI094-004Ej3-GG
 for samba-technical@lists.samba.org; Fri, 05 Mar 2021 02:24:52 +0000
Received: by mail-lj1-x22b.google.com with SMTP id e2so833043ljo.7
 for <samba-technical@lists.samba.org>; Thu, 04 Mar 2021 18:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=izqGTB5AQoglP4QvVy6KVIwtE++VulsPi9zMDQrAZXc=;
 b=DwdUfk6C978mzNJQSynA/LTfTsZC8WJFz72mL8nVsU3S1Mp48/Vkg6DphxWvrkgRxb
 sbB/qQU+139Xvgaw02vVFMrVyPoPbTr2pO53ZhItzHHOt3IHmd47ksgH70j42HF1x6zE
 /2blqPEJOSUNzJbtH+mlAWOhUMFEV97TccJTnVx+9zKUIKlMFQiKWN+QtO4pXBD+jZsq
 DdLMDgHsm4xiNIVfN7NbwRVIFKwUhty+5jBPv+38+Jy//MW2dwqKUEgjpLrKMHjHE98/
 /AsFHU0E8QARe+9yPWl5esMPPMjw/SxLzEJw/f5majykwjjiyEEFWeikSR6QK209GbAA
 pyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=izqGTB5AQoglP4QvVy6KVIwtE++VulsPi9zMDQrAZXc=;
 b=bNKcaGVpuTwTeUWTwgVWj4VbGi5hJP1N+bAZgwcC79Uc7h4QsdNjiNBjjOk9UGLHzJ
 dWnRfQu6gJFXBT38tcjtlwPZUEhv145k+XouacPwpVvgKoPp8myOp2gPoMszx6uJN+gh
 YW219aoDmG6NyW6vdxF/6j9LCskAKnGAcMKFD/6CLZti315tXMBykmmLhW5HEJ9cQjp4
 054xfE14W4L3z+hW+pgN7alJnr0Yxb7SPYVprrdH8QhDKLYNh7Dhr93uJz/DjlJyL9oU
 z7NSvoqkm4szjfExMgYvl1nv35drwESEPGeUf2WYk7QDrqeyNekDqhnI4xXPDTXGvDLt
 Q7aQ==
X-Gm-Message-State: AOAM531Y6ICpO01GbjNXeVf6nOYUQ0xMdD4tE46CKQPBJBnX+B+Uzl70
 S/+9f+QXZpe3BP9/fsKCnEQuwXMY8WdV7tAu3Eg=
X-Google-Smtp-Source: ABdhPJzWREoQY3UDh4QIIBj0YizdU9pTF8v4rZaYUl9l665cKp1soQK0vdF/CYPn8h2+FxAlPkwBn3LwexDQiUe+Cx8=
X-Received: by 2002:a19:3f04:: with SMTP id m4mr3898973lfa.395.1614911089227; 
 Thu, 04 Mar 2021 18:24:49 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 4 Mar 2021 20:24:38 -0600
Message-ID: <CAH2r5ms1F5SVh72rKYiSr5TKgG4yv1Bmj6Azdki5BQohcJmhSw@mail.gmail.com>
Subject: [PATCH] cifs: ask for more credit on async read/write code paths
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000d150cd05bcc0c9b7"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000d150cd05bcc0c9b7
Content-Type: text/plain; charset="UTF-8"

When doing a large read or write workload we only
very gradually increase the number of credits
which can cause problems with parallelizing large i/o
(I/O ramps up more slowly than it should for large
read/write workloads) especially with multichannel
when the number of credits on the secondary channels
starts out low (e.g. less than about 130) or when
recovering after server throttled back the number
of credit.

Signed-off-by: Aurelien Aptel <aaptel@suse.com>
Reviewed-by: Shyam Prasad N <sprasad@microsoft.com>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/cifs/smb2pdu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 4bbb6126b14d..2199a9bfae8f 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -4041,8 +4041,7 @@ smb2_async_readv(struct cifs_readdata *rdata)
  if (rdata->credits.value > 0) {
  shdr->CreditCharge = cpu_to_le16(DIV_ROUND_UP(rdata->bytes,
  SMB2_MAX_BUFFER_SIZE));
- shdr->CreditRequest =
- cpu_to_le16(le16_to_cpu(shdr->CreditCharge) + 1);
+ shdr->CreditRequest = cpu_to_le16(le16_to_cpu(shdr->CreditCharge) + 8);

  rc = adjust_credits(server, &rdata->credits, rdata->bytes);
  if (rc)
@@ -4348,8 +4347,7 @@ smb2_async_writev(struct cifs_writedata *wdata,
  if (wdata->credits.value > 0) {
  shdr->CreditCharge = cpu_to_le16(DIV_ROUND_UP(wdata->bytes,
      SMB2_MAX_BUFFER_SIZE));
- shdr->CreditRequest =
- cpu_to_le16(le16_to_cpu(shdr->CreditCharge) + 1);
+ shdr->CreditRequest = cpu_to_le16(le16_to_cpu(shdr->CreditCharge) + 8);

  rc = adjust_credits(server, &wdata->credits, wdata->bytes);
  if (rc)

-- 
Thanks,

Steve

--000000000000d150cd05bcc0c9b7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-ask-for-more-credit-on-async-read-write-code-pa.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-ask-for-more-credit-on-async-read-write-code-pa.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_klvoctzi0>
X-Attachment-Id: f_klvoctzi0

RnJvbSA5MDg0ZWY4ZmY5ZmEyNDAyOWY0OGE5NDlmZjE3M2ZmMGI3NDc5MTEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBdXJlbGllbiBBcHRlbCA8YWFwdGVsQHN1c2UuY29tPgpEYXRl
OiBUaHUsIDQgTWFyIDIwMjEgMTc6NTE6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBjaWZzOiBh
c2sgZm9yIG1vcmUgY3JlZGl0IG9uIGFzeW5jIHJlYWQvd3JpdGUgY29kZSBwYXRocwoKV2hlbiBk
b2luZyBhIGxhcmdlIHJlYWQgb3Igd3JpdGUgd29ya2xvYWQgd2Ugb25seQp2ZXJ5IGdyYWR1YWxs
eSBpbmNyZWFzZSB0aGUgbnVtYmVyIG9mIGNyZWRpdHMKd2hpY2ggY2FuIGNhdXNlIHByb2JsZW1z
IHdpdGggcGFyYWxsZWxpemluZyBsYXJnZSBpL28KKEkvTyByYW1wcyB1cCBtb3JlIHNsb3dseSB0
aGFuIGl0IHNob3VsZCBmb3IgbGFyZ2UKcmVhZC93cml0ZSB3b3JrbG9hZHMpIGVzcGVjaWFsbHkg
d2l0aCBtdWx0aWNoYW5uZWwKd2hlbiB0aGUgbnVtYmVyIG9mIGNyZWRpdHMgb24gdGhlIHNlY29u
ZGFyeSBjaGFubmVscwpzdGFydHMgb3V0IGxvdyAoZS5nLiBsZXNzIHRoYW4gYWJvdXQgMTMwKSBv
ciB3aGVuCnJlY292ZXJpbmcgYWZ0ZXIgc2VydmVyIHRocm90dGxlZCBiYWNrIHRoZSBudW1iZXIK
b2YgY3JlZGl0LgoKU2lnbmVkLW9mZi1ieTogQXVyZWxpZW4gQXB0ZWwgPGFhcHRlbEBzdXNlLmNv
bT4KUmV2aWV3ZWQtYnk6IFNoeWFtIFByYXNhZCBOIDxzcHJhc2FkQG1pY3Jvc29mdC5jb20+ClNp
Z25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBm
cy9jaWZzL3NtYjJwZHUuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvc21iMnBkdS5jIGIvZnMv
Y2lmcy9zbWIycGR1LmMKaW5kZXggNGJiYjYxMjZiMTRkLi4yMTk5YTliZmFlOGYgMTAwNjQ0Ci0t
LSBhL2ZzL2NpZnMvc21iMnBkdS5jCisrKyBiL2ZzL2NpZnMvc21iMnBkdS5jCkBAIC00MDQxLDgg
KzQwNDEsNyBAQCBzbWIyX2FzeW5jX3JlYWR2KHN0cnVjdCBjaWZzX3JlYWRkYXRhICpyZGF0YSkK
IAlpZiAocmRhdGEtPmNyZWRpdHMudmFsdWUgPiAwKSB7CiAJCXNoZHItPkNyZWRpdENoYXJnZSA9
IGNwdV90b19sZTE2KERJVl9ST1VORF9VUChyZGF0YS0+Ynl0ZXMsCiAJCQkJCQlTTUIyX01BWF9C
VUZGRVJfU0laRSkpOwotCQlzaGRyLT5DcmVkaXRSZXF1ZXN0ID0KLQkJCWNwdV90b19sZTE2KGxl
MTZfdG9fY3B1KHNoZHItPkNyZWRpdENoYXJnZSkgKyAxKTsKKwkJc2hkci0+Q3JlZGl0UmVxdWVz
dCA9IGNwdV90b19sZTE2KGxlMTZfdG9fY3B1KHNoZHItPkNyZWRpdENoYXJnZSkgKyA4KTsKIAog
CQlyYyA9IGFkanVzdF9jcmVkaXRzKHNlcnZlciwgJnJkYXRhLT5jcmVkaXRzLCByZGF0YS0+Ynl0
ZXMpOwogCQlpZiAocmMpCkBAIC00MzQ4LDggKzQzNDcsNyBAQCBzbWIyX2FzeW5jX3dyaXRldihz
dHJ1Y3QgY2lmc193cml0ZWRhdGEgKndkYXRhLAogCWlmICh3ZGF0YS0+Y3JlZGl0cy52YWx1ZSA+
IDApIHsKIAkJc2hkci0+Q3JlZGl0Q2hhcmdlID0gY3B1X3RvX2xlMTYoRElWX1JPVU5EX1VQKHdk
YXRhLT5ieXRlcywKIAkJCQkJCSAgICBTTUIyX01BWF9CVUZGRVJfU0laRSkpOwotCQlzaGRyLT5D
cmVkaXRSZXF1ZXN0ID0KLQkJCWNwdV90b19sZTE2KGxlMTZfdG9fY3B1KHNoZHItPkNyZWRpdENo
YXJnZSkgKyAxKTsKKwkJc2hkci0+Q3JlZGl0UmVxdWVzdCA9IGNwdV90b19sZTE2KGxlMTZfdG9f
Y3B1KHNoZHItPkNyZWRpdENoYXJnZSkgKyA4KTsKIAogCQlyYyA9IGFkanVzdF9jcmVkaXRzKHNl
cnZlciwgJndkYXRhLT5jcmVkaXRzLCB3ZGF0YS0+Ynl0ZXMpOwogCQlpZiAocmMpCi0tIAoyLjI3
LjAKCg==
--000000000000d150cd05bcc0c9b7--

