Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5D2621CC
	for <lists+samba-technical@lfdr.de>; Tue,  8 Sep 2020 23:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=XCYOofH7yef9G6pCc55bqSvnK2SQ2V7R2W9BtQb3PPE=; b=idtka0Z5eJMdJTYBzXkiQ4s/b1
	LxJ5vr6IaPZFbYXOrP9xJmj3yu8N3wnxXKvefIdobhRlw4VY77yQ1eV2bMIqSa+EB8C+y5nAD6wYh
	zDuSdyS8Id41uz7Z7sJpJqU7hDPmUGONC0HIMzYecF99JDfnXRqRUeH2rtYbBFoFpz96SxsvgfCzD
	9RYJt84gZZkS/lQGoihH7+sUKwMr+KDixER9Cj6W0+otHsIf5fKiFZOgbbpBiqVM6zxxy+Z/l+dIh
	801BAc1B0X7sBRKbbA5BBzdMv3sGcY8zoNBl9D/arCnoNajC6T4nAEPpwK0Fb1yqMELdNFVrSBKK6
	5JuZfjaQ==;
Received: from localhost ([::1]:53670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFkyi-004hft-J2; Tue, 08 Sep 2020 21:16:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54546) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFkyY-004hfm-NK
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 21:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=XCYOofH7yef9G6pCc55bqSvnK2SQ2V7R2W9BtQb3PPE=; b=aUz8GSrsl9HxcXqqCqHYKe9uRl
 5idcjKaSCLwVscqmwR/ggZfnS+tD1F9AqTBOt80JQ2miwK98qjF/qSi8TdJL9UgndZklbgzWl9HrK
 iNsP7c3QuoBlLgdw2gaiF2Am4sPKZoBDbYQhMFY7bJBfX6PLrlu25s8J+DTpXExpqGuQYspzUXQ/d
 NgLsiV4GYXlM3dH6WYbj4nknvswjRMgeF8z5EM4CZ0k5eG+Vx74eRHcf4U/URqBep493r9by639ZV
 jWEu0j+fZdAgBjsGxfWYn9mzxnvCrs45uBlMxC7eL+UxK/ewJD9hWTDq2zpHntCHlBzM+noxFHFSB
 nArpk+P+p3UYAsPb9O3Oo0fLdU+hFEyI8STqVLB5FtpMsmihO9PoYgfnv/kviW9wztQR6VLSZoOXK
 LnMxB8wEwNA5S6wvcOjzgQFUwWzkDuLqXnXbrdDSeWNVvhhV31RCHn7NWBOXF55yny0R02ZLXVrsd
 5cigSAhMLPFRcu5RCL7+56aw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFkyW-0005NK-L0; Tue, 08 Sep 2020 21:16:25 +0000
Message-ID: <d5a31f2fdfcfd03813cd3cc9ee862af2aad5d5ed.camel@samba.org>
Subject: Re: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
To: Alexander Bokovoy <ab@samba.org>, Jeremy Allison <jra@samba.org>
Date: Wed, 09 Sep 2020 09:16:04 +1200
In-Reply-To: <20200908165820.GB23377@pinega.vda.li>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
 <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
 <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
 <7960be07410deb265299daf2e2af243b628f3d4d.camel@samba.org>
 <20200908161627.GB599978@jeremy-acer>
 <20200908165820.GB23377@pinega.vda.li>
Content-Type: multipart/mixed; boundary="=-kOF3Xa7Br0dKTdh8PHSZ"
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
Cc: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-kOF3Xa7Br0dKTdh8PHSZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-08 at 19:58 +0300, Alexander Bokovoy wrote:
> On ti, 08 syys 2020, Jeremy Allison via samba-technical wrote:
> > On Tue, Sep 08, 2020 at 10:17:54AM +1200, Andrew Bartlett via samba-technical wrote:
> > > I'm sorry it was not clear, yes I mean all Python 2.x support will be
> > > gone so we can focus on Python 3.6 and above.
> > > 
> > > Let me know if this new patch is clearer.
> > 
> > How about "will require Python 3.6 or later to build" ?
> > 
> > Don't want to mandate a specific Python3 release.
> 
> +1 from me too. ;)
> 

Thanks!  I love bike sheds so please see attached a new patch with more
context and the feedback incorporated. :-)

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba


--=-kOF3Xa7Br0dKTdh8PHSZ
Content-Disposition: attachment;
	filename*0=0001-WHATSNEW-Announce-the-end-of-Python-2.6-2.7-support-.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-WHATSNEW-Announce-the-end-of-Python-2.6-2.7-support-.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBkNmY5MDA3ZmUwMDVhZTkyOTU4ODBmYjA1NDM4ZWQ5NWQ3YzAwMjIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQmFydGxldHQgPGFiYXJ0bGV0QHNhbWJhLm9yZz4K
