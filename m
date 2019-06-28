Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3559535
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 09:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=GHWowgQohNvjpBGR0yDBBdpc8tIJ7QVVfm5jJHsNpBo=; b=aExJ6pFEcsYjiwDNei7WkhAVrE
	z+ZvNEq1piXjByUtfSKE3c2PLMR0nhsH92OsBzzhQ+rm8ZjV3V7nEGF8J6YOtzGRQY6V2f7WFQbks
	Efx/+Rv+ime7d9fgjaPkafbm4GclZfMthFrf6bVMCGvRhCB0JTA2oOtEUyzre8YVLQjmBt722D4Rx
	a23/ybXL6Z69S4pdhc889qzOSeU3Fx/3HEgE1kF4YjKv3mVKoTLNB6vWadMeo9nhW4OdtOhjPZNUl
	Lxdw74z2K0zjqtkwF5z1IF+FEd4P0hGhNqospnz6k/c8KmTK7QeuNURlgCpzrtTXKjUFW4ic8sR5X
	cUGNXxYQ==;
Received: from localhost ([::1]:64912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hglUG-002HRV-8w; Fri, 28 Jun 2019 07:40:00 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:32914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hglUA-002HQk-F8
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 07:39:56 +0000
Received: by mail-pf1-x436.google.com with SMTP id x15so2550278pfq.0
 for <samba-technical@lists.samba.org>; Fri, 28 Jun 2019 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GHWowgQohNvjpBGR0yDBBdpc8tIJ7QVVfm5jJHsNpBo=;
 b=Bc6HDdo0YqpKIRTWxtt/WQlr6HVR/MifMXuJaSFgDQhudMM6eIk87YSl6NFiZd849i
 sR/vgv7uICQfJKPcQsfv7y8FIm/PMhnhVK6u/ROfMpzYE2qvIeES6tLUZmfaQxp+GYtt
 u2iYc1ohw6Mg2REpSxXhkqtFwx8CwuQVuHtl8xK/+2Hf+1S3A5FpKvM4E0K/M5qR68xU
 O1xbx4Q6hAnKlW4ektAZQx43I0LiZkMuinOHTGKHVclD1Brm97OF1rS2G6k3p1KVb+88
 YrNWwEjjq2uLevUWzA5HDgqsjHbnAMFIwx4TEPFjyH4AJJGOcePxeJxZEgTcX023Yx6O
 hmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GHWowgQohNvjpBGR0yDBBdpc8tIJ7QVVfm5jJHsNpBo=;
 b=dGVZ1JCmZkZkwOOaWg1EYEE5+n/Oo5WXKKhtAx/2Ka8xNtmKRyPLMshBwNbIHVUGUn
 HzfYNUaTSW/i0KbXy/3nBrCSBfRIItkkzkhrwmt1ZiNpGZbLjzQsWQaHQQ7AwqszjqZj
 mopALe2CEehVrtgrRA04rxmupWkVFu4ik7zjD6NCWUPsTdtb74TXCxLxn+GsUNd3MpSg
 Kg5AjEjoiDz8gghe3WkpiQSaAp9hT6hew3/8Vhe1Lr2qvGkzhBiT77I5QHyEgy2F8T23
 2SJsWkh+Eyl/REUL5hk6N92hYeWpAmgKNuSWusBttZehMr2iJ5F2Vg3Rcj5NoBgetiPu
 eg+Q==
X-Gm-Message-State: APjAAAUJ/j906fejUP1lqytUwjXVB/32KMWFzfg9pn2ols98IN0Zf+8u
 q2pomkqbnMbcqBPEpHnUUMH+WVcv7BWTuJRq6uq0Xw==
X-Google-Smtp-Source: APXvYqxqsBP71c3aWLz4F+s6A2css/KFns23sAAFzMFl3XXLqV3FHvbSfAVn6QTho4FoBab/gu8KCrYxFZP2M+jl+U4=
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr11022781pjb.138.1561707592118; 
 Fri, 28 Jun 2019 00:39:52 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 28 Jun 2019 02:39:41 -0500
Message-ID: <CAH2r5mtrzwAzGWKVj7Xkx2-x9JHso5rVo25bfhsbJor188J53Q@mail.gmail.com>
Subject: Add missing definitions for query_disk_id
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000458df5058c5d62ec"
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

--000000000000458df5058c5d62ec
Content-Type: text/plain; charset="UTF-8"

See MS-SMB2 2.2.13.2




-- 
Thanks,

Steve

--000000000000458df5058c5d62ec
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-add-some-missing-definitions.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-add-some-missing-definitions.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jxfsd5nb0>
X-Attachment-Id: f_jxfsd5nb0

RnJvbSA2ZTJkYzgwMTA0N2I3MDgyOWI1ODdlODU1NWQ3M2QyM2EyZDg1YzhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IEZyaSwgMjggSnVuIDIwMTkgMDI6MzU6MTAgLTA1MDAKU3ViamVjdDogW1BBVENIXSBb
c21iM10gYWRkIHNvbWUgbWlzc2luZyBkZWZpbml0aW9ucwoKcXVlcnkgb24gZGlzayBpZCBzdHJ1
Y3R1cmUgZGVmaW5pdGlvbiB3YXMgbWlzc2luZwoKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNo
IDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvc21iMnBkdS5oIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2Np
ZnMvc21iMnBkdS5oIGIvZnMvY2lmcy9zbWIycGR1LmgKaW5kZXggZDYxY2UyYjAxOWMyLi4wNTNl
YzYyMWU3YjkgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMnBkdS5oCisrKyBiL2ZzL2NpZnMvc21i
MnBkdS5oCkBAIC02NDcsNiArNjQ3LDcgQEAgc3RydWN0IHNtYjJfdHJlZV9kaXNjb25uZWN0X3Jz
cCB7CiAjZGVmaW5lIFNNQjJfQ1JFQVRFX0RVUkFCTEVfSEFORExFX1JFUVVFU1RfVjIJIkRIMlEi
CiAjZGVmaW5lIFNNQjJfQ1JFQVRFX0RVUkFCTEVfSEFORExFX1JFQ09OTkVDVF9WMgkiREgyQyIK
ICNkZWZpbmUgU01CMl9DUkVBVEVfQVBQX0lOU1RBTkNFX0lECTB4NDVCQ0E2NkFFRkE3Rjc0QTkw
MDhGQTQ2MkUxNDRENzQKKyNkZWZpbmUgU01CMl9DUkVBVEVfQVBQX0lOU1RBTkNFX1ZFUlNJT04g
MHhCOTgyRDBCNzNCNTYwNzRGQTA3QjUyNEE4MTE2QTAxMAogI2RlZmluZSBTVkhEWF9PUEVOX0RF
VklDRV9DT05URVgJMHg5Q0NCQ0Y5RTA0QzFFNjQzOTgwRTE1OERBMUY2RUM4MwogI2RlZmluZSBT
TUIyX0NSRUFURV9UQUdfUE9TSVgJCTB4OTNBRDI1NTA5Q0I0MTFFN0I0MjM4M0RFOTY4QkNEN0MK
IApAQCAtODEzLDYgKzgxNCwxMyBAQCBzdHJ1Y3QgZHVyYWJsZV9yZWNvbm5lY3RfY29udGV4dF92
MiB7CiAJX19sZTMyIEZsYWdzOyAvKiBzZWUgYWJvdmUgREhBTkRMRV9GTEFHX1BFUlNJU1RFTlQg
Ki8KIH0gX19wYWNrZWQ7CiAKKy8qIFNlZSBNUy1TTUIyIDIuMi4xNC4yLjkgKi8KK3N0cnVjdCBv
bl9kaXNrX2lkIHsKKwlfX2xlNjQgRGlza0ZpbGVJZDsKKwlfX2xlNjQgVm9sdW1lSWQ7CisJX191
NjQgIFJlc2VydmVkWzRdOworfSBfX3BhY2tlZDsKKwogLyogU2VlIE1TLVNNQjIgMi4yLjE0LjIu
MTIgKi8KIHN0cnVjdCBkdXJhYmxlX3JlY29ubmVjdF9jb250ZXh0X3YyX3JzcCB7CiAJX19sZTMy
IFRpbWVvdXQ7Ci0tIAoyLjIwLjEKCg==
--000000000000458df5058c5d62ec--

