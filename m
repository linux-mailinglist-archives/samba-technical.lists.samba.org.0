Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAC226227A
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 00:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=XijzxB7heZsRvFS1VvW7TqRKJR40uubfioZBxyb6hDk=; b=dq0QTTMlM0DzSd1PNhoesQxHTW
	LSrKhlR0bAZnoVvUeWNXRykQUFWuhmZvg0xS2I4KArSpM0/g8XHfqoj5z8SxW/FLs0Vk3eyBDokPg
	iYUrg0+FSNs1Ga/gHwtrnOf3FZDIdahvTq9lhMB/7jVdo8CYOeD/w9ssLNB/zYfosSO0bdKMzevSV
	fhV2Qsl6xAmymD2ZwVCBmqd0e84BzM6ICRd+LiOQO8nnF0xyy4wjxWeXK5nOZoMqHpOfhJ9KOIuSn
	f1bcFbTAb8NyD/YmUkuX1UNi3XvIcqcG/BSTn6994OjjQmFmjyuPFC42l/bqtQagWza0POeFHAD1V
	iH69CPaQ==;
Received: from localhost ([::1]:55144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFlsU-004hwr-Fl; Tue, 08 Sep 2020 22:14:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15684) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFlsO-004hwk-VX
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 22:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=XijzxB7heZsRvFS1VvW7TqRKJR40uubfioZBxyb6hDk=; b=llGy7o0U+I01bFaEeMY2ShLRml
 +n+4/azmfQATq+ow9B57+gcTP26Wb/OOF0NDfLY/a6LbAo6QJoPBnTKhoH1T2X72xZXXk1qQeNXCn
 8jABW3iKM0DGJ4oVDtaPK3Ucxf8PwJaHf2GR5nScd7Bf198JIpAo4c+nuCDW+jWo/QIc7AcCnSVAg
 oaxKpuvAim/sTvVEoWN6kSsLBJqsoLk2Gwi1CkzTJ8fi3gE3v341NdqalZoxNu4yE97DFz7Cd5y1U
 hAXEjz2EPxLSe6JNqybaHNVyU93bz2MqftDSVWjtT41RLpl18cZKJu5HuFeDfMPMNhMmKSRylK4pC
 cPgR1BkQSKa9VfZYPnYXWvVuKBokBuGhGyZK0ldN9MnGGLjnk/KcUA+QPMlhl+70UzKAmSIguVBYs
 buk/DwVd25Jaj1KGTmi9wVOae/hU59tm8dWaNBFrzNNMBJ4sfaOqtevTai3DRRc7M4UJy3mnFGwtw
 GTXa/mViI4H+PXCPq/iEuVYd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFlsL-0005kC-DG; Tue, 08 Sep 2020 22:14:06 +0000
Message-ID: <474e16eb49402c024b8b4f8f2f6183dae929f6d7.camel@samba.org>
Subject: Re: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, Alexander Bokovoy
 <ab@samba.org>, Jeremy Allison <jra@samba.org>
Date: Wed, 09 Sep 2020 10:14:00 +1200
In-Reply-To: <fece1ff9-f0c8-ab82-6aba-fa3810ca387f@catalyst.net.nz>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
 <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
 <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
 <7960be07410deb265299daf2e2af243b628f3d4d.camel@samba.org>
 <20200908161627.GB599978@jeremy-acer>
 <20200908165820.GB23377@pinega.vda.li>
 <d5a31f2fdfcfd03813cd3cc9ee862af2aad5d5ed.camel@samba.org>
 <fece1ff9-f0c8-ab82-6aba-fa3810ca387f@catalyst.net.nz>
Content-Type: multipart/mixed; boundary="=-acPk0x8KxnIC/E1DkoWC"
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


--=-acPk0x8KxnIC/E1DkoWC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-09 at 09:59 +1200, Douglas Bagnall wrote:
> On 9/09/20 9:16 am, Andrew Bartlett via samba-technical wrote:
> 
> > Thanks!  I love bike sheds
> 
> Well in that case,
> 
> the final release of Python 2 was on 2020-04-20, not 2020-01-01 as
> suggested in the patch.
> 
> https://www.python.org/downloads/release/python-2718/

Fixed!

Any more?  I've got all day! ;-)

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba


--=-acPk0x8KxnIC/E1DkoWC
Content-Disposition: attachment;
	filename*0=0001-WHATSNEW-Announce-the-end-of-Python-2.6-2.7-support-.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-WHATSNEW-Announce-the-end-of-Python-2.6-2.7-support-.patch";
	charset="UTF-8"

RnJvbSAwODgyMzg3M2U4NmM4MDg1MDllMmQ5YTBmNWQ3MWNkZDBlOGZiOGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQmFydGxldHQgPGFiYXJ0bGV0QHNhbWJhLm9yZz4K
RGF0ZTogU3VuLCA2IFNlcCAyMDIwIDE4OjA3OjI5ICsxMjAwClN1YmplY3Q6IFtQQVRDSF0gV0hB
VFNORVc6IEFubm91bmNlIHRoZSBlbmQgb2YgUHl0aG9uIDIuNi8yLjcgc3VwcG9ydCB0byBidWls
ZAogU2FtYmEKClRoaXMgaXMgYSB3YXJuaW5nIGZvciA0LjE0LCB0byBnaXZlIHVzZXJzIHRoZSBu
b3JtYWwgZGVwcmVjYXRpb24Kbm90aWNlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IEJhcnRsZXR0
IDxhYmFydGxldEBzYW1iYS5vcmc+Ci0tLQogV0hBVFNORVcudHh0IHwgMTQgKysrKysrKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL1dIQVRTTkVXLnR4dCBiL1dIQVRTTkVXLnR4dAppbmRleCA4MWQ5MzAwZGY5NC4u
Y2MzMjdiOGJkOTMgMTAwNjQ0Ci0tLSBhL1dIQVRTTkVXLnR4dAorKysgYi9XSEFUU05FVy50eHQK
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
IE9mIExpZmUgdXBzdHJlYW0gc2luY2UgQXByaWwgMjAyMCwgU2FtYmEKK2lzIGRyb3BwaW5nIEFM
TCBQeXRob24gMi54IHN1cHBvcnQgaW4gdGhlIE5FWFQgcmVsZWFzZS4KKworU2FtYmEgNC4xNCB0
byBiZSByZWxlYXNlZCBpbiBNYXJjaCAyMDIxIHdpbGwgcmVxdWlyZSBQeXRob24gMy42IG9yCits
YXRlciB0byBidWlsZC4KIAogd2lkZSBsaW5rcyBmdW5jdGlvbmFsaXR5CiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIAogRm9yIHRoaXMgcmVsZWFzZSwgdGhlIGNvZGUgaW1wbGVtZW50aW5nIHRo
ZSBpbnNlY3VyZSAid2lkZSBsaW5rcyA9IHllcyIKIGZ1bmN0aW9uYWxpdHkgaGFzIGJlZW4gbW92
ZWQgb3V0IG9mIHRoZSBjb3JlIHNtYmQgY29kZSBhbmQgaW50byBhIHNlcGFyYXRlCi0tIAoyLjI2
LjIKCg==


--=-acPk0x8KxnIC/E1DkoWC--


