Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B08054CE076
	for <lists+samba-technical@lfdr.de>; Fri,  4 Mar 2022 23:52:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=D4RCyHKtGrbQVjrmqnzWxWLMcN0R9tuL59cQ5gF0nIw=; b=ngGa6845kssiXBvvn+2LBO2V2m
	qEoy2SOXKu00V/gWUqvAqIhR/uO5OZVs/ma3l6P7CJZzsvZ3YAHf4yX6gKWAaT8rqZTnVtWN1D/Bq
	Glwn7NYHwVvOrVzOkE1Ybj7EWZFJdkguPJUe6K5HWvJyXKicsa3YILHZsulMWShXIhkTgr7oBZ9CH
	Iy02NHZrjpAI9I9TZMEr8RpyDrs5DDnT+cH/Gt94VeT1bOMGc/ZOw60g9crGcaZlzyAOtf7Cp2KH1
	5k//WMwwVqrOO39Md6QiYl849EAI26OIh2TdzHK5+DwMrsg13A5UTDJoQ15Bx3+ugAxYzsvjg0m4s
	wm8DW3YA==;
Received: from ip6-localhost ([::1]:55526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQGmB-00G0OX-Bz; Fri, 04 Mar 2022 22:51:55 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:47038) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nQGm2-00G0ON-VO
 for samba-technical@lists.samba.org; Fri, 04 Mar 2022 22:51:51 +0000
Received: by mail-ua1-x932.google.com with SMTP id c36so4147743uae.13
 for <samba-technical@lists.samba.org>; Fri, 04 Mar 2022 14:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=D4RCyHKtGrbQVjrmqnzWxWLMcN0R9tuL59cQ5gF0nIw=;
 b=B277ngBALlA6X05aZSk6Mao/lFWL/E9TX7w5Sx0e6G3IwkLjwSL8nJk/uBmqZUbgIV
 K9qLRZPaImbLbGXsNoZlcTjkW7tHxlK8+8Cs5zp8F1Bvd1OC2ylqd8GU4JhyoTRhUt7Z
 QU/2y2qV4be+Dr0Ku80StrSEBPMuE30M3pYADeaKeA6lNTNQmCX7ToVuWxII04yAgV2n
 9sulh7ykXqO+I4O2iLVJ/7mBfB5HYQPmx9DQcxhZxTXcvlHWfined2cLahXpW+KBCxuC
 77bxbZ4yP1tsIXduVczQB+X9yJ9Er6+WfJEkmCS3W+Wl9O4GaWYolaMoiJ1Dm3qeQSLS
 ffhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=D4RCyHKtGrbQVjrmqnzWxWLMcN0R9tuL59cQ5gF0nIw=;
 b=PDFp87ftss939UyMIf8kbZ03tOBYpSANCFrz0VY0c1zxv9ZIk2Yidv8u76m0s0wSbN
 xNxTZB9jUTwbGp0ipwMO/pwP91HmYBa3tzkPd3euwTJ+qm36MaoobJRenZ0yL0MiVBFu
 aAg1re4GnHR+rBbyUHC+KFgGpssa8p7osRGgvlJ6KNJjW8sLSSbs4ZV6UzU6KRgoE1eq
 WAiGORyfSAVEDnZuFO1i62Hb02v3XPy4J9LVqBZokBS2sRYotajAqOuqWsP4Bmf78JaK
 lebE2TOAfZ/b4muYKy+3cofLujuo9G+YQNjj8lrJtCI+ZI2eV4RmsT8qPo+0VFEtwR79
 i+HQ==
X-Gm-Message-State: AOAM532ahB+WvCbJ7z7p3AvDLA1QOB79hONI8XOOEzF6fRTd4R20n1Sa
 S+MLMU8FZ4eslH05DDXZ8bs+0ljN20EUvClzCtw=
X-Google-Smtp-Source: ABdhPJyh+U1dT7TkTVpjWE5LbySCVPFZgwNp6SAIqJdoI4YypyI82D7RnnBMlvkrjrwa3wzXdJb8DHPIiKwXvijj5vs=
X-Received: by 2002:ab0:1633:0:b0:341:ece7:cad3 with SMTP id
 k48-20020ab01633000000b00341ece7cad3mr326039uae.104.1646434303891; Fri, 04
 Mar 2022 14:51:43 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:15a4:0:0:0:0:0 with HTTP;
 Fri, 4 Mar 2022 14:51:43 -0800 (PST)
In-Reply-To: <YiFgXtz5W26CZRbm@jeremy-acer>
References: <CAAQNcwukKj0fXtbFW7A3nm4QOiVG-H4L7kHG30mGkyX_eJBz8A@mail.gmail.com>
 <YiFgXtz5W26CZRbm@jeremy-acer>
Date: Sat, 5 Mar 2022 00:51:43 +0200
Message-ID: <CAAQNcwtc1SbYNxRRf6_F50sg8cYgFc4bBjxaVFxsPP+JOdU=jA@mail.gmail.com>
Subject: [PATCHv2] cifs-utils: work around missing krb5_free_string in Heimdal
To: Jeremy Allison <jra@samba.org>
Content-Type: multipart/mixed; boundary="000000000000d46c4405d96c5bd7"
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
From: atheik via samba-technical <samba-technical@lists.samba.org>
Reply-To: atheik <atteh.mailbox@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000d46c4405d96c5bd7
Content-Type: text/plain; charset="UTF-8"

On 3/4/22, Jeremy Allison <jra@samba.org> wrote:
> Does cifs-utils have a libreplace equivalent ?

I have no idea about libreplace but cifs.upcall.c of
cifs-utils already has a lot of these #ifdefs for
compatibility between MIT and Heimdal KRB5.

