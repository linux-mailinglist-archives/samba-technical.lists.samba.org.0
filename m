Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D56F9DDD0E
	for <lists+samba-technical@lfdr.de>; Sun, 20 Oct 2019 08:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5vwQHA8UXcG24RQ4RpH73nA1gxGLM7OKHxB0cMJ1U8k=; b=FU2n9oCeaa9e6LVV+Q8NNF4/tB
	8KaPrbPnX/7DMfXn7Q0UR/E3z0GbJ75CzD8lT6qNF85KDb7fjosxM3TrI8bcK+0nZiv6D0fn22g4w
	ix3MaRt2ouRDPz9X3sfOpk0PQ15cy2DHBXv9KEN4ETsb6JK/Kh/bof740mCDw+Eklt664K0OkDxGi
	qicdkZ/Oa1t5U3PCQuzCeAdADfNQUrx6+lHtkBMUNmCEVKhidAi6HUHY20A9/6fgvQJ8YW09wk6p0
	msvr5rFJgvAqwa7T0fmiIv+cwvTYYqfLoZHaVo6CYJQP2YiDkXhq49+hW8Rsem4U+Jy+UAvkPv1bl
	RyHlwE4g==;
Received: from localhost ([::1]:54718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iM4qI-000m7H-C5; Sun, 20 Oct 2019 06:37:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iM4q4-000m79-7K
 for samba-technical@lists.samba.org; Sun, 20 Oct 2019 06:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=5vwQHA8UXcG24RQ4RpH73nA1gxGLM7OKHxB0cMJ1U8k=; b=xyUf0V5oPGw66r94sqX2aJZDjo
 1fB5Trk9X27gH0//tk3H0ATUluXRikGg59xYcmvZy1JV4oHrvWZFO5rcfSC89/aEmzh/FTQA6JyVO
 EA+DO0yW8UZMaH7dTJHv4QKAnBC/VHQfzQYQ7T8vATxKPO80qhJci7O+ry84KWuBrSc4rWU0IKY86
 MS0WT0G0BminW8WOU7NgUFA+iZ6MmeDwtJBCGqWA9yp5BbLx5BHMc5/37neFKfTvORySMSDo+Upkp
 CYteIzgKdNXr9r/VQg83CP/cVZ4HzlmXXq0iN1ruxUFMX3oteCtWTFkd8NeuP//tXqfq0Na/8duHL
 rbn+Bm5g30p6O4/iQ6twKLlfDhtJqgSJgmrRQqjWY4foMuDHPqjNlSzNQdVdr6WpH6eYuZnZAlZ3G
 mY8TIKVOTleYHEiYYgP/b2miBigIkbUWOHIOhEK1rr/5Ud7H3SS6IF6VdKlG7DRoMxq/+q3jZkUkg
 mfma4qyhxU+LhxVWaqDKo0r/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iM4q1-0007Bu-KT; Sun, 20 Oct 2019 06:37:13 +0000
To: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Subject: [PATCH] build - use system asn1_compile to cross-compile Samba's
 bundled Heimdal
Message-ID: <80f0d797-a4df-2694-f707-4dfb41b0bbdf@samba.org>
Date: Sun, 20 Oct 2019 09:37:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------F597C7AB337D1429DCE06835"
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: neil@nmacleod.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------F597C7AB337D1429DCE06835
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

(Taking discussion from https://bugzilla.samba.org/show_bug.cgi?id=14164 
to the list)

Attached is yet another cross-compilation fix which I submitted to 
bugzilla for test by reporter before MR. The fix works for the reporter, 
  but has been Nacked by Andrew, and I'd like to discuss this further here.

Background:
- Heimdal build requires two tools, asn1_compile and compile_et, which 
are binary programs.
- In the native build of Samba with embedded Heimdal, we build them 
first and use them to build the rest of Heimdal.
- This fails on cross-build for obvious reasons.
- One workaround (which I've been using when I was in the embedded Samba 
business) is to build Samba natively, stash the binaries of asn1_compile 
and compile_et somewhere, and set environment vars COMPILE_ET and 
ASN1_COMPILE to point to these binaries.
- A different workaround which is in common use (buildroot, OpenWRT, 
LibreELEC to name just a few) is to *somehow* host-build compile_et and 
asn1_compile and install them in the build's path, then run configure 
with the flag --bundled-libraries='!asn1_compile,!compile_et'. This 
would invoke a configuration test which finds the binaries in the path 
and sets COMPILE_ET / ASN1_COMPILE accordingly. Let's call that "the 
automatic method".
- The "somehow" seems to mostly be building of stand-alone Heimdal 
package. So Samba gets cross-built with asn1_compile that came from 
stand-alone Heimdal, and compile_et which comes from either Heimdal or, 
possibly, another package that produces this binary and has been 
host-built such as e2fsprogs. Both might be overriden by what happens to 
be installed on the build-host, if the distro doesn't take care to put 
its built tools in the path before the system tools.
- commit 8061983d4882f3ba3f12da71443b035d7b672eec broke the automatic 
method, because it invokes the test to find binaries only if using 
system Heimdal.

The attached patch fixes "the automatic method". Andrew Nacked it 
because using some binary that we don't know where it came from is prone 
to incompatibility issues. In fact, it appears that embedded vendors 
routinely use a patch that removes inclusion of <unistd.h> from one of 
Samba's libreplace files, just because of the automatic method, and this 
patch works on 4.11 but breaks master. A better fix would be to get 
Samba's build system to build asn1_compile and compile_et using the host 
compiler.

After this long background, my response to the Nack:

1. Does waf support this mixed-build method? Are there examples / 
pointers? (I can try myself but any pointers would be welcome)
2. Shouldn't we "get things to the way they were" before supplying "the 
perfect fix"? I fear of me running out of time and continuing this at a 
much slower pace.
3. If we nack the fix, would it be correct to say that the current 
situation, where "the automatic method" is invoked in system-heimdal 
build makes no sense, as there's no need for asn1_compile / et_compile 
with system Heimdal?

Thanks,
Uri.

--------------F597C7AB337D1429DCE06835
Content-Type: text/plain; charset=UTF-8;
 name="fix-14164.patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="fix-14164.patch.txt"

RnJvbSBiMzcxMTBkMGIzODBlYzZiOTJhMzRjMzZiYTM5ZDczYWU3NTkwZjkyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcmkgU2ltY2hvbmkgPHVyaUBzYW1iYS5vcmc+CkRh
dGU6IFN1biwgMjAgT2N0IDIwMTkgMDA6MDM6MTQgKzAzMDAKU3ViamVjdDogW1BBVENIXSBi
dWlsZDogZmluZCBwcmUtYnVpbHQgaGVpbWRhbCBidWlsZCB0b29scyBpbiBjYXNlIG9mIGVt
YmVkZGVkCiBoZWltZGFsCgpUaGlzIHBhdGNoIGZpeGVzIHRoZSBjYXNlIG9mIGZpbmRpbmcg
YXNuMV9jb21waWxlIGFuZCBjb21waWxlX2V0IGZvcgpidWlsZGluZyBlbWJlZGRlZCBoZWlt
ZGFsLCBieSBzZXR0aW5nCi0tYnVuZGxlZC1saWJyYXJpZXM9JyFhc24xX2NvbXBpbGUsIWNv
bXBpbGVfZXQnIGFzIGNvbmZpZ3VyZSBmbGFncy4KClRoZSBIZWltZGFsIGJ1aWxkIHRvb2xz
IGNvbXBpbGVfZXQgYW5kIGFzbjFfY29tcGlsZSBhcmUgbmVlZGVkICpvbmx5KgppZiB3ZSB1
c2UgdGhlIGVtYmVkZGVkIGhlaW1kYWwgKG90aGVyd2lzZSB3ZSBkb24ndCBidWlsZCBoZWlt
ZGFsIGFuZAp1c2UgaGVhZGVycyB0aGF0IGhhdmUgYmVlbiBnZW5lcmF0ZWQgYnkgdGhvc2Ug
dG9vbHMgZWxzZXdoZXJlKS4KCkZvciBjcm9zcy1jb21waWxhdGlvbiB3aXRoIGVtYmVkZGVk
IGhlaW1kYWwsIGl0IGlzIHZpdGFsIHRvIHVzZSBob3N0IGJ1aWxkCnRvb2xzLCBhbmQgc28g
YXNuMV9jb21waWxlIGFuZCBjb21waWxlX2V0IG11c3QgYmUgc3VwcGxpZWQgYW5kIG5vdApi
dWlsdC4gT25lIHdheSBvZiBkb2luZyB0aGlzIHdvdWxkIGJlIHRvIHNldCB0aGUgQ09NUElM
RV9FVCBhbmQKQVNOMV9DT01QSUxFIGVudiB2YXJzIHRvIHRoZSBsb2NhdGlvbiBvZiBzdXBw
bGllZCBiaW5hcmllcy4gQW5vdGhlciB3YXksCndoaWNoIGlzIG1vcmUgY29tbW9ubHkgdXNl
ZCwgaXMgdG8gZXhjbHVkZSBhc24xX2NvbXBpbGUgYW5kIGNvbXBpbGVfZXQKZnJvbSBidW5k
bGVkIHBhY2thZ2VzIHZpYSB0aGUgc3dpdGNoCi1idW5kbGVkLWxpYnJhcmllcz0nIWFzbjFf
Y29tcGlsZSwhY29tcGlsZV9ldCcuIFdoZW4gdGhpcyBpcyBkb25lLAp0aGUgYnVpbGQgc2Ny
aXB0IHNlYXJjaGVzIHRoZSBwYXRoIGZvciB0aG9zZSB0b29scyBhbmQgc2V0cyB0aGUKQVNO
MV9DT01QSUxFIGFuZCBDT01QSUxFX0VUIHZhcnMgYWNjb3JkaW5nbHkuICh0aGlzIGlzIGFk
bWl0dGVkbHkKa2luZCBvZiBhIHJvdW5kLWFib3V0IHdheSBvZiBkb2luZyB0aGluZ3MgYnV0
IHRoaXMgaGFzIGJlY29tZSB0aGUKZGUtZmFjdG8gc3RhbmRhcmQgYW1vbmdzdCBlbWJlZGRl
ZCBkaXN0cm8gYnVpbGRlcnMpLgoKSW4gY29tbWl0IDgwNjE5ODNkNDg4MmYzYmEzZjEyZGE3
MTQ0M2IwMzVkN2I2NzJlZWMsIHRoaXMgcHJvY2VzcyBvZgpmaW5kaW5nIHRoZSBiaW5hcmlz
IGhhcyBiZWVuIG1vdmVkIHRvIGJlIGNhcnJpZWQgb3V0IG9ubHkgaW4gdGhlCnN5c3RlbSBo
ZWltZGFsIGNhc2UuIEFzIGV4cGxhaW5lZCBhYm92ZSwgd2Ugb25seSBuZWVkIHRoZXNlIHRv
b2xzLAphbmQgaGVuY2UgdGhlIGNoZWNrLCBpbiBidW5kbGVkIG1vZGUuCgpCVUc6IGh0dHBz
Oi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDE2NAoKU2lnbmVkLW9m
Zi1ieTogVXJpIFNpbWNob25pIDx1cmlAc2FtYmEub3JnPgotLS0KIHdzY3JpcHRfY29uZmln
dXJlX2VtYmVkZGVkX2hlaW1kYWwgfCAxMSArKysrKysrKysrKwogd3NjcmlwdF9jb25maWd1
cmVfc3lzdGVtX2hlaW1kYWwgICB8IDExIC0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3dzY3Jp
cHRfY29uZmlndXJlX2VtYmVkZGVkX2hlaW1kYWwgYi93c2NyaXB0X2NvbmZpZ3VyZV9lbWJl
ZGRlZF9oZWltZGFsCmluZGV4IDhjNTVhZTJhOTM4Li40ZmRhZTgwNjJjNSAxMDA2NDQKLS0t
IGEvd3NjcmlwdF9jb25maWd1cmVfZW1iZWRkZWRfaGVpbWRhbAorKysgYi93c2NyaXB0X2Nv
bmZpZ3VyZV9lbWJlZGRlZF9oZWltZGFsCkBAIC0xICsxLDEyIEBACiBjb25mLlJFQ1VSU0Uo
J3NvdXJjZTQvaGVpbWRhbF9idWlsZCcpCisKK2RlZiBjaGVja19zeXN0ZW1faGVpbWRhbF9i
aW5hcnkobmFtZSk6CisgICAgaWYgY29uZi5MSUJfTUFZX0JFX0JVTkRMRUQobmFtZSk6Cisg
ICAgICAgIHJldHVybiBGYWxzZQorICAgIGlmIG5vdCBjb25mLmZpbmRfcHJvZ3JhbShuYW1l
LCB2YXI9bmFtZS51cHBlcigpKToKKyAgICAgICAgcmV0dXJuIEZhbHNlCisgICAgY29uZi5k
ZWZpbmUoJ1VTSU5HX1NZU1RFTV8lcycgJSBuYW1lLnVwcGVyKCksIDEpCisgICAgcmV0dXJu
IFRydWUKKworY2hlY2tfc3lzdGVtX2hlaW1kYWxfYmluYXJ5KCJjb21waWxlX2V0IikKK2No
ZWNrX3N5c3RlbV9oZWltZGFsX2JpbmFyeSgiYXNuMV9jb21waWxlIikKZGlmZiAtLWdpdCBh
L3dzY3JpcHRfY29uZmlndXJlX3N5c3RlbV9oZWltZGFsIGIvd3NjcmlwdF9jb25maWd1cmVf
c3lzdGVtX2hlaW1kYWwKaW5kZXggMGZmNmRhZDJmNTUuLmY3N2MxNzc0NDJmIDEwMDY0NAot
LS0gYS93c2NyaXB0X2NvbmZpZ3VyZV9zeXN0ZW1faGVpbWRhbAorKysgYi93c2NyaXB0X2Nv
bmZpZ3VyZV9zeXN0ZW1faGVpbWRhbApAQCAtMzYsMTQgKzM2LDYgQEAgZGVmIGNoZWNrX3N5
c3RlbV9oZWltZGFsX2xpYihuYW1lLCBmdW5jdGlvbnM9JycsIGhlYWRlcnM9JycsIG9ubHlp
Zj1Ob25lKToKICAgICBjb25mLmRlZmluZSgnVVNJTkdfU1lTVEVNXyVzJyAlIG5hbWUudXBw
ZXIoKSwgMSkKICAgICByZXR1cm4gVHJ1ZQogCi1kZWYgY2hlY2tfc3lzdGVtX2hlaW1kYWxf
YmluYXJ5KG5hbWUpOgotICAgIGlmIGNvbmYuTElCX01BWV9CRV9CVU5ETEVEKG5hbWUpOgot
ICAgICAgICByZXR1cm4gRmFsc2UKLSAgICBpZiBub3QgY29uZi5maW5kX3Byb2dyYW0obmFt
ZSwgdmFyPW5hbWUudXBwZXIoKSk6Ci0gICAgICAgIHJldHVybiBGYWxzZQotICAgIGNvbmYu
ZGVmaW5lKCdVU0lOR19TWVNURU1fJXMnICUgbmFtZS51cHBlcigpLCAxKQotICAgIHJldHVy
biBUcnVlCi0KIGNoZWNrX3N5c3RlbV9oZWltZGFsX2xpYigiY29tX2VyciIsICJjb21fcmln
aHRfciBjb21fZXJyIiwgImNvbV9lcnIuaCIpCiAKIGlmIGNoZWNrX3N5c3RlbV9oZWltZGFs
X2xpYigicm9rZW4iLCAicmtfc29ja2V0X3NldF9yZXVzZWFkZHIiLCAicm9rZW4uaCIpOgpA
QCAtOTQsNiArODYsMyBAQCBmaW5hbGx5OgogIyBXaXRoIHRoZSBwcm9wZXIgY2hlY2tzIGlu
IHBsYWNlIHdlIHNob3VsZCBiZSBhYmxlIHRvIGJ1aWxkIGFnYWluc3QgdGhlIHN5c3RlbSBs
aWJ0b21tYXRoLgogI2lmIGNvbmYuQ0hFQ0tfQlVORExFRF9TWVNURU0oJ3RvbW1hdGgnLCBj
aGVja2Z1bmN0aW9ucz0nbXBfaW5pdCcsIGhlYWRlcnM9J3RvbW1hdGguaCcpOgogIyAgICBj
b25mLmRlZmluZSgnVVNJTkdfU1lTVEVNX1RPTU1BVEgnLCAxKQotCi1jaGVja19zeXN0ZW1f
aGVpbWRhbF9iaW5hcnkoImNvbXBpbGVfZXQiKQotY2hlY2tfc3lzdGVtX2hlaW1kYWxfYmlu
YXJ5KCJhc24xX2NvbXBpbGUiKQotLSAKMi4yMS4wCgo=
--------------F597C7AB337D1429DCE06835--

