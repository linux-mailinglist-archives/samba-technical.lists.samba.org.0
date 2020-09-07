Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E022606D7
	for <lists+samba-technical@lfdr.de>; Tue,  8 Sep 2020 00:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=VMo0hXOKvdF42+n0J6JWih9FKvjGCSfOUFYoypKpVeM=; b=TrLsymUJTszmgwnXM11+cWg3Rq
	OYQaaY2exg6Sw/SpFL1/FsNDdz5mM72tlGgz+vAGqVrwCTHXx34+GMUlIVhaeEILOcKKfNZXBjsl1
	YXxEfw04zbbzMP/Rm42zCHoA6MKqhJIPDfIt8fY05KAiDMzAt1/B/NsLpcz+dp0+2OUhkOmJNemWL
	15l7fIOayRjJYis8WfOtBYPq8QsJEZ1pgc2J+vMYPNO/CUov2VeW1saIrfp/6Mu7jMDd7FZIfxpbq
	sJAh90RDuGxlxtVIA/MOmwRZlCIp0wDuTpGddpI+99DS8btfXP33bYA2qokVACMiuA2XgdgdXF/jT
	ittPYNaQ==;
Received: from localhost ([::1]:53602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFPT5-004YvV-SW; Mon, 07 Sep 2020 22:18:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50154) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFPSy-004YvO-Jp
 for samba-technical@lists.samba.org; Mon, 07 Sep 2020 22:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=VMo0hXOKvdF42+n0J6JWih9FKvjGCSfOUFYoypKpVeM=; b=4Du1aTSFCCCRBYhgctunjwMKT6
 Rm+3bzV5ZZ3whnf48x/QggFxDZY7SWgH5hx86MpdC/WBawrgIjQIBnpsU+5Ojuyq2qyBOHXW8I28+
 psOkPoj5AsPNPSVhaohuez/P39QYzOo5TAwczVzL4pXASbhG7EPzXR1M65rQQaJ0UwchLK1rDk3zj
 k5JcTPygXIUl/+s1CUINF0cdZ7DDbuC8OF24+9NsFTPDIekvPl2ZSXbGDPGb5arBWTPvQOQ+hsX54
 FF9sNT39hkNw3GWoppj65op+7bHX2kmQXJjw5ePsfl5fdejbBhIUpaWk+gJKsRYQxSH5midAO+Kig
 Qu6cValBN7nyRt9vGNIPFKiyrafmK4GFz6O3lnvNP2LJ1Wk+mX6xn9nEoU6wlCyp19yXf5rdJFFRP
 f47zCBQ6J6Nun5vMlE32gSAXuRHQUt+xXtVGvLjyue4pEAdupJP/0BqVJCxjtdH7C6cFz/ThBts9I
 iz8KA2z2m7zRRJKsUiT7dYCl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFPSv-0001y2-Pa; Mon, 07 Sep 2020 22:18:22 +0000
Message-ID: <7960be07410deb265299daf2e2af243b628f3d4d.camel@samba.org>
Subject: Re: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
To: Stefan Metzmacher <metze@samba.org>, Karolin Seeger <kseeger@samba.org>
Date: Tue, 08 Sep 2020 10:17:54 +1200
In-Reply-To: <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
 <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
 <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
Content-Type: multipart/mixed; boundary="=-f72pwyI0dzdm+EZc6HQE"
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


--=-f72pwyI0dzdm+EZc6HQE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-07 at 09:58 +0200, Stefan Metzmacher wrote:
> Am 06.09.20 um 08:14 schrieb Andrew Bartlett via samba-technical:
> > On Sun, 2020-09-06 at 01:08 -0400, Nico Kadel-Garcia via samba-
> > technical wrote:
> > > MacOS has working python3 according to my developer friends. Any
> > > operating still based on python3 is so old that it should *not* be
> > > running a contemporary Samba server, only perhaps cifs-utils for
> > > mounting from Windows or Samba servers on a more contemporary and
> > > securable operating system.
> > 
> > Thanks all for your positive feedback.
> > 
> > Without pre-empting the remainder discussion attached is a proposed
> > patch for the WHATSNEW for the pending 4.13.
> > 
> > This gives our users fair warning.  We can then change the build system
> > at our leisure (giving us a little more time for user feedback).
> > 
> > To be clear, I'm not proposing changing the actual code in master yet,
> > please do continue to send in your feedback.  
> > 
> > (Even after such a warning is given in 4.13 we can still change our
> > minds, but our users will have been warned). 
> 
> I guess you mean: we'll remove support for Python 2.6 as well as 2.7?
> This is not really clear from the WHATSNEW entry.

