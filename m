Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F630EE9
	for <lists+samba-technical@lfdr.de>; Fri, 31 May 2019 15:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=f7xfmr89Ux9y3MNUBkaN9AOeZkVHqJMBrmAj3zSHtnE=; b=Ud3IfwtJ/ebjPRyN1TY549e0Hy
	Mc3jwGQT4O+95uDwY7FRuAau8MvEhacHrbuuUUXibXtWEo/vTizXdan/p2ZQhSeYIPkjqpXEGZzXV
	Kii9kEAFOypdMZq1Qj/H+9FSWbSQ+TmkZtISADnZ9rbtGwkdH2zy34ryyDMjBu9dc8iB83Fcg8Via
	L4hQLHl8OE5aC5EpDou39D/vqr5eld4lFyFVRtB5tMFxEg42Uha57ITRD9+b9tivfbo9wk+o2lTbZ
	MikgbY3xdd6QrWSWQD3slntERI9bBYEdph38BcBQEkY+Y3BGFkS+Eyi/Sq+YR7QoZL9imTyRR23oR
	nitjdxEQ==;
Received: from localhost ([::1]:23220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hWhfP-002kKn-R5; Fri, 31 May 2019 13:33:55 +0000
Received: from mo6-p00-ob.smtp.rzone.de ([2a01:238:20a:202:5300::9]:12293) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hWhfL-002kKg-R2
 for samba-technical@lists.samba.org; Fri, 31 May 2019 13:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559309631;
 s=strato-dkim-0002; d=giantdisaster.de;
 h=Date:Message-ID:To:Subject:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=f7xfmr89Ux9y3MNUBkaN9AOeZkVHqJMBrmAj3zSHtnE=;
 b=PChh1gzQosEDc3fNnjE95RDGkJa5baGFn59GWEVQHxV20jqOJ9ZeMcdO1sZE8TkvlY
 l4GiyUIUm2T2N9W4mACQhQgulF4oFqtwdo5fdBQog1rv4xeSCqVErOqcW22aPhHQwyrC
 ad4uyn0wF7PlArB2kqieYHAQkVMwr9fl3akyToEN+0uXi2f3wXWdC1Nqd57ENqK5umWW
 InfXkLae+Vnh6buOdtTqHBgdDlDQGYrAH9VZpmNR7ckzOoeHqLyM5vg39+jO/zydNrko
 10W0yCY+wTgod+s5wZpJGwXn6vGfpFKIfa13VcHXgNT99uCb2IMqJO+SKX5Ktjsr1ivX
 9s0w==
X-RZG-AUTH: ":IGcJeWCvcv7m4oe9OnyHZn/wihD8NCBbCv/qWr8H8yMCDRzMGIwfeoNZnBFi0iOpvy6H2PE9ON9W"
X-RZG-CLASS-ID: mo00
Received: from [172.17.64.1] by smtp.strato.de (RZmta 44.18 AUTH)
 with ESMTPSA id V042cbv4VDXoD31
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <samba-technical@lists.samba.org>;
 Fri, 31 May 2019 15:33:50 +0200 (CEST)
Subject: [PATCH] lib/util: Fixup tcopy_passwd() to also copy the pw_comment,
 field
To: samba-technical@lists.samba.org
Message-ID: <cac16911-80da-a27d-deb1-3ce3929cb6a2@giantdisaster.de>
Date: Fri, 31 May 2019 15:33:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------5D377D0A8B268E736FD86F21"
Content-Language: de-DE
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Stefan Behrens via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Behrens <samba-technical@giantdisaster.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------5D377D0A8B268E736FD86F21
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All fields of the passwd structure are copied except for pw_comment, and
I needed pw_comment to be copied and here is the commit for the change.

Bug 13975

Review appreciated.

--------------5D377D0A8B268E736FD86F21
Content-Type: text/plain; charset=UTF-8;
 name="lib-util-tcopy-passwd-pw_comment.patches.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="lib-util-tcopy-passwd-pw_comment.patches.txt"

RnJvbSBjOGM2ODI5ZTBiMTY3Yzg1ZmM4MDRiMjU1OWE2NDMyMzJhMzZmOWZhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gQmVocmVucyA8c2JlaHJlbnNAZ2lhbnRk
aXNhc3Rlci5kZT4KRGF0ZTogV2VkLCAyNyBNYXIgMjAxOSAxMToyNjowOSArMDEwMApTdWJq
ZWN0OiBbUEFUQ0hdIGxpYi91dGlsOiBGaXh1cCB0Y29weV9wYXNzd2QoKSB0byBhbHNvIGNv
cHkgdGhlIHB3X2NvbW1lbnQKIGZpZWxkCgpUaGlzIGNoYW5nZSBpc24ndCBuZWVkZWQgYnkg
dGhlIFNhbWJhIGNvZGUgaXRzZWxmIGJ1dCBieSBhIHBhc3NkYgptb2R1bGUgb2YgbWluZS4g
VGhpcyBtb2R1bGUgbWFrZXMgdXNlIG9mIHRoZSBjb21tZW50IGZpZWxkIGFuZApyZXF1aXJl
cyB0aGF0IHRoZSBjb3B5IG9mIGEgcGFzc3dkIHN0cnVjdHVyZSBpbmNsdWRlcyB0aGUgcHdf
Y29tbWVudApmaWVsZC4gQW5kIEkgc2VlIG5vIHJlYXNvbiB3aHkgYWxsIGZpZWxkcyBvZiB0
aGUgcGFzc3dkIHN0cnVjdHVyZQphcmUgY29waWVkIGV4Y2VwdCBmb3IgcHdfY29tbWVudC4K
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBCZWhyZW5zIDxzYmVocmVuc0BnaWFudGRpc2FzdGVy
LmRlPgotLS0KIGxpYi91dGlsL3V0aWxfcHcuYyB8IDEyICsrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9saWIvdXRpbC91dGlsX3B3LmMgYi9saWIvdXRpbC91dGlsX3B3LmMKaW5kZXggODAzNWRl
NDM5MmMzLi42MmU2ZTFlMzZhNjQgMTAwNjQ0Ci0tLSBhL2xpYi91dGlsL3V0aWxfcHcuYwor
KysgYi9saWIvdXRpbC91dGlsX3B3LmMKQEAgLTM0LDE0ICszNCwyMSBAQCBzdHJ1Y3QgcGFz
c3dkICp0Y29weV9wYXNzd2QoVEFMTE9DX0NUWCAqbWVtX2N0eCwKIHsKIAlzdHJ1Y3QgcGFz
c3dkICpyZXQ7CiAJc2l6ZV90IGxlbiA9IDA7CisJdW5zaWduZWQgaW50IG51bV9zdWJvYmpz
OwogCiAJbGVuICs9IHN0cmxlbihmcm9tLT5wd19uYW1lKSsxOwogCWxlbiArPSBzdHJsZW4o
ZnJvbS0+cHdfcGFzc3dkKSsxOwogCWxlbiArPSBzdHJsZW4oZnJvbS0+cHdfZ2Vjb3MpKzE7
CiAJbGVuICs9IHN0cmxlbihmcm9tLT5wd19kaXIpKzE7CiAJbGVuICs9IHN0cmxlbihmcm9t
LT5wd19zaGVsbCkrMTsKKwlpZiAoZnJvbS0+cHdfY29tbWVudCAhPSBOVUxMKSB7CisJCWxl
biArPSBzdHJsZW4oZnJvbS0+cHdfY29tbWVudCkrMTsKKwkJbnVtX3N1Ym9ianMgPSA2Owor
CX0gZWxzZSB7CisJCW51bV9zdWJvYmpzID0gNTsKKwl9CiAKLQlyZXQgPSB0YWxsb2NfcG9v
bGVkX29iamVjdChtZW1fY3R4LCBzdHJ1Y3QgcGFzc3dkLCA1LCBsZW4pOworCXJldCA9IHRh
bGxvY19wb29sZWRfb2JqZWN0KG1lbV9jdHgsIHN0cnVjdCBwYXNzd2QsIG51bV9zdWJvYmpz
LCBsZW4pOwogCiAJaWYgKHJldCA9PSBOVUxMKSB7CiAJCXJldHVybiBOVUxMOwpAQCAtNTQs
NiArNjEsOSBAQCBzdHJ1Y3QgcGFzc3dkICp0Y29weV9wYXNzd2QoVEFMTE9DX0NUWCAqbWVt
X2N0eCwKIAlyZXQtPnB3X2dlY29zID0gdGFsbG9jX3N0cmR1cChyZXQsIGZyb20tPnB3X2dl
Y29zKTsKIAlyZXQtPnB3X2RpciA9IHRhbGxvY19zdHJkdXAocmV0LCBmcm9tLT5wd19kaXIp
OwogCXJldC0+cHdfc2hlbGwgPSB0YWxsb2Nfc3RyZHVwKHJldCwgZnJvbS0+cHdfc2hlbGwp
OworCWlmIChmcm9tLT5wd19jb21tZW50ICE9IE5VTEwpIHsKKwkJcmV0LT5wd19jb21tZW50
ID0gdGFsbG9jX3N0cmR1cChyZXQsIGZyb20tPnB3X2NvbW1lbnQpOworCX0KIAogCXJldHVy
biByZXQ7CiB9Ci0tIAoyLjE5LjIKCg==
--------------5D377D0A8B268E736FD86F21--