RGF0ZTogU3VuLCA2IFNlcCAyMDIwIDE4OjA3OjI5ICsxMjAwClN1YmplY3Q6IFtQQVRDSF0gV0hB
VFNORVc6IEFubm91bmNlIHRoZSBlbmQgb2YgUHl0aG9uIDIuNi8yLjcgc3VwcG9ydCB0byBidWls
ZAogU2FtYmEKClRoaXMgaXMgYSB3YXJuaW5nIGZvciA0LjE0LCB0byBnaXZlIHVzZXJzIHRoZSBu
b3JtYWwgZGVwcmVjYXRpb24Kbm90aWNlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IEJhcnRsZXR0
IDxhYmFydGxldEBzYW1iYS5vcmc+Ci0tLQogV0hBVFNORVcudHh0IHwgMTQgKysrKysrKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL1dIQVRTTkVXLnR4dCBiL1dIQVRTTkVXLnR4dAppbmRleCA4MWQ5MzAwZGY5NC4u
YWNhNGQ2ODU5MGIgMTAwNjQ0Ci0tLSBhL1dIQVRTTkVXLnR4dAorKysgYi9XSEFUU05FVy50eHQK
QEAgLTEzLDIyICsxMywyOCBAQCBVUEdSQURJTkcKID09PT09PT09PQogCiAKIE5FVyBGRUFUVVJF
Uy9DSEFOR0VTCiA9PT09PT09PT09PT09PT09PT09PQogCi1QeXRob24gMy42IFJlcXVpcmVkCi0t
LS0tLS0tLS0tLS0tLS0tLS0tCitQeXRob24gMy42IG9yIGxhdGVyIHJlcXVpcmVkCistLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAKIFNhbWJhJ3MgbWluaW11bSBydW50aW1lIHJlcXVpcmVt
ZW50IGZvciBweXRob24gd2FzIHJhaXNlZCB0byBQeXRob24KIDMuNSB3aXRoIHNhbWJhIDQuMTIu
ICBTYW1iYSA0LjEzIHJhaXNlcyB0aGlzIG1pbmltdW0gdmVyc2lvbiB0byBQeXRob24KIDMuNiBi
b3RoIHRvIGFjY2VzcyBuZXcgZmVhdHVyZXMgYW5kIGJlY2F1c2UgdGhpcyBpcyB0aGUgb2xkZXN0
IHZlcnNpb24KIHdlIHRlc3Qgd2l0aCBpbiBvdXIgQ0kgaW5mcmFzdHJ1Y3R1cmUuCiAKLShCdWls
ZCB0aW1lIHN1cHBvcnQgZm9yIHRoZSBmaWxlIHNlcnZlciB3aXRoIFB5dGhvbiAyLjYgaGFzIG5v
dAotY2hhbmdlZCkKK1RoaXMgaXMgYWxzbyB0aGUgbGFzdCByZWxlYXNlIHdoZXJlIGl0IHdpbGwg
YmUgcG9zc2libGUgdG8gYnVpbGQgU2FtYmEKKyhqdXN0IHRoZSBmaWxlIHNlcnZlcikgd2l0aCBQ
eXRob24gdmVyc2lvbnMgMi42IGFuZCAyLjcuCisKK0FzIFB5dGhvbiAyLjcgaGFzIGJlZW4gRW5k
IE9mIExpZmUgdXBzdHJlYW0gc2luY2UgSmFudWFyeSAyMDIwLCBTYW1iYQoraXMgZHJvcHBpbmcg
QUxMIFB5dGhvbiAyLnggc3VwcG9ydCBpbiB0aGUgTkVYVCByZWxlYXNlLgorCitTYW1iYSA0LjE0
IHRvIGJlIHJlbGVhc2VkIGluIE1hcmNoIDIwMjEgd2lsbCByZXF1aXJlIFB5dGhvbiAzLjYgb3IK
K2xhdGVyIHRvIGJ1aWxkLgogCiB3aWRlIGxpbmtzIGZ1bmN0aW9uYWxpdHkKIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogCiBGb3IgdGhpcyByZWxlYXNlLCB0aGUgY29kZSBpbXBsZW1lbnRpbmcg
dGhlIGluc2VjdXJlICJ3aWRlIGxpbmtzID0geWVzIgogZnVuY3Rpb25hbGl0eSBoYXMgYmVlbiBt
b3ZlZCBvdXQgb2YgdGhlIGNvcmUgc21iZCBjb2RlIGFuZCBpbnRvIGEgc2VwYXJhdGUKLS0gCjIu
MjYuMgoK


--=-kOF3Xa7Br0dKTdh8PHSZ--


