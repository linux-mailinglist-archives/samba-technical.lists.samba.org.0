Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890C124078
	for <lists+samba-technical@lfdr.de>; Mon, 20 May 2019 20:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=8JoyG1Z77W8GhuO89fFBegoGljtpkEJ7D9RszhEq3t4=; b=j6qBg8W/SMGEuW/wE0CpYzIr3J
	9C0FIeHEdEQEt5sFEp3/EM7GV/zLyNrMF4tztuV6P1P829c/1SdxU8gNauOxjvC5cOx/bHaCxqPHt
	X4PzGz6aPj/V0tbnhiLVWfgcjmmERr5YhCxMtOsKbGWLPOnzQECjjEXnECZBstmT19ePgp9U8fzEE
	zHcwI87TBA9Gu92KWdQFyU4fpAkVSXwUg2XDkqI8/F1e4tcD6AQKAA0X4CDnwHkcXApNhx541ilWd
	bOvmpVUZuGY4yY+ILCPhlzRGEG4RtXOpBbC1+QMhXE9AGYHuoUVGiIE2f/MgPcTmfGww3b5tZC2wM
	y68l6jig==;
Received: from localhost ([::1]:32194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSn7G-000m3E-3t; Mon, 20 May 2019 18:34:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:45589) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSn7A-000m37-UR
 for samba-technical@lists.samba.org; Mon, 20 May 2019 18:34:27 +0000
Received: by mail-lf1-x134.google.com with SMTP id n22so11038176lfe.12
 for <samba-technical@lists.samba.org>; Mon, 20 May 2019 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=8JoyG1Z77W8GhuO89fFBegoGljtpkEJ7D9RszhEq3t4=;
 b=ISpcelJ/1wCV95f7VSqsSHTQ/XJKqijnrMogGZokbqi6V4HgmCF/3NXtxEilk1oIPJ
 AbrCBL/kgKvndhFtTgWB/CnpeX5tqhC1mgEFpcQglS1WEk0m8zahtz+D/BiM1r8Lga3K
 zT57OioY0M0xnY5hC/EQYQiNKjsULcmLXX6jaz04mAjeHpaUc3rKNMj1b0IpH+NACexP
 aOiqnSF9V1C280nFsto1AneTee3Aoz+jWqzo6BqIbMv/1QlxM2Z/EHNhjmoSJlq4VmV1
 Mu4cgsxyd3mG8NUO91SC3YqJw8xQjsV2/5jLanwLYcN+ABiU/fofpV1OPxELt0t/hcG2
 aPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=8JoyG1Z77W8GhuO89fFBegoGljtpkEJ7D9RszhEq3t4=;
 b=NI8b+S1vK8jPU+bRbQr8d2awbd3rTCyINcmapPYBhbeS9+tB9CdTyNerKoLbje+In4
 9z/u5p4UM9i8o3bVpqt/Rc6no/AUSFzXyOCA3JSuqX6B3kUSKcBzixkW9rnb02B394hg
 UaJMCZx9HTAp5Dm/qvhLIZ1o2dVfzXoD4Xliv/BlMziX9BYiRbp/MXf/2O4J0tlsPHLL
 HK/TDs6i36xr8wZcA3qjJMkB9Itm36Q3OrJPIr9fM+CMrfF8y7+vLG/DEDna/Zs0Gf9/
 HuPeXnmvjNFAnGGtHOe4TIHjd/klrU62ylqIOwhpwcV7Vx0qeXerX0MaACQ1Ar0KGt6L
 5B1A==
X-Gm-Message-State: APjAAAXy6bijNq75eyGps5zqTGbw1Py0E+F1JUohDapRiyytbbcaggza
 +A2vDjae5pcLpfjGzxb8BqVJIjNax0fsDmQ5hbScuPEWgvE=
