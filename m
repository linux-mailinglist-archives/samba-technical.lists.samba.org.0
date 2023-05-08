Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C626A6F9F50
	for <lists+samba-technical@lfdr.de>; Mon,  8 May 2023 07:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=n5Wlr942xG6CSd7qeermfDWDJpBeBmtqBNdlbqseiHQ=; b=FnN1c/BFxKeUf3pJh09e3wpjlm
	HAKbbcSgj0+NG5pIJnjQbsVIgbcxmJ7CcWDDeqn0iSHxn6lbBj0Y61+X8eR0KBoUuDvup6nSXa+8t
	DK7msMbXMiRM3CvTygybrPj7vGKP5ck0+0TGtonX1QyCQdmtrg7p4v21lM+/mYDVA9EpDfIEQLv+c
	7KBguhhWFuL7dH+ZWc6S/v6pphlQ+49/O0K8Pcg0iIH4s6kkcJ1cEW4uk7CEq8p/YUGLu38MdAfsB
	FvnQxFp6C4xg+P2MLA1WYSrEe7Pi48ocp0SJafK2AUXhZSsdo+O3/4jP064jECcogKW94znT8IdC1
	/1KiznSQ==;
Received: from ip6-localhost ([::1]:61400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pvtpd-008rc3-Ju; Mon, 08 May 2023 05:54:45 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:51579) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pvtpY-008rbu-LE
 for samba-technical@lists.samba.org; Mon, 08 May 2023 05:54:42 +0000
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ac770a99e2so45316481fa.3
 for <samba-technical@lists.samba.org>; Sun, 07 May 2023 22:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683525277; x=1686117277;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=n5Wlr942xG6CSd7qeermfDWDJpBeBmtqBNdlbqseiHQ=;
 b=KfOhrb6TYL5AqNyij/DNYL/LpxlnxVk79i+vGEjdNhEQAESQfmOcAhiZk+QCVv8u2v
 +0/gwyi6aMIct//fu2Co/wYts9SfsyssRZHKd6/H/ZwXjG2Fk0IP27R9BB+MFMtDaJNG
 YCXVv7iRmIRulQKiE7yApmq+rSQgq6rJ5naKCLzLDruXCVAsWMt3Qi/fpTAmYNcgq4G4
 zb4D2/3qfhBVhwkD7u0HjheiiBQIygKXQkztcYU0kq31AAadPiKwtCSOomhl+htmWOCF
 5RjP2OJ0DR2AOzKEBkgTb/WZ4dI0Lgwjb5QshxpNF+UJY4DjcFoBP1qx6IFoqkv6pMvq
 fF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683525277; x=1686117277;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n5Wlr942xG6CSd7qeermfDWDJpBeBmtqBNdlbqseiHQ=;
 b=H9rBXLZmHE7XrlpFXKzUzgnlYMK647Bd+hDNI0XnEpHQRurKFjDyCC83Y2px1Ll5rL
 64MP3afvTdBWLFQlQ9gFWk2+wmKYRYs6ajPr68WUtb3zvD41GYj3U/pTT6Zswb+dUiR9
 u+w3dVSHQ+blGjxpuJ2lFCdBsgsTi1m6bCXg4VnkDBXwImy7gLk6uqm9XGFPeyrSIOyA
 vCPQztJfNlE0MC66yQo9paRqqwpNyF24Hz8OVimpkMr7cjJU33uzwHeWu3AjRY38Wb1H
 s1eGrDimtT+9GnnhliVSOhVu0hb0rJ8M64uO+GlFL0ROFfGG7zFD8kMEOKLqv3NdnSmx
 KTXg==
X-Gm-Message-State: AC+VfDx5rCbhsazjtVCpA/XyfUpCChgA7H4meg26kWJgovKbFynCTKoy
 D6SH7POXRXHW6qFivHnduerCt7GmIgP3Zg/KzJA=
X-Google-Smtp-Source: ACHHUZ6lAJT9X6v6h9G1L0ruYoBpBWFO2XSwfjKwyLwtVPbZX9IBZnfditGYvRCM4QCJactRqXDs25fOgKOO1GYa7YM=
X-Received: by 2002:a2e:9c13:0:b0:2ad:814c:6ad5 with SMTP id
 s19-20020a2e9c13000000b002ad814c6ad5mr1296808lji.46.1683525277026; Sun, 07
 May 2023 22:54:37 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 8 May 2023 00:54:25 -0500
