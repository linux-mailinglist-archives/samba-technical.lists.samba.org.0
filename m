Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3137C30D2AD
	for <lists+samba-technical@lfdr.de>; Wed,  3 Feb 2021 05:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=aPcTv+C8NhGOig42Q0Gf2+QqhISYP1bEV71JEU5ft/w=; b=whQ7VbWWaaBYUQffUme1qgrbvl
	wGxv8to/s44i+S50RVsjBlFqZgPDy3fwvk1YJTykn5uBqOK2utSliazVmEHbsvi/6j0R1MHM/fytd
	dIGcsttPHR2dPvQQM3hEMEJ8I3LHWtdTwfw2JoWA2yW3UNh/qXiaZRCiZRNIgBqWFvRorksW93iIJ
	6ooku9T+Pug3SIl5ldHjSbCp33Iey+WrLgUicD8G54527ZKpQ8Q8mr9Jxgz4CrXN9iIO4TMM1O3px
	iarG3t3jnnU3xmL8dVvCdbceW+Vvo5qeVo17f0WqEWUHleZBCiYrYAusrgk1m07oCH4posY7hSusX
	yOzojz2A==;
Received: from ip6-localhost ([::1]:54696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l7ABr-00ANma-Fh; Wed, 03 Feb 2021 04:54:55 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:50610) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l7ABh-00ANmT-9M
 for samba-technical@lists.samba.org; Wed, 03 Feb 2021 04:54:52 +0000
Received: from [IPv6:2404:130:0:1000:157d:2304:98d1:a078] (unknown
 [IPv6:2404:130:0:1000:157d:2304:98d1:a078])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id B07BF8152F; 
 Wed,  3 Feb 2021 17:54:17 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1612328057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aPcTv+C8NhGOig42Q0Gf2+QqhISYP1bEV71JEU5ft/w=;
 b=cgJ8ut09+8HstT80mq7O8QV4B32qRI4o4h45xEwEQMPGRy+XyKi53ZPm5fHTfnDM88FuFR
 53URGvgP9NEOlpBP7AJIza6WarSW7DhNYpiA8SfeO34WT+qgZBYC2WEuU7rp/5vePQNpAU
 l0m4P/ak1PtnUHuDiinveuvEO0AxBYDJyP2ZQPs6XdltmFhD2g7hetbMMd2nAkFm3UjCuT
 V2xh5Ied7aPmCXFqGMnd2SS3jhKS3+jxL3o6Twqvgze2WZdmKaeq8+GPEunSIM5G+bQyG2
 uNoApgjE+c2MPbs8h2P+lz9OVDUR85TgKULFEVaKOV1z/fRSyws2W2lUr7avoQ==
Subject: Re: [PATCH] Make tdb a bit more robust against corrupt tdbs
To: Volker.Lendecke@SerNet.DE, samba-technical@lists.samba.org
References: <20181005132403.7ylnchkwnbmhshob@sernet.de>
Message-ID: <24274537-c1c5-54e0-59a9-59ed96b971c9@catalyst.net.nz>
Date: Wed, 3 Feb 2021 17:54:17 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20181005132403.7ylnchkwnbmhshob@sernet.de>
Content-Type: multipart/mixed; boundary="------------3A5B5CE8DA1B1A601258D107"
Content-Language: en-NZ
X-Spamd-Result: default: False [2.00 / 15.00]; ARC_NA(0.00)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_BASE64_TEXT(0.10)[]; CTYPE_MIXED_BOGUS(1.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+]; MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------3A5B5CE8DA1B1A601258D107
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Over two years ago, on 2018-10-16, Volker Lendecke wrote:
> Hi!
> 
> Attached find a few patches that make tdb a bit more robust against
> tdbs that contain circular hash chains. I did not cover all instances
> where we walk chains, but this might be a step in the right direction.
> Without these patches we sit in 100% cpu loops when we hit such a
> condition.
> 
> The main one I did not touch yet is tdb_traverse. This is particularly
> difficult as the hash chain can change while we are traversing it. So
> we can't use the trick from rescue.c with the slow ptr.
> 
> To enable imprecise, but safe traverse for a limited set of use cases
> I'm considering to write a function that will just marshall a complete
> hash chain into a predefined buffer. This should be really, really
> fast and should be good for background cleanup tasks. The main target
> here is gencache, which we don't clean up at all yet.
> 
> Comments?

Through fuzzing I found a couple of the other cases Volker mentions. I
wasn't actually aware of this work, and I decided against the two-speed
algorithm on the grounds of performance and fiddliness (though as
implemented in Volker's patches, it doesn't look that bad).

