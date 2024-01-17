Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B93830F2E
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jan 2024 23:28:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=84XkGLvsoppwnjCl11vVf4LSthAdwJOsUjCsA2aCCuo=; b=kixjIsfBcicXVlXPxnAGNLTiWz
	v7O7J6YYB1qhaalyPmRNZfKpmNWEZBwrZb6Ghpds1j4P0SrFzeci9luley+bQPvUrRp9drlPlfg1G
	oTEnLIPi1TZkhhdgNRC0eR03zwlzb3NsdwUR3cQlwP4vRlZnF+xvnA+z/AnUU0X4GN7P/9Dw8pU/Y
	O0TgzJANvAIdbm7QTi0IG6KFj/ZynFZwcQm4aRhYjDuFttCel/U9cgSWQnawJsNegM3O07RLxfD9t
	AjW62RGiT47fKgzDPxn6gvEe4Kl8+EjclC7EFFw/xKSHWs7VA5JGM+/IRl+s5nrZlpkwH7jebpXg1
	/r7nEyUA==;
Received: from ip6-localhost ([::1]:36896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rQEOb-003m7X-Ml; Wed, 17 Jan 2024 22:28:29 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:61500) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rQEOX-003m7Q-8V
 for samba-technical@lists.samba.org; Wed, 17 Jan 2024 22:28:28 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50eaabc36bcso14496360e87.2
 for <samba-technical@lists.samba.org>; Wed, 17 Jan 2024 14:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705530503; x=1706135303; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=84XkGLvsoppwnjCl11vVf4LSthAdwJOsUjCsA2aCCuo=;
 b=Q65NHIwWiZg+TBLwAATB+CfVUhC8v6zwxT37F87HmL5gmFKZY8J0f1OVcCODv0cfBu
 gFGYF9mWYwGPhAMDedhYTzl45re1wy8Xnyhgb2SciLNHIU17dpT9tckgEHk9N8W9nlV4
 nWY6XNh4nJd5glyTIZ0JttwHyC30Vx6+ENKZmU2bmVHGE+kYxrDilyrBmAKlmiUF0f7T
 1aOq18nUJ/fsw3Z23ERSPbrLLRKQxvVIgCSg9QLhjaagLTq7WVN2hZbF3Rdcss3TWHli
 0YpQtbhm/w/TGU763LsFWCUJPbGpT7n+3T7y5j78++BUgkwTWA68WKO1ZhhJdF3EOuhk
 JS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705530503; x=1706135303;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=84XkGLvsoppwnjCl11vVf4LSthAdwJOsUjCsA2aCCuo=;
 b=QpqR939+72yZ+tsN/bTcvYTbl0P4IWGkn/yWJfW8I/sHIFxOG02frJmBNoAH2pvtai
 G9wv3SEvAaggxhNENG7GZGAAsujkDPhbukxyMw5K83sd8SiAcWz5q1IUFoDLnsRMTIKu
 To1GWdw4O7j5CCnrOlxM0DnnZcR/w5g45gA+qkakUmLo/efuF3FVq8FRG+gktaMPj8Oq
 cwm4ml7odCSiaijsmW7G7pDGl5Gkm5dXvDbzfHrqlBv/TlU1r1fmbJJYGiaLAtKRh92O
 VUCA9osPy1UVf6GxHFfjyVEHUQ2STHE8K8Cv2bt/4UX6Nnxni7aDOBhdZRVy02yOT9WK
 5XXA==
X-Gm-Message-State: AOJu0YyMTto6u/ZRCvdAp7w/EArGo2IzPhr3UgtEYffZiUV7RDcCkacp
 UNbAzMLwxZ9aEDgkFWFbA18clQEOcQi0igllPlRp+eK8IUvkdQ==
X-Google-Smtp-Source: AGHT+IHe7584WO2xjM8XG8HJoRVvKIZLd9hxhb9ZJhjMK1Tvg7ut6/cLj1Di9DSsrG8/t5h3dzqYX3zEua7QPyfLlZU=
X-Received: by 2002:ac2:46e9:0:b0:50e:7b0d:5b66 with SMTP id
 q9-20020ac246e9000000b0050e7b0d5b66mr4561023lfo.73.1705530502845; Wed, 17 Jan
 2024 14:28:22 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 17 Jan 2024 16:28:11 -0600
