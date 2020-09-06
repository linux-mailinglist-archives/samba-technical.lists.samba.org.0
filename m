Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B36B625ED02
	for <lists+samba-technical@lfdr.de>; Sun,  6 Sep 2020 08:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ZhH5R30HvdM3DeOJVNsx5BtBMl8cEdmKzTxxq6wj63k=; b=uOeFYCsC1PfY2o6cACvKlozy0B
	uRDcTSBXPmsVgI4BTZJeefYH9uRX/uW5SY6vRsh3px+awSp6Bs5UG8zWrTqpbHzNQxUpRd4bYabVg
	Qw6vgxZlEFRmfcXveaRR+KoJSiOTIepiantnimPF8GCbicvlkeNJIHBYl4HTf6CO3h2tK15AAIwaU
	Y3Zo5RdQ6DH5d4uMsn+OZ8s5V/RxgFQn+A/xX1B6pHhzuQXd4PMJwUm+YPoljKLasrwGE0Cxa2LmT
	bUHqot5aKL52Nh7uukSym3Z1jk8G9MvU0oZgUu8hlNA8iuQSJ6YMzdyjKcLhhRy+8F+nqv5hOBYus
	hHP4b9Hg==;
Received: from localhost ([::1]:63968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kEnwW-004JDA-RQ; Sun, 06 Sep 2020 06:14:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16304) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kEnwR-004JD3-Le
 for samba-technical@lists.samba.org; Sun, 06 Sep 2020 06:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ZhH5R30HvdM3DeOJVNsx5BtBMl8cEdmKzTxxq6wj63k=; b=MTfEZDjrSPFcgRqpIOd3CLZZtI
 6RyvULQxbNMv+SgkqpxHQGdcPyzYcV5FiixfnQuSohJHrBDaDY/ryIu1kwE6dfZDKMFlx3AFA9KkE
 OLKoZ7EE1xQ25HyO1IxUs21H2LoeVLj9k7Zqpyo9dcEV2cac4xDK5VBvEDBrqd1hYBG+10KcKoOtB
 YXeY144DOQLwgvW4OhpH9C7MD4lQN6eMQsGNYl+fD6QvoR4jpHL+oLFspwlm8VlpNhYogsI68FckJ
 la9jnQvMTDbme3Si1m0O62IM7IlqrQp0eztLpVMD0aED/ouvz1F8V1zEN/OKksdq2lGpIQ8VjT+JY
 Je5oip3c8v7RlT6QuOH9Rj9YWyoLBf1CFgxEiAJyhAMbxwCDLFvQ+T3Z0rSBFmEr1LsUoKiEoDsL+
 S+x5QqEt5833LXBHE6TheZi+tBMAr8cojYLOVC7jCR5+gxLaGGaRTqoO+qdxFLBYqUCD933CsPrT/
 zleujCzr1RU1WW43vDSFFszI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kEnwP-00029o-RR; Sun, 06 Sep 2020 06:14:18 +0000
Message-ID: <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
Subject: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
To: Karolin Seeger <kseeger@samba.org>
Date: Sun, 06 Sep 2020 18:14:11 +1200
In-Reply-To: <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
Content-Type: multipart/mixed; boundary="=-bfxg+QroZF9AUVaSqj9I"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-bfxg+QroZF9AUVaSqj9I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-09-06 at 01:08 -0400, Nico Kadel-Garcia via samba-
technical wrote:
> 
> MacOS has working python3 according to my developer friends. Any
> operating still based on python3 is so old that it should *not* be
> running a contemporary Samba server, only perhaps cifs-utils for
> mounting from Windows or Samba servers on a more contemporary and
> securable operating system.

Thanks all for your positive feedback.

Without pre-empting the remainder discussion attached is a proposed
patch for the WHATSNEW for the pending 4.13.

This gives our users fair warning.  We can then change the build system
at our leisure (giving us a little more time for user feedback).

