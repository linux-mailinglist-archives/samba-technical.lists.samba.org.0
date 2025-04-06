Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C3A7CFF5
	for <lists+samba-technical@lfdr.de>; Sun,  6 Apr 2025 21:43:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=e3JJQm1qSjqMwiJoDddskYf4wu3viUAhC4IlUYhjc9M=; b=xIxePCNS3fPqaLcsexglT4TrTo
	jEa3iX6CJIdif+DSK5RtxOEpBEpeEtRs3FXk57VMIV+JSFiC/Osg7hRKbWWQ1iIgXBQaHNw0v5BEB
	evlWBHEuPUtNrbOfofz2dXs8a2MWed+ubL2GDfriklNcOqvfgLXXnCqYage32m1zCbgstJsycNu8E
	+UaFH9kuZ63D1pqm02lp2H3WEEOYSO1gUwFb0K6Dwe2k5PmfV8dF+1pa8BBuRfMxM7iTxlHohk30G
	7HI5YGVlNouSHQ4XNOiQFfy0GOZDT5CP5a1qz9OVogB1+BTVR0Ld9ssU4G7n4X04Xzqqpu0rt2+6z
	xu4d+Zzg==;
Received: from ip6-localhost ([::1]:46860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u1Vte-001nYV-Hl; Sun, 06 Apr 2025 19:43:10 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:50240) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u1Vta-001nYO-9v
 for samba-technical@lists.samba.org; Sun, 06 Apr 2025 19:43:08 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54addb5a139so4129625e87.0
 for <samba-technical@lists.samba.org>; Sun, 06 Apr 2025 12:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743968572; x=1744573372; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=e3JJQm1qSjqMwiJoDddskYf4wu3viUAhC4IlUYhjc9M=;
 b=TEzoPNOMLZE8gVY4K/IoSvAvsjPZhyuMAngbavinQoK22n5tKtyITNXxni1MrD/zk/
 yAeRRaDAcSOVlHg+5y9x/T9jNaLobFK87GgH3QbRtPcXsW+7ljlzk8uP0s0AyzCT7S9A
 qWuyk7M0xnHUlMaFteDjGI0dfIHmTQG4GbTu6TYPcXINB1b8JyBDnlsBndQ+6z4ub3Vn
 0GiA2+BKEtjfylgJHQgzKeNDkfhd/4UYYYhTiYx+P64iNTp5JEDaBHrDK7oeWkxdXMDH
 3VsEO3Q/q35eefJZezPMNkYysuFWgm/F/10yzE4TD6p95fLOGOE51x6Nd6y92s2WDWTh
 nRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743968572; x=1744573372;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e3JJQm1qSjqMwiJoDddskYf4wu3viUAhC4IlUYhjc9M=;
 b=BI07QFgW1mcdQZzAZ9Zlsk6vFEYJ5NE9hUP9OXOdIZG7pedexCYbu22QCQH0V2/C6C
 WuOPEn8s/Tbl5CzaE62JTIEKvZKpWGVgqqdDG4pdO2NmATyZFaq9vesVhlChf4qsr4BI
 Y9WUqf9XZte/sNv0PED3LWC382dQWBOM4DdtMWdbVct1+2G2Rsp2v/zm+agIjN554gkM
 w1gavf4XfBKX7FMm1kirXlqWEk/lLlqpheBKWSonqUhHxr4awEF5YuLhVZGOi2Hpzmc6
 IK91tbGs7HACQCk8Wk2+6xusFUV5LbMro0GQZV+o5y6ID293eUn4d9iJT5+w0q/mQqCd
 2k4Q==
X-Gm-Message-State: AOJu0Ywm7gHaIrgMxzbTubFCQ8mP5P63caZ0aCU57+UFXu76bp3V6kPD
 oj+xBwWtXmPCnv5jSD+pV0tSCKT6cJTexJXO3wUlpdSYkXCiHk/zkhIRMDxLKPHvSmzppLa4LK7
 9WrfZM/valysDYVXfr+CFvuJ/7uw=
X-Gm-Gg: ASbGnctyOIPgWHZUeBjiE0SjBPCc6b0sseGNDZbwT5ikSY/NDlOQufT1Dus9O/GY9d6
 uiIt6kx2v0T52yRh3Zm2mFFjHVA1kN0ENJDuxTBXAEDgTeoSXPNX1oPznI4w1t6RqZi5bn3qDIG
 rClfQCvwUKMtZIFHixwCCzAm0gf1MOPs2jyn4WSxu+8RMkDqBEV7bnsIiaWtVe
