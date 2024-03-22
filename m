Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7D08871C5
	for <lists+samba-technical@lfdr.de>; Fri, 22 Mar 2024 18:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ceE09WSdBbtbMcWlz4ZDhqs/Qiz4gkyYQu133soPsgI=; b=OUOJFq0yLdpm7DqTbAch4IvekM
	OA7fwHNNnLZ/SgXKCPwxbnsAhCR6kuVqa6dmB+OAs2d/tvFLHJNLsnKTYaWuZhrnvzRiA7mOEhXeI
	GAI7L8ko7P6/hJUC/C+P1EMtPoCIEQcWtBdd0gtRBMt34tDipPl+HWuexeKrdp81JOdX+hCIJaGjF
	0uAtT9SoWdiKUloLyAJgsAR2SNSXoqclVJR0iVmo3Zik/H2D8d4y2kQcQDero7nop6j2NdgNCRSTM
	5t6BSRA54y3YZT66nTE3FRJi3+yLvarGJhyn4YHL8vmpvT2b1nDqNrva3gjP3bJVPGFe1SJjXyPLG
	betOBCZA==;
Received: from ip6-localhost ([::1]:55248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rniR9-0011US-Lc; Fri, 22 Mar 2024 17:12:12 +0000
Received: from mail.tranquil.it ([2001:bc8:392f:101::20]:50334) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rniR3-0011UK-8p
 for samba-technical@lists.samba.org; Fri, 22 Mar 2024 17:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tranquil.it; s=mail;
 t=1711126525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jHdxKDtJ1qY+Ksa0mgMSaSHEbO7x4TxlA/DXeEZz8Oc=;
 b=xU0cKFmekgrJ9eaMatmd4e7cgz/c0OE+FC4dxXvD61k+pWp6ulZjuEpHCPahSTRFB6gF0H
 Rpcq+vTa5SRHXdY4r5Se5NnRVQcIDSY0Wq8M7PO5VX5EZLut9FnhAZWzCrYithkMeVcLK+
 4qlI54izFiVFOBE3pO8Jea5Z1fqMc5k4Ke+zBymf7/6Qdt1U7jk7izXp4auufWUl2fzP6q
 jy/rjRGveZYMrD4GdeRRxOtzBXpFEh/2Nz7Q2fhG3CFb3QTqTFnYMC1NDxHP7DuVD+Ewwg
 w/l2sHXuB3di1aPZ4/OVeyK697WT0v+NyvuYMgMaBlRzKuTkviv3HNhZVzEtUw==
Content-Type: multipart/mixed; boundary="------------4fVY6jdmCYcFOYR4yyZFxW3h"
Message-ID: <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
Date: Fri, 22 Mar 2024 17:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Regression: ldb performance with indexes
To: samba-technical@lists.samba.org
References: <4856178.OV4Wx5bFTl@magrathea>
 <44c7b6c9-519a-4b01-ae62-2d03b033c3d4@tranquil.it>
Content-Language: fr
In-Reply-To: <44c7b6c9-519a-4b01-ae62-2d03b033c3d4@tranquil.it>
X-Spamd-Result: default: False [-2.99 / 25.00]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[];
 MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
 MIME_BASE64_TEXT(0.10)[]; XM_UA_NO_VERSION(0.01)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+,5:+,6:+];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 ASN(0.00)[asn:3215, ipnet:90.115.0.0/17, country:FR];
 NEURAL_HAM(-0.00)[-0.988]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[tranquil.it:s=mail]; HAS_ATTACHMENT(0.00)[]