X-Google-Smtp-Source: APXvYqyKRsPMOi98IfZEfBC2dJ1Z6pqHo+/GoYqrD4t7t6GY72cGj9Rpdf3ZfGn8aEy60DyrW3F7rgTFQt/Q71UJHSs=
X-Received: by 2002:ac2:43af:: with SMTP id t15mr27651045lfl.45.1558377263850; 
 Mon, 20 May 2019 11:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8QtBc8cRVKcgV62A3D9jNHjPzn6NCGyVU_Q_x88T0emQA@mail.gmail.com>
 <CAC-fF8QeW-MAzd5jWj5qsej+ekzUFmv5=pmUjxXPQMQcgeizng@mail.gmail.com>
In-Reply-To: <CAC-fF8QeW-MAzd5jWj5qsej+ekzUFmv5=pmUjxXPQMQcgeizng@mail.gmail.com>
Date: Mon, 20 May 2019 20:34:12 +0200
Message-ID: <CAC-fF8TDnV5NXRWemTBtR5fWeVr7-wf+aoUeEJzgjKTBV0OU2Q@mail.gmail.com>
Subject: Re: [PATCH] heimdal-kdc: allow checksum of PA-FOR-USER to be HMAC_MD5
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Content-Type: multipart/mixed; boundary="0000000000003d0399058955fbe9"
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

--0000000000003d0399058955fbe9
Content-Type: text/plain; charset="UTF-8"

