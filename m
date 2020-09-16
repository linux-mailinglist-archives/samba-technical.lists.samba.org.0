Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DFD26BBFC
	for <lists+samba-technical@lfdr.de>; Wed, 16 Sep 2020 07:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4T4TmeUr11M0gwCmLGIrKRsA95wX50xyE1Fi6QiEGRc=; b=6EWv25D5DHuu5Rnd093L2ICR1w
	OXZaAws2Ke47dZdJU1xtJLaY8DGnuhHKC30Ju31uNFRgvweT/nsjXxMqmutK7Ja/7Jq9Q10sRPawA
	A2+Y0uDDDP5lJgJM/hHanRijkX0ks7FcyZ4M+n7+Or7+x8cyvyNnAbReyi9U/8vax3LUHTuN7tb2x
	ZPsLqxGULFkXIzGan3VjeGoSCwgqe0PNLFCGC9PySJXrrJVW/tn3AWz0IIxXSlKTlmgB3trplV9fv
	OB0/1s8b/BkVoGZQeKO9sJx8aBGhdbinBaTdYjC3j67nhvVu7P75wIpdQ3g9aghIk6Xbxg1C6+XBy
	duRZ+Y7w==;
Received: from localhost ([::1]:38964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIQLs-005eYV-Sc; Wed, 16 Sep 2020 05:51:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59840) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIQLk-005eYO-CO
 for samba-technical@lists.samba.org; Wed, 16 Sep 2020 05:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=4T4TmeUr11M0gwCmLGIrKRsA95wX50xyE1Fi6QiEGRc=; b=HGa1IH+xTJkz7UdaTLIw5Bd8aW
 rTdBXsJLz4ld4ecVGqcLMn7fyqFGUlZn5PyGMwdl5v2rmiOjaWh9fD7uyILRSsuxdPGUGUhIVQKiR
 2y7WDxcWuR3yBqO5n37V3T5gD6kvjUgCkYspQnTWHzi4oZSOM0BJ02Ude/DFYfV9OgEqls69MoqI8
 MKB8wunczH2k1eRhNoPn7w4MIbdeSnvEZQFSBaE+OFzzFO6AvryMnLK6OrkWeW5PIIxon8dq1OlBs
 BnJoWjxiPx9DTiJbQb6zzzcPc3QBOCAV8UXTvVgKMCyui1+1MZClzCZDPw2vo7v06Fezh9351ZFEQ
 tm91HvBXtciB+vwGxw45yItt0xWzrBZJ9jpADHdbZfQRuEwI14zsCWFDDH7mw70/lVGcL6ZDlx/T1
 b4oVpvRmMiRaWC0lH1c93XbjZDADC6KbcHjbrfePFhNApZ86Cv93I4f6deR37QqiqxridyVNdxlcH
 TZr7TsrV4cmylcTk1mENhLrE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIQLj-0007ld-BU
 for samba-technical@lists.samba.org; Wed, 16 Sep 2020 05:51:23 +0000
Message-ID: <d415684468ce9d140f570791f6a4d560df9bb7da.camel@samba.org>
Subject: Ideas (other than just mandetory schannel) for ZeroLogin CVE-2020-1472
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 16 Sep 2020 17:51:20 +1200
Content-Type: multipart/mixed; boundary="=-vJseFcw1rGrpy8ebsvr+"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-vJseFcw1rGrpy8ebsvr+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This isn't on the bug
https://bugzilla.samba.org/show_bug.cgi?id=14497
because it isn't at that point yet, and isn't a MR as I've not even
compiled it, but ideas (done with Gary) for mitigation for those who
must run with schannel are:

Ensure that the password set via ServerSetPassword2 is of non-zero
length.

Check the password does not have zero bytes in it.

Check that the challenge in ServerAuthenticate3 does not have repeating
patterns in the first 3 bytes and repeating 0s in the computed
response.

This should make false positives pretty rare, while working with the
failure mode of the cipher.

See https://www.secura.com/pathtoimg.php?id=2055 for a really readable
description of the issue.

I'm going home shortly but will keep looking at this and will be
available tonight.

I think Samba 4.13 should ship without the option to turn off schannel
- just remove it, assuming we can make the tests still go.

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba






