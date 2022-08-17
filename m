Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC1596DDE
	for <lists+samba-technical@lfdr.de>; Wed, 17 Aug 2022 13:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=5eVl+tmzocwKBtQCIzRay1azYDF8Hx1ar9fi5IPt/cQ=; b=spAsOyo9xld3fgKBX5jFjXJvG/
	bqe7TQJelGPf4a5sjtG+J311l5GAbcmN7HLB87uZv8yZs2DlH9RzdDmLCVyFYJYhaxgAdT3cCN0bT
	PhLPxjIrmFa6SG9ArP4yXQUtUuYFJX4JnPplRFvbpynbmFbB3Fh6RbBwyAXq0TVCzBLGpZSSl2YMI
	zURRf6pzOO4gvhTtul75kVuTx/D6DZruNPPhVUwmqF/MZ9JZ9fE9izI8ibQDj4uOC24GslHBdfFJp
	S9bu3vb8rcumyNfWKbsYUdFNFhPOyL6BXlGp3TiDe7vyM/YV8COTHwZbdtLMI9JkKJA0iOf9VKjn+
	rcxEiszA==;
Received: from ip6-localhost ([::1]:51014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oOHef-000RSc-KO; Wed, 17 Aug 2022 11:56:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40486) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oOHeZ-000RST-9i
 for samba-technical@lists.samba.org; Wed, 17 Aug 2022 11:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=5eVl+tmzocwKBtQCIzRay1azYDF8Hx1ar9fi5IPt/cQ=; b=3SUnOFJ+DlsmhS8NdeJnxacHfr
 dVb9H91tGxU/uuWOFSShVRd6tjDMLHHl1Qy1SnWtfImfCiEnny4oSmQMBzLRlJH9ejtNhPx/ydUds
 1nrhiEfqZQf15P/Nu5l1l+u8tomKzxaPpVmF+eppe4k8IhC/K/nxffZ8NovFJe0oSnzr54ODyM7g/
 R5z8mwplw3u7HqPc2rIA2CZgeOWSk5wu62COFfA4DSFNqxK+GxsopQPwCViCb0+55EonayPHyRq4e
 pHLBHHk0g2LiB2ieCDtzykuaaQoIdaJbJnQxJeUAfXtOKqWYp4ao3Xv8F1Kc+JXCNkKQXu3AwbDZJ
 8Ga0nZ5/+bnDttF5/bANXPU3qDG2ef+aXde3zWkKSaP7J3XlouP3u37EZ2mLdQw+MLlf//e5M2lE8
 tGDBbVwDXYt1RY5086syLmFCHMUw0MCQXfm8k2U8UbpDMZiSvlNC5MZReX9ligG+lktweeuB3zpq8
 FuHDBavf/5IHutjeMNMiioDh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oOHeY-000XZK-Bj
 for samba-technical@lists.samba.org; Wed, 17 Aug 2022 11:56:06 +0000
Content-Type: multipart/mixed; boundary="------------rMQj8JnjEHl1UV0Qt7y0n4pd"
Message-ID: <686f397f-223c-d7d9-64ad-86f63f2f810f@samba.org>
Date: Wed, 17 Aug 2022 13:56:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: samba-technical <samba-technical@lists.samba.org>
Subject: [PATCH] WHATSNEW: document new volume serial number smb.conf,
 parameter
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
From: Christian Ambach via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christian Ambach <ambi@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------rMQj8JnjEHl1UV0Qt7y0n4pd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, forgot to add the new parameter to WHATSNEW while working on it.


Regards,
Christian
--------------rMQj8JnjEHl1UV0Qt7y0n4pd
Content-Type: text/plain; charset=UTF-8;
 name="0001-WHATSNEW-document-new-volume-serial-number-smb.conf-.patch"
Content-Disposition: attachment;
 filename*0="0001-WHATSNEW-document-new-volume-serial-number-smb.conf-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA1MDI4MGFkNGY0ZGEzYTYyYzQ2NTg5N2NkZTM3YzVkNzcyYjFhZjg4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaHJpc3RpYW4gQW1iYWNoIDxhbWJpQHNhbWJhLm9y
Zz4KRGF0ZTogV2VkLCAxNyBBdWcgMjAyMiAxMzoxNzoyOSArMDIwMApTdWJqZWN0OiBbUEFU
Q0hdIFdIQVRTTkVXOiBkb2N1bWVudCBuZXcgdm9sdW1lIHNlcmlhbCBudW1iZXIgc21iLmNv
bmYKIHBhcmFtZXRlcgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEFtYmFjaCA8YW1iaUBz
YW1iYS5vcmc+Ci0tLQogV0hBVFNORVcudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9XSEFUU05FVy50eHQgYi9XSEFUU05FVy50eHQK
aW5kZXggOTg4YzRjNjZlZDguLjYwZTcxZDRmNzllIDEwMDY0NAotLS0gYS9XSEFUU05FVy50
eHQKKysrIGIvV0hBVFNORVcudHh0CkBAIC0yMDQsNiArMjA0LDcgQEAgc21iLmNvbmYgY2hh
bmdlcwogICAtLS0tLS0tLS0tLS0tLSAgICAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0t
LS0tLS0gICAgIC0tLS0tLS0KICAgZG5zIHBvcnQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIE5ldyBkZWZhdWx0ICAgICA1MwogICBudCBoYXNoIHN0b3JlCQkJCSAgTmV3IHBh
cmFtZXRlciAgIGFsd2F5cworICB2b2x1bWUgc2VyaWFsIG51bWJlcgkJCSAgTmV3IHBhcmFt
ZXRlciAgIC0xCiAKIENIQU5HRVMgU0lOQ0UgNC4xNy4wcmMxCiA9PT09PT09PT09PT09PT09
PT09PT09PQotLSAKMi4xNy4xCgo=

--------------rMQj8JnjEHl1UV0Qt7y0n4pd--

