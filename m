Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E437EBCC26
	for <lists+samba-technical@lfdr.de>; Tue, 24 Sep 2019 18:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=cV9fVE+WG85gwsOvAvX2sRFNLpXAdUlHYYvwmO/54FQ=; b=oeRqo917GFZRkohKWbS37CMRWX
	HcJkRGjtJT4eFb8vKUD+ykMLNp92XlRBBXk220F3xkxCSCr2nPzNBKDJEAzziIezYHfuqu/W+0aOx
	2umK9RGEhquobBc/QTh78Fmjhi8gUKwYGtGUMvt7H8dubMeG+fQoC4Z+t3VjYYLTAooKDKLFp/YkN
	X7adg9YxgbBE9vbK5ZmmzzOy8tUcPYdzucee4EB76RjjNfne8Rf8clbSiILaaUP7SUq2o2J/8WD60
	tXukDIDPWXPGa+3m+/TCXzGayOivBtF/bXIiwbjM+FCiZShtD9twl34i8XdNaL4p5rF9rM5IsSqbq
	F1pB2lZA==;
Received: from localhost ([::1]:63280 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCnPe-008GGo-AT; Tue, 24 Sep 2019 16:11:38 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:35611) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCnPa-008GGh-0P
 for samba-technical@lists.samba.org; Tue, 24 Sep 2019 16:11:36 +0000
Received: by mail-lj1-x22d.google.com with SMTP id m7so2510618lji.2
 for <samba-technical@lists.samba.org>; Tue, 24 Sep 2019 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cV9fVE+WG85gwsOvAvX2sRFNLpXAdUlHYYvwmO/54FQ=;
 b=GRgOFl+aov+88KSkKm9RyOxK1RmgiNX/22wre6667g1DV6mt+jywPWtHTXrlqFE+V7
 OPyRXSVzy+0AfM+ZW2dPG1e79n/XSjiWMOwtIbVvhRGpdqDmqYSs375K6nL3Jf1BezLR
 g/g4pT1Ierx7+W9VXFRYoCWBFGtHO9Qm2oeyidUA7D9jIRptEOUbpubHSGYQwtRNrw9D
 Np4VP2M28x8F++Jjao7Sez8yElVc3PQerlfvJurYkOFG8oy2cLyiAu4spxHZZYV/5Xun
 ZhlGvuMbfh1xm0ddElkYc0bNe1LAUyvPj5tVkldooCSVHdgTSLt+RUs+8KRtFvAz2cgi
 yp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cV9fVE+WG85gwsOvAvX2sRFNLpXAdUlHYYvwmO/54FQ=;
 b=lmeSVGyv+xlk3U8iB52KkCnQSDHWvkD6FHwxFJgRW3cTq91dJjHWiOAshSBIqsFFk2
 ScJBEenT130CYrZk7HiWSxPfWytP6ZF3xsUnnDYAyJd/qrUGrvpxF9gsJCwzWuw6KCLh
 0KTUEAbnXLAwEHyQxmeyQnjCjTSpwokuJnxwgSPbNFrwGfQhl8jHRicAcxDLjYG7iZwv
 RRq/rYyULp1s3vVDFrqknQTJdjCUXhDzMSwlN/nq537bUSLha3/G94BPjLcV2K/R6FVJ
 W1qfECaB65jHGPovnVmWJsm/4tIKwNLsPm28V+shY+z7ah47g6wMSDVUVfA7DDeZrbMt
 TgHg==
X-Gm-Message-State: APjAAAUF3ezMX49ptEQ4qczHPNBwMlrCMF1we2CP8G4w8K1/bJW8nzkd
 zLc1i4HgRP5lpcf97Vn76cnPpxxp+rvXkL1J6rGMDXxy
