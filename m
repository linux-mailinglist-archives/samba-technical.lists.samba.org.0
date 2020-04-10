Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 125831A48A9
	for <lists+samba-technical@lfdr.de>; Fri, 10 Apr 2020 18:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=O1wrUcrnhrHiHClqFaeOjjwmXhFlGuONaT1UsoDhIt0=; b=mQzOhwNylwnrXX7psx/+Zs2Y+g
	o96IwApCXH9bCOiAb5bHq4KyVIsIHe2ePzgINnQfZ8xtyUh/EcQs0Os7nbsBXGMVAK+E/c77198mC
	jmBe+iOMYFoUcIm4dwWUXFkX8o0DL26w9RgcfP/lrVAWMnkxAhO+JBWVNqdxG28qi/vCc2t4H4Tpf
	jXkwxha6wacsBDOtMhVcI0TeNNGjY2wPdHddwJbqEY5Pm2vh+wUAhI5HXfUnUvudAVz3znfNkmEk9
	ams3LEodG8gddrexbFlLTc5pW7q7sKDq/7r2fMMgSN6gHCS25fMjldG4vINHpxscB5BTqL6k0OXa0
	YVE+sPKg==;
Received: from localhost ([::1]:23172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMwqq-000Mym-Kn; Fri, 10 Apr 2020 16:49:56 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:36695) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMwql-000Myf-0J
 for samba-technical@lists.samba.org; Fri, 10 Apr 2020 16:49:53 +0000
Received: by mail-qv1-xf42.google.com with SMTP id o15so1227146qvl.3
 for <samba-technical@lists.samba.org>; Fri, 10 Apr 2020 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=rNSt4/rj8OV5VPqbKJlGRLo10YCRFpkA4WnVcCTNm9g=;
 b=bYwy/qdX/hvrHTiLqPFdUG8SQK+laFvP13pJX9xOxbqIfN76HL57k/FucmOe3QKBHc
 mQfLB/tFLXqPFMiYzVmidCURycMHgkeVR9zjreIIR+kdb7qx6GJLj7KqNwkdH1w34eJT
 iN7ui3u/+SlPzAR0j8YeMdY0zmumjsuqkHupg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rNSt4/rj8OV5VPqbKJlGRLo10YCRFpkA4WnVcCTNm9g=;
 b=sR5+Z3ht0rKCSW1OoyLUQagPSqEGqCo0DrHoAZpqb5j5U0SXxylR9uLbcnR/9R+FBZ
 5LlsQ+iiNs6BB8HE49MEcuZmXomWlZ512BzXTW+Z3N6BmUccBYW3aygSzTITRT0zgiaF
 paE4m0Xolqpr2JGc0vrN88LQL+DB13dfDjAKXYSjLTmHw6736DNkzBkPOPShdsUt1ifV
 JwgAS2GBIWKf2ogUpVJb+YPnLwTc0Pw2cLZewkloxVUgByHtisJ4JybA4GVAGnY+V+m8
 L5yRf6squ8YD1A2rfo5e79E55nlfrM/Bf/AJMQdCzGHSjFsmYtAV3RLsAGUOn4yZk5YA
 Whhg==
X-Gm-Message-State: AGi0Puahy8XhvFbZxmX/+bv6upqxfRUJDHyX1SJjpQgzAzBaTOo7xvta
 gPSD7Sc14SnaoSUdhpN+u5Bm4xmqPADuGofO65nqlEEM
X-Google-Smtp-Source: APiQypI4wilkG3ZdjfIdCPb2BkweQkA5ODyQhSGu8kzdbBGerdmCRjEpYX3qEfENkQxN1LcDngcL3LsCP/qH0aKiEa0=
X-Received: by 2002:ad4:41c2:: with SMTP id a2mr5844345qvq.112.1586537388963; 
 Fri, 10 Apr 2020 09:49:48 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 11 Apr 2020 00:49:32 +0800
Message-ID: <CAEUGjKiLPQP9wp0AgLUvHgKBOe9We2a-RQaZ7cd7CvhnarwWiw@mail.gmail.com>
Subject: [PATCH] cifs: improve read performance for page size 64KB &
 cache=strict & vers=2.1+
