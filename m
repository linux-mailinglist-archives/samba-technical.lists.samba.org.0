Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A385D30734B
	for <lists+samba-technical@lfdr.de>; Thu, 28 Jan 2021 11:01:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kuTs/g0CP8WSCafELOXXIxuMzzXge4iLd2VxYTptIiQ=; b=wSnaH+X6mJLOl8wydnan5AAe8d
	eNza8bJoq8kfNIZIZIGp/sAj8trPRmuNlE4dZoDxR5V7W1breRdbjzyJqueSHNtf53Oub/x42TLpj
	jm9PZ2C9u5XibUEVamMy5xJ4yKfdjCp08fp7MiG1pxgEWuaXd5hN7O66sdjasF9AzvQMlAgJRe+Rn
	7YcSNmtcJrHVVL8w1hUS1PnT3abA5+mDrOr6fA4MleuwHw7gXZSRjw+6HTjIo/qPeIpUSWrrsGCdN
	znJArVR7wMDKBzy/smTkdBNPVXgkJmsuYBwpvAvAZ9SHRN7IiTwtc0XK2Lq3Llph0bTDxaXKPFP8T
	SBdCiwyw==;
Received: from ip6-localhost ([::1]:22786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l546d-007VFR-EX; Thu, 28 Jan 2021 10:00:51 +0000
Received: from [220.181.13.81] (port=54120 helo=m1381.mail.163.com) 
 by hr1.samba.org with smtp (Exim) id 1l546U-007V8f-Aq
 for samba-technical@lists.samba.org; Thu, 28 Jan 2021 10:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=C7fMl
 RR6R/o6UhKIER+r5mI2TAmmz+ys064KWvmOOuA=; b=GPpDHR6wQ/wt+LXT7xo92
 /URx+dQq2NxL8sIN8OaCck9H8TQwBUdvLXDxMoS48KrEZnYckUduVBPNWx+iNtJl
 Qb9JU9ufq3W55voWy4ZaRGmjyJpdr8grqwnhLqH4EvBH8abXoeiU9UtD7+PAyUjc
 sa50e4bF7Ggxf9jkQHinRw=
Received: from wuming_81$163.com ( [123.116.97.153] ) by
 ajax-webmail-wmsvr81 (Coremail) ; Thu, 28 Jan 2021 18:00:02 +0800 (CST)
X-Originating-IP: [123.116.97.153]
Date: Thu, 28 Jan 2021 18:00:02 +0800 (CST)
To: "Martin Schwenke" <martin@meltin.net>
Subject: Re:Re: about active/active clustered nfs with ctdb
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(ab4b390f)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
In-Reply-To: <20210128202516.40677c83@martins.ozlabs.org>
References: <387bc94a.4501.1772917b1cf.Coremail.wuming_81@163.com>
 <20210127204613.5735addd@martins.ozlabs.org>
 <545e1ab2.ef9.17746b3e063.Coremail.wuming_81@163.com>
 <20210128202516.40677c83@martins.ozlabs.org>
X-CM-CTRLDATA: wa3Py2Zvb3Rlcl9odG09NDA1Mjo1Ng==
MIME-Version: 1.0
Message-ID: <3cabb185.5677.177486f8025.Coremail.wuming_81@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: UcGowACnEOQiixJg5QC4AA--.47963W
X-CM-SenderInfo: pzxpx0ljbyiqqrwthudrp/1tbiTgMocFUDHfhVjQABs-
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

IkluIHlvdXIgc2NlbmFyaW8sIGlzIHRoZSBmaWxlc3lzdGVtIG9uIGVhY2ggTFVOIGFzc29jaWF0
ZWQgd2l0aCBhIHBhcnRpY3VsYXIgcHVibGljIElQIGFkZHJlc3M/Igp5ZXMKCgoiSXQgd291bGQg
YmUgZ29vZCBpZiB5b3UgY291bGQgZG8gdGhpcyB3aXRob3V0IG1vZGlmeWluZyAxMC5pbnRlcmZh
Y2UuIEl0IHdvdWxkIGJlIGJldHRlciBpZiB5b3UgY291bGQgZG8gaXQgYnkgYWRkaW5nIGEgbmV3
IGV2ZW50IHNjcmlwdC4iCnRoYW5rcy4KSSBhbSBzb3JyeSB0aGF0IEkgaGF2ZSBhbm90aGVyIHF1
ZXN0aW9uLgpyZWRoYXQgcHJvdmlkZXMgYW5vdGhlciBzb2x1dGlvbjoKaHR0cHM6Ly93d3cubGlu
dXh0ZWNoaS5jb20vY29uZmlndXJlLW5mcy1zZXJ2ZXItY2x1c3RlcmluZy1wYWNlbWFrZXItY2Vu
dG9zLTctcmhlbC03Lwp0aGV5IHVzZSBwYWNlbWFrZXIgdG8gbWFrZSBhbiBhY3RpdmUvcGFzc2l2
ZSAgbmZzIGNsdXN0ZXIuIGl0cyBnb2FsIGlzIHZlcnkgc2ltaWxhciB0byBtaW5lLiAKCgppZiB0
aGUgY2x1c3RlciBjb25zaXN0cyBvZiBqdXN0IHR3byBub2Rlcywgd2Uga25vdyB0aGF0IHRoZXJl
IGRvZXMgbm90IGV4aXN0IGEgY29ycmVjdCBhbGdvcml0aG0gZm9yIHRoZSBjb25zZW5zdXMgcHJv
YmxlbS4gVGhlIHBhY2VtYWtlciBzb2x1dGlvbiBvZiByZWRoYXQgdXNlcyBhIGZlbmNlIGRldmlj
ZSAod2UgY2FuIHVzZSBhIHNoYXJlZCBkaXNrLiBmb3IgZXhhbXBsZSBpc2NzaSBsdW4sIGFzIGEg
ZmVuY2luZyBkZXZpY2UpLCAgc28gaXQgbWF5IGJlIGNvcnJlY3QuCkJ1dCBJIGhhdmUgbm90IGZv
dW5kIGFueSBkb2MgYWJvdXQgZmVuY2UgZGV2aWNlIGFuZCBjdGRiLCBzbyBpbiB0aGVvcnkgbXkg
c29sdXRpb24gbWF5IGJlIG5vdCBjb3JyZWN0IGZvciB0d28tbm9kZXMgY2x1c3Rlci4KSSBhbSB2
ZXJ5IGN1cmlvdXMgaG93IGRvZXMgY3RkYiB0YWNrbGUgdGhlIHByb2JsZW0gb3IgdGhlIHByb2Js
ZW0gaXMgbm90IHRhY2tsZWQuCgoKaWYgYW55IGhvdy10b3Mgb3IgaW1wbGVtZW50YXRpb24vcHJp
bmNpcGxlIG9mIGN0ZGIgaXMgcHJvdmlkZWQgSSB3aWxsIGJlIGdsYWQuCnNvcnJ5IHRvIGJvdGhl
ci4gCnRoYW5rcyBmb3IgeW91ciByZXBseS4KQXQgMjAyMS0wMS0yOCAxNzoyNToxNiwgIk1hcnRp
biBTY2h3ZW5rZSIgPG1hcnRpbkBtZWx0aW4ubmV0PiB3cm90ZToKPkhtbW0uICBTb3JyeSwgSSBt
aWdodCBoYXZlIHJlYWQgdG9vIHF1aWNrbHkgYW5kIG1pc3VuZGVyc3Rvb2QuICA3MC5pc2NzaQo+
aXMgb25seSBkZXNpZ25lZCB0byBydW4gdGd0ZCBvbiBub2RlcyBhbmQgZXhwb3J0IExVTnMgZnJv
bSBwdWJsaWMgSVAKPmFkZHJlc3Nlcy4gSW4geW91ciBleGFtcGxlIHRoZSBub2RlcyBhcmUgaVND
U0kgY2xpZW50cywgbW91bnRpbmcgYQo+ZmlsZXN5c3RlbSBvbiB0aGUgTFVOIGFuZCBleHBvcnRp
bmcgaXQgdmlhIE5GUy4gIFRoYXQgaXMgdmVyeSBkaWZmZXJlbnQuCj4KPlNvcnJ5IGZvciB0aGUg
Y29uZnVzaW9uLgo+Cj5JbiB5b3VyIHNjZW5hcmlvLCBpcyB0aGUgZmlsZXN5c3RlbSBvbiBlYWNo
IExVTiBhc3NvY2lhdGVkIHdpdGggYQo+cGFydGljdWxhciBwdWJsaWMgSVAgYWRkcmVzcz8KPgo+
SXQgd291bGQgYmUgZ29vZCBpZiB5b3UgY291bGQgZG8gdGhpcyB3aXRob3V0IG1vZGlmeWluZyAx
MC5pbnRlcmZhY2UuCj5JdCB3b3VsZCBiZSBiZXR0ZXIgaWYgeW91IGNvdWxkIGRvIGl0IGJ5IGFk
ZGluZyBhIG5ldyBldmVudCBzY3JpcHQuCj4KPnBlYWNlICYgaGFwcGluZXNzLAo+bWFydGluCj4K
Pk9uIFRodSwgMjggSmFuIDIwMjEgMDk6NTU6MjkgKzA4MDAgKENTVCksILfnzt7D+yA8d3VtaW5n
XzgxQDE2My5jb20+Cj53cm90ZToKPgo+PiBtYXJ0aW4sIHRoYW5rcyBmb3IgeW91ciByZXBseS4K
Pj4gTm8sIEkgZGlkIG5vdCBtb2RpZnkgNzAuaXNjc2kuIE1heWJlIEkgbmVlZCB0byBtYWtlIGZ1
bGwgdW5kZXJzdGFuZGluZyBvZiBpdC4KPj4gCj4+IAo+PiBhZnRlciBtYW55IGRheXMgcmVhZGlu
Zy9kZWJ1Z2luZyB0aGUgc291cmNlIGNvZGUgb2YgY3RkYiBhbmQgaXRzIHNoZWxsIHNjcmlwdHMs
IEkgZm91bmQgdGhlIGtleSBwb2ludCBpbiB0aGUgc2NyaXB0IDEwLmludGVyZmFjZS4gCj4+IG15
IG1vZGlmaWNhdGlvbiAgaXM6Cj4+IDEgY3JlYXRlIG5mcyBzaGFyZShtb3VudCBmcywgbW9kaWZ5
IC9ldGMvZXhwb3J0cywgcmVzdGFydCBuZnMgc2VydmljZSAuLikgYmVmb3JlIGFueSBwdWJsaWMg
aXAgaXMgYWRkZWQgdG8gc29tZSBpbnRlcmZhY2UKPj4gMiBkZWxldGUgdGhlIGNvcnJlc3BvbmRp
bmcgbmZzIHNoYXJlIGFmdGVyIGFueSBwdWJsaWMgaXAgaXMgcmVtb3ZlZCBmcm9tIHNvbWUgaW50
ZXJmYWNlCj4+IAo+PiAKPj4gSSB0ZXN0ZWQgbWFueSBzaHV0ZG93bi1yZWJvb3QgY3ljbGVzIChv
ZiBub2RlIGluIGEgY3RkYiBjbHVzdGVyKSwgYW5kIHRoZSByZXN1bHRzIGFyZSB0aGUgc2FtZSBh
cyBteSBleHBlY3RhdGlvbi4KPj4gSSB0aGluayBJIG5lZWQgbW9yZSB0ZXN0cyBhbmQgbW9yZSBz
Y2VuYXJpbyB0ZXN0cy4K
