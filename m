Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4822402D
	for <lists+samba-technical@lfdr.de>; Mon, 20 May 2019 20:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=1s85K73WNK9BnVeBqhBqNYjj2ERe3x/LGvZ5wHti3MA=; b=f/EFCASNIjiHrExwpJFFVRq6iW
	oA92yUzPSxSFPtjv1WkRlYfB0WylDYEiL+0ybOqs/vcHjR8ifDYfCFfQNXDBFpFGJKWBrlDm4CCa8
	abMrpEXkgRdj2I8qvWmx93z9agTZ13mRudY/KaaNsz2eDfhoY8gWF0znGXrmQ4tqSB7b8q6KHvrCW
	asXtoFAnvs5D9nMWqu3tu4JlhEFAHb09Kac0Ate79ZthUM41C618oudppyZ/s0ixqQJo7ZRcMCeIz
	Mf28X0IHnIB6QWVYXqkP6as3a1CqFnofkBLBdvxTQSvE2pJhpA49ru1ikiDOGA57r7V//ytDfGamH
	4/RgNnfQ==;
Received: from localhost ([::1]:31450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSmuO-000lte-9b; Mon, 20 May 2019 18:21:12 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:33043) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSmuI-000ltX-TK
 for samba-technical@lists.samba.org; Mon, 20 May 2019 18:21:09 +0000
Received: by mail-lf1-x12f.google.com with SMTP id x132so11081436lfd.0
 for <samba-technical@lists.samba.org>; Mon, 20 May 2019 11:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=1s85K73WNK9BnVeBqhBqNYjj2ERe3x/LGvZ5wHti3MA=;
 b=DgdbEoSm8n3KX+9csA1OOSjXMZCQo2adwykQkSWtxcxCUMTz7sRU/MOBxKO8mnlZ84
 P4sQoHoavWdqNIbGYZJGGB7NG6dLNx/kfXTsqUcmaBoS1L9e71ONkIzt1SqfBOu7DOOG
 JKrxgbNmxFm7rthGWKeburfgJf9g+0yuNTkvgp9YP607CngDjfF/nDnEg8ObeCkVxzyb
 Qj+NlMCL/J+NUgfkPiC7LMiiLMEk0FPg4RuW6Io29MYDOFjB76xF7lbnrJlXr9XDinSl
 Xmhv2JyUILmROD+IBh/2XWTWZqay8cDffzaybHFhjgQmGDPcc4NDG+it3pDXAC0rM/VY
 3lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=1s85K73WNK9BnVeBqhBqNYjj2ERe3x/LGvZ5wHti3MA=;
 b=PLCWwpVA6OFZgehsAzdZmTf7aqIZzCG4bg0Tc9oOv4XtTLjQ0aRFJOewH8eYimwtK+
 vg0q/Bzp05tmCTsJR6hKkJP3G498YIKEYP88VvLEwUC0PdVkQX2bNNzxxmDHKPszRvq0
 6nla2QdL90ETJ0mVrApqxaOTlGLw6fFcrJMGk27SY7csNWZ7pQkUHSlQmL1ir23x8+j0
 LHY2qTCboOYgEKIcnPw9YScXzVRl40TUue1QtRJPv9aeZRXe1hX0tbr11NIB5GFHvSSU
 P2RsKU+LFT5zvpAXYCB3msKBr0A0H66hpKwke27wm74NLw/hHHKSRNPJY1RbihuMRkUD
 1Mbg==
X-Gm-Message-State: APjAAAXYqa+yru/zcMkMx7UgeZeQfJIiVGNFaiNp37+WlEhuwLSSxvOe
 eN+MnLm4ShNIFlaJcDPAhfoz6aJHqgETuNbGAOlS1ryiKXA=
X-Google-Smtp-Source: APXvYqw3KFZuZfzy+CTjur6acmIxfMhHXZcqxyth+JoejTrkmuzvvATdLdmEDZUCbjgNkn/MxyWfjN8m3U0t/4V9lo0=
X-Received: by 2002:ac2:43af:: with SMTP id t15mr27615673lfl.45.1558376465692; 
 Mon, 20 May 2019 11:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8QtBc8cRVKcgV62A3D9jNHjPzn6NCGyVU_Q_x88T0emQA@mail.gmail.com>
In-Reply-To: <CAC-fF8QtBc8cRVKcgV62A3D9jNHjPzn6NCGyVU_Q_x88T0emQA@mail.gmail.com>
Date: Mon, 20 May 2019 20:20:54 +0200
Message-ID: <CAC-fF8QeW-MAzd5jWj5qsej+ekzUFmv5=pmUjxXPQMQcgeizng@mail.gmail.com>
Subject: Re: [PATCH] heimdal-kdc: allow checksum of PA-FOR-USER to be HMAC_MD5
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Content-Type: multipart/mixed; boundary="000000000000aa1ddc058955cbd5"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000aa1ddc058955cbd5
Content-Type: text/plain; charset="UTF-8"