To: linux-cifs@vger.kernel.org, 
 Samba Technical <samba-technical@lists.samba.org>, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000007e421c05a2f28566"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Jones Syue via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jones Syue <jonessyue@qnap.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000007e421c05a2f28566
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello list,

please help review whether the attached patch is correct, thank you.

Found a read performance issue when linux kernel page size is 64KB.
If linux kernel page size is 64KB and mount options cache=3Dstrict &
vers=3D2.1+,
it does not support cifs_readpages(). Instead, it is using cifs_readpage()
and
cifs_read() with maximum read IO size 16KB, which is much slower than read
IO
size 1MB when negotiated SMB 2.1+. Since modern SMB server supported SMB
2.1+
and Max Read Size can reach more than 64KB (for example 1MB ~ 8MB), this
patch
do one more check on max_read to determine whether server support
readpages()
and improve read performance for page size 64KB & cache=3Dstrict & vers=3D2=
.1+.

The client is a linux box with linux kernel 4.2.8,
page size 64KB (CONFIG_ARM64_64K_PAGES=3Dy),
cpu arm 1.7GHz, and use mount.cifs as smb client.
The server is another linux box with linux kernel 4.2.8,
share a file '10G.img' with size 10GB,
and use samba-4.7.12 as smb server.

The client mount a share from the server with different
cache options: cache=3Dstrict and cache=3Dnone,
mount -tcifs //<server_ip>/Public /cache_strict
-overs=3D3.0,cache=3Dstrict,username=3D<xxx>,password=3D<yyy>
mount -tcifs //<server_ip>/Public /cache_none
-overs=3D3.0,cache=3Dnone,username=3D<xxx>,password=3D<yyy>

The client download a 10GbE file from the server accross 1GbE network,
dd if=3D/cache_strict/10G.img of=3D/dev/null bs=3D1M count=3D10240
dd if=3D/cache_none/10G.img of=3D/dev/null bs=3D1M count=3D10240

Found that cache=3Dstrict (without patch) is slower read throughput and
smaller
read IO size than cache=3Dnone.
cache=3Dstrict (without patch): read throughput 40MB/s, read IO size is 16K=
B
cache=3Dstrict (with patch): read throughput 113MB/s, read IO size is 1MB
cache=3Dnone: read throughput 109MB/s, read IO size is 1MB

Looks like if page size is 64KB,
cifs_set_ops() would use cifs_addr_ops_smallbuf instead of cifs_addr_ops,

/* check if server can support readpages */
if (cifs_sb_master_tcon(cifs_sb)->ses->server->maxBuf <
PAGE_SIZE + MAX_CIFS_HDR_SIZE)
inode->i_data.a_ops =3D &cifs_addr_ops_smallbuf;
else
inode->i_data.a_ops =3D &cifs_addr_ops;

maxBuf is came from 2 places, SMB2_negotiate() and CIFSSMBNegotiate(),
(SMB2_MAX_BUFFER_SIZE is 64KB)
SMB2_negotiate():
/* set it to the maximum buffer size value we can send with 1 credit */
server->maxBuf =3D min_t(unsigned int, le32_to_cpu(rsp->MaxTransactSize),
      SMB2_MAX_BUFFER_SIZE);
CIFSSMBNegotiate():
server->maxBuf =3D le32_to_cpu(pSMBr->MaxBufferSize);

Page size 64KB and cache=3Dstrict lead to read_pages() use cifs_readpage()
instead
of cifs_readpages(), and then cifs_read() using maximum read IO size 16KB,
which is much slower than maximum read IO size 1MB.
(CIFSMaxBufSize is 16KB by default)

/* FIXME: set up handlers for larger reads and/or convert to async */
rsize =3D min_t(unsigned int, cifs_sb->rsize, CIFSMaxBufSize);

--
Regards,
Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
QNAP Systems, Inc.

--0000000000007e421c05a2f28566
Content-Type: application/octet-stream; 
	name="0001-cifs-improve-read-performance-for-page-size-64KB-cac.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-improve-read-performance-for-page-size-64KB-cac.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8ufa8mk0>
X-Attachment-Id: f_k8ufa8mk0

