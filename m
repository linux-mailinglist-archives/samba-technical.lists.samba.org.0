Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC47AC8CD5
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2019 17:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=tfkytMcH4ovEsd736+JX0cx08mOhHJE895L8XWxWWsc=; b=nZwWo3vIzkYUzR3F6RG48YIpOA
	6RWW3sIzW1iPbxRQf7nD+BTCzUK6lmNFTApjFm0uFEdnYQji2aHhHvR3s4bs5jYqMohhU8+UztUM5
	Yyip+I67kNjYNSNdpo7oEnLGFEGGjS5C5j2I/OV+U2oBs5HpN61yrQuWdgXxEU9uZp30od0qfq3E4
	DgGmJ6KeUj2vTOsWYTkZYd7SevY+qBRB0eA7WB0Cu2+qXiXif4PzLuY3mjYDVTNGj+soLTXDTcvrB
	ttwrNb4ooGaoUKPr6+Ne120kL6yoA5sr0Y/YWTTgDXP8ijll3LSuaKg3sjw7fyFwyJ0bi6NmDvGru
	Bn9f6hUA==;
Received: from localhost ([::1]:25958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFgUk-000Tgx-KX; Wed, 02 Oct 2019 15:24:50 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:37916) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFgUg-000Tga-Ln
 for samba-technical@lists.samba.org; Wed, 02 Oct 2019 15:24:48 +0000
Received: by mail-lj1-x22e.google.com with SMTP id b20so17569257ljj.5
 for <samba-technical@lists.samba.org>; Wed, 02 Oct 2019 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tfkytMcH4ovEsd736+JX0cx08mOhHJE895L8XWxWWsc=;
 b=r5vUbMq4pwcxdPK0jPRDdn2j71oBvPruOiXosAcoZH8P1fm1IMrz2VcvrN96QSrZMp
 JHJwFLVTZx3jTv1YjAOQ4+gbK/5Wq8yoRQNXRiBLYNchKV9bf6B8ACPQD/MkDp56UhMu
 jNl+jIGuNrm9Y0DYUd5Jj1YqSfwSPF2AN08BfL1Z5NhOA024JHPYIIGohQ5Yd+4/uxWc
 9Lkjc9DVf3x/40wT1R28cin2xTR5NR2mg8D527PlRJK35yD2vZ+KnWmJ3NS3yr5UQ4Iu
 N/kElIICdWC11McOJhpycuWI8Z+fpO8L/ASVblJeTOxGRn1uHcPsn8bnq/P3LuZy40in
 XE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tfkytMcH4ovEsd736+JX0cx08mOhHJE895L8XWxWWsc=;
 b=eYrZIKy1qAim+03Xng1Jwu3L7Ul1gejGr8sj83eAs1Ml7p8TMSTSrxj82rY+EdpHxr
 aHjox0EUQduPRYNS0zG1GCZRcb0SjdlarwuzTvT+f+2F40XJXtQWhpWsdnoB0y5lF7BJ
 HK/U/QRrITRQm60aAZ/FPZYl3Z325yXElL9H5JQ5Z0POsMtleIglK6rJkqPTWrRuHri1
 3ZaTfnTal2YoiwPnUbT482m1I2m55VUm8Iufnj1kce9SjeSU3ViEe1JesDvnCcP7HDxF
 q4zLEhb1QbaKUcujKMe7IqDKejitmOC+73OKfPpaBiC4ZAmcKiUXnYtGDp7+ecqhWjkd
 zbeQ==
X-Gm-Message-State: APjAAAU2muS25w+KHw/F7pMlNBOlAi8FWYL8MKnGnZt3jaURXl1cukKo
 rBRMRIDrlna2bqtkpxcKM/uxCFbOJ9QFBrhppAsYUu/O
X-Google-Smtp-Source: APXvYqxw0Nm24KEkTigB7az4Fw30cV+1kx2LDK+Yog9Fx0CxyUssWPw6jT28jCdLzodzrs3VVcNZHZW4BxEN3vESy6E=
X-Received: by 2002:a2e:2bda:: with SMTP id r87mr2806737ljr.3.1570029885531;
 Wed, 02 Oct 2019 08:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAD0Ztp3ZioeuGwzsjL3ehpCMxXgbrXsTQxMXXKYP53m0q6wDqw@mail.gmail.com>
