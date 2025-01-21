Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 140ACA1754D
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2025 01:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=gP6qn/FApXQMq6lfA//qwEAQ2ecx1WiySyCatf4tjXg=; b=rd/0RRiOgvVuuC8JwXxqaZvu+d
	wzS6yDFe8R4rvNFgNEsVnU+fahowRKtYnOTDZOiKoP61bjAX//olazy8sZme4g4UkyzyOjFqXzTIp
	8xOWcv108/aBMDelz1l9rHsj07w3ATjMyCxmbqzeJEHqkMfLmqx8RyZUQSDlstrXgxlAFIYsvrtOY
	1F3aKnwvm7FxKOfDinADXeDiWW4q5d+cFd7Jak13x0dAQqlG0ldf1sVqKhrrLwYewq0PRVELM5A7Q
	PmLoJLocz8aCLx6KuZipf6ek14gsI+eWVW4cHYCeBhKl47/EGghfVaNm3BRJnYWV/dbPqe6Dgn3wM
	7/uQB7fQ==;
Received: from ip6-localhost ([::1]:50722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ta2SY-008s3X-KZ; Tue, 21 Jan 2025 00:49:38 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:61627) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ta2SR-008s3Q-9t
 for samba-technical@lists.samba.org; Tue, 21 Jan 2025 00:49:36 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so5043777e87.2
 for <samba-technical@lists.samba.org>; Mon, 20 Jan 2025 16:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737420569; x=1738025369; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gP6qn/FApXQMq6lfA//qwEAQ2ecx1WiySyCatf4tjXg=;
 b=cY/FZi77Sz4bhr02NlWRAUOUnAlqINirJkEm5mHIv7gzrR6u8i+VXAda8d6UAQN42G
 QJwKO3ohli4c6wm3nWBiXNq2iSSBRmIugHqI/LRlkyYw8xk8DZxmcX3cNnlZ0NlvoNuk
 B6UFZ2RuJaDa1rOeTG8dKgOb6rR8QDcxHlaS35y/95/HiVwa9I3QVsi+oONlsg6e0GtK
 Dx3u3FZZzrH5jWk1XjNhtxqmERhEWalsVDgr1fCewefn5yRl8HJeIuM28uHwB1WdLpY5
 exdSJ/AtW77vIGJKm4lHQHojryD6P5Y9yAwbA31aqCHh1xs7GrfZY6iCIMiRcINq/5ok
 qI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737420569; x=1738025369;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gP6qn/FApXQMq6lfA//qwEAQ2ecx1WiySyCatf4tjXg=;
 b=hVaYu6HR4TvGtulUJ71jMPihXrWywc56PVZjNI6jh51hQIwM1dhOjK2Ss8UlXhB04n
 foTalF/OIa16m9wTXjumVoiDwMlM6WlU3T+O9ZgqUgWwQDq1pbxjSos0OGzsl+X2vsqb
 i/Jo2dHMVGaV8+ZtSAPUTLp9hTo/xZiZnTT7Yg7f2nn8ox/ecD0bp+OmG0pcSfeL4EO2
 cXYXzVtcFm3blMLlotsitEkHvFvBvkr+bZ/ssSIfWqqrkU6/0Ye5cf/HRIpZubbjvoLb
 tZf80htalL5wlM2F7n27Ix5ieCNfVDsxWVrYjeLN1G3906bz//Of0DmGWf0qkiCm10z2
 KWyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQDs429VlwESMOHlr992o4PBzOepwsDP564Xk1zTXfPTQO93Awmtg9+XM0CrlmKQrQqyGkt5ejQKJl/wAxX48=@lists.samba.org
X-Gm-Message-State: AOJu0YzXwXGiQ6rvIQ712zlo4n2ld1hbv9Yi8VFRhNsSKUXFNvwTxEBt
 08R4dh/ytlQ7aJFMdn3UiJfRan45ROU3fL8613mIAAPkaIaGCsZud/nYZE9tyJ0ENXN0v7Y1l7P
 qSezjrY6O5V0MPB+QYeLFYSGb4qc=
