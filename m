Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB0A775D
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 00:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=XX6PnSS0XGg/J1ZrD4AQewrN8q/0nOz94IYH1WHzKjk=; b=ACR0m7/NMutII+xDUs1AZ8l2oe
	Vk25zgM3k6wIJscyE3Vfv/7CJ2Ff5ac+nn85gp4lHIeX5JHVbK+yDS3DGfokVCr3n69dVGUsB6Zy8
	yPUaTteYwWnFpi4e5dkzcbnUxifomJW/GeX21XDKTgjMtIBHXyghq4bgKh0bh1o2H2BzZnmd4VT20
	Eh9ndHbdf+2K9tiYUf4cLtbg9StAGo6X96YCSLetl9dElB/rNMrWa7+WJ1dZ+94bzCwBTnq8dyOO4
	1acQ2RotPaDQsB3kS1ZRPBSsQKdcMOAcQX32MnJCAs9lLNunyqHanfVgfXrjAye7WtZv1cMk4RW6c
	FzOSecJQ==;
Received: from localhost ([::1]:28344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5Hh4-003Htz-L9; Tue, 03 Sep 2019 22:54:34 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:47012) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Hh0-003Hts-Dy
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 22:54:32 +0000
Received: by mail-io1-xd42.google.com with SMTP id x4so39712137iog.13
 for <samba-technical@lists.samba.org>; Tue, 03 Sep 2019 15:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XX6PnSS0XGg/J1ZrD4AQewrN8q/0nOz94IYH1WHzKjk=;
 b=HDnpZZzGzCPGC3Wpm2akx2tC2hmTaty2GGI0YqIg89UeaTKrtF3HjiXpy7s+u7aua4
 fTTlC+Gvy2/fN9YnN6Ox4WFTRa47SE4KfmH7UfoLlS5jhLfzd3Pg7p/WtmHQjlcjSH2I
 GjhMjjXrhLGrMuu81xo2ji5Mubghht0jWqwnn0Bq0tRMI9CLNzHjFryx+MjgV4rjZG3Q
 caZe1VXaQHm4bamKHxcV/1umzHeYaqevtN9kEjvLBTI3NF+0ENIuZRyCYVYomXXRAYlE
 mmuw6IBgdfA5uQTR4gX5rUkM9fQ+54QuNvQw2AYMP/MJ2ckh8CQVftWkD5HHCyzIb0LI
 mwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XX6PnSS0XGg/J1ZrD4AQewrN8q/0nOz94IYH1WHzKjk=;
 b=LWVJIb4V4qqLR7BTrLWLLsw6EexjguiVj0jjx2V/2kzsi0YeR78vMbIBMKg9B5rQNs
 a4CXLj/sFbG8Aia7+Sk4vAFpdnCJrHYcTeJDjamdNR2khZr3z40uIuh7dsPx89WHbI9N
 VnBCZugmPpmAaqzwpI/r1aMIll2VvbxXxtoRZOt1mZcjaeSO5SVs1qGNtAn3RvDoQdpr
 okMSFfYsJdJvzOdW0AjFqSSHCRjCv4Xl05CM81ltx5trhWJ/l7cDiSQz34CIwkk7UxEF
 fH4CTmUyfPY9YX3Ckrp6BqxuCZAxHZB29jJxPetN6M9dlv+N9b37ZpWlnQJYENPPj3yu
 XQVg==
X-Gm-Message-State: APjAAAUk1XKZ9KrVf7ZG9RiHsVKrowFDoUizk8idc4qcHbqBFTsYOzsw
 Svw+Z9Q6eXIZyzTYfRhBD+tiCBelVKI0CNyV9jM=
X-Google-Smtp-Source: APXvYqy7MJrikA6cZoW3mUqxKonOcNME2sfKdgUyF+KZXJfVpeBdjnL7cdGX0I3KFyK0uIxGxc69qqZfNntbTiAAEJY=
X-Received: by 2002:a6b:6303:: with SMTP id p3mr1006199iog.169.1567551268258; 
 Tue, 03 Sep 2019 15:54:28 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 3 Sep 2019 17:54:17 -0500
Message-ID: <CAH2r5mtzztgoW91TvG_wTYju10dNJ+=r8Ncx3f3bebstMZiCpA@mail.gmail.com>
Subject: [PATCH] smb3: log warning if CSC policy conflicts with linux kernel
 client cache mount option
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000008327cd0591adf8db"
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

--0000000000008327cd0591adf8db
Content-Type: text/plain; charset="UTF-8"

If the server config (e.g. Samba smb.conf "csc policy = disable)
for the share indicates that the share should not be cached, log
a warning message in the Linux kernel client if forced client side
caching ("cache=ro" or "cache=singleclient") was requested on mount.

Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/cifs/connect.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index d9a995588c74..85f8d943a05a 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -3478,6 +3478,14 @@ cifs_get_tcon(struct cifs_ses *ses, struct
smb_vol *volume_info)
         tcon->use_resilient = true;
     }

