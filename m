Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289AB23FBD
	for <lists+samba-technical@lfdr.de>; Mon, 20 May 2019 19:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZstbfGmIVvo19Xqklyg9xaNxjWaIlEhzled3SyVRqa8=; b=A9QFSXuwDavJCEXbFDI3ed8RRA
	B7oK3Emkb0+HxiNV443D0c1izCIADbdfDY92AQeNJAu85WKMvd1qKyL0iXeRvTDANdIm+JE0Ne8fF
	bsiArfyDBkUWn9zB2dBis/nrtZXSqPiVAMJsozhcDWOA7Wwo8zzeMNGebYKsuGSho5IVOJYSNYbQ5
	Y8k7/rgM+wMrAebc9+UMThbB6Cvz+EuC3jcqOFGcRZRYUKweuHHLuLTae3O5UGzbCh5hQi+yDEPKL
	PTMoN8G1nnDsyQCMKMXGDl0Z+jxG+7EZr5WTPVnPt4LnSaayNOcDV7PxocIYycyiKFXea5s0KeLmG
	HOQ4dg6A==;
Received: from localhost ([::1]:22574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSmY0-000kdT-In; Mon, 20 May 2019 17:58:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38731) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSmXw-000kdC-NN
 for samba-technical@lists.samba.org; Mon, 20 May 2019 17:58:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id t5so243341wmh.3
 for <samba-technical@lists.samba.org>; Mon, 20 May 2019 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZstbfGmIVvo19Xqklyg9xaNxjWaIlEhzled3SyVRqa8=;
 b=ro9X4NviimAV2jI+DGZavV9X+qNABRYGlv2XSawYtwmt5KmSDG5EgmvZ4qNt96+8Ix
 1YLzAfM8ZKKlIncVY3pat9MgoZAoUSV1ubLdEKdQuW8HrVO6wR1gfHW4W0+9V8LFn5HX
 J1ppO+Kb2ilpPXIYCASGsoV+VxxfJ53Ik3MAvGL9yuh9VNk15a1RPr+PFjvar4/3BKIR
 Ijg/Q63aPL7Yx/eNCRl26ZrT0fVzD/q1PDaj7jJy23FPfQywiPCuH5eN3FwM90XTt7km
 IN/uPeUgC8gkP46wLoUYfw8vYX0yxHR6KTXzwYWOLykTCPFF8EQZ+TAyTXYdOY4igCul
 RnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZstbfGmIVvo19Xqklyg9xaNxjWaIlEhzled3SyVRqa8=;
 b=bn6eiC4apRA0w6N61bzory94ZpSBE7qmsiolKLpQnIfe+wELi2RSpgX74awIqIAbxM
 Y7mC1AoPVmpZg6PgTJRj2tZ2JA/MlsP9Nulu+OzUUy/+xx9lme/jOSkEbuROu3Rk7z/C
 3v4feX0weYM73OmxEOn9QA8/FVFwr5sI2s6jn956/BdQKj3QQ5YjSNaNb/S7RbWQY9FP
 ulHHo0DDXBtKvgAsjlkxDsgKs5wWa+lkqTWU1SsyNgdaGVOTgUNV2vJ1j3b7Rm15/CLu
 wx+BYg2l3xO3Qccw3Hcm7T2A1ZQM2YL3hhGsqlQUbUuGxInFhhD8xppJKg0j5nvL/GoO
 ZRsg==
X-Gm-Message-State: APjAAAXW+bXND/rUPPBjt5vXsmL94az5Ce9J1NvhqGxlwTmbjfiIQjrb
 CAAFVE9R2SrViAUTfYRHY8Da5x+s77w9NiWnLqISMw==
X-Google-Smtp-Source: APXvYqwj60WKS8jP4ttsM1f0Q9mJ+Uuq1q2cMCqUFn//Ns+v+P9D55oD7OKWB21CYtqQQr6kUCsleF6PnVl/0x3KIvg=
X-Received: by 2002:a1c:48d7:: with SMTP id v206mr300316wma.38.1558375080002; 
 Mon, 20 May 2019 10:58:00 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 20 May 2019 10:56:44 -0700
