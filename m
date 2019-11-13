Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CCAFAA1B
	for <lists+samba-technical@lfdr.de>; Wed, 13 Nov 2019 07:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/Sx8jOFip6LY0WM2JtGUJH6gRD99w/mj049GL+1FtHo=; b=JxiXwiLznjLzws/UllraG+f8FM
	t45fMGk4LoU3asdMPKYNnqVYB/vrNTo7CiRIGQzUbDv1Y8aMBdrTPOfbkbwirJnuemr9QGaPe24wP
	9PiY/zEVWpa+fbYruOdSMM9CVDlQtY7KXo53NhsksuSAMv4a6YTRUBUmymRueVnxZ63GjKymNZUkB
	oxBTw5b1wyRLTWPz/KVNyLKzQccKEMLT+Sy8/gcmlsZfLMGFwYFXh7lilDYGY/WtmMXGl0JbIBWeK
	tZ/dnMfKPXbIJWaXgl++uPf6ln37PsyZ0HJBbUIGdMsOJhANm9QxMA6xAPFzSSe4rM+0yzdOixmHR
	7A3T6JLg==;
Received: from localhost ([::1]:65350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUm0w-009ePw-JI; Wed, 13 Nov 2019 06:20:26 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:38851) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUm0r-009ePZ-Lc
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 06:20:23 +0000
Received: by mail-oi1-x229.google.com with SMTP id a14so779354oid.5
 for <samba-technical@lists.samba.org>; Tue, 12 Nov 2019 22:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/Sx8jOFip6LY0WM2JtGUJH6gRD99w/mj049GL+1FtHo=;
 b=NZRF+rMoIOuBiOJuUb1ajLpkpfGJwn8eoEAbh8TtwbYqRFC4RFrVGA2rWPSaTpt4ul
 m+XGhq2CpOSzc/kJ/8d8mTUoLKcuroPckUe+VkpV/g9vLycWLu5qnHXAkjY18HTtDbot
 0/7qMAWx1Oi2aP2MGkoM+6pXMkWafdd5+hVYTJkPgrXSW6C14GXqTBg11vg8985FiX+2
 v2smXSejq7i64z27Oj8QJdxd5q9BE+CUJXjM+oUyQ3MAO/eya3oWgGxKFIBdQhGP3Gro
 zIXdrRwYGdXHbBiXZpK70527LVr6vzRqhYwitEgOr0O3T2JzglH+TgmE5zOSzOBQnru7
 EX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/Sx8jOFip6LY0WM2JtGUJH6gRD99w/mj049GL+1FtHo=;
 b=J7f0yX+TY1+QwvcR4PcSyq9enf//z5ti+jJes4IxH95sDz4bU1O3bFksgpLIJB1vm6
 5oLVzyQUp+Wmw3+RhL4iuz3dm7P5ukS+GvmAK6NbgBviL9VoFDDYoN9JGqAhROXlR9SU
 qvAyB6WDD+9vwLeoRf5oyBxyq7398wlx5mURQwTLgQF5qsZ4CvVT5j8y3btC82KU2yZD
 /Z44uFBxCb6095VGkRxwqrMze77dMXvOO1tC2nUzyUlEsXoQf9h7lPhwk+lTuT9Pl/1w
 1TqSpe+Ng/i/dxtyptlaH6RQz3IQHYBUoWZEnIAtQRqbailvNtJSuh3c1ABZxExhv0t/
 Kzng==
X-Gm-Message-State: APjAAAV+WaETFyXATwpAz58lP6EA2NL3UI9ZUJp9mvGQfiAEbEMRyCSG
 q1JGTG9oXqz04zcOoSEpbYSeCUJPRphmmcJ/8ifVbg==
X-Google-Smtp-Source: APXvYqxrlX4jcjdSEMhOhDN1U83d1sZPTA2PiKccUEgncM1AyCr85uEuNRpfZSsJThBw/vQ/9bPl7Q2FyhBUo8cYKkQ=
X-Received: by 2002:aca:4742:: with SMTP id u63mr1572673oia.177.1573626019264; 
 Tue, 12 Nov 2019 22:20:19 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 13 Nov 2019 17:20:07 +1100
Message-ID: <CAJ+X7mTKrDNj7hgcKNpf=8ibwtJ7VjhrOLbyjgJ+Orj9R6aR0A@mail.gmail.com>
Subject: [PATCH] ctdb-ib: Fix build errors for infiniband transport
To: Samba Technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000e35d340597345b88"
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000e35d340597345b88
Content-Type: text/plain; charset="UTF-8"