I'm sorry it was not clear, yes I mean all Python 2.x support will be
gone so we can focus on Python 3.6 and above.

Let me know if this new patch is clearer.

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba


--=-f72pwyI0dzdm+EZc6HQE
Content-Disposition: attachment;
	filename*0=0001-WHATSNEW-Announce-the-end-of-Python-2.6-2.7-support-.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-WHATSNEW-Announce-the-end-of-Python-2.6-2.7-support-.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBjODcwNjY1NTBjNmM5OTM3NDE5ZTNmNzgxMzI3MGM4OWQ0M2JlNTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQmFydGxldHQgPGFiYXJ0bGV0QHNhbWJhLm9yZz4K
RGF0ZTogU3VuLCA2IFNlcCAyMDIwIDE4OjA3OjI5ICsxMjAwClN1YmplY3Q6IFtQQVRDSF0gV0hB
VFNORVc6IEFubm91bmNlIHRoZSBlbmQgb2YgUHl0aG9uIDIuNi8yLjcgc3VwcG9ydCB0byBidWls
ZAogU2FtYmEKClRoaXMgaXMgYSB3YXJuaW5nIGZvciA0LjE0LCB0byBnaXZlIHVzZXJzIHRoZSBu
b3JtYWwgZGVwcmVjYXRpb24Kbm90aWNlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IEJhcnRsZXR0
IDxhYmFydGxldEBzYW1iYS5vcmc+Ci0tLQogV0hBVFNORVcudHh0IHwgMTAgKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9XSEFUU05FVy50eHQgYi9XSEFUU05FVy50eHQKaW5kZXggODFkOTMwMGRmOTQuLjQ5Y2U3
ZTc2ZTBhIDEwMDY0NAotLS0gYS9XSEFUU05FVy50eHQKKysrIGIvV0hBVFNORVcudHh0CkBAIC0y
NCw4ICsyNCwxNCBAQCBTYW1iYSdzIG1pbmltdW0gcnVudGltZSByZXF1aXJlbWVudCBmb3IgcHl0
aG9uIHdhcyByYWlzZWQgdG8gUHl0aG9uCiAzLjYgYm90aCB0byBhY2Nlc3MgbmV3IGZlYXR1cmVz
IGFuZCBiZWNhdXNlIHRoaXMgaXMgdGhlIG9sZGVzdCB2ZXJzaW9uCiB3ZSB0ZXN0IHdpdGggaW4g
b3VyIENJIGluZnJhc3RydWN0dXJlLgogCi0oQnVpbGQgdGltZSBzdXBwb3J0IGZvciB0aGUgZmls
ZSBzZXJ2ZXIgd2l0aCBQeXRob24gMi42IGhhcyBub3QKLWNoYW5nZWQpCitUaGlzIGlzIGFsc28g
dGhlIGxhc3QgcmVsZWFzZSB3aGVyZSBpdCB3aWxsIGJlIHBvc3NpYmxlIHRvIGJ1aWxkIFNhbWJh
CisoanVzdCB0aGUgZmlsZSBzZXJ2ZXIpIHdpdGggUHl0aG9uIHZlcnNpb25zIDIuNiBhbmQgMi43
LgorCitBcyBQeXRob24gMi43IGhhcyBiZWVuIEVuZCBPZiBMaWZlIHVwc3RyZWFtIHNpbmNlIEph
bnVhcnkgMjAyMCwgU2FtYmEKK2lzIGRyb3BwaW5nIEFMTCBQeXRob24gMi54IHN1cHBvcnQgaW4g
dGhlIE5FWFQgcmVsZWFzZS4KKworU2FtYmEgNC4xNCB0byBiZSByZWxlYXNlZCBpbiBNYXJjaCAy
MDIxIHdpbGwgcmVxdWlyZSBQeXRob24gMy42IHRvCitidWlsZC4KIAogd2lkZSBsaW5rcyBmdW5j
dGlvbmFsaXR5CiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLS0gCjIuMjYuMgoK


--=-f72pwyI0dzdm+EZc6HQE--


