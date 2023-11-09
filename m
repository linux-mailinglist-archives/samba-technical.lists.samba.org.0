Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D77697E6C66
	for <lists+samba-technical@lfdr.de>; Thu,  9 Nov 2023 15:27:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Nn2V5dlH59ZyBXElPkKLAdxA0P4x0UAeFdTGis4z2wU=; b=LgplygKBmtYIBQ7TApfmZTixwU
	jqm1dhoTyqYvTpALnVOh28faa/9CFnLpM3HZhpV5g/h8RbixVEZobTtjlQ8UUqZdbSnrWGtopNheo
	89mss/cMuc/ilw+5bPiO0ImczJJyvbIELhOXTyFVRpBwT7QEQYC2FlrZd6EeVSjxctNCjHff7Rj1x
	AiZMtPES+fdYU8xLZ/EAa7/Si6vpw/IEXbmDv2u/jHRheDBvHHZl9BZBHS0D9pSd9WgtuaSDPHHqV
	svSlx5o9zjNVeng2nivisS/zZ6CsEv5xfXAvbv+l0lMmSs7F3R2ZXxl9kdP56r7Sojc+TkDYCsLoK
	ptpr9vug==;
Received: from ip6-localhost ([::1]:64160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r15z9-007Jyq-ID; Thu, 09 Nov 2023 14:26:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31576) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r15z4-007Jyh-1T
 for samba-technical@lists.samba.org; Thu, 09 Nov 2023 14:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=Nn2V5dlH59ZyBXElPkKLAdxA0P4x0UAeFdTGis4z2wU=; b=K2zUtVqAauHYBdlWky9MYu3/72
 ZmhYRMvw/HDd+np+FGGknM0GEkKV1NgG9ApnAHaaDwjXrKjs18Z4Kuv4kFW2o7ECrw7uQEzh23YEm
 N89cTf/rXAAd8sFiEOugxa0d7R9EjICvX+OcxJ/3QMaYHz17nRtjU3FD8p4F2fpsEMbEVbiahz6gM
 egCS728pM1BwIKVk3i1cbf0Ra2PBE0fojYWt/8g6lAVwC8bHFFIZ68hjSa0DO5T1zBY2msXyGjIWm
 WcOpkbk6m1x5eWwNqROcelm+CxLK/h2iHIgfpcGRb8Q6vK71isENmfU64fFAmdJO3f2123Ga1EsfN
 3yMShtYgKUZrf1naV2MvLFUlglnyLPxlWZTQz/uGjrzK0OrI9DPkpnuvpBYELQJBbov9SebadExPP
 jU+61LI4l6tjkBr2HbKzOqYo+DWUOPq3AwEhwUpq8WVhpbvM7f8u89b4IwoJKlFgLAWcMfZrVkXLQ
 sHCGwuOqImcGDbZ6OOx3sCb3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r15z3-005JBn-1R for samba-technical@lists.samba.org;
 Thu, 09 Nov 2023 14:26:13 +0000
Date: Thu, 9 Nov 2023 16:24:19 +0200
To: samba-technical@lists.samba.org
Subject: [[FOSDEM] [CfP] Identity and Access Management devroom at FOSDEM 2024]
Message-ID: <ZUzrkwea8JIaXW/p@toolbox>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rJ4q9VbfEBANI0cw"
Content-Disposition: inline
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--rJ4q9VbfEBANI0cw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

like in 2018, we'll have Identity and Access Management devroom at
FOSDEM in 2024. Attached is the annoucement of the call for proposals. In
2018 Samba-related talks were very well attended: people queued outside
in advance for a chance to get to Volker's talk, for example!

I think there are enough interesting developments around identity management in
Samba world that would be worth presenting.

Please consider submitting a talk proposal if you are able to attend
FOSDEM! Deadline is December 1st, 2023.

-- 
/ Alexander Bokovoy

--rJ4q9VbfEBANI0cw
Content-Type: message/rfc822
Content-Disposition: inline