X-Gm-Gg: ASbGncsfTM5DgyvGtgCtVPCRHIXydruhnOoVZrWL/doxvnmbDwmL9lMFKsojJmkOj+m
 vwvYovtoAh2d9DOZiweF7lzeOjgLWUS5wbwA+BEp5GsGxV2WwrSw=
X-Google-Smtp-Source: AGHT+IEWaxK+9wGppAbFwsHDURuk8fWxO4/Lgd421+KZSS7CoVqSju/Hl3Qmjm7w9bBbmpashEJmLLCNgKfk5TzEKro=
X-Received: by 2002:a05:6512:4808:b0:542:2e09:639a with SMTP id
 2adb3069b0e04-5439c22a678mr3884436e87.10.1737420569281; Mon, 20 Jan 2025
 16:49:29 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 20 Jan 2025 18:49:17 -0600
X-Gm-Features: AbW1kva4btopGe5bFJjKlsMP0x00iSujiyZn9EhKmArgYPguVTyvomDkrZTAqS0
Message-ID: <CAH2r5mscBfMimoxO8yYQAB1SEdDhdjpwQxkw-45+tWL5tcsqZQ@mail.gmail.com>
Subject: [PATCH][cifs-utils] avoid using mktemp when updating mtab
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000dbc8fa062c2cbffb"
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
Cc: Carlos Maiolino <cmaiolino@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000dbc8fa062c2cbffb
Content-Type: text/plain; charset="UTF-8"

Attached patch to  Fix build warning: cifs-utils/mount.cifs.c:1726:
    warning: the use of `mktemp' is dangerous, better use `mkstemp' or `mkdtemp'

Use of mktemp() has been deprecated (e.g. due to security issues with
symlink races), and instead mkstemp is often recommended.  Change
the use of mktemp to mkstemp in del_mtab in cifs-utils

Fixes: f46dd7661cfb ("mount.cifs: Properly update mtab during remount")

Opinions? Better way to address it?

-- 
Thanks,

Steve

--000000000000dbc8fa062c2cbffb
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-utils-avoid-using-mktemp-when-updating-mtab.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-utils-avoid-using-mktemp-when-updating-mtab.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m65r92vq0>
X-Attachment-Id: f_m65r92vq0