The patch I have for a loop in the freelist that relies on the fact that
we are already counting bytes, which is certain to overflow if and only
if there is a loop. I think this works well there because it is almost
free in the common case, and you only count to 4 billion in the sad
case, which takes no time at all these days. You can wait a second to be
told your database was in ruins but was perhaps fixed by a repack.

Then I tried something similar for traverse, about which I am utterly
unconvinced. I only show it below to provoke discussion.

What I wonder is whether something like a per-chain count of bytes, as
in the freelist, work for traverse? There's the chance of a false
positive if a chain changes enough times to seem like it contains
4Gbytes, but seems to me like a sign that you've got pathologically
unbalanced chains anyway. Is seems-like-forever close enough to forever
to abandon the search?

I'm not very familiar with tdb.

cheers,
Douglas

--------------3A5B5CE8DA1B1A601258D107
Content-Type: text/plain; charset=UTF-8;
 name="tdb.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="tdb.txt"

RnJvbSBkNWY3ZGVhZDQ2YzFjZDAzMTJkOTY1MDY1YjAwMzU1MWZjNzRhNzEyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEb3VnbGFzIEJhZ25hbGwgPGRvdWdsYXMuYmFnbmFs
bEBjYXRhbHlzdC5uZXQubno+CkRhdGU6IFdlZCwgMjcgSmFuIDIwMjEgMTI6NTE6MzAgKzEz
MDAKU3ViamVjdDogW1BBVENIIDEvMl0gdGRiOiBub3RpY2UgZnJlZWxpc3QgbG9vcHMgaW4g
dHJhbnNhY3Rpb24KCnJlcGFja2luZyBpcyBwcm9iYWJseSBhIGdvb2QgaWRlYSBpbiB0aGlz
IHNpdHVhdGlvbgoKU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBCYWduYWxsIDxkb3VnbGFzLmJh
Z25hbGxAY2F0YWx5c3QubmV0Lm56PgotLS0KIGxpYi90ZGIvY29tbW9uL3RyYW5zYWN0aW9u
LmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3RkYi9jb21tb24vdHJhbnNhY3Rpb24uYyBi
L2xpYi90ZGIvY29tbW9uL3RyYW5zYWN0aW9uLmMKaW5kZXggNGY4ZDFmOGNkY2MuLmUxZjE3
NTM4YWVlIDEwMDY0NAotLS0gYS9saWIvdGRiL2NvbW1vbi90cmFuc2FjdGlvbi5jCisrKyBi
L2xpYi90ZGIvY29tbW9uL3RyYW5zYWN0aW9uLmMKQEAgLTEwOTcsNyArMTA5NywxMyBAQCBz
dGF0aWMgYm9vbCByZXBhY2tfd29ydGh3aGlsZShzdHJ1Y3QgdGRiX2NvbnRleHQgKnRkYikK
IAl9CiAKIAl3aGlsZSAocHRyICE9IDAgJiYgdGRiX3JlY19mcmVlX3JlYWQodGRiLCBwdHIs
ICZyZWMpID09IDApIHsKLQkJdG90YWwgKz0gcmVjLnJlY19sZW47CisJCXRkYl9sZW5fdCB0
bXAgPSB0b3RhbCArIHJlYy5yZWNfbGVuOworCQlpZiAodG1wIDwgdG90YWwpIHsKKwkJCVRE
Ql9MT0coKHRkYiwgVERCX0RFQlVHX0VSUk9SLAorCQkJCSAiZnJlZSBsaXN0IHRvdGFsIG92
ZXJmbG93IChwcm9iYWJsZSBsb29wIGluIGxpc3QpXG4iKSk7CisJCQlyZXR1cm4gdHJ1ZTsK
KwkJfQorCQl0b3RhbCA9IHRtcDsKIAkJaWYgKHJlYy5yZWNfbGVuID4gbGFyZ2VzdCkgewog
CQkJbGFyZ2VzdCA9IHJlYy5yZWNfbGVuOwogCQl9Ci0tIAoyLjI1LjEKCgpGcm9tIGI1ZTQ1
ZjI0OTRlYmVkN2I1MWU1MTk2OTQ3YTBhMzBiZjFkNDVmNTYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCkZyb206IERvdWdsYXMgQmFnbmFsbCA8ZG91Z2xhcy5iYWduYWxsQGNhdGFseXN0
Lm5ldC5uej4KRGF0ZTogU2F0LCAzMCBKYW4gMjAyMSAxMzo0MjoxOCArMTMwMApTdWJqZWN0
OiBbUEFUQ0ggMi8yXSB0ZGI6IHRyYXZlcnNlIHdpbGwgKGV2ZW50dWFsbHkpIG5vdGljZSBj
aGFpbiBsb29wcwoKSWYgdGhlcmUgaXMgYSBsb29wIGluIGEgY2hhaW4gKGUuZy4gQS0+bmV4
dCBwb2ludHMgdG8gQiBhbiBCLT5uZXh0CnBvaW50cyB0byBBKSwgYSB0cmF2ZXJzZSB3aWxs
IG5vdCBzdG9wLgoKV2UgYWxyZWFkeSBkZWZlbmQgYWdhaW5zdCB0aGUgc2hvcnRlc3QgbG9v
cHMgKEEtPm5leHQgcG9pbnRzIHRvIEEpIGluCnRkYl9uZXh0X2xvY2soKSwgYnV0IGxvbmdl
ciBsb29wcyBhcmUgbm90IGRldGVjdGVkLgoKSW4gb3RoZXIgcGxhY2VzIHdlIHVzZSB0aGUg
dHdvIHNwZWVkIHdhbGsgYWxnb3JpdGhtLCB3aGljaCBpcyBmYXN0ZXIKaW4gdGhlIGxvb3Ag
Y2FzZSwgYnV0IHNsb3dlciBpbiBvcmRpbmFyeSB1bmNvcnJ1cHRlZCBjYXNlLiBXZSBhdm9p
ZAp0aGF0IGhlcmUgYmVjYXVzZSB3ZSBkb24ndCB3YW50IHRvIHBheSB0aGUgY29zdCBmb3Ig
c29tZXRobmcgdGhhdApzaG91bGQgaGFyZGx5IGV2ZXIgaGFwcGVuLgoKU2lnbmVkLW9mZi1i
eTogRG91Z2xhcyBCYWduYWxsIDxkb3VnbGFzLmJhZ25hbGxAY2F0YWx5c3QubmV0Lm56Pgot
LS0KIGxpYi90ZGIvY29tbW9uL3RyYXZlcnNlLmMgfCAxNSArKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL3RkYi9j
b21tb24vdHJhdmVyc2UuYyBiL2xpYi90ZGIvY29tbW9uL3RyYXZlcnNlLmMKaW5kZXggZDY5
ZTdkZmYyODUuLmM0OTQzMjZjYjhkIDEwMDY0NAotLS0gYS9saWIvdGRiL2NvbW1vbi90cmF2
ZXJzZS5jCisrKyBiL2xpYi90ZGIvY29tbW9uL3RyYXZlcnNlLmMKQEAgLTE5Nyw2ICsxOTcs
MjEgQEAgc3RhdGljIGludCB0ZGJfdHJhdmVyc2VfaW50ZXJuYWwoc3RydWN0IHRkYl9jb250
ZXh0ICp0ZGIsCiAJCX0KIAogCQljb3VudCsrOworCQlpZiAoY291bnQgPiB0ZGItPm1hcF9z
aXplIC8gc2l6ZW9mKHJlYykpIHsKKwkJCS8qIHdlIGNhbiBvbmx5IGdldCBhbnl3aGVyZSBu
ZWFyIHRoaXMgdXBwZXIgYm91bmQgaWYKKwkJCSAqIHRoZXJlIGlzIGEgbG9vcCBpbiB0aGUg
bGlua2VkIGxpc3QgKi8KKwkJCXRkYi0+ZWNvZGUgPSBUREJfRVJSX0NPUlJVUFQ7CisJCQlU
REJfTE9HKCh0ZGIsIFREQl9ERUJVR19GQVRBTCwKKwkJCQkgInRkYl90cmF2ZXJzZTogdGhl
cmUgaXMgYSBsb29wIGluIGEgY2hhaW4gIgorCQkJCSAiKGNvdW50ICV1LCBtYXBfc2l6ZSAl
dSkuXG4iLAorCQkJCSAodW5zaWduZWQpY291bnQsCisJCQkJICh1bnNpZ25lZCl0ZGItPm1h
cF9zaXplKSk7CisJCQlpZiAodGRiX3VubG9ja19yZWNvcmQodGRiLCB0bC0+b2ZmKSAhPSAw
KSB7CisJCQkJVERCX0xPRygodGRiLCBUREJfREVCVUdfRkFUQUwsCisJCQkJCSAidGRiX3Ry
YXZlcnNlOiBwb3N0LWxvb3AgdW5sb2NrIGZhaWxlZFxuIikpOworCQkJfQorCQkJZ290byBv
dXQ7CisJCX0KIAkJLyogbm93IHJlYWQgdGhlIGZ1bGwgcmVjb3JkICovCiAJCW5yZWFkID0g
dGRiLT5tZXRob2RzLT50ZGJfcmVhZCh0ZGIsIHRsLT5vZmYgKyBzaXplb2YocmVjKSwKIAkJ
CQkJICAgICAgIGtleS5kcHRyLCBmdWxsX2xlbiwgMCk7Ci0tIAoyLjI1LjEKCg==
--------------3A5B5CE8DA1B1A601258D107--