Message-ID: <CAH2r5mu-1g33hBOjcY4S0JBuwD3VKD1goTiQKurj+9wj+XmXpg@mail.gmail.com>
Subject: [PATCH][SMB3 client] show beginning time for per share stats
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000c6ac32060f2bc32e"
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000c6ac32060f2bc32e
Content-Type: text/plain; charset="UTF-8"

In analyzing problems, one missing piece of debug data is when the
mount occurred.  A related problem is when collecting stats we don't
know the  period of time the stats covered, ie when this set of stats
for the tcon started to be collected.  To make debugging easier track
the stats begin time. Set it when the mount occurred at mount time,
and reset it to current time whenever stats are reset. For example,

...
1) \\localhost\test
SMBs: 14 since 2024-01-17 22:17:30 UTC
Bytes read: 0  Bytes written: 0
Open files: 0 total (local), 0 open on server
TreeConnects: 1 total 0 failed
TreeDisconnects: 0 total 0 failed
...
2) \\localhost\scratch
SMBs: 24 since 2024-01-17 22:16:04 UTC
Bytes read: 0  Bytes written: 0
Open files: 0 total (local), 0 open on server
TreeConnects: 1 total 0 failed
TreeDisconnects: 0 total 0 failed
...

Note the time "since ... UTC" is now displayed in /proc/fs/cifs/Stats
for each share that is mounted.

See attached

-- 
Thanks,

Steve

--000000000000c6ac32060f2bc32e
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-show-beginning-time-for-per-share-stats.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-show-beginning-time-for-per-share-stats.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lrictcne0>
X-Attachment-Id: f_lrictcne0

