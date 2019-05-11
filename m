Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411AF1A944
	for <lists+samba-technical@lfdr.de>; Sat, 11 May 2019 21:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=c41ao0O3PNDbGDdKviICP6fB0n3d8yTMO8ww3O3L/DE=; b=bP4/kxyc14bRFp3geO349wWuPB
	19tsvZYgmYIAMeYPd4WHrqDG40VEVgxf4MaTGMhuYjdQ7eYD51OByehU+UwhqI4n2v+3CSgSPwYON
	MR5oSZ6ejyEpIHjHdSBCoYZ4swqOJCGuRa5gnqWmrI9Ri1Lfj9vwNf7rglsLctT8pn5VZaDOuMKHD
	Y3Wi3yA+R2wo07EaDEf1Nmuf09DmuikMrFV2a6Gp4VyAMWT9ky6fnuZHFCYcJZhLx0fYNSqV6CkaI
	se1wE5Os0ZkWhX/L5muSq9xhWGjGgm8KI8qSq8vaJFmxL5I60b60vOUZmkWpXHqzvSCPFkFtCf2D0
	6TKtXQ0A==;
Received: from localhost ([::1]:35088 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hPXj3-003DGU-Vx; Sat, 11 May 2019 19:32:06 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:43358) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hPXiz-003DGN-4J
 for samba-technical@lists.samba.org; Sat, 11 May 2019 19:32:03 +0000
Received: by mail-ot1-x334.google.com with SMTP id i8so8450857oth.10
 for <samba-technical@lists.samba.org>; Sat, 11 May 2019 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=De6eSDXt7ED5vYUUcPd7FDUDjOz6GwvTmHfZgwD/j2c=;
 b=LQkRXnUVhTTNT1FgLYa0MJpsWV5KJIJFcqGkD53Dp50GoYS8a3pXGdFaJ6TyZYfKpz
 XLv/rp1+Byby70ByXLZWSCCkX4GlbemgNPsf/Ryu8hplR01SQ5MXPvcVCgXHP4p+IZHx
 ELgw+x5ODJJV3S5m1hR+ns6QWOsN8yBAQzdTXJ6BqFozVptzZWRtj7X/sjz3lK31edqP
 EE7OIGpSTavfNYjgcyIPT9132irBEyY6C4GVqx0U4b56uyey0uefTV5/h6np8ugiLQrx
 qh+qPmKU27YWoVQy6+1PzCtUpL1o7g4/RVeyxb9gpFs7zyYnYFYua/HKrscoM1bIsf6J
 uu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=De6eSDXt7ED5vYUUcPd7FDUDjOz6GwvTmHfZgwD/j2c=;
 b=YfkuUJTT93TPYYjEp5p3GDLl+VjiGjxYyXFmLOBuYlDnfevteGp7AGlNRKKn8/J/zU
 KcoL4IvRiuvsdvhseElTETY62KZLljuKE1a9dmB4zXIOScXjie3P3nKJMWNeDKOm7tK2
 kyu3KWWRFFaO8T5PDHIwAdBgsPRHBWKRDsOhIll+5f+3fevniCGKlUECsiy3B6UgZqal
 C9CTJpGQDC0AyMDF7gzUAXsUGkS3gsrxSCM1309kXRlxo+r5nTiiHYiDt9JHHmxB2cyY
 7SiWkVkI3WCZmjcQPFXrOecI58NyjcwIn3/D/YLPtCCZLJUUToAttheQFmXMr3oHtLV+
 ZBEg==
X-Gm-Message-State: APjAAAWlB2lpYc7ESkhaQlamo103LLm2kh8dtlb4CwdASeCPKmmv5+kJ
 6WMSgtqdo/ycvxeZZsu9Pyk+ffIKzQBNS82UellWxE/8UOU=
X-Google-Smtp-Source: APXvYqwF149R6lHx58+VLM92hZ80ot/qVxlyRI5WbCBuyc/NTvASwbHDUkZL1EAAtkopchi0AhhKFKJ0oPdjj380riI=
X-Received: by 2002:a9d:6a86:: with SMTP id l6mr11874389otq.93.1557603117495; 
 Sat, 11 May 2019 12:31:57 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 11 May 2019 21:31:44 +0200