X-Rspamd-Server: mail.tranquil.it
X-Spamd-Bar: --
X-Rspamd-Queue-Id: 8D5F389182
X-Rspamd-Action: no action
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
From: =?utf-8?q?Andr=C3=A9as_LEROUX_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Andr=C3=A9as_LEROUX?= <aleroux@tranquil.it>
Cc: Andreas Schneider <asn@samba.org>, yalemu@tranquil.it,
 Denis CARDON <dcardon@tranquil.it>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------4fVY6jdmCYcFOYR4yyZFxW3h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andreas and Andrew,

 >>>> > Hi,my colleagues discovered a performance issue in libldb:
 >>>> > https://bugzilla.samba.org/show_bug.cgi?id=15590
 >>>> > > > > As soon as you use indexes, ldbadd will be magnitudes
 >> slower than
 >>>> > itwas before.Could some ldb expert please look into it?
 >>>> > > Your subject says a regression. What version is this a
 >>>> regressionagainst?
 >>>> Isn't that obvious from the bug report?
 >>> Here is the short summary:
 >>> $ bash repro.sh 20000 indexesAdded 2 records successfullyAdded
 >> 20000
 >>> records successfully
 >>> On Samba 4.10: 0m01.231sOn Samba 4.19: 1m30.924s (that's 90 times
 >>> slower)
 >>>> > The very nature of a DB index is that it will take time to
 >>>> create,possibly a lot of time, but should make reads faster.
 >>>> Either the DB index doesn't work at all in Samba 4.10 or there
 >> is a
 >>> huge performance problem in Samba 4.19. What is it?
 >>
 >> Thanks, that wasn't written as obviously on the bug, thanks for the
 >> clarification.
 >
 > I used our CentOS 8 Stream CI image for bisecting. You can't bisect
 > easily on a modern Linux Distribution, as the included waf would not
 > have support for newer Python versions like 3.12.
 >
 > In case you want to reproduce it, here is my run:

I'm Andréas from Tranquil IT dev team. Denis and Yohannès asked me this 
week to take a look at the performance issues on large domains, which 
include this issue in the current thread along the mdb large transaction 
issues.

The attached patchset goes through all the tdb and ldb make test.

* LMDB : increase MDB_IDL_LOGN from 16 to 18 to accomodate large nested 
transactions
* tdb : fail-fast when record hash doesn't match expected hash to avoid 
to read/copy the entire record
* ldb : increase DEFAULT_INDEX_CACHE_SIZE from 491 to 8089 to increase 
the number of bucket to have smaller bucket to have faster iteration in 
each buckets in tdb_find

With this patchset we can upgrade large domains (>200k objects) to 
FL2k16 level in approximatly 1 hour instead of 3 days :-)

[root@srvads1-bl1cw ~]# bash repro.sh 20000 indexes Added 2 records 
successfully Added 20000 records successfully real 0m0.536s user 
0m0.798s sys 0m0.105s

Tranquil IT team is expert at deploying Samba-AD in large domains, but 
we are not core devs, so I may have missed something during my debugging 
/ patching session. Don't hesitate to comment and tell me what you think 
about this patchset, if there are some pitfalls that I missed or if the 
style can be improved.


Cheers,

Andréas
--------------4fVY6jdmCYcFOYR4yyZFxW3h
Content-Type: text/plain; charset=UTF-8;
 name="tis-increase-mdb-idl-logn.patch"