RnJvbSBmODVjMGM2M2FkYjQ0MjJiMzAwNzcwYmZjMmQ4NDQ3NDJlMGZjY2Q3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMjAgSmFuIDIwMjUgMTg6MzQ6MzggLTA2MDAKU3ViamVjdDogW1BBVENIXSBj
aWZzLXV0aWxzOiBhdm9pZCB1c2luZyBta3RlbXAgd2hlbiB1cGRhdGluZyBtdGFiCgpGaXggYnVp
bGQgd2FybmluZzogY2lmcy11dGlscy9tb3VudC5jaWZzLmM6MTcyNjoKICAgIHdhcm5pbmc6IHRo
ZSB1c2Ugb2YgYG1rdGVtcCcgaXMgZGFuZ2Vyb3VzLCBiZXR0ZXIgdXNlIGBta3N0ZW1wJyBvciBg
bWtkdGVtcCcKClVzZSBvZiBta3RlbXAoKSBoYXMgYmVlbiBkZXByZWNhdGVkIChlLmcuIGR1ZSB0
byBzZWN1cml0eSBpc3N1ZXMgd2l0aApzeW1saW5rIHJhY2VzKSwgYW5kIGluc3RlYWQgbWtzdGVt
cCBpcyBvZnRlbiByZWNvbW1lbmRlZC4gIENoYW5nZQp0aGUgdXNlIG9mIG1rdGVtcCB0byBta3N0
ZW1wIGluIGRlbF9tdGFiIGluIGNpZnMtdXRpbHMKCkZpeGVzOiBmNDZkZDc2NjFjZmIgKCJtb3Vu
dC5jaWZzOiBQcm9wZXJseSB1cGRhdGUgbXRhYiBkdXJpbmcgcmVtb3VudCIpClNpZ25lZC1vZmYt
Ynk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBtb3VudC5jaWZz
LmMgfCAxMiArKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW91bnQuY2lmcy5jIGIvbW91bnQuY2lmcy5jCmlu
ZGV4IGU0NjY5M2UuLjc2MDUxMzAgMTAwNjQ0Ci0tLSBhL21vdW50LmNpZnMuYworKysgYi9tb3Vu
dC5jaWZzLmMKQEAgLTQxLDYgKzQxLDcgQEAKICNpbmNsdWRlIDxtbnRlbnQuaD4KICNpbmNsdWRl
IDxmY250bC5oPgogI2luY2x1ZGUgPGxpbWl0cy5oPgorI2luY2x1ZGUgPHN0ZGJvb2wuaD4KICNp
bmNsdWRlIDxwYXRocy5oPgogI2luY2x1ZGUgPGxpYmdlbi5oPgogI2luY2x1ZGUgPHRpbWUuaD4K
QEAgLTE2ODgsNyArMTY4OSw3IEBAIGFkZF9tdGFiX2V4aXQ6CiBzdGF0aWMgaW50CiBkZWxfbXRh
YihjaGFyICptb3VudHBvaW50KQogewotCWludCBsZW4sIHRtcHJjLCByYyA9IDA7CisJaW50IGxl
biwgdG1wcmMsIHJjID0gMCwgdG1wZmQ7CiAJRklMRSAqbW50dG1wLCAqbW50bXRhYjsKIAlzdHJ1
Y3QgbW50ZW50ICptb3VudGVudDsKIAljaGFyICptdGFiZmlsZSwgKm10YWJkaXIsICptdGFidG1w
ZmlsZSA9IE5VTEw7CkBAIC0xNzIzLDggKzE3MjQsOSBAQCBkZWxfbXRhYihjaGFyICptb3VudHBv
aW50KQogCQlnb3RvIGRlbF9tdGFiX2V4aXQ7CiAJfQogCi0JbXRhYnRtcGZpbGUgPSBta3RlbXAo
bXRhYnRtcGZpbGUpOwotCWlmICghbXRhYnRtcGZpbGUpIHsKKwkvLyBVc2UgbWtzdGVtcCBpbnN0
ZWFkIG9mIG1rdGVtcAorCXRtcGZkID0gbWtzdGVtcChtdGFidG1wZmlsZSk7CisJaWYgKHRtcGZk
ID09IC0xKSB7CiAJCWZwcmludGYoc3RkZXJyLCAiZGVsX210YWI6IGNhbm5vdCBzZXR1cCB0bXAg
ZmlsZSBkZXN0aW5hdGlvblxuIik7CiAJCXJjID0gRVhfRklMRUlPOwogCQlnb3RvIGRlbF9tdGFi
X2V4aXQ7CkBAIC0xNzM0LDEzICsxNzM2LDE1IEBAIGRlbF9tdGFiKGNoYXIgKm1vdW50cG9pbnQp
CiAJaWYgKCFtbnRtdGFiKSB7CiAJCWZwcmludGYoc3RkZXJyLCAiZGVsX210YWI6IGNvdWxkIG5v
dCB1cGRhdGUgbW91bnQgdGFibGVcbiIpOwogCQlyYyA9IEVYX0ZJTEVJTzsKKwkJY2xvc2UodG1w
ZmQpOwogCQlnb3RvIGRlbF9tdGFiX2V4aXQ7CiAJfQogCi0JbW50dG1wID0gc2V0bW50ZW50KG10
YWJ0bXBmaWxlLCAidyIpOworCW1udHRtcCA9IGZkb3Blbih0bXBmZCwgInciKTsKIAlpZiAoIW1u
dHRtcCkgewogCQlmcHJpbnRmKHN0ZGVyciwgImRlbF9tdGFiOiBjb3VsZCBub3QgdXBkYXRlIG1v
dW50IHRhYmxlXG4iKTsKIAkJZW5kbW50ZW50KG1udG10YWIpOworCQljbG9zZSh0bXBmZCk7CiAJ
CXJjID0gRVhfRklMRUlPOwogCQlnb3RvIGRlbF9tdGFiX2V4aXQ7CiAJfQotLSAKMi40My4wCgo=
--000000000000dbc8fa062c2cbffb--