X-Google-Smtp-Source: APXvYqy6ojLfJF7mgB7Jn34LZFeeZAENCV2vJbxZ3l7QQKxhsqTYTXbwAGh3JgCbXT/QdLHSM9WLhYPq4QuKhmliPuM=
X-Received: by 2002:a2e:7d19:: with SMTP id y25mr2544783ljc.177.1569341492563; 
 Tue, 24 Sep 2019 09:11:32 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 24 Sep 2019 09:11:21 -0700
Message-ID: <CAD0Ztp3ZioeuGwzsjL3ehpCMxXgbrXsTQxMXXKYP53m0q6wDqw@mail.gmail.com>
Subject: Patch: Let smbtorture run when EAs are not supported
To: _samba-tech <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="00000000000032483805934ecabc"
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

--00000000000032483805934ecabc
Content-Type: text/plain; charset="UTF-8"

Some servers (and some file system types) choose not to implement OS/2
style EAs.  As one example, the server I work on supports named
streams but does not support EAs.  I gather some file system types
(even on Windows) also don't support EAs.  Many smbtorture tests that
have little to do with EAs refuse to run only because
smb2_create_complex fails if EAs are not supported.
Attached is a patch to make that failure non-fatal.

--00000000000032483805934ecabc
Content-Type: application/octet-stream; 
	name="0000-allow-eas-not-supported.patch"
Content-Disposition: attachment; 
	filename="0000-allow-eas-not-supported.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k0y1dzlk0>
X-Attachment-Id: f_k0y1dzlk0

RnJvbSBiMGMyNGMxMzM4NDc2MmI3M2FkN2I3NDIyNjI1YzAyYzZhMmFhNWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHb3Jkb24gUm9zcyA8Z3dyQG5leGVudGEuY29tPgpEYXRlOiBN
b24sIDkgTWF5IDIwMTYgMTM6NDU6MDcgLTA0MDAKU3ViamVjdDogW1BBVENIXSBBbGxvdyBydW5u
aW5nIG9uIEZTIHRoYXQgZG9lcyBub3Qgc3VwcG9ydCBFQXMKCi0tLQogc291cmNlNC90b3J0dXJl
L3NtYjIvdXRpbC5jICAgICAgICAgICAgfCAgNiArKwogMSBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291cmNlNC90b3J0dXJlL3Nt
YjIvdXRpbC5jIGIvc291cmNlNC90b3J0dXJlL3NtYjIvdXRpbC5jCmluZGV4IDgxNGUzOThkZDA4
Li43YmVmM2JmZDYxOCAxMDA2NDQKLS0tIGEvc291cmNlNC90b3J0dXJlL3NtYjIvdXRpbC5jCisr
KyBiL3NvdXJjZTQvdG9ydHVyZS9zbWIyL3V0aWwuYwpAQCAtOTgsNiArOTgsMTIgQEAgc3RhdGlj
IE5UU1RBVFVTIHNtYjJfY3JlYXRlX2NvbXBsZXgoc3RydWN0IHNtYjJfdHJlZSAqdHJlZSwgY29u
c3QgY2hhciAqZm5hbWUsCiAJfQogCiAJc3RhdHVzID0gc21iMl9jcmVhdGUodHJlZSwgdG1wX2N0
eCwgJmlvKTsKKwlpZiAoc3RhdHVzID09IE5UX1NUQVRVU19FQVNfTk9UX1NVUFBPUlRFRCkgewor
CQlwcmludGYoIkVBcyBub3Qgc3VwcG9ydGVkLCBjcmVhdGluZzogJXNcbiIsIGZuYW1lKTsKKwkJ
aW8uaW4uZWFzLm51bV9lYXMgPSAwOworCQlzdGF0dXMgPSBzbWIyX2NyZWF0ZSh0cmVlLCB0bXBf
Y3R4LCAmaW8pOworCX0KKwogCXRhbGxvY19mcmVlKHRtcF9jdHgpOwogCU5UX1NUQVRVU19OT1Rf
T0tfUkVUVVJOKHN0YXR1cyk7CiAKLS0gCjIuMjMuMAo=
--00000000000032483805934ecabc--