In-Reply-To: <CAD0Ztp3ZioeuGwzsjL3ehpCMxXgbrXsTQxMXXKYP53m0q6wDqw@mail.gmail.com>
Date: Wed, 2 Oct 2019 11:24:31 -0400
Message-ID: <CAD0Ztp1wjUnYqQZV9=gxZxgDSCxHDOVsk7eKi48r3fZ0KFnBUQ@mail.gmail.com>
Subject: Re: Patch: Let smbtorture run when EAs are not supported
To: _samba-tech <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000009d515b0593ef119b"
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
From: Gordon Ross via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gordon Ross <gordon.w.ross@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000009d515b0593ef119b
Content-Type: text/plain; charset="UTF-8"

I forgot (and Volker reminded me) that I needed to use NT_STATUS_EQUAL
in that status check.  I did that in a later commit but forgot about
that when I extracted this change from other work.  Attached is a new
patch.  This one passes gitlab.
Volker reviewed and did some testing.  (Thanks!)


On Tue, Sep 24, 2019 at 12:11 PM Gordon Ross <gordon.w.ross@gmail.com> wrote:
>
> Some servers (and some file system types) choose not to implement OS/2
> style EAs.  As one example, the server I work on supports named
> streams but does not support EAs.  I gather some file system types
> (even on Windows) also don't support EAs.  Many smbtorture tests that
> have little to do with EAs refuse to run only because
> smb2_create_complex fails if EAs are not supported.
> Attached is a patch to make that failure non-fatal.

--0000000000009d515b0593ef119b
Content-Type: application/octet-stream; name="samba-noea.patch"
Content-Disposition: attachment; filename="samba-noea.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k19f86hu0>
X-Attachment-Id: f_k19f86hu0

RnJvbSA0NGY4MjZjNmRhYjUzYzM3NGYzMWYyNmIzYzc2MjY5NWVhNTc5Yjc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogR29yZG9uIFJvc3MgPGd3ckBuZXhlbnRhLmNvbT4NCkRhdGU6
IE1vbiwgOSBNYXkgMjAxNiAxMzo0NTowNyAtMDQwMA0KU3ViamVjdDogW1BBVENIXSB0b3J0dXJl
OiBBbGxvdyBydW5uaW5nIG9uIEZTIHRoYXQgZG9lcyBub3Qgc3VwcG9ydCBFQXMNCg0KU2lnbmVk
LW9mZi1ieTogR29yZG9uIFJvc3MgPGdvcmRvbi53LnJvc3NAZ21haWwuY29tPg0KUmV2aWV3ZWQt
Ynk6IFZvbGtlciBMZW5kZWNrZSA8dmxAc2FtYmEub3JnPg0KLS0tDQogc291cmNlNC90b3J0dXJl
L3NtYjIvdXRpbC5jIHwgNyArKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQ0KDQpkaWZmIC0tZ2l0IGEvc291cmNlNC90b3J0dXJlL3NtYjIvdXRpbC5jIGIvc291cmNlNC90
b3J0dXJlL3NtYjIvdXRpbC5jDQppbmRleCAwNDIxMjY1MGMzMC4uYmRhZTc4ODZlZGUgMTAwNjQ0
DQotLS0gYS9zb3VyY2U0L3RvcnR1cmUvc21iMi91dGlsLmMNCisrKyBiL3NvdXJjZTQvdG9ydHVy
ZS9zbWIyL3V0aWwuYw0KQEAgLTEwMiw2ICsxMDIsMTMgQEAgc3RhdGljIE5UU1RBVFVTIHNtYjJf
Y3JlYXRlX2NvbXBsZXgoc3RydWN0IHRvcnR1cmVfY29udGV4dCAqdGN0eCwNCiAJfQ0KIA0KIAlz
dGF0dXMgPSBzbWIyX2NyZWF0ZSh0cmVlLCB0bXBfY3R4LCAmaW8pOw0KKwlpZiAoTlRfU1RBVFVT
X0VRVUFMKHN0YXR1cywgTlRfU1RBVFVTX0VBU19OT1RfU1VQUE9SVEVEKSkgew0KKwkJdG9ydHVy
ZV9jb21tZW50KA0KKwkJCXRjdHgsICJFQXMgbm90IHN1cHBvcnRlZCwgY3JlYXRpbmc6ICVzXG4i
LCBmbmFtZSk7DQorCQlpby5pbi5lYXMubnVtX2VhcyA9IDA7DQorCQlzdGF0dXMgPSBzbWIyX2Ny
ZWF0ZSh0cmVlLCB0bXBfY3R4LCAmaW8pOw0KKwl9DQorDQogCXRhbGxvY19mcmVlKHRtcF9jdHgp
Ow0KIAlOVF9TVEFUVVNfTk9UX09LX1JFVFVSTihzdGF0dXMpOw0KIA0KLS0gDQoyLjExLjANCg0K
--0000000000009d515b0593ef119b--