Content-Disposition: attachment; filename="tis-increase-mdb-idl-logn.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtdXAgYS9saWJyYXJpZXMvbGlibG1kYi9taWRsLmggYi9saWJyYXJpZXMvbGlibG1k
Yi9taWRsLmgKLS0tIGEvbGlicmFyaWVzL2xpYmxtZGIvbWlkbC5oCTIwMTgtMDMtMjIgMTY6
MjM6MDUuMDAwMDAwMDAwICswMTAwCisrKyBiL2xpYnJhcmllcy9saWJsbWRiL21pZGwuaAky
MDI0LTAzLTIxIDExOjQ2OjU0LjYxNjAwMDAwMCArMDEwMApAQCAtNTYsNyArNTYsNyBAQCB0
eXBlZGVmIE1EQl9JRCAqTURCX0lETDsKIC8qIElETCBzaXplcyAtIGxpa2VseSBzaG91bGQg
YmUgZXZlbiBiaWdnZXIKICAqICAgbGltaXRpbmcgZmFjdG9yczogc2l6ZW9mKElEKSwgdGhy
ZWFkIHN0YWNrIHNpemUKICAqLwotI2RlZmluZQlNREJfSURMX0xPR04JMTYJLyogREJfU0la
RSBpcyAyXjE2LCBVTV9TSVpFIGlzIDJeMTcgKi8KKyNkZWZpbmUJTURCX0lETF9MT0dOCTE4
CS8qIERCX1NJWkUgaXMgMl4xOCwgVU1fU0laRSBpcyAyXjE5ICovCiAjZGVmaW5lIE1EQl9J
RExfREJfU0laRQkJKDE8PE1EQl9JRExfTE9HTikKICNkZWZpbmUgTURCX0lETF9VTV9TSVpF
CQkoMTw8KE1EQl9JRExfTE9HTisxKSkK
--------------4fVY6jdmCYcFOYR4yyZFxW3h
Content-Type: text/plain; charset=UTF-8; name="tis-tdbfind.patch"
Content-Disposition: attachment; filename="tis-tdbfind.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtcnVOIGEvY29tbW9uL2lvLmMgYi9jb21tb24vaW8uYwotLS0gYS9jb21tb24vaW8u
YwkyMDIzLTA3LTE4IDEwOjE0OjU0LjQ5MDA5MTAwMCArMDIwMAorKysgYi9jb21tb24vaW8u
YwkyMDI0LTAzLTIxIDE1OjQ5OjM4Ljc4MDYzNDc4NCArMDEwMApAQCAtNzQxLDYgKzc0MSwy
NiBAQAogCXJldHVybiByZXN1bHQ7CiB9CiAKKworLyogQ2hlY2sgaWYgdGhlIHJlY29yZCBo
YXNoIG1hdGNoIHRoZSBleHBlY3RlZCBvbmUuIElmIG5vdCwgbW92ZSB0aGUgb2Zmc2V0IHRv
IHRoZSBuZXh0IHJlY29yZCAqLworCitpbnQgdGRiX3JlY19pc2hhc2goc3RydWN0IHRkYl9j
b250ZXh0ICp0ZGIsIHRkYl9vZmZfdCAqb2ZmLCB1aW50MzJfdCBoYXNoKSB7CisJdWludDMy
X3QgcmVhZF9oYXNoOworCisJLy8gRW5zdXJlIHRoZSByZWNvcmQgaXMgbm90IG9vYgorCWlm
ICh0ZGJfb29iKHRkYiwgKm9mZiwgc2l6ZW9mKHN0cnVjdCB0ZGJfcmVjb3JkKSwgMCkgIT0g
MCkKKwkJIHJldHVybiAtMTsKKworCS8vIFJlYWQgb25seSBmdWxsX2hhc2ggdmFsdWUgYW5k
IGNvbXBhcmUgaXQgdG8gZXhwZWN0ZWQgaGFzaAorCWlmICh0ZGItPm1ldGhvZHMtPnRkYl9y
ZWFkKHRkYiwgKm9mZiArIG9mZnNldG9mKHN0cnVjdCB0ZGJfcmVjb3JkLCBmdWxsX2hhc2gp
LCAmcmVhZF9oYXNoLCBzaXplb2YoaGFzaCksIERPQ09OVigpKSA9PSAtMSkKKwkJIHJldHVy
biAtMTsKKwlpZiAocmVhZF9oYXNoID09IGhhc2gpCisJCSByZXR1cm4gMTsKKworCS8vIFJl
YWQgdGhlIG5leHQgcG9pbnRlciB2YWx1ZQorCXJldHVybiB0ZGItPm1ldGhvZHMtPnRkYl9y
ZWFkKHRkYiwgKm9mZiwgb2ZmLCBzaXplb2YodGRiX29mZl90KSxET0NPTlYoKSk7Cit9CisK
IC8qIHJlYWQvd3JpdGUgYSByZWNvcmQgKi8KIGludCB0ZGJfcmVjX3JlYWQoc3RydWN0IHRk
Yl9jb250ZXh0ICp0ZGIsIHRkYl9vZmZfdCBvZmZzZXQsIHN0cnVjdCB0ZGJfcmVjb3JkICpy
ZWMpCiB7CmRpZmYgLXJ1TiBhL2NvbW1vbi90ZGIuYyBiL2NvbW1vbi90ZGIuYwotLS0gYS9j
b21tb24vdGRiLmMJMjAyMy0wNy0xOCAxMDoxNDo1NC40OTQwOTEwMDAgKzAyMDAKKysrIGIv
Y29tbW9uL3RkYi5jCTIwMjQtMDMtMjIgMDk6NDQ6MDcuMDYwNjMzODQ2ICswMTAwCkBAIC0x
MzMsNyArMTMzLDE5IEBACiAKIAkvKiBrZWVwIGxvb2tpbmcgdW50aWwgd2UgZmluZCB0aGUg
cmlnaHQgcmVjb3JkICovCiAJd2hpbGUgKHJlY19wdHIpIHsKLQkJYm9vbCBvazsKKwkJaW50
IGlzX2hhc2hfcmVzdWx0ID0gdGRiX3JlY19pc2hhc2godGRiLCAmcmVjX3B0ciwgaGFzaCk7
CisKKwkJLyogRmFpbGVkIHRvIHJlYWQgdGhlIGhhc2gvbmV4dCBwb2ludGVyIG9mIHRoaXMg
cmVjb3JkICovCisJCWlmIChpc19oYXNoX3Jlc3VsdCA9PSAtMSkKKwkJCXJldHVybiAwOwor
CQkvKiBSZWNvcmQgaGFzaCBkb2Vzbid0IG1hdGNoIGV4cGVjdGVkIGhhc2ggc28gd2UgZmFp
bCBmYXN0IGluc3RlYWQgb2YgY29weWluZyB0aGUgZW50aXJlIHJlY29yZC4KKwkJICAgcmVj
X3B0ciBhbHJlYWR5IG1vdmVkIHRvIG5leHQgcmVjb3JkIGJ5IHRkYl9yZWNfaXNoYXNoLgor
CQkgICBTdGlsbCBuZWVkIHRvIGNoZWNrIHRoZSBjaGFpbndhbGsgdG8gYXZvaWQgY2lyY3Vs
YXIgc2VhcmNoICovCisJCWVsc2UgaWYgKGlzX2hhc2hfcmVzdWx0ID09IDApIHsKKwkJCWlm
ICghdGRiX2NoYWlud2Fsa19jaGVjayh0ZGIsICZjaGFpbndhbGssIHJlY19wdHIpKQorCQkJ
CXJldHVybiAwOworCQkJY29udGludWU7CisJCX0KIAogCQlpZiAodGRiX3JlY19yZWFkKHRk
YiwgcmVjX3B0ciwgcikgPT0gLTEpCiAJCQlyZXR1cm4gMDsKQEAgLTE0NywxMCArMTU5LDgg
QEAKCQl9CgkJcmVjX3B0ciA9IHItPm5leHQ7CiAKLQkJb2sgPSB0ZGJfY2hhaW53YWxrX2No
ZWNrKHRkYiwgJmNoYWlud2FsaywgcmVjX3B0cik7Ci0JCWlmICghb2spIHsKKwkJaWYgKCF0
ZGJfY2hhaW53YWxrX2NoZWNrKHRkYiwgJmNoYWlud2FsaywgcmVjX3B0cikpCiAJCQlyZXR1
cm4gMDsKLQkJfQogCX0KIAl0ZGItPmVjb2RlID0gVERCX0VSUl9OT0VYSVNUOwogCXJldHVy
biAwOwpkaWZmIC1ydU4gYS9jb21tb24vdGRiX3ByaXZhdGUuaCBiL2NvbW1vbi90ZGJfcHJp
dmF0ZS5oCi0tLSBhL2NvbW1vbi90ZGJfcHJpdmF0ZS5oCTIwMjMtMDctMTggMTA6MTQ6NTQu
NDk0MDkxMDAwICswMjAwCisrKyBiL2NvbW1vbi90ZGJfcHJpdmF0ZS5oCTIwMjQtMDMtMjEg
MTU6NTA6MzkuMjQ0NjM0MTQxICswMTAwCkBAIC0zMjIsNiArMzIyLDcgQEAKIGludCB0ZGJf
bG9ja19yZWNvcmQoc3RydWN0IHRkYl9jb250ZXh0ICp0ZGIsIHRkYl9vZmZfdCBvZmYpOwog
aW50IHRkYl91bmxvY2tfcmVjb3JkKHN0cnVjdCB0ZGJfY29udGV4dCAqdGRiLCB0ZGJfb2Zm
X3Qgb2ZmKTsKIGJvb2wgdGRiX25lZWRzX3JlY292ZXJ5KHN0cnVjdCB0ZGJfY29udGV4dCAq
dGRiKTsKK2ludCB0ZGJfcmVjX2lzaGFzaChzdHJ1Y3QgdGRiX2NvbnRleHQgKnRkYiwgdGRi
X29mZl90ICpvZmYsIHVpbnQzMl90IGhhc2gpOwogaW50IHRkYl9yZWNfcmVhZChzdHJ1Y3Qg
dGRiX2NvbnRleHQgKnRkYiwgdGRiX29mZl90IG9mZnNldCwgc3RydWN0IHRkYl9yZWNvcmQg
KnJlYyk7CiBpbnQgdGRiX3JlY193cml0ZShzdHJ1Y3QgdGRiX2NvbnRleHQgKnRkYiwgdGRi
X29mZl90IG9mZnNldCwgc3RydWN0IHRkYl9yZWNvcmQgKnJlYyk7CiB1bnNpZ25lZCBjaGFy
ICp0ZGJfYWxsb2NfcmVhZChzdHJ1Y3QgdGRiX2NvbnRleHQgKnRkYiwgdGRiX29mZl90IG9m
ZnNldCwgdGRiX2xlbl90IGxlbik7Cgo=
--------------4fVY6jdmCYcFOYR4yyZFxW3h
Content-Type: text/plain; charset=UTF-8; name="tis-ldbfind.patch"
Content-Disposition: attachment; filename="tis-ldbfind.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtcnVOIGEvbGRiX2tleV92YWx1ZS9sZGJfa3YuaCBiL2xkYl9rZXlfdmFsdWUvbGRi
X2t2LmgKLS0tIGEvbGRiX2tleV92YWx1ZS9sZGJfa3YuaAkyMDIzLTA3LTE4IDEwOjE0OjU0
LjQzODA5MDgwMCArMDIwMAorKysgYi9sZGJfa2V5X3ZhbHVlL2xkYl9rdi5oCTIwMjQtMDMt
MjEgMTU6NDg6NTcuMzEyNjM1MjI1ICswMTAwCkBAIC0yNDksNyArMjQ5LDcgQEAKICAqIFRo
ZSB2YWx1ZSBjaG9zZW4gZ2l2ZXMgYSBwcmltZSBtb2R1bG8gZm9yIHRoZSBoYXNoIHRhYmxl
IGFuZCBrZWVwcyB0aGUKICAqIHRkYiBtZW1vcnkgb3ZlcmhlYWQgdW5kZXIgNCBrQgogICov
Ci0jZGVmaW5lIERFRkFVTFRfSU5ERVhfQ0FDSEVfU0laRSA0OTEKKyNkZWZpbmUgREVGQVVM
VF9JTkRFWF9DQUNIRV9TSVpFIDgwODkgCiAKIHN0cnVjdCBsZGJfcGFyc2VfdHJlZTsKCg==


--------------4fVY6jdmCYcFOYR4yyZFxW3h--