+    /* If the user really knows what they are doing they can override */
+    if (tcon->share_flags & SMB2_SHAREFLAG_NO_CACHING) {
+        if (volume_info->cache_ro)
+            cifs_dbg(VFS, "cache=ro requested on mount but NO_CACHING
flag set on share\n");
+        else if (volume_info->cache_rw)
+            cifs_dbg(VFS, "cache=singleclient requested on mount but
NO_CACHING flag set on share\n");
+    }
+
     /*
      * We can have only one retry value for a connection to a share so for
      * resources mounted more than once to the same server share the last

-- 
Thanks,

Steve

--0000000000008327cd0591adf8db
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-log-warning-if-CSC-policy-conflicts-with-cache-.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-log-warning-if-CSC-policy-conflicts-with-cache-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k04fjknu0>
X-Attachment-Id: f_k04fjknu0

RnJvbSBkYWU5MzFjMDJhZWQxNDQyN2VhNDAyMmM3ZTgwMzhhYjMxMDNiNGQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMyBTZXAgMjAxOSAxNzo0OTo0NiAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IGxvZyB3YXJuaW5nIGlmIENTQyBwb2xpY3kgY29uZmxpY3RzIHdpdGggY2FjaGUgbW91bnQK
IG9wdGlvbgoKSWYgdGhlIHNlcnZlciBjb25maWcgKGUuZy4gU2FtYmEgc21iLmNvbmYgImNzYyBw
b2xpY3kgPSBkaXNhYmxlKQpmb3IgdGhlIHNoYXJlIGluZGljYXRlcyB0aGF0IHRoZSBzaGFyZSBz
aG91bGQgbm90IGJlIGNhY2hlZCwgbG9nCmEgd2FybmluZyBtZXNzYWdlIGlmIGZvcmNlZCBjbGll
bnQgc2lkZSBjYWNoaW5nICgiY2FjaGU9cm8iIG9yCiJjYWNoZT1zaW5nbGVjbGllbnQiKSBpcyBy
ZXF1ZXN0ZWQgb24gbW91bnQuCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNo
QG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvY2lmcy9jb25uZWN0LmMgfCA4ICsrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9jb25uZWN0
LmMgYi9mcy9jaWZzL2Nvbm5lY3QuYwppbmRleCBkOWE5OTU1ODhjNzQuLjg1ZjhkOTQzYTA1YSAx
MDA2NDQKLS0tIGEvZnMvY2lmcy9jb25uZWN0LmMKKysrIGIvZnMvY2lmcy9jb25uZWN0LmMKQEAg
LTM0NzgsNiArMzQ3OCwxNCBAQCBjaWZzX2dldF90Y29uKHN0cnVjdCBjaWZzX3NlcyAqc2VzLCBz
dHJ1Y3Qgc21iX3ZvbCAqdm9sdW1lX2luZm8pCiAJCXRjb24tPnVzZV9yZXNpbGllbnQgPSB0cnVl
OwogCX0KIAorCS8qIElmIHRoZSB1c2VyIHJlYWxseSBrbm93cyB3aGF0IHRoZXkgYXJlIGRvaW5n
IHRoZXkgY2FuIG92ZXJyaWRlICovCisJaWYgKHRjb24tPnNoYXJlX2ZsYWdzICYgU01CMl9TSEFS
RUZMQUdfTk9fQ0FDSElORykgeworCQlpZiAodm9sdW1lX2luZm8tPmNhY2hlX3JvKQorCQkJY2lm
c19kYmcoVkZTLCAiY2FjaGU9cm8gcmVxdWVzdGVkIG9uIG1vdW50IGJ1dCBOT19DQUNISU5HIGZs
YWcgc2V0IG9uIHNoYXJlXG4iKTsKKwkJZWxzZSBpZiAodm9sdW1lX2luZm8tPmNhY2hlX3J3KQor
CQkJY2lmc19kYmcoVkZTLCAiY2FjaGU9c2luZ2xlY2xpZW50IHJlcXVlc3RlZCBvbiBtb3VudCBi
dXQgTk9fQ0FDSElORyBmbGFnIHNldCBvbiBzaGFyZVxuIik7CisJfQorCiAJLyoKIAkgKiBXZSBj
YW4gaGF2ZSBvbmx5IG9uZSByZXRyeSB2YWx1ZSBmb3IgYSBjb25uZWN0aW9uIHRvIGEgc2hhcmUg
c28gZm9yCiAJICogcmVzb3VyY2VzIG1vdW50ZWQgbW9yZSB0aGFuIG9uY2UgdG8gdGhlIHNhbWUg
c2VydmVyIHNoYXJlIHRoZSBsYXN0Ci0tIAoyLjIwLjEKCg==
--0000000000008327cd0591adf8db--