--=-vJseFcw1rGrpy8ebsvr+
Content-Disposition: attachment; filename="CVE-2020-1472-ideas.patch"
Content-Type: text/x-patch; name="CVE-2020-1472-ideas.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2xpYmNsaS9hdXRoL2NyZWRlbnRpYWxzLmMgYi9saWJjbGkvYXV0aC9jcmVk
ZW50aWFscy5jCmluZGV4IGM1NDFlZWZmNDcwLi5lYmI0M2Q3ZGJlYyAxMDA2NDQKLS0tIGEvbGli
Y2xpL2F1dGgvY3JlZGVudGlhbHMuYworKysgYi9saWJjbGkvYXV0aC9jcmVkZW50aWFscy5jCkBA
IC03NDQsNiArNzQ0LDMxIEBAIHN0cnVjdCBuZXRsb2dvbl9jcmVkc19DcmVkZW50aWFsU3RhdGUg
Km5ldGxvZ29uX2NyZWRzX3NlcnZlcl9pbml0KFRBTExPQ19DVFggKm1lCiAKIAlkdW1wX2RhdGFf
cHcoIkNyZWRlbnRpYWxzIGluIiwgY3JlZGVudGlhbHNfaW4tPmRhdGEsIHNpemVvZihjcmVkZW50
aWFsc19pbi0+ZGF0YSkpOwogCisJaWYgKChjbGllbnRfY2hhbGxlbmdlLT5kYXRhWzBdID09IGNs
aWVudF9jaGFsbGVuZ2UtPmRhdGFbMV0pCisJICAgICYmIChjbGllbnRfY2hhbGxlbmdlLT5kYXRh
WzBdID09IGNsaWVudF9jaGFsbGVuZ2UtPmRhdGFbMl0pCisJICAgICYmIHJlY2VpdmVkX2NyZWRl
bnRpYWxzLT5kYXRhWzBdID09IDAKKwkgICAgJiYgcmVjZWl2ZWRfY3JlZGVudGlhbHMtPmRhdGFb
MV0gPT0gMAorCSAgICAmJiByZWNlaXZlZF9jcmVkZW50aWFscy0+ZGF0YVsyXSA9PSAwKSB7CisJ
CS8qCisJCSAqIExvb2tzIGxpa2UgYSBjbGllbnQgdHJ5aW5nIHRvIGV4cGxvaXQKKwkJICogQ1ZF
LTIwMjAtMTQ3MiwgYnV0IHBlcmhhcHMganVzdCBhIG1vcmUgdGhhbiAyXjI0CisJCSAqIHVubHVj
a3kgY2xpZW50LiAgSW4gU2VydmVyQXV0aGVudGljYXRlMyB0aGUgY2xpZW50CisJCSAqIHdpbGwg
bGlrZWx5IGp1c3QgdHJ5IGFnYWluIHdpdGggdGhlIHByZXZpb3VzCisJCSAqIHBhc3N3b3JkLgor
CQkgKi8KKwkJCisJCURCR19FUlIoIlJlZnVzaW5nIHRvIHNldCBhIG5ldyBtYWNoaW5lIGFjY291
bnQgIgorCQkJInBhc3N3b3JkIG9mIGxlbmd0aCAldXogZnJvbSAlcyIKKwkJCSJvbiAlcywgaXQg
aXMgdG9vIHNob3J0ICg8MTQgVUNTMiB1bml0cykgYW5kIGxvb2tzICIKKwkJCSJsaWtlIGEgQ1ZF
LTIwMjAtMTQ3MiBhdHRhY2siLAorCQkJbmV3X3Bhc3N3b3JkLmxlbmd0aCwKKwkJCXJlbW90ZSwK
KwkJCWNyZWRzLT5hY2NvdW50X25hbWUpOworCQkKKwkJdGFsbG9jX2ZyZWUoY3JlZHMpOworCQly
ZXR1cm4gZmFsc2U7CisJfQorCiAJLyogQW5kIGJlZm9yZSB3ZSBsZWFrIGluZm9ybWF0aW9uIGFi
b3V0IHRoZSBtYWNoaW5lIGFjY291bnQKIAkgKiBwYXNzd29yZCwgY2hlY2sgdGhhdCB0aGV5IGdv
dCB0aGUgZmlyc3QgZ28gcmlnaHQgKi8KIAlpZiAoIW5ldGxvZ29uX2NyZWRzX3NlcnZlcl9jaGVj
a19pbnRlcm5hbChjcmVkcywgY3JlZGVudGlhbHNfaW4pKSB7CmRpZmYgLS1naXQgYS9zb3VyY2Uz
L3JwY19zZXJ2ZXIvbmV0bG9nb24vc3J2X25ldGxvZ19udC5jIGIvc291cmNlMy9ycGNfc2VydmVy
L25ldGxvZ29uL3Nydl9uZXRsb2dfbnQuYwppbmRleCAyYTJlMmQwYWM2ZS4uYTkzMjQxMjhmOWQg
MTAwNjQ0Ci0tLSBhL3NvdXJjZTMvcnBjX3NlcnZlci9uZXRsb2dvbi9zcnZfbmV0bG9nX250LmMK
KysrIGIvc291cmNlMy9ycGNfc2VydmVyL25ldGxvZ29uL3Nydl9uZXRsb2dfbnQuYwpAQCAtMTQw
MSw2ICsxNDAxLDIxIEBAIE5UU1RBVFVTIF9uZXRyX1NlcnZlclBhc3N3b3JkU2V0MihzdHJ1Y3Qg
cGlwZXNfc3RydWN0ICpwLAogCQlyZXR1cm4gTlRfU1RBVFVTX1dST05HX1BBU1NXT1JEOwogCX0K
IAorCWlmIChuZXdfcGFzc3dvcmQubGVuZ3RoIDwgMTQpIHsgLyogcmVhbGx5LCB0aGlzIGlzIGFi
b3V0IG5vdCBiZWluZyB6ZXJvICovCisJCWNvbnN0IGNoYXIgKnJlbW90ZQorCQkJPSB0c29ja2V0
X2FkZHJlc3Nfc3RyaW5nKHAtPnJlbW90ZV9hZGRyZXNzLAorCQkJCQkJIHAtPm1lbV9jdHgpOwor
CQlEQkdfRVJSKCJSZWZ1c2luZyB0byBzZXQgYSBuZXcgbWFjaGluZSBhY2NvdW50ICIKKwkJCSJw
YXNzd29yZCBvZiBsZW5ndGggJXV6IGZyb20gJXMiCisJCQkib24gJXMsIGl0IGlzIHRvbyBzaG9y
dCAoPDE0KSBhbmQgbG9va3MgIgorCQkJImxpa2UgYSBDVkUtMjAyMC0xNDcyIGF0dGFjayIsCisJ
CQluZXdfcGFzc3dvcmQubGVuZ3RoLAorCQkJcmVtb3RlLAorCQkJY3JlZHMtPmFjY291bnRfbmFt
ZSk7CisJCXJldHVybiBOVF9TVEFUVVNfV1JPTkdfUEFTU1dPUkQ7CisJfQorCisJCiAJY3IuY3Jl
ZHMucGFzc3dvcmQgPSAoY29uc3QgY2hhciopIHBsYWludGV4dC5kYXRhOwogCXN0YXR1cyA9IG5l
dHJfc2V0X21hY2hpbmVfYWNjb3VudF9wYXNzd29yZChwLT5tZW1fY3R4LAogCQkJCQkJICAgcC0+
c2Vzc2lvbl9pbmZvLApkaWZmIC0tZ2l0IGEvc291cmNlNC9ycGNfc2VydmVyL25ldGxvZ29uL2Rj
ZXJwY19uZXRsb2dvbi5jIGIvc291cmNlNC9ycGNfc2VydmVyL25ldGxvZ29uL2RjZXJwY19uZXRs
b2dvbi5jCmluZGV4IDBhYjU1YWZlYWIwLi5iODQwYzU1YTM5ZiAxMDA2NDQKLS0tIGEvc291cmNl
NC9ycGNfc2VydmVyL25ldGxvZ29uL2RjZXJwY19uZXRsb2dvbi5jCisrKyBiL3NvdXJjZTQvcnBj
X3NlcnZlci9uZXRsb2dvbi9kY2VycGNfbmV0bG9nb24uYwpAQCAtNzkxLDYgKzc5MSw0OSBAQCBz
dGF0aWMgTlRTVEFUVVMgZGNlc3J2X25ldHJfU2VydmVyUGFzc3dvcmRTZXQyKHN0cnVjdCBkY2Vz
cnZfY2FsbF9zdGF0ZSAqZGNlX2NhbAogCQlyZXR1cm4gTlRfU1RBVFVTX1dST05HX1BBU1NXT1JE
OwogCX0KIAorCWRjZXNydl9jYWxsX2F1dGhfaW5mbyhkY2VfY2FsbCwgJmF1dGhfdHlwZSwgTlVM
TCk7CisKKwkvKgorCSAqIGV4cGxvaXRpbmcgQ1ZFLTIwMjAtMTQ3MiBpcyBvbmx5IHBvc3NpYmxl
IHdpdGhvdXQgc2NoYW5uZWwKKwkgKiB3cmFwcGluZyB0aGUgd2hvbGUgUlBDIGNvbm5lY3Rpb24K
KwkgKi8KKwlpZiAoYXV0aF90eXBlICE9IERDRVJQQ19BVVRIX1RZUEVfU0NIQU5ORUwpIHsKKwkJ
LyoKKwkJICogQ2hlY2sgdGhpcyBpcyBub3QgbGVzcyB0aGFuIG9sZAorCQkgKiBERUZBVUxUX1RS
VVNUX0FDQ09VTlRfUEFTU1dPUkRfTEVOR1RIICogMgorCQkgKiAKKwkJICogcmVhbGx5LCB0aGlz
IGlzIGFib3V0IG5vdCBiZWluZyB6ZXJvLCBidXQgbWFrZSB0aGluZ3MgYXMKKwkJICogaGFyZCBh
cyBwb3NzaWJsZSBmb3IgYW4gYXR0YWNrZXIKKwkJICovCisJCQorCQlpZiAobmV3X3Bhc3N3b3Jk
Lmxlbmd0aCA8IDI4KSB7CisJCQljb25zdCBjaGFyICpyZW1vdGUKKwkJCQk9IHRzb2NrZXRfYWRk
cmVzc19zdHJpbmcoZGNlX2NhbGwtPmNvbm4tPnJlbW90ZV9hZGRyZXNzLAorCQkJCQkJCSBtZW1f
Y3R4KTsKKwkJCURCR19FUlIoIlJlZnVzaW5nIHRvIHNldCBhIG5ldyBtYWNoaW5lIGFjY291bnQg
IgorCQkJCSJwYXNzd29yZCBvZiBsZW5ndGggJXV6IGZyb20gJXMiCisJCQkJIm9uICVzLCBpdCBp
cyB0b28gc2hvcnQgKDwxNCBVQ1MyIHVuaXRzKSBhbmQgbG9va3MgIgorCQkJCSJsaWtlIGEgQ1ZF
LTIwMjAtMTQ3MiBhdHRhY2siLAorCQkJCW5ld19wYXNzd29yZC5sZW5ndGgsCisJCQkJcmVtb3Rl
LAorCQkJCWNyZWRzLT5hY2NvdW50X25hbWUpOworCQkJcmV0dXJuIE5UX1NUQVRVU19XUk9OR19Q
QVNTV09SRDsKKwkJfQorCQkKKwkJZm9yIChpID0gMDsgaSA8IG5ld19wYXNzd29yZC5sZW5ndGgg
LyAyOyBpKyspIHsKKwkJCS8qIERvIG5vdCBhbGxvdyBlbWJlZGRlZCBOVUxMcyAqLworCQkJaWYg
KFBVTExfTEVfVTE2KG5ld19wYXNzd29yZC5kYXRhLCBpKSA9PSAwKSB7CisJCQkJREJHX0VSUigi
UmVmdXNpbmcgdG8gc2V0IGEgbmV3IG1hY2hpbmUgYWNjb3VudCAiCisJCQkJCSJwYXNzd29yZCBv
ZiB3aXRoIGFuIGVtYmVkZGVkIE5VTCBmcm9tICVzICIKKwkJCQkJIm9uICVzLCBpdCBsb29rcyAi
CisJCQkJCSJsaWtlIGEgQ1ZFLTIwMjAtMTQ3MiBhdHRhY2siLAorCQkJCQluZXdfcGFzc3dvcmQu
bGVuZ3RoLAorCQkJCQlyZW1vdGUsCisJCQkJCWNyZWRzLT5hY2NvdW50X25hbWUpOworCQkJfQor
CQl9CisJfQorCQogCS8qIGZldGNoIHRoZSBvbGQgcGFzc3dvcmQgaGFzaGVzIChhdCBsZWFzdCBv
bmUgb2YgYm90aCBoYXMgdG8gZXhpc3QpICovCiAKIAlyZXQgPSBnZW5kYl9zZWFyY2goc2FtX2N0
eCwgbWVtX2N0eCwgTlVMTCwgJnJlcywgYXR0cnMsCg==


--=-vJseFcw1rGrpy8ebsvr+--