> Wouldn't it be easier to test for the existence of
> krb5_free_string() and write a libreplace wrapper
> function so krb5_free_string() can be called from
> all code without #ifdefs in the main code ?

This patch adds just another #ifdef to cifs.upcall.c
so that cifs-utils builds against Heimdal again.

I have attached a new patch that doesn't place the
#ifdefs in the function body.

--000000000000d46c4405d96c5bd7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-utils-work-around-missing-krb5_free_string-in-H.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-utils-work-around-missing-krb5_free_string-in-H.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

RnJvbSBhZTljZTFkODc2NzdjZmU5YWVmMTRkMGRiY2JhZTc3NmFlMmVmZjVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBhdGhlaWsgPGF0dGVoLm1haWxib3hAZ21haWwuY29tPgpEYXRl
OiBTYXQsIDUgTWFyIDIwMjIgMDA6MjQ6NDkgKzAyMDAKU3ViamVjdDogW1BBVENIXSBjaWZzLXV0
aWxzOiB3b3JrIGFyb3VuZCBtaXNzaW5nIGtyYjVfZnJlZV9zdHJpbmcgaW4gSGVpbWRhbAoKVGhl
IGtyYjVfZnJlZV9zdHJpbmcgZnVuY3Rpb24gaXMgbm90IHByZXNlbnQgaW4gSGVpbWRhbCBhbmQg
aW5zdGVhZAprcmI1X3hmcmVlIHNob3VsZCBiZSB1c2VkIGZvciBmcmVlaW5nIHRoZSBzdHJpbmcg
YWxsb2NhdGlvbiBkb25lIGJ5CmtyYjVfY2NfZ2V0X2Z1bGxfbmFtZS4gSGVpbWRhbCBkb2N1bWVu
dGF0aW9uIGRvZXMgc3BlY2lmeSB0aGF0CmtyYjVfeGZyZWUgc2hvdWxkIGJlIHVzZWQgaGVyZSBh
bmQga3JiNV91bnBhcnNlX25hbWUgaXMgZnJlZWQgd2l0aApqdXN0IGZyZWUuCgpTaWduZWQtb2Zm
LWJ5OiBhdGhlaWsgPGF0dGVoLm1haWxib3hAZ21haWwuY29tPgotLS0KIGNpZnMudXBjYWxsLmMg
fCA4ICsrKysrKysrCiBjb25maWd1cmUuYWMgIHwgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY2lmcy51cGNhbGwuYyBiL2NpZnMudXBjYWxs
LmMKaW5kZXggYWQwNDMwMS4uZDM2YTZhYiAxMDA2NDQKLS0tIGEvY2lmcy51cGNhbGwuYworKysg
Yi9jaWZzLnVwY2FsbC5jCkBAIC0xODEsNiArMTgxLDE0IEBAIHN0YXRpYyB2b2lkIGtyYjVfZnJl
ZV91bnBhcnNlZF9uYW1lKGtyYjVfY29udGV4dCBjb250ZXh0LCBjaGFyICp2YWwpCiB9CiAjZW5k
aWYKIAorI2lmICFkZWZpbmVkKEhBVkVfS1JCNV9GUkVFX1NUUklORykJLyogSGVpbWRhbCAqLwor
c3RhdGljIHZvaWQga3JiNV9mcmVlX3N0cmluZyhrcmI1X2NvbnRleHQgY29udGV4dCwgY2hhciAq
dmFsKQoreworCSh2b2lkKWNvbnRleHQ7CisJa3JiNV94ZnJlZSh2YWwpOworfQorI2VuZGlmCisK
ICNpZiAhZGVmaW5lZChIQVZFX0tSQjVfQVVUSF9DT05fR0VUU0VORFNVQktFWSkJLyogSGVpbWRh
bCAqLwogc3RhdGljIGtyYjVfZXJyb3JfY29kZQoga3JiNV9hdXRoX2Nvbl9nZXRzZW5kc3Via2V5
KGtyYjVfY29udGV4dCBjb250ZXh0LApkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmln
dXJlLmFjCmluZGV4IGJhNmRmZTEuLjI5MzdlZTIgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3VyZS5hYwor
KysgYi9jb25maWd1cmUuYWMKQEAgLTI1Niw2ICsyNTYsMTEgQEAgaWYgdGVzdCAkZW5hYmxlX2Np
ZnN1cGNhbGwgIT0gIm5vIjsgdGhlbgogCUFDX0NIRUNLX0ZVTkNTKFtrcmI1X2F1dGhfY29uX3Nl
dGFkZHJzIGtyYjVfYXV0aF9jb25fc2V0X3JlcV9ja3N1bXR5cGVdKQogZmkKIAorIyBkZXRlcm1p
bmUgaG93IHRvIGZyZWUgYSBzdHJpbmcgYWxsb2NhdGVkIGJ5IGEga3JiNSBmdW5jdGlvbgoraWYg
dGVzdCAkZW5hYmxlX2NpZnN1cGNhbGwgIT0gIm5vIjsgdGhlbgorCUFDX0NIRUNLX0ZVTkNTKFtr
cmI1X2ZyZWVfc3RyaW5nXSkKK2ZpCisKIGlmIHRlc3QgJGVuYWJsZV9zeXN0ZW1kICE9ICJubyI7
IHRoZW4KIAlBQ19ERUZJTkUoRU5BQkxFX1NZU1RFTUQsIDEsIFtFbmFibGUgc3lzdGVtZCBzcGVj
aWZpYyBiZWhhdmlvciBmb3IgbW91bnQuY2lmc10pCiBmaQotLSAKMi4zNS4xCgo=
--000000000000d46c4405d96c5bd7--