Hi,

Even though infiniband support is broken in CTDB, I would like to keep
it building at least.

Please review and push.

Amitay.

--000000000000e35d340597345b88
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-ctdb-ib-Fix-build-errors-for-infiniband-transport.patch"
Content-Disposition: attachment; 
	filename="0001-ctdb-ib-Fix-build-errors-for-infiniband-transport.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k2wwa8kd0>
X-Attachment-Id: f_k2wwa8kd0

RnJvbSBmODY5MWMxZjBiZDFmODJkZGI4NWMyYjg2NzVmNzY5MDM3ZTMwNGM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbWl0YXkgSXNhYWNzIDxhbWl0YXlAZ21haWwuY29tPgpEYXRl
OiBUdWUsIDEyIE5vdiAyMDE5IDE0OjE0OjUzICsxMTAwClN1YmplY3Q6IFtQQVRDSF0gY3RkYi1p
YjogRml4IGJ1aWxkIGVycm9ycyBmb3IgaW5maW5pYmFuZCB0cmFuc3BvcnQKClNpZ25lZC1vZmYt
Ynk6IEFtaXRheSBJc2FhY3MgPGFtaXRheUBnbWFpbC5jb20+Ci0tLQogY3RkYi9pYi9pYndyYXBw
ZXIuYyAgICAgIHwgMSAtCiBjdGRiL2liL2lid3JhcHBlcl90ZXN0LmMgfCA0ICsrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2N0ZGIvaWIvaWJ3cmFwcGVyLmMgYi9jdGRiL2liL2lid3JhcHBlci5jCmluZGV4IDVjYTNiOTQ2
ZjAwLi5jZjRlZmE1NzllMiAxMDA2NDQKLS0tIGEvY3RkYi9pYi9pYndyYXBwZXIuYworKysgYi9j
dGRiL2liL2lid3JhcHBlci5jCkBAIC0zMiw3ICszMiw2IEBACiAKICNpbmNsdWRlICJjb21tb24v
bG9nZ2luZy5oIgogCi0jaW5jbHVkZSA8aW5maW5pYmFuZC9rZXJuLWFiaS5oPgogI2luY2x1ZGUg
PHJkbWEvcmRtYV9jbWFfYWJpLmg+CiAjaW5jbHVkZSA8cmRtYS9yZG1hX2NtYS5oPgogCmRpZmYg
LS1naXQgYS9jdGRiL2liL2lid3JhcHBlcl90ZXN0LmMgYi9jdGRiL2liL2lid3JhcHBlcl90ZXN0
LmMKaW5kZXggNWViMzIwOWI2OGMuLjc3YTUzMjNmYmYxIDEwMDY0NAotLS0gYS9jdGRiL2liL2li
d3JhcHBlcl90ZXN0LmMKKysrIGIvY3RkYi9pYi9pYndyYXBwZXJfdGVzdC5jCkBAIC01NTEsNyAr
NTUxLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAltZW1zZXQodGN4LCAw
LCBzaXplb2Yoc3RydWN0IGlid3Rlc3RfY3R4KSk7CiAJdGN4LT5uc2VjID0gMDsKIAl0Y3gtPm5t
c2cgPSAxMDAwOwotCURFQlVHTEVWRUwgPSAwOworCWRlYnVnbGV2ZWxfc2V0KDApOwogCiAJLyog
aGVyZSBpcyB0aGUgb25seSBjYXNlIHdlIGNhbid0IGF2b2lkIHVzaW5nIGdsb2JhbC4uLiAqLwog
CXRlc3RjdHggPSB0Y3g7CkBAIC01OTAsNyArNTkwLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKmFyZ3ZbXSkKIAkJCXRjeC0+bWF4c2l6ZSA9ICh1bnNpZ25lZCBpbnQpYXRvaShvcHRhcmcp
OwogCQkJYnJlYWs7CiAJCWNhc2UgJ2QnOgotCQkJREVCVUdMRVZFTCA9IGF0b2kob3B0YXJnKTsK
KwkJCWRlYnVnbGV2ZWxfc2V0KGF0b2kob3B0YXJnKSk7CiAJCQlicmVhazsKIAkJZGVmYXVsdDoK
IAkJCWZwcmludGYoc3RkZXJyLCAiRVJST1I6IHVua25vd24gb3B0aW9uIC0lY1xuIiwgKGNoYXIp
b3ApOwotLSAKMi4yMS4wCgo=
--000000000000e35d340597345b88--

