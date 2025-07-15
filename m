Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F7B04F10
	for <lists+samba-technical@lfdr.de>; Tue, 15 Jul 2025 05:32:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GFmgWQvpMxPBtBq1ucsn2DJRdhKAVc7fWWLoKmb9WvQ=; b=eD5LWWhdSi931z4yZInB6ksKuy
	NaphtTApD7AJtmkKGnNRhXvpaaOi7Qo5G4a4r4D+nHIoXeU0whjLGEFhed0baRh5K2TVldGIuYyyA
	CPntieLtGTGs9CPwEqKTkTnVV8yhzj7NfeyStvM2QPM6vSm06wrfw4dF9QHj4lHIK8NVyL2WC5HG7
	lR3+Y2Vm/2Ffqmf4TJipdDd7/wTqQSu6ACifEjl2GEkiMo5mJRH9utrok61ZCYEhfWp8F2tCUd9VB
	xGegFFr63TR61Fxk8wNO1YbpkePxdGQI6fl3RKwuY7/610NKEiLzfQutaf2KlMu/IqziVUND50PSk
	a98oWiKw==;
Received: from ip6-localhost ([::1]:60974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubWOs-00BER4-4G; Tue, 15 Jul 2025 03:32:14 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:49469) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubWOo-00BEQx-0w
 for samba-technical@lists.samba.org; Tue, 15 Jul 2025 03:32:12 +0000
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7d9eac11358so494540885a.3
 for <samba-technical@lists.samba.org>; Mon, 14 Jul 2025 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752550328; x=1753155128; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GFmgWQvpMxPBtBq1ucsn2DJRdhKAVc7fWWLoKmb9WvQ=;
 b=H8OaXip2fsgVAkMzm0GqrIW6gbWPQnSeklkXXzJoNOwsC3uBl3dGIf/d4YqMGNT1V3
 yx3p0mzcHNTJsTYtVLnTo9vSy9Rp736SXChvhyhRVUnYF4nWB7SbgsiDctZTRrM9eth0
 5VkXhND3ma/E/bPzos3qoZ5csFUk97y3/2fdObnYZpbkbPC5/JNimq8zBIbDRIhWX6HF
 0WcMf9oQoHgu2Q12R9xlsCrsXJBR2gW1vXY7D8HrkhjVZoXJdsetAkac9PG4yVYXidIu
 vazjVjq5YpJ0MmNa915v0RWMrLPOaKE75AoPOhit6Kwplcl7koomK3PiaEKGkC+yrhlC
 dFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752550328; x=1753155128;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GFmgWQvpMxPBtBq1ucsn2DJRdhKAVc7fWWLoKmb9WvQ=;
 b=o/3aaMy+zP4PS3s6tOqlg36bcYtmOnGNlCijQyeidIuRcS6i/DoeDWTuQiDGinPi4V
 qdOtG9Q37dUtGxAbVZcmtLn9pqoXKhl73/hdWBga3PVCbu2zv5M3mkmUskKjI0iITosC
 31tpDoW2qQRUN2T9BDr3uzGZprszqUcM/ZpKiovseCbJCEY2S8HU0t8yilyB4N0Vo9M0
 US9VO9JzYgvQ+kamnZUt6uHHUGHkj8L0VQqE1lRl86lvF/0wpHkq8fEkxiwo7MO2/xdP
 f9CVM+iw178rBeTkPXlIAkyFLS3S5EBGiK3/D8hj4Le78yNMBP658suiMiA7KC2Z0AWW
 7l0A==
X-Gm-Message-State: AOJu0YzJ1lRN0SCzlDPXItsA7LQeQvYKYXiv7Tkjvwj25rVHLhP0xLKP
 v3nwHAkm9KrF5wvQwohCUtZVxPILYXOxKgAPPkLuazreAgy4DU38FRaPzboqHBYbSo+g0g383aT
 0in/nQQEyrGRfttZH2/LhTQ8Qskyh6DY=
X-Gm-Gg: ASbGncv0CL4ne2Vy87n8vGN8T9S6VefDLxUR1VzIlEX1MiOOP91z1Iqn6r6eCdLD8DK
 j1GDYl1GI9EmZd3pN/3itTD36x8rcctOZZ7pkREj+G8NpCBa7ts8lzGxy43RH9lSjRUuuMfPGiL
 213SoLgXWd4GcZdQJSJvoD7b3BooblMeTKEQZVeVrRX4degxE3reP5AHDHj13LR9oegeBo6tf95
 mioSup8ckfOl1fVks2zlt3cZM8YdPSLDEcyC+lFtg==
X-Google-Smtp-Source: AGHT+IGQ5BHrkgFepzjYp8mbMNtIeAqn2WTYFkhaulaKCik4qxPc1MCd4Z9Rx/r3PX1ClwHSUqEicDhYskcA9Yc3DaQ=
X-Received: by 2002:a05:620a:4549:b0:7e2:a47:e50e with SMTP id
 af79cd13be357-7e20a47e7cdmr1158579185a.30.1752550327833; Mon, 14 Jul 2025
 20:32:07 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 14 Jul 2025 22:31:56 -0500