Message-ID: <CACyXjPyno0BH-9WCcTkYaUVpZK03Hog2pZEhwiPBQCJd8JR+6A@mail.gmail.com>
Subject: Patch: Make sure we log an error if we are exiting from the server
 when there is a problem
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000001239df0589557953"
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000001239df0589557953
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgZm9sa3MsDQoNCkhlcmUgaXMgYSBzaWduZWQtb2ZmLWJ5IHBhdGNoIGZvciB0aGUgcHJvYmxl
bSBJIHNhdyBsYXN0IHdlZWs6DQoNCkhvcGUgdGhpcyBoZWxwcy4NCg0KLS0gDQpSZWdhcmRzLA0K
UmljaGFyZCBTaGFycGUNCijkvZXku6Xop6PmhoLvvJ/llK/mnInmnZzlurfjgIItLeabueaTjSko
5Lyg6K+05p2c5bq35piv6YWS55qE5Y+R5piO6ICFKQ0K
--0000000000001239df0589557953
Content-Type: application/octet-stream; 
	name="0001-s3-When-exiting-from-the-server-we-should-log-an-err.patch"
Content-Disposition: attachment; 
	filename="0001-s3-When-exiting-from-the-server-we-should-log-an-err.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jvwo8haj0>
X-Attachment-Id: f_jvwo8haj0

RnJvbSBmYzNiYTc1NzE0OWU5ZDZmYmIyNDRmODFkYzA2MTEwNzA0YjUyYTkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaWNoYXJkIFNoYXJwZSA8cmljaGFyZC5zaGFycGVAcHJpbWFy
eWRhdGEuY29tPgpEYXRlOiBNb24sIDIwIE1heSAyMDE5IDE1OjQyOjAwICswMDAwClN1YmplY3Q6
IFtQQVRDSF0gczM6IFdoZW4gZXhpdGluZyBmcm9tIHRoZSBzZXJ2ZXIgd2Ugc2hvdWxkIGxvZyBh
biBlcnJvciBzbwogdGhhdCBpdCB0dXJucyB1cCBpbiB0aGUgbG9ncyBubyBtYXR0ZXIgd2hhdCB0
aGUgbG9nIGxldmVsIGlzLgoKU2lnbmVkLW9mZi1ieTogUmljaGFyZCBTaGFycGUgPHJlYWxyaWNo
YXJkc2hhcnBlQGdtYWlsLmNvbT4KLS0tCiBzb3VyY2UzL3NtYmQvc2VydmVyLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9zb3VyY2UzL3NtYmQvc2VydmVyLmMgYi9zb3VyY2UzL3NtYmQvc2VydmVyLmMKaW5kZXggM2Vm
N2JlZi4uM2FjOWJlOSAxMDA2NDQKLS0tIGEvc291cmNlMy9zbWJkL3NlcnZlci5jCisrKyBiL3Nv
dXJjZTMvc21iZC9zZXJ2ZXIuYwpAQCAtMjEwMSw3ICsyMTAxLDcgQEAgZXh0ZXJuIHZvaWQgYnVp
bGRfb3B0aW9ucyhib29sIHNjcmVlbik7CiAJaWYgKGxwX2NsdXN0ZXJpbmcoKSAmJiAhbHBfYWxs
b3dfdW5zYWZlX2NsdXN0ZXJfdXBncmFkZSgpKSB7CiAJCXN0YXR1cyA9IHNtYmRfY2xhaW1fdmVy
c2lvbihtc2dfY3R4LCBzYW1iYV92ZXJzaW9uX3N0cmluZygpKTsKIAkJaWYgKCFOVF9TVEFUVVNf
SVNfT0soc3RhdHVzKSkgewotCQkJREJHX1dBUk5JTkcoIkNvdWxkIG5vdCBjbGFpbSB2ZXJzaW9u
OiAlc1xuIiwKKwkJCURCR19FUlIoIkNvdWxkIG5vdCBjbGFpbSB2ZXJzaW9uOiAlc1xuIiwKIAkJ
CQkgICAgbnRfZXJyc3RyKHN0YXR1cykpOwogCQkJcmV0dXJuIC0xOwogCQl9Ci0tIAoxLjguMy4x
Cgo=
--0000000000001239df0589557953--