RnJvbSAxMTQyYzFhOTIyZDU2ODFjZjQ0Yzg0YzY1M2RjODEwNGZiMzI5MzNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFdlZCwgMTcgSmFuIDIwMjQgMTY6MTU6MTggLTA2MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBzaG93IGJlZ2lubmluZyB0aW1lIGZvciBwZXIgc2hhcmUgc3RhdHMKCkluIGFuYWx5emlu
ZyBwcm9ibGVtcywgb25lIG1pc3NpbmcgcGllY2Ugb2YgZGVidWcgZGF0YSBpcyB3aGVuIHRoZQpt
b3VudCBvY2N1cnJlZC4gIEEgcmVsYXRlZCBwcm9ibGVtIGlzIHdoZW4gY29sbGVjdGluZyBzdGF0
cyB3ZSBkb24ndAprbm93IHRoZSAgcGVyaW9kIG9mIHRpbWUgdGhlIHN0YXRzIGNvdmVyZWQsIGll
IHdoZW4gdGhpcyBzZXQgb2Ygc3RhdHMKZm9yIHRoZSB0Y29uIHN0YXJ0ZWQgdG8gYmUgY29sbGVj
dGVkLiAgVG8gbWFrZSBkZWJ1Z2dpbmcgZWFzaWVyIHRyYWNrCnRoZSBzdGF0cyBiZWdpbiB0aW1l
LiBTZXQgaXQgd2hlbiB0aGUgbW91bnQgb2NjdXJyZWQgYXQgbW91bnQgdGltZSwKYW5kIHJlc2V0
IGl0IHRvIGN1cnJlbnQgdGltZSB3aGVuZXZlciBzdGF0cyBhcmUgcmVzZXQuIEZvciBleGFtcGxl
LAoKLi4uCjEpIFxcbG9jYWxob3N0XHRlc3QKU01CczogMTQgc2luY2UgMjAyNC0wMS0xNyAyMjox
NzozMCBVVEMKQnl0ZXMgcmVhZDogMCAgQnl0ZXMgd3JpdHRlbjogMApPcGVuIGZpbGVzOiAwIHRv
dGFsIChsb2NhbCksIDAgb3BlbiBvbiBzZXJ2ZXIKVHJlZUNvbm5lY3RzOiAxIHRvdGFsIDAgZmFp
bGVkClRyZWVEaXNjb25uZWN0czogMCB0b3RhbCAwIGZhaWxlZAouLi4KMikgXFxsb2NhbGhvc3Rc
c2NyYXRjaApTTUJzOiAyNCBzaW5jZSAyMDI0LTAxLTE3IDIyOjE2OjA0IFVUQwpCeXRlcyByZWFk
OiAwICBCeXRlcyB3cml0dGVuOiAwCk9wZW4gZmlsZXM6IDAgdG90YWwgKGxvY2FsKSwgMCBvcGVu
IG9uIHNlcnZlcgpUcmVlQ29ubmVjdHM6IDEgdG90YWwgMCBmYWlsZWQKVHJlZURpc2Nvbm5lY3Rz
OiAwIHRvdGFsIDAgZmFpbGVkCi4uLgoKTm90ZSB0aGUgdGltZSAic2luY2UgLi4uIFVUQyIgaXMg
bm93IGRpc3BsYXllZCBpbiAvcHJvYy9mcy9jaWZzL1N0YXRzCmZvciBlYWNoIHNoYXJlIHRoYXQg
aXMgbW91bnRlZC4KClN1Z2dlc3RlZC1ieTogU2h5YW0gUHJhc2FkIE4gPHNwcmFzYWRAbWljcm9z
b2Z0LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQu
Y29tPgotLS0KIGZzL3NtYi9jbGllbnQvY2lmc19kZWJ1Zy5jIHwgNiArKysrLS0KIGZzL3NtYi9j
bGllbnQvY2lmc2dsb2IuaCAgIHwgMSArCiBmcy9zbWIvY2xpZW50L21pc2MuYyAgICAgICB8IDEg
KwogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZnMvc21iL2NsaWVudC9jaWZzX2RlYnVnLmMgYi9mcy9zbWIvY2xpZW50L2NpZnNf
ZGVidWcuYwppbmRleCA2MDAyN2Y1YWViZTguLjNlNDIwOWY0MWMxOCAxMDA2NDQKLS0tIGEvZnMv
c21iL2NsaWVudC9jaWZzX2RlYnVnLmMKKysrIGIvZnMvc21iL2NsaWVudC9jaWZzX2RlYnVnLmMK
QEAgLTY1OSw2ICs2NTksNyBAQCBzdGF0aWMgc3NpemVfdCBjaWZzX3N0YXRzX3Byb2Nfd3JpdGUo
c3RydWN0IGZpbGUgKmZpbGUsCiAJCQkJCXNwaW5fbG9jaygmdGNvbi0+c3RhdF9sb2NrKTsKIAkJ
CQkJdGNvbi0+Ynl0ZXNfcmVhZCA9IDA7CiAJCQkJCXRjb24tPmJ5dGVzX3dyaXR0ZW4gPSAwOwor
CQkJCQl0Y29uLT5zdGF0c19mcm9tX3RpbWUgPSBrdGltZV9nZXRfcmVhbF9zZWNvbmRzKCk7CiAJ
CQkJCXNwaW5fdW5sb2NrKCZ0Y29uLT5zdGF0X2xvY2spOwogCQkJCQlpZiAoc2VydmVyLT5vcHMt
PmNsZWFyX3N0YXRzKQogCQkJCQkJc2VydmVyLT5vcHMtPmNsZWFyX3N0YXRzKHRjb24pOwpAQCAt
NzM3LDggKzczOCw5IEBAIHN0YXRpYyBpbnQgY2lmc19zdGF0c19wcm9jX3Nob3coc3RydWN0IHNl
cV9maWxlICptLCB2b2lkICp2KQogCQkJCXNlcV9wcmludGYobSwgIlxuJWQpICVzIiwgaSwgdGNv
bi0+dHJlZV9uYW1lKTsKIAkJCQlpZiAodGNvbi0+bmVlZF9yZWNvbm5lY3QpCiAJCQkJCXNlcV9w
dXRzKG0sICJcdERJU0NPTk5FQ1RFRCAiKTsKLQkJCQlzZXFfcHJpbnRmKG0sICJcblNNQnM6ICVk
IiwKLQkJCQkJICAgYXRvbWljX3JlYWQoJnRjb24tPm51bV9zbWJzX3NlbnQpKTsKKwkJCQlzZXFf
cHJpbnRmKG0sICJcblNNQnM6ICVkIHNpbmNlICVwdFRzIFVUQyIsCisJCQkJCSAgIGF0b21pY19y
ZWFkKCZ0Y29uLT5udW1fc21ic19zZW50KSwKKwkJCQkJICAgJnRjb24tPnN0YXRzX2Zyb21fdGlt
ZSk7CiAJCQkJaWYgKHNlcnZlci0+b3BzLT5wcmludF9zdGF0cykKIAkJCQkJc2VydmVyLT5vcHMt
PnByaW50X3N0YXRzKG0sIHRjb24pOwogCQkJfQpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9j
aWZzZ2xvYi5oIGIvZnMvc21iL2NsaWVudC9jaWZzZ2xvYi5oCmluZGV4IDg3OWQ1ZWY4YTY2ZS4u
ZjU3NmNlZWU2MTU3IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2NpZnNnbG9iLmgKKysrIGIv
ZnMvc21iL2NsaWVudC9jaWZzZ2xvYi5oCkBAIC0xMjA3LDYgKzEyMDcsNyBAQCBzdHJ1Y3QgY2lm
c190Y29uIHsKIAlfX3U2NCAgICBieXRlc19yZWFkOwogCV9fdTY0ICAgIGJ5dGVzX3dyaXR0ZW47
CiAJc3BpbmxvY2tfdCBzdGF0X2xvY2s7ICAvKiBwcm90ZWN0cyB0aGUgdHdvIGZpZWxkcyBhYm92
ZSAqLworCXRpbWU2NF90IHN0YXRzX2Zyb21fdGltZTsKIAlGSUxFX1NZU1RFTV9ERVZJQ0VfSU5G
TyBmc0RldkluZm87CiAJRklMRV9TWVNURU1fQVRUUklCVVRFX0lORk8gZnNBdHRySW5mbzsgLyog
b2sgaWYgZnMgbmFtZSB0cnVuY2F0ZWQgKi8KIAlGSUxFX1NZU1RFTV9VTklYX0lORk8gZnNVbml4
SW5mbzsKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvbWlzYy5jIGIvZnMvc21iL2NsaWVudC9t
aXNjLmMKaW5kZXggYzIxMzdlYTNjMjUzLi4wNzQ4ZDdiNzU3YjkgMTAwNjQ0Ci0tLSBhL2ZzL3Nt
Yi9jbGllbnQvbWlzYy5jCisrKyBiL2ZzL3NtYi9jbGllbnQvbWlzYy5jCkBAIC0xNDAsNiArMTQw
LDcgQEAgdGNvbl9pbmZvX2FsbG9jKGJvb2wgZGlyX2xlYXNlc19lbmFibGVkKQogCXNwaW5fbG9j
a19pbml0KCZyZXRfYnVmLT5zdGF0X2xvY2spOwogCWF0b21pY19zZXQoJnJldF9idWYtPm51bV9s
b2NhbF9vcGVucywgMCk7CiAJYXRvbWljX3NldCgmcmV0X2J1Zi0+bnVtX3JlbW90ZV9vcGVucywg
MCk7CisJcmV0X2J1Zi0+c3RhdHNfZnJvbV90aW1lID0ga3RpbWVfZ2V0X3JlYWxfc2Vjb25kcygp
OwogI2lmZGVmIENPTkZJR19DSUZTX0RGU19VUENBTEwKIAlJTklUX0xJU1RfSEVBRCgmcmV0X2J1
Zi0+ZGZzX3Nlc19saXN0KTsKICNlbmRpZgotLSAKMi40MC4xCgo=
--000000000000c6ac32060f2bc32e--