Return-path: <fosdem-bounces@lists.fosdem.org>
Envelope-to: ab@samba.org
Delivery-date: Thu, 09 Nov 2023 13:42:44 +0000
Received: from mail.fosdem.org ([2001:67c:1808::142]:58685) 
	by hr2.samba.org with esmtps (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__CHACHA20_POLY1305:256)
	(Exim)
	id 1r15Iw-005IQY-0e
	for ab@samba.org;
	Thu, 09 Nov 2023 13:42:44 +0000
X-Comment: SPF check N/A for local connections - client-ip=::1; helo=mail.fosdem.org; envelope-from=fosdem-bounces@lists.fosdem.org; receiver=<UNKNOWN> 
Received: from mail.fosdem.org (localhost [IPv6:::1])
	by mail.fosdem.org (Postfix) with ESMTP id 3136ED0E45;
	Thu,  9 Nov 2023 13:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=144.76.82.148;
 helo=hr2.samba.org; envelope-from=ab@samba.org; receiver=<UNKNOWN> 
Received: from hr2.samba.org (hr2.samba.org [144.76.82.148])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mail.fosdem.org (Postfix) with ESMTPS id E29CB6230;
 Thu,  9 Nov 2023 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=m2/kWxFyTuw5V+pSYg6texPPtEfdA8G846xtYUCxbTQ=; b=eI2i9nVWawTkfqDRty897vn67W
 pCcAmryy9GHJwKQWLuU74J9XHMyntrWAolWF+bt5/Zc3HaMhaym9s5OxLCzGFP6TvjpeUs6mEtvkW
 YiyYECgHQ6Dye6UFezZD244zMUoBszFXveFJj/bJgOkjOF1YDl2WtpBaBoFhFdAZYxQzH3ebdkflg
 qFgrzUReAtfthXEeTBBZPzJK2PO0k0eJ8xCfx1AF/slccr1RlbHcFWCmmnKdduXcxnSLV2sINfAVZ
 8XiiZexusNGMG+GvMTu8yCxLy7R2WBUXvjNazjuqBFztLltY/XumbneG+jPQQJFXfVc3n6Qy6pQuI
 9wU0+VdkGEP2jvPEUUxqAnpfp7foDOMs4qCH/SgGkgYYB5g0ygBSSS5SnDopXEiSztzgIuJi+m8db
 SsxR3fKZxoY5jFnB6VDkkpxFjlvSxPzM55gFYEvefTR9UNW5T8EVWj9yM14KYvYdwQdtUnvlIR26u
 PF/bpIy3Wpu4XWmNiepVerFN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r0zMw-005Ep8-20; Thu, 09 Nov 2023 07:22:31 +0000
Date: Thu, 9 Nov 2023 09:20:32 +0200
From: Alexander Bokovoy <ab@samba.org>
To: fosdem@lists.fosdem.org, iam-devroom@lists.fosdem.org
Message-ID: <ZUyIQKNBex/65xpn@toolbox>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 09 Nov 2023 13:42:37 +0000
Subject: [FOSDEM] [CfP] Identity and Access Management deveroom at FOSDEM
 2024
X-BeenThere: fosdem@lists.fosdem.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: FOSDEM announcements <fosdem.lists.fosdem.org>
List-Unsubscribe: <https://lists.fosdem.org/options/fosdem>,
 <mailto:fosdem-request@lists.fosdem.org?subject=unsubscribe>
List-Archive: <https://lists.fosdem.org/pipermail/fosdem/>
List-Post: <mailto:fosdem@lists.fosdem.org>
List-Help: <mailto:fosdem-request@lists.fosdem.org?subject=help>
List-Subscribe: <https://lists.fosdem.org/listinfo/fosdem>,
 <mailto:fosdem-request@lists.fosdem.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: fosdem-bounces@lists.fosdem.org
Sender: "FOSDEM" <fosdem-bounces@lists.fosdem.org>
X-TUID: PnZRKIM5Cb4c