On Mon, May 20, 2019 at 8:20 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> Hi again,
>
> On Mon, Nov 12, 2018 at 8:28 PM Isaac Boukris <iboukris@gmail.com> wrote:
> >
> > Find attached fix for s4u2self from windows and MIT clients using aes
> > tgt session key against heimdal-kdc.
> >
> > Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/36299057
> >
> > Upstream PR: https://github.com/heimdal/heimdal/pull/439
>
> Upstream PR finally landed (see also #576) so I'd like to re-propose
> the new attached patch to Samba.
> The changes are now exercised when kinit used rc4 enctype (should be
> triggered in Samba's fl2003dc environment where AES isn't supported).
>
> New pipeline:
> https://gitlab.com/samba-team/devel/samba/pipelines/62234600

Oups, I sent the old version in the previous email - new version is
attached now.

New-New pipeline (running):
https://gitlab.com/samba-team/devel/samba/pipelines/62245377

Thanks.

--0000000000003d0399058955fbe9
Content-Type: text/plain; charset="US-ASCII"; name="new_heimdal_hmac_md5.patch.txt"
Content-Disposition: attachment; filename="new_heimdal_hmac_md5.patch.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jvwpk1og0>
X-Attachment-Id: f_jvwpk1og0

RnJvbSA1OWVmNGVkN2I2NWJhMDY5N2Y5ZTU0NzkyZDhjZTI1NWZmZjc1MDFhIE1vbiBTZXAgMTcg
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
ICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0KIHNvdXJjZTQvaGVpbWRhbC9saWIv
a3JiNS92ZXJzaW9uLXNjcmlwdC5tYXAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291cmNlNC9oZWltZGFsL2tk
Yy9rcmI1dGdzLmMgYi9zb3VyY2U0L2hlaW1kYWwva2RjL2tyYjV0Z3MuYwppbmRleCBmZjdkOTMx
MzhjMC4uODA5Y2IyYzY1MzMgMTAwNjQ0Ci0tLSBhL3NvdXJjZTQvaGVpbWRhbC9rZGMva3JiNXRn
cy5jCisrKyBiL3NvdXJjZTQvaGVpbWRhbC9rZGMva3JiNXRncy5jCkBAIC0xOTQ2LDEyICsxOTQ2
LDI4IEBAIHNlcnZlcl9sb29rdXA6CiAJCWdvdG8gb3V0OwogCSAgICB9CiAKLQkgICAgcmV0ID0g
a3JiNV92ZXJpZnlfY2hlY2tzdW0oY29udGV4dCwKLQkJCQkgICAgICAgY3J5cHRvLAotCQkJCSAg
ICAgICBLUkI1X0tVX09USEVSX0NLU1VNLAotCQkJCSAgICAgICBkYXRhY2suZGF0YSwKLQkJCQkg
ICAgICAgZGF0YWNrLmxlbmd0aCwKLQkJCQkgICAgICAgJnNlbGYuY2tzdW0pOworCSAgICBpZiAo
c2VsZi5ja3N1bS5ja3N1bXR5cGUgPT0gQ0tTVU1UWVBFX0hNQUNfTUQ1KSB7CisJCXVuc2lnbmVk
IGNoYXIgY3NkYXRhWzE2XTsKKwkJQ2hlY2tzdW0gY3M7CisKKwkJY3MuY2hlY2tzdW0ubGVuZ3Ro
ID0gc2l6ZW9mKGNzZGF0YSk7CisJCWNzLmNoZWNrc3VtLmRhdGEgPSAmY3NkYXRhOworCisJCXJl
dCA9IF9rcmI1X0hNQUNfTUQ1X2NoZWNrc3VtKGNvbnRleHQsICZjcnlwdG8tPmtleSwKKwkJCQkJ
ICAgICAgZGF0YWNrLmRhdGEsIGRhdGFjay5sZW5ndGgsCisJCQkJCSAgICAgIEtSQjVfS1VfT1RI
RVJfQ0tTVU0sICZjcyk7CisJCWlmIChyZXQgPT0gMCAmJgorCQkgICAga3JiNV9kYXRhX2N0X2Nt
cCgmY3MuY2hlY2tzdW0sICZzZWxmLmNrc3VtLmNoZWNrc3VtKSAhPSAwKQorCQkgICAgcmV0ID0g
S1JCNUtSQl9BUF9FUlJfQkFEX0lOVEVHUklUWTsKKwkgICAgfQorCSAgICBlbHNlIHsKKwkJcmV0
ID0ga3JiNV92ZXJpZnlfY2hlY2tzdW0oY29udGV4dCwKKwkJCQkJICAgY3J5cHRvLAorCQkJCQkg
ICBLUkI1X0tVX09USEVSX0NLU1VNLAorCQkJCQkgICBkYXRhY2suZGF0YSwKKwkJCQkJICAgZGF0
YWNrLmxlbmd0aCwKKwkJCQkJICAgJnNlbGYuY2tzdW0pOworCSAgICB9CiAJICAgIGtyYjVfZGF0
YV9mcmVlKCZkYXRhY2spOwogCSAgICBrcmI1X2NyeXB0b19kZXN0cm95KGNvbnRleHQsIGNyeXB0
byk7CiAJICAgIGlmIChyZXQpIHsKZGlmZiAtLWdpdCBhL3NvdXJjZTQvaGVpbWRhbC9saWIva3Ji
NS92ZXJzaW9uLXNjcmlwdC5tYXAgYi9zb3VyY2U0L2hlaW1kYWwvbGliL2tyYjUvdmVyc2lvbi1z
Y3JpcHQubWFwCmluZGV4IGRkYWUyYTA2NzY0Li5iOTViYTkyZjRmNiAxMDA2NDQKLS0tIGEvc291
cmNlNC9oZWltZGFsL2xpYi9rcmI1L3ZlcnNpb24tc2NyaXB0Lm1hcAorKysgYi9zb3VyY2U0L2hl
aW1kYWwvbGliL2tyYjUvdmVyc2lvbi1zY3JpcHQubWFwCkBAIC03NjQsNiArNzY0LDcgQEAgSEVJ
TURBTF9LUkI1XzIuMCB7CiAJCV9rcmI1X3ByaW5jaXBhbG5hbWUya3JiNV9wcmluY2lwYWw7CiAJ
CV9rcmI1X3B1dF9pbnQ7CiAJCV9rcmI1X3M0dTJzZWxmX3RvX2NoZWNrc3VtZGF0YTsKKwkJX2ty
YjVfSE1BQ19NRDVfY2hlY2tzdW07CiAKIAkJIyBraW5pdCBoZWxwZXIKIAkJa3JiNV9nZXRfaW5p
dF9jcmVkc19vcHRfc2V0X3BraW5pdF91c2VyX2NlcnRzOwotLSAKMi4xNC41Cgo=
--0000000000003d0399058955fbe9--

