Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65051306ACA
	for <lists+samba-technical@lfdr.de>; Thu, 28 Jan 2021 02:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5xCfCS58NjF3zH4riLTWGdq9+lYGtbCw4ScNeQZsZIc=; b=0mEi5iqvQNtOtfpq/WtXodcXOR
	sC8RwOaxsuNJ6P3WBbK4vSRv0XsWsct7SK8V1p+tXENC2IK+aEN8GS07T8Jv1XHM9fSr/SHKkr+H9
	8AzqomMIAojGQl6W5TosDTwW/kM2g2zB9IWksebBf6E6c4dhqvfq/XZVU4wjzHYY8dNyEdd+1zKBE
	6Nzt8cbX63pRbE/QoWGkjEForD66hqth2JvwD88aS4v3TkUW4jFwSsTRDR7GBj7H6xOdERsgo9Dx3
	2vDFrIrdKGFsI8ilvtwGJOdSZ8beyG/KmCElajwyqw7EuUuNbUJmNnw/FKzdYhTYYfkPurL6fmkf2
	zXNp6TWA==;
Received: from ip6-localhost ([::1]:63156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4wXd-007TUp-Ky; Thu, 28 Jan 2021 01:56:13 +0000
Received: from m13128.mail.163.com ([220.181.13.128]:59415) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4wXR-007TTh-4H
 for samba-technical@lists.samba.org; Thu, 28 Jan 2021 01:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=MsPq8
 ZSwwnW4YDHNfuhg67GLdl/2S3t2SIbAeE3e47g=; b=NNn00wGmsK6SC4M/2DIRX
 /Nv/Sgc0hh1TB5qzwpSY/pLIcA6f4xTzT9H9GUtc/cxVEuZSgG6xBmY74/1iBG9I
 WQyN+aaqONeLcXMFofgp1unwAAvdAeQi5kwYANGkI9ilDZmUo+mIUcG16OaQJ36V
 dYrMQk/v5pTRB1zRDN8J+s=
Received: from wuming_81$163.com ( [123.116.97.153] ) by
 ajax-webmail-wmsvr128 (Coremail) ; Thu, 28 Jan 2021 09:55:29 +0800 (CST)
X-Originating-IP: [123.116.97.153]
Date: Thu, 28 Jan 2021 09:55:29 +0800 (CST)
To: "Martin Schwenke" <martin@meltin.net>
Subject: Re:Re: about active/active clustered nfs with ctdb
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(ab4b390f)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
In-Reply-To: <20210127204613.5735addd@martins.ozlabs.org>
References: <387bc94a.4501.1772917b1cf.Coremail.wuming_81@163.com>
 <20210127204613.5735addd@martins.ozlabs.org>
X-CM-CTRLDATA: tgNUXmZvb3Rlcl9odG09MzkyMzo1Ng==
MIME-Version: 1.0
Message-ID: <545e1ab2.ef9.17746b3e063.Coremail.wuming_81@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gMGowAD3_0ORGRJgVoS3AA--.39305W
X-CM-SenderInfo: pzxpx0ljbyiqqrwthudrp/1tbiHhEocFSIsi8tMgAAsJ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64
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
From: =?utf-8?b?6aOO5peg5ZCNIHZpYSBzYW1iYS10ZWNobmljYWw=?=
 <samba-technical@lists.samba.org>
Reply-To: =?GBK?B?t+fO3sP7?= <wuming_81@163.com>
Cc: =?GBK?Q?=B7=E7=CE=DE=C3=FB_via_samba-technical?=
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

bWFydGluLCB0aGFua3MgZm9yIHlvdXIgcmVwbHkuCk5vLCBJIGRpZCBub3QgbW9kaWZ5IDcwLmlz
Y3NpLiBNYXliZSBJIG5lZWQgdG8gbWFrZSBmdWxsIHVuZGVyc3RhbmRpbmcgb2YgaXQuCgoKYWZ0
ZXIgbWFueSBkYXlzIHJlYWRpbmcvZGVidWdpbmcgdGhlIHNvdXJjZSBjb2RlIG9mIGN0ZGIgYW5k
IGl0cyBzaGVsbCBzY3JpcHRzLCBJIGZvdW5kIHRoZSBrZXkgcG9pbnQgaW4gdGhlIHNjcmlwdCAx
MC5pbnRlcmZhY2UuIApteSBtb2RpZmljYXRpb24gIGlzOgoxIGNyZWF0ZSBuZnMgc2hhcmUobW91
bnQgZnMsIG1vZGlmeSAvZXRjL2V4cG9ydHMsIHJlc3RhcnQgbmZzIHNlcnZpY2UgLi4pIGJlZm9y
ZSBhbnkgcHVibGljIGlwIGlzIGFkZGVkIHRvIHNvbWUgaW50ZXJmYWNlCjIgZGVsZXRlIHRoZSBj
b3JyZXNwb25kaW5nIG5mcyBzaGFyZSBhZnRlciBhbnkgcHVibGljIGlwIGlzIHJlbW92ZWQgZnJv
bSBzb21lIGludGVyZmFjZQoKCkkgdGVzdGVkIG1hbnkgc2h1dGRvd24tcmVib290IGN5Y2xlcyAo
b2Ygbm9kZSBpbiBhIGN0ZGIgY2x1c3RlciksIGFuZCB0aGUgcmVzdWx0cyBhcmUgdGhlIHNhbWUg
YXMgbXkgZXhwZWN0YXRpb24uCkkgdGhpbmsgSSBuZWVkIG1vcmUgdGVzdHMgYW5kIG1vcmUgc2Nl
bmFyaW8gdGVzdHMuCgpUaGFua3MgZm9yIGFueW9uZSdzIGFkdmljZS4KCgoKCgoKCgpBdCAyMDIx
LTAxLTI3IDE3OjQ2OjEzLCAiTWFydGluIFNjaHdlbmtlIiA8bWFydGluQG1lbHRpbi5uZXQ+IHdy
b3RlOgo+SGksCj4KPk9uIEZyaSwgMjIgSmFuIDIwMjEgMTU6NTU6NTQgKzA4MDAgKENTVCksILfn
zt7D+yB2aWEgc2FtYmEtdGVjaG5pY2FsCj48c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9y
Zz4gd3JvdGU6Cj4KPj4gSSB3YW50IHRvIGJ1aWxkIGEgbmZzIGNsdXN0ZXI6Cj4+IAo+PiAxKSB0
aGUgbmZzIGNsdXN0ZXIgIGNvbnNpc3RzIG9mIHRocmVlIG5vZGVzKGxpbnV4IHNlcnZlcnMpCj4+
IAo+PiAyKSBlYWNoIG5vZGUgaGFzICBsb2dpbmVkIGFuIGlzY3NpIGx1biwgaS5lLgo+PiAKPj4g
bm9kZV8xIC0+IGx1bl8xCj4+IAo+PiBub2RlXzIgLT4gbHVuXzIKPj4gCj4+IG5vZGVfMyAtPiBs
dW5fMwo+PiAKPj4gMykgbWFrZSB4ZnMgZmlsZSBzeXN0ZW0gb24gZWFjaCBsdW4KPj4gCj4+IDQp
IGV4cG9ydCBlYWNoIHhmcyBmaWxlIHN5c3RlbSB2aWEgTkZTCj4+IAo+PiBub2RlXzEgLT4gbHVu
XzEtPiAvc2hhcmUtMQo+PiAKPj4gbm9kZV8yIC0+IGx1bl8yLT4gL3NoYXJlLTIKPj4gCj4+IG5v
ZGVfMyAtPiBsdW5fMy0+IC9zaGFyZS0zCj4+IAo+PiA1KSBjdGRiIGRpc3RyaWJ1dGVzIHB1Ymxp
YyBpcHMgdG8gdGhlIG5vZGVzCj4+IAo+PiAKPj4gCj4+IAo+PiBpZiBvbmUgbm9kZSBpcyBmYWls
ZWQsIGN0ZGIgcmVkaXN0cmlidXRlcyBpdHMgcHVibGljIGlwIHRvIGFub3RoZXIgbGl2aW5nIG5v
ZGUuCj4+IAo+PiBhbmQgdGhlIHNoZWxsIHNjcmlwdHMgZXhlY3V0ZWQgYnkgY3RkYiBvbiB0aGUg
bm9kZSwgd2lsbCBtb3VudCB0aGUgZmlsZSBzeXN0ZW0sIHJlc3RhcnQgbmZzIHNlcnZpY2UgZXRj
Lgo+PiAKPj4gaWYgdGhlIGZhaWxlZCBub2RlIHJlc3RhcnRzLCBzaW1pbGFyIHN0ZXBzIGV4ZWN1
dGUuCj4+IAo+PiAKPj4gCj4+IAo+PiBJIGhhdmUgd3JpdHRlbiBzb21lIHNoZWxsIHNjcmlwdHMg
dG8gaW1wbGVtZW50IHRoZSBhYm92ZSBwcm9jZXNzLgo+PiAKPj4gSSBob3BlIHRoYXQgZHVyaW5n
IHRoZSBsdW4vc2VydmljZSBtb3ZpbmcgcHJvY2VzcywgCj4+IAo+PiB0aGUgZmlsZSBpbyBvbiB0
aGUgbW91bnQgcG9pbnRzIG9mIHRoZSBjb3JyZXNwb25kaW5nIGx1biBpcyBibG9ja2VkIGZvciBv
bmUgb3IgdHdvIG1pbnV0ZXMgYW5kIHN1Y2NlZWRzIGFmdGVyIHRoZSBtb3ZpbmcgcHJvY2VzcyBj
b21wbGV0ZWQuIAo+PiAKPj4gCj4+IAo+PiAKPj4gTXkgdGVzdCByZXN1bHQgaXM6Cj4+IAo+PiBz
Y2VuYXJpbyAxOiBvbmUgbm9kZSBmYWlsZWQsIGFub3RoZXIgdGFrZXMgb3ZlciBpdHMgc2Vydmlj
ZQo+PiAKPj4gdGhlIGZpbGUgaW8gb24gdGhlIG1vdW50IHBvaW50IHdpbGwgYmUgYmxvY2tlZCBh
bG1vc3QgZXZlcnl0aW1lCj4+IAo+PiAKPj4gCj4+IAo+PiBzY2VuYXJpbyAyOiBmYWlsZWQgbm9k
ZSByZXN0YXJ0cwo+PiAKPj4gdGhlIGZpbGUgaW8gb24gdGhlIG1vdW50IHBvaW50IHNvbWV0aW1l
cyBpcyBibG9ja2VkLCBzb21ldGltZXMgdGhlIGlvKG9wZW4sIHdyaXRlKSAgd2lsbCBlbmNvdW50
ZXIgc29tZSBlcnJvci4KPj4gCj4+IAo+PiAKPj4gCj4+IGNvdWxkIEkgYWNoaWV2ZSBteSBnb2Fs
IGp1c3QgdGhyb3VnaCBtb2RpZnlpbmcvcmV3cml0aW5nIHRoZSBzaGVsbCBzY3JpcHQ/IAo+PiAK
Pj4gb3IgbXVzdCBJIG1vZGlmeSB0aGUga2VybmVsIG5mcyBvciBjdGRiPyAKPgo+QXJlIHlvdSB1
c2luZyBDVERCJ3MgNzAuaXNjc2kgZXZlbnQgc2NyaXB0IGZvciB0aGlzIGFuZCBhZGRpbmcgdGhl
Cj5leHRyYSBzY3JpcHRzIHRoYXQgaXQgc3VnZ2VzdHM/Cj4KPlVuZm9ydHVuYXRlbHksIGFsdGhv
dWdoIEkgYW0gb25lIG9mIHRoZSBDVERCIGRldmVsb3BlcnMsIEkgZG9uJ3QgdGhpbmsKPkkgaGF2
ZSBldmVyIHRlc3RlZCB0aGlzIHNjcmlwdCBzbyBJIGFtIG5vdCBzdXJlIGhvdyByZWxpYWJsZSBp
dCBpcy4gIDotKAo+Cj5JJ20gQ0M6aW5nIFJvbm5pZSwgd2hvIG9yaWdpbmFsbHkgd3JvdGUgdGhp
cyBldmVudCBzY3JpcHQsIHRvIHNlZSBpZiBoZQo+aGFzIGFueSBhZHZpY2UgZm9yIHlvdS4uLiBp
ZiBoZSBjYW4gcmVtZW1iZXIgdGhpcyBhdCBhbGwuLi4gIDotKQo+Cj5wZWFjZSAmIGhhcHBpbmVz
cywKPm1hcnRpbgo=