RnJvbSAxY2ViOWVmMmQwMzFiNTUyMDBiZTc5MGJhMmEzYWJjN2U4NWQ3Y2IyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb25lcyBTeXVlIDxqb25lc3N5dWVAcW5hcC5jb20+CkRhdGU6
IFNhdCwgMTEgQXByIDIwMjAgMDA6NDU6MDMgKzA4MDAKU3ViamVjdDogW1BBVENIXSBjaWZzOiBp
bXByb3ZlIHJlYWQgcGVyZm9ybWFuY2UgZm9yIHBhZ2Ugc2l6ZSA2NEtCICYKIGNhY2hlPXN0cmlj
dCAmIHZlcnM9Mi4xKwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47
IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKRm91bmQgYSBy
ZWFkIHBlcmZvcm1hbmNlIGlzc3VlIHdoZW4gbGludXgga2VybmVsIHBhZ2Ugc2l6ZSBpcyA2NEtC
LgpJZiBsaW51eCBrZXJuZWwgcGFnZSBzaXplIGlzIDY0S0IgYW5kIG1vdW50IG9wdGlvbnMgY2Fj
aGU9c3RyaWN0ICYgdmVycz0yLjErLAppdCBkb2VzIG5vdCBzdXBwb3J0IGNpZnNfcmVhZHBhZ2Vz
KCkuIEluc3RlYWQsIGl0IGlzIHVzaW5nIGNpZnNfcmVhZHBhZ2UoKSBhbmQKY2lmc19yZWFkKCkg
d2l0aCBtYXhpbXVtIHJlYWQgSU8gc2l6ZSAxNktCLCB3aGljaCBpcyBtdWNoIHNsb3dlciB0aGFu
IHJlYWQgSU8Kc2l6ZSAxTUIgd2hlbiBuZWdvdGlhdGVkIFNNQiAyLjErLiBTaW5jZSBtb2Rlcm4g
U01CIHNlcnZlciBzdXBwb3J0ZWQgU01CIDIuMSsKYW5kIE1heCBSZWFkIFNpemUgY2FuIHJlYWNo
IG1vcmUgdGhhbiA2NEtCIChmb3IgZXhhbXBsZSAxTUIgfiA4TUIpLCB0aGlzIHBhdGNoCmRvIG9u
ZSBtb3JlIGNoZWNrIG9uIG1heF9yZWFkIHRvIGRldGVybWluZSB3aGV0aGVyIHNlcnZlciBzdXBw
b3J0IHJlYWRwYWdlcygpCmFuZCBpbXByb3ZlIHJlYWQgcGVyZm9ybWFuY2UgZm9yIHBhZ2Ugc2l6
ZSA2NEtCICYgY2FjaGU9c3RyaWN0ICYgdmVycz0yLjErLgoKVGhlIGNsaWVudCBpcyBhIGxpbnV4
IGJveCB3aXRoIGxpbnV4IGtlcm5lbCA0LjIuOCwKcGFnZSBzaXplIDY0S0IgKENPTkZJR19BUk02
NF82NEtfUEFHRVM9eSksCmNwdSBhcm0gMS43R0h6LCBhbmQgdXNlIG1vdW50LmNpZnMgYXMgc21i
IGNsaWVudC4KVGhlIHNlcnZlciBpcyBhbm90aGVyIGxpbnV4IGJveCB3aXRoIGxpbnV4IGtlcm5l
bCA0LjIuOCwKc2hhcmUgYSBmaWxlICcxMEcuaW1nJyB3aXRoIHNpemUgMTBHQiwKYW5kIHVzZSBz
YW1iYS00LjcuMTIgYXMgc21iIHNlcnZlci4KClRoZSBjbGllbnQgbW91bnQgYSBzaGFyZSBmcm9t
IHRoZSBzZXJ2ZXIgd2l0aCBkaWZmZXJlbnQKY2FjaGUgb3B0aW9uczogY2FjaGU9c3RyaWN0IGFu
ZCBjYWNoZT1ub25lLAptb3VudCAtdGNpZnMgLy88c2VydmVyX2lwPi9QdWJsaWMgL2NhY2hlX3N0
cmljdCAtb3ZlcnM9My4wLGNhY2hlPXN0cmljdCx1c2VybmFtZT08eHh4PixwYXNzd29yZD08eXl5
Pgptb3VudCAtdGNpZnMgLy88c2VydmVyX2lwPi9QdWJsaWMgL2NhY2hlX25vbmUgLW92ZXJzPTMu
MCxjYWNoZT1ub25lLHVzZXJuYW1lPTx4eHg+LHBhc3N3b3JkPTx5eXk+CgpUaGUgY2xpZW50IGRv
d25sb2FkIGEgMTBHYkUgZmlsZSBmcm9tIHRoZSBzZXJ2ZXIgYWNjcm9zcyAxR2JFIG5ldHdvcmss
CmRkIGlmPS9jYWNoZV9zdHJpY3QvMTBHLmltZyBvZj0vZGV2L251bGwgYnM9MU0gY291bnQ9MTAy
NDAKZGQgaWY9L2NhY2hlX25vbmUvMTBHLmltZyBvZj0vZGV2L251bGwgYnM9MU0gY291bnQ9MTAy
NDAKCkZvdW5kIHRoYXQgY2FjaGU9c3RyaWN0ICh3aXRob3V0IHBhdGNoKSBpcyBzbG93ZXIgcmVh
ZCB0aHJvdWdocHV0IGFuZCBzbWFsbGVyCnJlYWQgSU8gc2l6ZSB0aGFuIGNhY2hlPW5vbmUuCmNh
Y2hlPXN0cmljdCAod2l0aG91dCBwYXRjaCk6IHJlYWQgdGhyb3VnaHB1dCA0ME1CL3MsIHJlYWQg
SU8gc2l6ZSBpcyAxNktCCmNhY2hlPXN0cmljdCAod2l0aCBwYXRjaCk6IHJlYWQgdGhyb3VnaHB1
dCAxMTNNQi9zLCByZWFkIElPIHNpemUgaXMgMU1CCmNhY2hlPW5vbmU6IHJlYWQgdGhyb3VnaHB1
dCAxMDlNQi9zLCByZWFkIElPIHNpemUgaXMgMU1CCgpMb29rcyBsaWtlIGlmIHBhZ2Ugc2l6ZSBp
cyA2NEtCLApjaWZzX3NldF9vcHMoKSB3b3VsZCB1c2UgY2lmc19hZGRyX29wc19zbWFsbGJ1ZiBp
bnN0ZWFkIG9mIGNpZnNfYWRkcl9vcHMsCgoJCS8qIGNoZWNrIGlmIHNlcnZlciBjYW4gc3VwcG9y
dCByZWFkcGFnZXMgKi8KCQlpZiAoY2lmc19zYl9tYXN0ZXJfdGNvbihjaWZzX3NiKS0+c2VzLT5z
ZXJ2ZXItPm1heEJ1ZiA8CgkJCQlQQUdFX1NJWkUgKyBNQVhfQ0lGU19IRFJfU0laRSkKCQkJaW5v
ZGUtPmlfZGF0YS5hX29wcyA9ICZjaWZzX2FkZHJfb3BzX3NtYWxsYnVmOwoJCWVsc2UKCQkJaW5v
ZGUtPmlfZGF0YS5hX29wcyA9ICZjaWZzX2FkZHJfb3BzOwoKbWF4QnVmIGlzIGNhbWUgZnJvbSAy
IHBsYWNlcywgU01CMl9uZWdvdGlhdGUoKSBhbmQgQ0lGU1NNQk5lZ290aWF0ZSgpLAooU01CMl9N
QVhfQlVGRkVSX1NJWkUgaXMgNjRLQikKU01CMl9uZWdvdGlhdGUoKToKCS8qIHNldCBpdCB0byB0
aGUgbWF4aW11bSBidWZmZXIgc2l6ZSB2YWx1ZSB3ZSBjYW4gc2VuZCB3aXRoIDEgY3JlZGl0ICov
CglzZXJ2ZXItPm1heEJ1ZiA9IG1pbl90KHVuc2lnbmVkIGludCwgbGUzMl90b19jcHUocnNwLT5N
YXhUcmFuc2FjdFNpemUpLAoJCQkgwqAgwqAgwqAgU01CMl9NQVhfQlVGRkVSX1NJWkUpOwpDSUZT
U01CTmVnb3RpYXRlKCk6CglzZXJ2ZXItPm1heEJ1ZiA9IGxlMzJfdG9fY3B1KHBTTUJyLT5NYXhC
dWZmZXJTaXplKTsKClBhZ2Ugc2l6ZSA2NEtCIGFuZCBjYWNoZT1zdHJpY3QgbGVhZCB0byByZWFk
X3BhZ2VzKCkgdXNlIGNpZnNfcmVhZHBhZ2UoKSBpbnN0ZWFkCm9mIGNpZnNfcmVhZHBhZ2VzKCks
IGFuZCB0aGVuIGNpZnNfcmVhZCgpIHVzaW5nIG1heGltdW0gcmVhZCBJTyBzaXplIDE2S0IsCndo
aWNoIGlzIG11Y2ggc2xvd2VyIHRoYW4gbWF4aW11bSByZWFkIElPIHNpemUgMU1CLgooQ0lGU01h
eEJ1ZlNpemUgaXMgMTZLQiBieSBkZWZhdWx0KQoKCS8qIEZJWE1FOiBzZXQgdXAgaGFuZGxlcnMg
Zm9yIGxhcmdlciByZWFkcyBhbmQvb3IgY29udmVydCB0byBhc3luYyAqLwoJcnNpemUgPSBtaW5f
dCh1bnNpZ25lZCBpbnQsIGNpZnNfc2ItPnJzaXplLCBDSUZTTWF4QnVmU2l6ZSk7CgpTaWduZWQt
b2ZmLWJ5OiBKb25lcyBTeXVlIDxqb25lc3N5dWVAcW5hcC5jb20+Ci0tLQogZnMvY2lmcy9pbm9k
ZS5jIHwgMTIgKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvaW5vZGUuYyBiL2ZzL2NpZnMvaW5v
ZGUuYwppbmRleCBiMTZmOGQyLi5jN2FlMDliIDEwMDY0NAotLS0gYS9mcy9jaWZzL2lub2RlLmMK
KysrIGIvZnMvY2lmcy9pbm9kZS5jCkBAIC02MiwxMCArNjIsMTYgQEAgc3RhdGljIHZvaWQgY2lm
c19zZXRfb3BzKHN0cnVjdCBpbm9kZSAqaW5vZGUpCiAKIAkJLyogY2hlY2sgaWYgc2VydmVyIGNh
biBzdXBwb3J0IHJlYWRwYWdlcyAqLwogCQlpZiAoY2lmc19zYl9tYXN0ZXJfdGNvbihjaWZzX3Ni
KS0+c2VzLT5zZXJ2ZXItPm1heEJ1ZiA8Ci0JCQkJUEFHRV9TSVpFICsgTUFYX0NJRlNfSERSX1NJ
WkUpCi0JCQlpbm9kZS0+aV9kYXRhLmFfb3BzID0gJmNpZnNfYWRkcl9vcHNfc21hbGxidWY7Ci0J
CWVsc2UKKwkJCQlQQUdFX1NJWkUgKyBNQVhfQ0lGU19IRFJfU0laRSkgeworCQkJaWYgKGNpZnNf
c2JfbWFzdGVyX3Rjb24oY2lmc19zYiktPnNlcy0+c2VydmVyLT5tYXhfcmVhZCA8CisJCQkJCVBB
R0VfU0laRSArIE1BWF9DSUZTX0hEUl9TSVpFKSB7CisJCQkJaW5vZGUtPmlfZGF0YS5hX29wcyA9
ICZjaWZzX2FkZHJfb3BzX3NtYWxsYnVmOworCQkJfSBlbHNlIHsKKwkJCQlpbm9kZS0+aV9kYXRh
LmFfb3BzID0gJmNpZnNfYWRkcl9vcHM7CisJCQl9CisJCX0gZWxzZSB7CiAJCQlpbm9kZS0+aV9k
YXRhLmFfb3BzID0gJmNpZnNfYWRkcl9vcHM7CisJCX0KIAkJYnJlYWs7CiAJY2FzZSBTX0lGRElS
OgogI2lmZGVmIENPTkZJR19DSUZTX0RGU19VUENBTEwKLS0gCjIuMS40Cgo=
--0000000000007e421c05a2f28566--

