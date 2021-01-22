Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B479D2FFDEE
	for <lists+samba-technical@lfdr.de>; Fri, 22 Jan 2021 09:12:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=0cvST3RJFOtT0ClqJBLGeeybSjhLoRvcV4Io2eRY5SY=; b=z41WezU+ee8PRoPF+rBC9CfNcU
	Re2uBMdP2Ul6+dLH/dSh5KiLwv1rlkQ91I+kZAGtEmOElTsgPQ+aEU/Iz0h96O3XPRMaac4aps6ud
	Pw7MAwG3U3ZY9sSXa5KnPYrLWUnV5V2j8j4a2ZtE+1/cZRZgu3fRJ/q3DJavly7EI2OKd5qvGpYiI
	HM+C0uLL4XByZzsmLANB6mcqMwnMDAmpNuyvTFIzViWLmshFt/FtIdp2xgkfhiN2AwJmy/yiJ6KHZ
	4Hzor1418eb9P2VOjExo+TLIksBt+S44/E+vRh7/kfDKkEC/eQ5UgB8//YvyGmCJ4D95+d2P8IeqO
	T85nsf0w==;
Received: from ip6-localhost ([::1]:52080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l2rY0-006bdZ-UU; Fri, 22 Jan 2021 08:12:01 +0000
Received: from m1343.mail.163.com ([220.181.13.43]:25635) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l2rXt-006bdS-PH
 for samba-technical@lists.samba.org; Fri, 22 Jan 2021 08:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=piK8/
 DKmS4PvxInOYttS02heoAA4G1itDLEuZ3cd5ok=; b=aoI7XMRiOqYHADgVvt/6x
 yVNgpFCLl4jEV9GxTSmeuA7589ilF0BzT7mNndpFBrz2GJjEQ8VmbaDGchIXz5WS
 oLuK4JgdOxo210CkrCdoMQx1SP+82mkQEDTm85IV6UKrYsVrxnSoJasXD9sQ2gTH
 SGz4TWSJML8cD6XWhNwvZw=
Received: from wuming_81$163.com ( [111.198.235.47] ) by
 ajax-webmail-wmsvr43 (Coremail) ; Fri, 22 Jan 2021 15:55:54 +0800 (CST)
X-Originating-IP: [111.198.235.47]
Date: Fri, 22 Jan 2021 15:55:54 +0800 (CST)
To: samba-technical@lists.samba.org
Subject: about active/active clustered nfs with ctdb
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(ab4b390f)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
X-CM-CTRLDATA: 3/C9f2Zvb3Rlcl9odG09MjcxMDo1Ng==
MIME-Version: 1.0
Message-ID: <387bc94a.4501.1772917b1cf.Coremail.wuming_81@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: K8GowAC3JO8KhQpgZBC1AA--.54383W
X-CM-SenderInfo: pzxpx0ljbyiqqrwthudrp/1tbiThoicFUDHX32qQABsu
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

aGVsbG8gZXZlcnlvbmUuCgpJIHdhbnQgdG8gYnVpbGQgYSBuZnMgY2x1c3RlcjoKCjEpIHRoZSBu
ZnMgY2x1c3RlciAgY29uc2lzdHMgb2YgdGhyZWUgbm9kZXMobGludXggc2VydmVycykKCjIpIGVh
Y2ggbm9kZSBoYXMgIGxvZ2luZWQgYW4gaXNjc2kgbHVuLCBpLmUuCgpub2RlXzEgLT4gbHVuXzEK
Cm5vZGVfMiAtPiBsdW5fMgoKbm9kZV8zIC0+IGx1bl8zCgozKSBtYWtlIHhmcyBmaWxlIHN5c3Rl
bSBvbiBlYWNoIGx1bgoKNCkgZXhwb3J0IGVhY2ggeGZzIGZpbGUgc3lzdGVtIHZpYSBORlMKCm5v
ZGVfMSAtPiBsdW5fMS0+IC9zaGFyZS0xCgpub2RlXzIgLT4gbHVuXzItPiAvc2hhcmUtMgoKbm9k
ZV8zIC0+IGx1bl8zLT4gL3NoYXJlLTMKCjUpIGN0ZGIgZGlzdHJpYnV0ZXMgcHVibGljIGlwcyB0
byB0aGUgbm9kZXMKCgoKCmlmIG9uZSBub2RlIGlzIGZhaWxlZCwgY3RkYiByZWRpc3RyaWJ1dGVz
IGl0cyBwdWJsaWMgaXAgdG8gYW5vdGhlciBsaXZpbmcgbm9kZS4KCmFuZCB0aGUgc2hlbGwgc2Ny
aXB0cyBleGVjdXRlZCBieSBjdGRiIG9uIHRoZSBub2RlLCB3aWxsIG1vdW50IHRoZSBmaWxlIHN5
c3RlbSwgcmVzdGFydCBuZnMgc2VydmljZSBldGMuCgppZiB0aGUgZmFpbGVkIG5vZGUgcmVzdGFy
dHMsIHNpbWlsYXIgc3RlcHMgZXhlY3V0ZS4KCgoKCkkgaGF2ZSB3cml0dGVuIHNvbWUgc2hlbGwg
c2NyaXB0cyB0byBpbXBsZW1lbnQgdGhlIGFib3ZlIHByb2Nlc3MuCgpJIGhvcGUgdGhhdCBkdXJp
bmcgdGhlIGx1bi9zZXJ2aWNlIG1vdmluZyBwcm9jZXNzLCAKCnRoZSBmaWxlIGlvIG9uIHRoZSBt
b3VudCBwb2ludHMgb2YgdGhlIGNvcnJlc3BvbmRpbmcgbHVuIGlzIGJsb2NrZWQgZm9yIG9uZSBv
ciB0d28gbWludXRlcyBhbmQgc3VjY2VlZHMgYWZ0ZXIgdGhlIG1vdmluZyBwcm9jZXNzIGNvbXBs
ZXRlZC4gCgoKCgpNeSB0ZXN0IHJlc3VsdCBpczoKCnNjZW5hcmlvIDE6IG9uZSBub2RlIGZhaWxl
ZCwgYW5vdGhlciB0YWtlcyBvdmVyIGl0cyBzZXJ2aWNlCgp0aGUgZmlsZSBpbyBvbiB0aGUgbW91
bnQgcG9pbnQgd2lsbCBiZSBibG9ja2VkIGFsbW9zdCBldmVyeXRpbWUKCgoKCnNjZW5hcmlvIDI6
IGZhaWxlZCBub2RlIHJlc3RhcnRzCgp0aGUgZmlsZSBpbyBvbiB0aGUgbW91bnQgcG9pbnQgc29t
ZXRpbWVzIGlzIGJsb2NrZWQsIHNvbWV0aW1lcyB0aGUgaW8ob3Blbiwgd3JpdGUpICB3aWxsIGVu
Y291bnRlciBzb21lIGVycm9yLgoKCgoKY291bGQgSSBhY2hpZXZlIG15IGdvYWwganVzdCB0aHJv
dWdoIG1vZGlmeWluZy9yZXdyaXRpbmcgdGhlIHNoZWxsIHNjcmlwdD8gCgpvciBtdXN0IEkgbW9k
aWZ5IHRoZSBrZXJuZWwgbmZzIG9yIGN0ZGI/IAoKCgoKdGhhbmtzIGZvciBhbnkgcmVzcG9uc2Uv
YWR2aWNlLg==