Hi again,

On Mon, Nov 12, 2018 at 8:28 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> Find attached fix for s4u2self from windows and MIT clients using aes
> tgt session key against heimdal-kdc.
>
> Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/36299057
>
> Upstream PR: https://github.com/heimdal/heimdal/pull/439

Upstream PR finally landed (see also #576) so I'd like to re-propose
the new attached patch to Samba.
The changes are now exercised when kinit used rc4 enctype (should be
triggered in Samba's fl2003dc environment where AES isn't supported).

New pipeline:
https://gitlab.com/samba-team/devel/samba/pipelines/62234600

Thanks,
Isaac

--000000000000aa1ddc058955cbd5
Content-Type: text/plain; charset="US-ASCII"; name="heimdal_kdc_s4u2self_hmac_md5.patch.txt"
Content-Disposition: attachment; 
	filename="heimdal_kdc_s4u2self_hmac_md5.patch.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jvwop0v10>
X-Attachment-Id: f_jvwop0v10

RnJvbSA3YmY5YTMyNmE5M2MwMDBjNzJlNzlmZWEwMjlmMWYxZmMwMzQwMzQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBJc2FhYyBCb3VrcmlzIDxpYm91a3Jpc0BnbWFpbC5jb20+CkRh
dGU6IE1vbiwgMTIgTm92IDIwMTggMTI6MjY6MjUgKzAyMDAKU3ViamVjdDogW1BBVENIXSBrZGM6
IGFsbG93IGNoZWNrc3VtIG9mIFBBLUZPUi1VU0VSIHRvIGJlIEhNQUNfTUQ1CgpldmVuIGlmIHRn
dCB1c2VkIGFuIGVuY3R5cGUgd2l0aCBhIGRpZmZlcmVudCBjaGVja3N1bS4KClBlciBbTVMtU0ZV
XSAyLjIuMSBQQS1GT1ItVVNFUiB0aGUgY2hlY2tzdW0gaXMgYWx3YXlzCkhNQUNfTUQ1LCBhbmQg
dGhhdCdzIHdoYXQgV2luZG93cyBhbmQgTUlUIGNsaWVudHMgc2VuZC4KCkluIGhlaW1kYWwgYm90
aCB0aGUgY2xpZW50IGFuZCBrZGMgdXNlIGluc3RlYWQgdGhlCmNoZWNrc3VtIG9mIHRoZSB0Z3Qs
IGFuZCB0aGVyZWZvcmUgd29yayB3aXRoIGVhY2ggb3RoZXIKYnV0IHdpbmRvd3MgYW5kIE1JVCBj
bGllbnRzIGZhaWwgYWdhaW5zdCBoZWltZGFsIEtEQy4KCkJvdGggV2luZG93cyBhbmQgTUlUIEtE
QyB3b3VsZCBhbGxvdyBhbnkga2V5ZWQgY2hlY2tzdW0KdG8gYmUgdXNlZCBzbyBIZWltZGFsIGNs
aWVudCB3b3JrIGZpbmUgYWdhaW5zdCBpdC4KCkNoYW5nZSBIZWltZGFsIEtEQyB0byBhbGxvdyBI
TUFDX01ENSBldmVuIGZvciBub24gUkM0CmJhc2VkIHRndCBpbiBvcmRlciB0byBzdXBwb3J0IHBl
ci1zcGVjIGNsaWVudHMuCgpTaWduZWQtb2ZmLWJ5OiBJc2FhYyBCb3VrcmlzIDxpYm91a3Jpc0Bn
bWFpbC5jb20+Ci0tLQogc291cmNlNC9oZWltZGFsL2tkYy9rcmI1dGdzLmMgICAgICAgICAgICAg
ICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBzb3VyY2U0L2hlaW1kYWwvbGli
L2tyYjUvdmVyc2lvbi1zY3JpcHQubWFwIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdXJjZTQvaGVpbWRhbC9r
ZGMva3JiNXRncy5jIGIvc291cmNlNC9oZWltZGFsL2tkYy9rcmI1dGdzLmMKaW5kZXggZmY3ZDkz
MTM4YzAuLjE4Njg1NjM4N2VmIDEwMDY0NAotLS0gYS9zb3VyY2U0L2hlaW1kYWwva2RjL2tyYjV0
Z3MuYworKysgYi9zb3VyY2U0L2hlaW1kYWwva2RjL2tyYjV0Z3MuYwpAQCAtMTk0NiwxMiArMTk0
NiwzMCBAQCBzZXJ2ZXJfbG9va3VwOgogCQlnb3RvIG91dDsKIAkgICAgfQogCi0JICAgIHJldCA9
IGtyYjVfdmVyaWZ5X2NoZWNrc3VtKGNvbnRleHQsCi0JCQkJICAgICAgIGNyeXB0bywKLQkJCQkg
ICAgICAgS1JCNV9LVV9PVEhFUl9DS1NVTSwKLQkJCQkgICAgICAgZGF0YWNrLmRhdGEsCi0JCQkJ
ICAgICAgIGRhdGFjay5sZW5ndGgsCi0JCQkJICAgICAgICZzZWxmLmNrc3VtKTsKKwkgICAgaWYg
KGNyeXB0by0+ZXQtPmtleWVkX2NoZWNrc3VtICE9IE5VTEwgJiYKKwkgICAgICAgIGNyeXB0by0+
ZXQtPmtleWVkX2NoZWNrc3VtLT50eXBlICE9IHNlbGYuY2tzdW0uY2tzdW10eXBlICYmCisJICAg
ICAgICBzZWxmLmNrc3VtLmNrc3VtdHlwZSA9PSBDS1NVTVRZUEVfSE1BQ19NRDUpIHsKKwkJdW5z
aWduZWQgY2hhciBjc2RhdGFbMTZdOworCQlDaGVja3N1bSBjczsKKworCQljcy5jaGVja3N1bS5s
ZW5ndGggPSBzaXplb2YoY3NkYXRhKTsKKwkJY3MuY2hlY2tzdW0uZGF0YSA9ICZjc2RhdGE7CisK
KwkJcmV0ID0gX2tyYjVfSE1BQ19NRDVfY2hlY2tzdW0oY29udGV4dCwgJmNyeXB0by0+a2V5LAor
CQkJCQkgICAgICBkYXRhY2suZGF0YSwgZGF0YWNrLmxlbmd0aCwKKwkJCQkJICAgICAgS1JCNV9L
VV9PVEhFUl9DS1NVTSwgJmNzKTsKKwkJaWYgKHJldCA9PSAwICYmCisJCSAgICBrcmI1X2RhdGFf
Y3RfY21wKCZjcy5jaGVja3N1bSwgJnNlbGYuY2tzdW0uY2hlY2tzdW0pICE9IDApCisJCSAgICBy
ZXQgPSBLUkI1S1JCX0FQX0VSUl9CQURfSU5URUdSSVRZOworCSAgICB9CisJICAgIGVsc2Ugewor
CQlyZXQgPSBrcmI1X3ZlcmlmeV9jaGVja3N1bShjb250ZXh0LAorCQkJCQkgICBjcnlwdG8sCisJ
CQkJCSAgIEtSQjVfS1VfT1RIRVJfQ0tTVU0sCisJCQkJCSAgIGRhdGFjay5kYXRhLAorCQkJCQkg
ICBkYXRhY2subGVuZ3RoLAorCQkJCQkgICAmc2VsZi5ja3N1bSk7CisJICAgIH0KIAkgICAga3Ji
NV9kYXRhX2ZyZWUoJmRhdGFjayk7CiAJICAgIGtyYjVfY3J5cHRvX2Rlc3Ryb3koY29udGV4dCwg
Y3J5cHRvKTsKIAkgICAgaWYgKHJldCkgewpkaWZmIC0tZ2l0IGEvc291cmNlNC9oZWltZGFsL2xp
Yi9rcmI1L3ZlcnNpb24tc2NyaXB0Lm1hcCBiL3NvdXJjZTQvaGVpbWRhbC9saWIva3JiNS92ZXJz
aW9uLXNjcmlwdC5tYXAKaW5kZXggZGRhZTJhMDY3NjQuLmI5NWJhOTJmNGY2IDEwMDY0NAotLS0g
YS9zb3VyY2U0L2hlaW1kYWwvbGliL2tyYjUvdmVyc2lvbi1zY3JpcHQubWFwCisrKyBiL3NvdXJj
ZTQvaGVpbWRhbC9saWIva3JiNS92ZXJzaW9uLXNjcmlwdC5tYXAKQEAgLTc2NCw2ICs3NjQsNyBA
QCBIRUlNREFMX0tSQjVfMi4wIHsKIAkJX2tyYjVfcHJpbmNpcGFsbmFtZTJrcmI1X3ByaW5jaXBh
bDsKIAkJX2tyYjVfcHV0X2ludDsKIAkJX2tyYjVfczR1MnNlbGZfdG9fY2hlY2tzdW1kYXRhOwor
CQlfa3JiNV9ITUFDX01ENV9jaGVja3N1bTsKIAogCQkjIGtpbml0IGhlbHBlcgogCQlrcmI1X2dl
dF9pbml0X2NyZWRzX29wdF9zZXRfcGtpbml0X3VzZXJfY2VydHM7Ci0tIAoyLjE0LjUKCg==
--000000000000aa1ddc058955cbd5--