SGkhCgpUaGlzIGlzIGEgY2FsbCBmb3IgcHJvcG9zYWxzIGZvciB0aGUgSWRlbnRpdHkgYW5kIEFj
Y2VzcyBNYW5hZ2VtZW50CkRldnJvb206IGh0dHBzOi8vaWFtLWRldnJvb20uZ2l0aHViLmlvL2Zv
c2RlbS0yMDI0LwoKIyBJZGVudGl0eSBhbmQgQWNjZXNzIE1hbmFnZW1lbnQgRGV2cm9vbSBAIEZP
U0RFTScyMDI0CgpbRk9TREVNIDIwMjRdKGh0dHBzOi8vZm9zZGVtLm9yZy8yMDI0Lykgd2lsbCBo
YXZlIGEgW2lkZW50aXR5IGFuZCBhY2Nlc3MgbWFuYWdlbWVudApkZXZyb29tXShodHRwczovL2Zv
c2RlbS5vcmcvMjAyNC9zY2hlZHVsZS90cmFjay9pZGVudGl0eV9hbmRfYWNjZXNzX21hbmFnZW1l
bnQpLgoKVGhlIElBTSBkZXZyb29tIGlzIHBsYW5uZWQgdG8gYmUgcnVuIGF0ICoqU3VuZGF5LCBG
ZWJydWFyeSA0dGgsIDIwMjQqKiBpbgpCcnVzc2VscywgQmVsZ2l1bSBhdCBbVUxCXShodHRwOi8v
d3d3LnVsYi5hYy5iZS8pLgoKIyMgT3VyIHRvcGljcyB0aGlzIHllYXIKClRoaXMgaXMgdGhlIElk
ZW50aXR5IGFuZCBBY2Nlc3MgTWFuYWdlbWVudCBEZXZyb29tIGFuZCB3ZSBpbnZpdGUgeW91IHRv
IHN1Ym1pdAphIHRhbGsgdGhhdCBpcyByZWxldmFudCB0byBvcGVyYXRpbmcgc3lzdGVtcycgaWRl
bnRpdHkgYW5kIGFjY2VzcyBtYW5hZ2VtZW50IGluCnRoZSBmcmVlIHNvZnR3YXJlIGFuZCBvcGVu
IHNvdXJjZSB3b3JsZC4gIFdlIGRvbid0IGV4Y2x1ZGUgYW55IHJlbGV2YW50CnN1Ym1pc3Npb24s
IGZvciBpZGVhcyBhbmQgc3VnZ2VzdGlvbnMgcGxlYXNlIGNoZWNrIHRoZSBwcmV2aW91cyBlZGl0
aW9uIG9mIElBTQpkZXZyb29tIGF0IFtGT1NERU0gMjAxOF0oaHR0cHM6Ly9hcmNoaXZlLmZvc2Rl
bS5vcmcvMjAxOC9zY2hlZHVsZS90cmFjay9pZGVudGl0eV9hbmRfYWNjZXNzX21hbmFnZW1lbnQv
KQoKU3VnZ2VzdGVkIHRvcGljczoKCi0gU2VjdXJpdHk6IGFsZ29yaXRobXMgYW5kIHByb3RvY29s
cyBmb3IgSUFNL0lkTTsgcGFzc3dvcmRzIGFuZCBwYXNzd29yZCBhbHRlcm5hdGl2ZXMKCi0gRmVk
ZXJhdGVkIGFuZCBzb2NpYWwgaWRlbnRpdHk7IGxldmVyYWdpbmcgZXh0ZXJuYWwgaWRlbnRpdGll
cyBpbiBhcHBsaWNhdGlvbnMKCi0gQXVkaXQsIGNvbXBsaWFuY2UsIG1vbml0b3JpbmcKCi0gVXNl
ciBleHBlcmllbmNlLCBkZXNrdG9wIGludGVncmF0aW9uCgotIEZyZWUgc29mdHdhcmUgSUFNL0lk
TSBvZmZlcmluZ3MKCi0gSUFNL0lkTSBkZXBsb3ltZW50IHJlcG9ydHMKCmFuZCBtb3JlLiBEb24n
dCBiZSBzaHkgYW5kIHNob3cgaG93IHlvdXIgcHJvamVjdCBoZWxwcyB0byBpbXByb3ZlIG91ciBs
aXZlcy4KCiMjIFN1Ym1pc3Npb25zCgpTdWJtaXNzaW9ucyByZXF1aXJlIGEgc21hbGwgYWJzdHJh
Y3QgYW5kIGEgc2hvcnQgc3BlYWtlciBkZXNjcmlwdGlvbiBhbmQgbXVzdApiZSBzdWJtaXR0ZWQg
W3ZpYSB0aGUgUHJldGFseCBzeXN0ZW1dKGh0dHBzOi8vZm9zZGVtLm9yZy9zdWJtaXQpIG5vIGxh
dGVyIHRoYW4KKioxc3Qgb2YgRGVjZW1iZXIgMjAyMyoqLiBTdWdnZXN0ZWQgZHVyYXRpb24gZm9y
IGEgdGltZXNsb3QgdG8gYXBwbHkgZm9yIGlzCioqMjUgbWludXRlcyoqICgyMCBtaW4gcHJlc2Vu
dGF0aW9uICsgNSBtaW5zIHF1ZXN0aW9ucykuIFRoZSBzY2hlZHVsZSBzaGFsbCBiZQpmaW5hbGl6
ZWQgYnkgKioxNSBEZWNlbWJlciAyMDIzKiouCgpOb3RlIHRoYXQgdGhpcyBpcyBhIG5ldyBzdWJt
aXNzaW9uIHN5c3RlbSBhbmQgYWNjb3VudHMgZnJvbSBwZW50YWJhcmYgd2VyZSBub3QKbWlncmF0
ZWQ6IFByZXNlbnRlcnMgd2lsbCBoYXZlIHRvIGNyZWF0ZSBhIG5ldyBhY2NvdW50LgoKSW5zdHJ1
Y3Rpb25zOgoKICAqIEdvIHRvIFtodHRwczovL2Zvc2RlbS5vcmcvc3VibWl0XShodHRwczovL2Zv
c2RlbS5vcmcvc3VibWl0KQogICogUmVnaXN0ZXIgYSBuZXcgYWNjb3VudAogICogQ3JlYXRlIGEg
bmV3IGV2ZW50IHdpdGggeW91ciB0aXRsZSBhbmQgYWJzdHJhY3QgYW5kIHNvbWUgaW5mb3JtYXRp
b24gYWJvdXQgeW91CiAgKiBCZSBzdXJlIHRvIHNldCB0aGUgZXZlbnQgdHJhY2sgdG8gIklkZW50
aXR5IGFuZCBBY2Nlc3MgTWFuYWdlbWVudCBkZXZyb29tIgogICogU3Vic2NyaWJlIHRvIHRoZSBb
aWFtLWRldnJvb21AbGlzdHMuZm9zZGVtLm9yZ10oaHR0cHM6Ly9saXN0cy5mb3NkZW0ub3JnL2xp
c3RpbmZvL2lhbS1kZXZyb29tKSBtYWlsaW5nIGxpc3QgZm9yIGFubm91bmNlbWVudHMKCiMjIyBP
cmdhbml6ZXJzCgogICogWW91ISAtIGFueSBoZWxwIHdpdGggb3JnYW5pemluZyBpcyBoaWdobHkg
YXBwcmVjaWF0ZWQhCiAgKiBBbGV4YW5kZXIgQm9rb3ZveSAoYWJAc2FtYmEub3JnKQogICogSWtl
ciBQZWRyb3NhIChpcGVkcm9zYUByZWRoYXQuY29tKQoKCgotLSAKLyBBbGV4YW5kZXIgQm9rb3Zv
eQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGT1NERU0g
bWFpbGluZyBsaXN0CkZPU0RFTUBsaXN0cy5mb3NkZW0ub3JnCmh0dHBzOi8vbGlzdHMuZm9zZGVt
Lm9yZy9saXN0aW5mby9mb3NkZW0=

--rJ4q9VbfEBANI0cw--