X-Gm-Features: Ac12FXzrmLboga7OWI2YMuucTsXiG3AXGz7CTDK1uPmxzV-1mpI-ggSRZkqiFq8
Message-ID: <CAH2r5mvA3NQp8BDj_v-k3YRUR9Xe7u5XmaM_XQBP4xJts0R6bA@mail.gmail.com>
Subject: [PATCH][SMB3 client] Fix SMB311 posix special file creation to
 servers which do not advertise reparse support
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000bdf9050639ef6b0b"
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Paulo Alcantara <pc@manguebit.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000bdf9050639ef6b0b
Content-Type: text/plain; charset="UTF-8"

Some servers (including Samba), support the SMB3.1.1 POSIX Extensions
(which use reparse
points for handling special files) but do not properly advertise file
system attribute
FILE_SUPPORTS_REPARSE_POINTS.  Although we don't check for this
attribute flag when
querying special file information, we do check it when creating
special files which
causes them to fail unnecessarily.   If we have negotiated SMB3.1.1
POSIX Extensions
with the server we can expect the server to support creating special files via
reparse points, and even if the server fails the operation due to
really forbidding
creating special files, then it should be no problem and is more
likely to return a
more accurate rc in any case (e.g. EACCES instead of EOPNOTSUPP).

Allow creating special files as long as the server supports either
reparse points
or the SMB3.1.1 POSIX Extensions (note that if the "sfu" mount option
is specified
it uses a different way of storing special files that does not rely on
reparse points).

See attached patch

-- 
Thanks,

Steve

--000000000000bdf9050639ef6b0b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Fix-SMB311-posix-special-file-creation-to-servers-wh.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-SMB311-posix-special-file-creation-to-servers-wh.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_md3z6nfo0>
X-Attachment-Id: f_md3z6nfo0