Message-ID: <CADRDgG5Oh2GfCzrzZzHDhD6nzCqCLgctptdK7-stYqjwsOp96g@mail.gmail.com>
Subject: [PATCH] lib:util: Fix tfork return value if sigprocmask fails
To: samba-technical@lists.samba.org
Content-Type: multipart/mixed; boundary="00000000000085148c0588a1bce3"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Rikard Falkeborn via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000085148c0588a1bce3
Content-Type: text/plain; charset="UTF-8"

Returning a non-zero value from a function with bool as return value is
the same as returning true. Change the return value to false if
sigprocmask or pthread_sigmask fails to indicate failure.

Detected with the help of cppcheck.

There are a couple of similar issues in the source3 directory, I wasn't sure
if this directory is in use and if it's worth fixing these as well?

MR: https://gitlab.com/samba-team/samba/merge_requests/436
CI: https://gitlab.com/rikardfalkeborn/samba/pipelines/60596119

Please review.

--00000000000085148c0588a1bce3
Content-Type: text/plain; charset="US-ASCII"; name="return-non-bool-tfork.txt"
Content-Disposition: attachment; filename="return-non-bool-tfork.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jvjwndcy0>
X-Attachment-Id: f_jvjwndcy0

RnJvbSA3OWFiMDA2NTk4NzI1MDEwMDU5YWE5M2JkNjk5MDE3ZDE0YmQ1Y2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaWthcmQgRmFsa2Vib3JuIDxyaWthcmQuZmFsa2Vib3JuQGdt
YWlsLmNvbT4KRGF0ZTogVGh1LCA5IE1heSAyMDE5IDIxOjE3OjI0ICswMjAwClN1YmplY3Q6IFtQ
QVRDSF0gbGliOnV0aWw6IEZpeCB0Zm9yayByZXR1cm4gdmFsdWUgaWYgc2lncHJvY21hc2sgZmFp
bHMKClJldHVybmluZyBhIG5vbi16ZXJvIHZhbHVlIGZyb20gYSBmdW5jdGlvbiB3aXRoIGJvb2wg
YXMgcmV0dXJuIHZhbHVlIGlzCnRoZSBzYW1lIGFzIHJldHVybmluZyB0cnVlLiBDaGFuZ2UgdGhl
IHJldHVybiB2YWx1ZSB0byBmYWxzZSBpZgpzaWdwcm9jbWFzayBvciBwdGhyZWFkX3NpZ21hc2sg
ZmFpbHMgdG8gaW5kaWNhdGUgZmFpbHVyZS4KCkRldGVjdGVkIHdpdGggdGhlIGhlbHAgb2YgY3Bw
Y2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBSaWthcmQgRmFsa2Vib3JuIDxyaWthcmQuZmFsa2Vib3Ju
QGdtYWlsLmNvbT4KLS0tCiBsaWIvdXRpbC90ZXN0cy90Zm9yay5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3V0
aWwvdGVzdHMvdGZvcmsuYyBiL2xpYi91dGlsL3Rlc3RzL3Rmb3JrLmMKaW5kZXggZWYzYTZmNzE3
ZDAuLjhhNjE5N2ZjMDBmIDEwMDY0NAotLS0gYS9saWIvdXRpbC90ZXN0cy90Zm9yay5jCisrKyBi
L2xpYi91dGlsL3Rlc3RzL3Rmb3JrLmMKQEAgLTQ5MCw3ICs0OTAsNyBAQCBzdGF0aWMgYm9vbCB0
ZXN0X3Rmb3JrX3RocmVhZHMoc3RydWN0IHRvcnR1cmVfY29udGV4dCAqdGN0eCkKIAlyZXQgPSBz
aWdwcm9jbWFzayhTSUdfVU5CTE9DSywgJnNldCwgTlVMTCk7CiAjZW5kaWYKIAlpZiAocmV0ICE9
IDApIHsKLQkJcmV0dXJuIC0xOworCQlyZXR1cm4gZmFsc2U7CiAJfQogCiAJZm9yIChpID0gMDsg
aSA8IG51bV90aHJlYWRzOyBpKyspIHsKLS0gCjIuMjEuMAoK
--00000000000085148c0588a1bce3--