To be clear, I'm not proposing changing the actual code in master yet,
please do continue to send in your feedback.  

(Even after such a warning is given in 4.13 we can still change our
minds, but our users will have been warned). 

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba


--=-bfxg+QroZF9AUVaSqj9I
Content-Disposition: attachment;
	filename*0=0001-WHATSNEW-Announce-the-end-of-Python-2.6-support-to-b.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-WHATSNEW-Announce-the-end-of-Python-2.6-support-to-b.patch";
	charset="UTF-8"

RnJvbSA1YjFjYWQ4OWRkMWYwODQ1NjJiNDAxOGY5MmQ3YWQ1NTQ1OGFjOGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQmFydGxldHQgPGFiYXJ0bGV0QHNhbWJhLm9yZz4K
RGF0ZTogU3VuLCA2IFNlcCAyMDIwIDE4OjA3OjI5ICsxMjAwClN1YmplY3Q6IFtQQVRDSF0gV0hB
VFNORVc6IEFubm91bmNlIHRoZSBlbmQgb2YgUHl0aG9uIDIuNiBzdXBwb3J0IHRvIGJ1aWxkCiBT
YW1iYSAod2FybmluZyBmb3IgNC4xNCkKClNpZ25lZC1vZmYtYnk6IEFuZHJldyBCYXJ0bGV0dCA8
YWJhcnRsZXRAc2FtYmEub3JnPgotLS0KIFdIQVRTTkVXLnR4dCB8IDEwICsrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvV0hBVFNORVcudHh0IGIvV0hBVFNORVcudHh0CmluZGV4IDgxZDkzMDBkZjk0Li4zNWE5ZDdj
OTg4OSAxMDA2NDQKLS0tIGEvV0hBVFNORVcudHh0CisrKyBiL1dIQVRTTkVXLnR4dApAQCAtMjQs
OCArMjQsMTQgQEAgU2FtYmEncyBtaW5pbXVtIHJ1bnRpbWUgcmVxdWlyZW1lbnQgZm9yIHB5dGhv
biB3YXMgcmFpc2VkIHRvIFB5dGhvbgogMy42IGJvdGggdG8gYWNjZXNzIG5ldyBmZWF0dXJlcyBh
bmQgYmVjYXVzZSB0aGlzIGlzIHRoZSBvbGRlc3QgdmVyc2lvbgogd2UgdGVzdCB3aXRoIGluIG91
ciBDSSBpbmZyYXN0cnVjdHVyZS4KIAotKEJ1aWxkIHRpbWUgc3VwcG9ydCBmb3IgdGhlIGZpbGUg
c2VydmVyIHdpdGggUHl0aG9uIDIuNiBoYXMgbm90Ci1jaGFuZ2VkKQorVGhpcyBpcyBhbHNvIHRo
ZSBsYXN0IHJlbGVhc2Ugd2hlcmUgYnVpbGQgdGltZSBzdXBwb3J0IGZvciB0aGUgZmlsZQorc2Vy
dmVyIHdpdGggUHl0aG9uIDIuNiB3aWxsIGJlIHByb3ZpZGVkLgorCitBcyBQeXRob24yIGhhcyBi
ZWVuIEVuZCBPZiBMaWZlIHVwc3RyZWFtIHNpbmNlIEphbnVhcnkgMjAyMCwgU2FtYmEgaXMKK2Ry
b3BwaW5nIFB5dGhvbjIgc3VwcG9ydCBmb3IgdGhlIE5FWFQgcmVsZWFzZS4KKworU2FtYmEgNC4x
NCB0byBiZSByZWxlYXNlZCBpbiBNYXJjaCAyMDIxIHdpbGwgcmVxdWlyZSBQeXRob24gMy42IHRv
CitidWlsZC4KIAogd2lkZSBsaW5rcyBmdW5jdGlvbmFsaXR5CiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KLS0gCjIuMjYuMgoK


--=-bfxg+QroZF9AUVaSqj9I--