Message-ID: <CAH2r5mug_RmfmdBJqpzofB36wAHx4MVC0kO2G80ft7m13tx_Zg@mail.gmail.com>
Subject: [PATCH][CIFS] smb3: improve parallel reads of large files
To: ronnie sahlberg <ronniesahlberg@gmail.com>,
 David Howells <dhowells@redhat.com>, CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000001bf2f105fb2846af"
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

--0000000000001bf2f105fb2846af
Content-Type: text/plain; charset="UTF-8"

rasize (ra_pages) should be set higher than read size by default
to allow parallel reads when reading large files in order to
improve performance (otherwise there is much dead time on the
network when doing readahead of large files).  Default rasize
to twice readsize.  See attached patch

This improved performance for me (although there may be cases where
setting it more than 2*read_size still could help).  ceph IIRC sets
ra_pages even higher (to 8MB by default).   Any thoughts?



-- 
Thanks,

Steve

--0000000000001bf2f105fb2846af
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-improve-parallel-reads-of-large-files.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-improve-parallel-reads-of-large-files.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lhefdbw30>
X-Attachment-Id: f_lhefdbw30

RnJvbSA2OGFhYzg1YjliNjk3Y2ZjMWRjMTI4NmY1OTZlYmJkZGI5YWUzYzU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgOCBNYXkgMjAyMyAwMDo0NTo0NSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IGltcHJvdmUgcGFyYWxsZWwgcmVhZHMgb2YgbGFyZ2UgZmlsZXMKCnJhc2l6ZSAocmFfcGFn
ZXMpIHNob3VsZCBiZSBzZXQgaGlnaGVyIHRoYW4gcmVhZCBzaXplIGJ5IGRlZmF1bHQKdG8gYWxs
b3cgcGFyYWxsZWwgcmVhZHMgd2hlbiByZWFkaW5nIGxhcmdlIGZpbGVzIGluIG9yZGVyIHRvCmlt
cHJvdmUgcGVyZm9ybWFuY2UgKG90aGVyd2lzZSB0aGVyZSBpcyBtdWNoIGRlYWQgdGltZSBvbiB0
aGUKbmV0d29yayB3aGVuIGRvaW5nIHJlYWRhaGVhZCBvZiBsYXJnZSBmaWxlcykuICBEZWZhdWx0
IHJhc2l6ZQp0byB0d2ljZSByZWFkc2l6ZS4KClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8
c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9jaWZzL2NpZnNmcy5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZnMvY2lmcy9jaWZzZnMuYyBiL2ZzL2NpZnMvY2lmc2ZzLmMKaW5kZXggMzJmN2M4MWE3Yjg5Li44
MTQzMGFiYWNmOTMgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvY2lmc2ZzLmMKKysrIGIvZnMvY2lmcy9j
aWZzZnMuYwpAQCAtMjQ2LDcgKzI0Niw3IEBAIGNpZnNfcmVhZF9zdXBlcihzdHJ1Y3Qgc3VwZXJf
YmxvY2sgKnNiKQogCWlmIChjaWZzX3NiLT5jdHgtPnJhc2l6ZSkKIAkJc2ItPnNfYmRpLT5yYV9w
YWdlcyA9IGNpZnNfc2ItPmN0eC0+cmFzaXplIC8gUEFHRV9TSVpFOwogCWVsc2UKLQkJc2ItPnNf
YmRpLT5yYV9wYWdlcyA9IGNpZnNfc2ItPmN0eC0+cnNpemUgLyBQQUdFX1NJWkU7CisJCXNiLT5z
X2JkaS0+cmFfcGFnZXMgPSAyICogKGNpZnNfc2ItPmN0eC0+cnNpemUgLyBQQUdFX1NJWkUpOwog
CiAJc2ItPnNfYmxvY2tzaXplID0gQ0lGU19NQVhfTVNHU0laRTsKIAlzYi0+c19ibG9ja3NpemVf
Yml0cyA9IDE0OwkvKiBkZWZhdWx0IDIqKjE0ID0gQ0lGU19NQVhfTVNHU0laRSAqLwotLSAKMi4z
NC4xCgo=
--0000000000001bf2f105fb2846af--