RnJvbSA0ZTFjOTExOGVhNjJjNTJmNzBjYTJjMzk0OWQwOTUwOTZjNGViNjY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMTQgSnVsIDIwMjUgMjI6MTY6MTkgLTA1MDAKU3ViamVjdDogW1BBVENIXSBG
aXggU01CMzExIHBvc2l4IHNwZWNpYWwgZmlsZSBjcmVhdGlvbiB0byBzZXJ2ZXJzIHdoaWNoIGRv
CiBub3QgYWR2ZXJ0aXNlIHJlcGFyc2Ugc3VwcG9ydAoKU29tZSBzZXJ2ZXJzIChpbmNsdWRpbmcg
U2FtYmEpLCBzdXBwb3J0IHRoZSBTTUIzLjEuMSBQT1NJWCBFeHRlbnNpb25zICh3aGljaCB1c2Ug
cmVwYXJzZQpwb2ludHMgZm9yIGhhbmRsaW5nIHNwZWNpYWwgZmlsZXMpIGJ1dCBkbyBub3QgcHJv
cGVybHkgYWR2ZXJ0aXNlIGZpbGUgc3lzdGVtIGF0dHJpYnV0ZQpGSUxFX1NVUFBPUlRTX1JFUEFS
U0VfUE9JTlRTLiAgQWx0aG91Z2ggd2UgZG9uJ3QgY2hlY2sgZm9yIHRoaXMgYXR0cmlidXRlIGZs
YWcgd2hlbgpxdWVyeWluZyBzcGVjaWFsIGZpbGUgaW5mb3JtYXRpb24sIHdlIGRvIGNoZWNrIGl0
IHdoZW4gY3JlYXRpbmcgc3BlY2lhbCBmaWxlcyB3aGljaApjYXVzZXMgdGhlbSB0byBmYWlsIHVu
bmVjZXNzYXJpbHkuICAgSWYgd2UgaGF2ZSBuZWdvdGlhdGVkIFNNQjMuMS4xIFBPU0lYIEV4dGVu
c2lvbnMKd2l0aCB0aGUgc2VydmVyIHdlIGNhbiBleHBlY3QgdGhlIHNlcnZlciB0byBzdXBwb3J0
IGNyZWF0aW5nIHNwZWNpYWwgZmlsZXMgdmlhCnJlcGFyc2UgcG9pbnRzLCBhbmQgZXZlbiBpZiB0
aGUgc2VydmVyIGZhaWxzIHRoZSBvcGVyYXRpb24gZHVlIHRvIHJlYWxseSBmb3JiaWRkaW5nCmNy
ZWF0aW5nIHNwZWNpYWwgZmlsZXMsIHRoZW4gaXQgc2hvdWxkIGJlIG5vIHByb2JsZW0gYW5kIGlz
IG1vcmUgbGlrZWx5IHRvIHJldHVybiBhCm1vcmUgYWNjdXJhdGUgcmMgaW4gYW55IGNhc2UgKGUu
Zy4gRUFDQ0VTIGluc3RlYWQgb2YgRU9QTk9UU1VQUCkuCgpBbGxvdyBjcmVhdGluZyBzcGVjaWFs
IGZpbGVzIGFzIGxvbmcgYXMgdGhlIHNlcnZlciBzdXBwb3J0cyBlaXRoZXIgcmVwYXJzZSBwb2lu
dHMKb3IgdGhlIFNNQjMuMS4xIFBPU0lYIEV4dGVuc2lvbnMgKG5vdGUgdGhhdCBpZiB0aGUgInNm
dSIgbW91bnQgb3B0aW9uIGlzIHNwZWNpZmllZAppdCB1c2VzIGEgZGlmZmVyZW50IHdheSBvZiBz
dG9yaW5nIHNwZWNpYWwgZmlsZXMgdGhhdCBkb2VzIG5vdCByZWx5IG9uIHJlcGFyc2UgcG9pbnRz
KS4KCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogU3RldmUgRnJl
bmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL3NtYi9jbGllbnQvc21iMmlub2Rl
LmMgfCAzICsrLQogZnMvc21iL2NsaWVudC9zbWIyb3BzLmMgICB8IDMgKystCiAyIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9z
bWIvY2xpZW50L3NtYjJpbm9kZS5jIGIvZnMvc21iL2NsaWVudC9zbWIyaW5vZGUuYwppbmRleCAy
YTNlNDZiOGUxNWEuLmExMWEyYTY5M2M1MSAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9zbWIy
aW5vZGUuYworKysgYi9mcy9zbWIvY2xpZW50L3NtYjJpbm9kZS5jCkBAIC0xMzQ2LDcgKzEzNDYs
OCBAQCBzdHJ1Y3QgaW5vZGUgKnNtYjJfZ2V0X3JlcGFyc2VfaW5vZGUoc3RydWN0IGNpZnNfb3Bl
bl9pbmZvX2RhdGEgKmRhdGEsCiAJICogZW1wdHkgb2JqZWN0IG9uIHRoZSBzZXJ2ZXIuCiAJICov
CiAJaWYgKCEobGUzMl90b19jcHUodGNvbi0+ZnNBdHRySW5mby5BdHRyaWJ1dGVzKSAmIEZJTEVf
U1VQUE9SVFNfUkVQQVJTRV9QT0lOVFMpKQotCQlyZXR1cm4gRVJSX1BUUigtRU9QTk9UU1VQUCk7
CisJCWlmICghdGNvbi0+cG9zaXhfZXh0ZW5zaW9ucykKKwkJCXJldHVybiBFUlJfUFRSKC1FT1BO
T1RTVVBQKTsKIAogCW9wYXJtcyA9IENJRlNfT1BBUk1TKGNpZnNfc2IsIHRjb24sIGZ1bGxfcGF0
aCwKIAkJCSAgICAgU1lOQ0hST05JWkUgfCBERUxFVEUgfApkaWZmIC0tZ2l0IGEvZnMvc21iL2Ns
aWVudC9zbWIyb3BzLmMgYi9mcy9zbWIvY2xpZW50L3NtYjJvcHMuYwppbmRleCBjYjY1OTI1NmQy
MTkuLjkzOGE4YTdjNWQyMSAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9zbWIyb3BzLmMKKysr
IGIvZnMvc21iL2NsaWVudC9zbWIyb3BzLmMKQEAgLTUyNjAsNyArNTI2MCw4IEBAIHN0YXRpYyBp
bnQgc21iMl9tYWtlX25vZGUodW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGlub2RlICppbm9kZSwK
IAlpZiAoY2lmc19zYi0+bW50X2NpZnNfZmxhZ3MgJiBDSUZTX01PVU5UX1VOWF9FTVVMKSB7CiAJ
CXJjID0gY2lmc19zZnVfbWFrZV9ub2RlKHhpZCwgaW5vZGUsIGRlbnRyeSwgdGNvbiwKIAkJCQkJ
ZnVsbF9wYXRoLCBtb2RlLCBkZXYpOwotCX0gZWxzZSBpZiAobGUzMl90b19jcHUodGNvbi0+ZnNB
dHRySW5mby5BdHRyaWJ1dGVzKSAmIEZJTEVfU1VQUE9SVFNfUkVQQVJTRV9QT0lOVFMpIHsKKwl9
IGVsc2UgaWYgKChsZTMyX3RvX2NwdSh0Y29uLT5mc0F0dHJJbmZvLkF0dHJpYnV0ZXMpICYgRklM
RV9TVVBQT1JUU19SRVBBUlNFX1BPSU5UUykKKwkJfHwgKHRjb24tPnBvc2l4X2V4dGVuc2lvbnMp
KSB7CiAJCXJjID0gc21iMl9ta25vZF9yZXBhcnNlKHhpZCwgaW5vZGUsIGRlbnRyeSwgdGNvbiwK
IAkJCQkJZnVsbF9wYXRoLCBtb2RlLCBkZXYpOwogCX0KLS0gCjIuNDMuMAoK
--000000000000bdf9050639ef6b0b--