X-Google-Smtp-Source: AGHT+IHWWr+G0ug9xKZyoZJuvyly2ZVJ59MwzJgAOV7qKnn3lEIQ1VdJytZJaOS9VU9QnzeBQnM3n5Vxw1SMuXXevXk=
X-Received: by 2002:ac2:5683:0:b0:549:5b54:2c6c with SMTP id
 2adb3069b0e04-54c22777b0fmr2764388e87.23.1743968572010; Sun, 06 Apr 2025
 12:42:52 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 6 Apr 2025 14:42:40 -0500
X-Gm-Features: ATxdqUFMYDnAg8R0wPb559vnE-jhH0ijzywm72TsyA-1gmOWcqD_GRmFkVVf0gc
Message-ID: <CAH2r5muN630v9cDmMJ9hmavf2qdb0Gdpe80i6NAQnsB2C7eAgw@mail.gmail.com>
Subject: [PATCH][SMB311 client] fix missing tcon check when mounting with
 linux extensions
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000003c11900632215344"
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

--0000000000003c11900632215344
Content-Type: text/plain; charset="UTF-8"

When mounting the same share twice, once with the "linux" mount parameter
(or equivalently "posix") and then once without (or e.g. with "nolinux"),
we were incorrectly reusing the same tree connection for both mounts.
This meant that the first mount of the share on the client, would
cause subsequent mounts of that same share on the same client to
ignore that mount parm ("linux" vs. "nolinux") and incorrectly reuse
the same tcon.

See attached

-- 
Thanks,

Steve

--0000000000003c11900632215344
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb311-client-fix-missing-tcon-check-when-mounting-w.patch"
Content-Disposition: attachment; 
	filename="0001-smb311-client-fix-missing-tcon-check-when-mounting-w.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m961soai0>
X-Attachment-Id: f_m961soai0

RnJvbSAwMTVmZTk4NmMzZTA1ZjJkMThlMmI3ZDBjMzU2MzA2Yjk4YjY5NjU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgNiBBcHIgMjAyNSAxNDowOToxOSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjMxMSBjbGllbnQ6IGZpeCBtaXNzaW5nIHRjb24gY2hlY2sgd2hlbiBtb3VudGluZyB3aXRoCiBs
aW51eC9wb3NpeCBleHRlbnNpb25zCgpXaGVuIG1vdW50aW5nIHRoZSBzYW1lIHNoYXJlIHR3aWNl
LCBvbmNlIHdpdGggdGhlICJsaW51eCIgbW91bnQgcGFyYW1ldGVyCihvciBlcXVpdmFsZW50bHkg
InBvc2l4IikgYW5kIHRoZW4gb25jZSB3aXRob3V0IChvciBlLmcuIHdpdGggIm5vbGludXgiKSwK
d2Ugd2VyZSBpbmNvcnJlY3RseSByZXVzaW5nIHRoZSBzYW1lIHRyZWUgY29ubmVjdGlvbiBmb3Ig
Ym90aCBtb3VudHMuClRoaXMgbWVhbnQgdGhhdCB0aGUgZmlyc3QgbW91bnQgb2YgdGhlIHNoYXJl
IG9uIHRoZSBjbGllbnQsIHdvdWxkCmNhdXNlIHN1YnNlcXVlbnQgbW91bnRzIG9mIHRoYXQgc2Ft
ZSBzaGFyZSBvbiB0aGUgc2FtZSBjbGllbnQgdG8KaWdub3JlIHRoYXQgbW91bnQgcGFybSAoImxp
bnV4IiB2cy4gIm5vbGludXgiKSBhbmQgaW5jb3JyZWN0bHkgcmV1c2UKdGhlIHNhbWUgdGNvbi4K
CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8
c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L2Nvbm5lY3QuYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9zbWIv
Y2xpZW50L2Nvbm5lY3QuYyBiL2ZzL3NtYi9jbGllbnQvY29ubmVjdC5jCmluZGV4IGYyOThlODZh
M2MxZi4uNGMxNWVkMDU4M2I0IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2Nvbm5lY3QuYwor
KysgYi9mcy9zbWIvY2xpZW50L2Nvbm5lY3QuYwpAQCAtMjU1Niw2ICsyNTU2LDggQEAgc3RhdGlj
IGludCBtYXRjaF90Y29uKHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sIHN0cnVjdCBzbWIzX2ZzX2Nv
bnRleHQgKmN0eCkKIAkJcmV0dXJuIDA7CiAJaWYgKHRjb24tPm5vZGVsZXRlICE9IGN0eC0+bm9k
ZWxldGUpCiAJCXJldHVybiAwOworCWlmICh0Y29uLT5wb3NpeF9leHRlbnNpb25zICE9IGN0eC0+
bGludXhfZXh0KQorCQlyZXR1cm4gMDsKIAlyZXR1cm4gMTsKIH0KIAotLSAKMi40My4wCgo=
--0000000000003c11900632215344--

