Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 843343E3DB8
	for <lists+samba-technical@lfdr.de>; Mon,  9 Aug 2021 03:38:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=cE/wEBMDQzmELnz6lgtQsQEBJRXSpip992ZaeZl9A74=; b=feNnypoDidTsOYA7ugiRmTRLv2
	d30I2t1L61351/BwW7viX4Dxo7+Ew4Fgc933PDyNLC4kaCaKW0YRBkrR4x48GuwAU3n5YJjSdjoDr
	39yy2LYpnu1n45or5K8tXyLaF4azdFr80QZAThufTKYz99dsZdRb4JNz4iGx7YYY86pLgslfqIV1e
	W5s9XwFiEt6Z4x7Gws+SaRZ6GnX1V4wg/QkujyTQFixnM1p7TxYZv6f7WHpLx59vVTgon7yhFLeGp
	smKi0XkppV/yN5TL3CJvgi42q7GR+RdVl+wp8oMkjfXDxoUxdDXDHAk172M2cNJgmEeORKf8/9E9S
	ZxkxIgHA==;
Received: from ip6-localhost ([::1]:32782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mCuEl-005G1M-IR; Mon, 09 Aug 2021 01:37:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mCuEe-005G1D-2f
 for samba-technical@lists.samba.org; Mon, 09 Aug 2021 01:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=cE/wEBMDQzmELnz6lgtQsQEBJRXSpip992ZaeZl9A74=; b=j5WF+7abo6seaXxMAqGnzb5Obl
 l0XpQ8NQs59snY71wizkgWgPks1ghxTVVVNAy27BtsZ7Ys0voFl5HVxYPKMa/ShlkYQj15Y78k5ER
 MlMplYKfxAH++gfvxMIUFPsL+G/eTLY4+eogEiU3ejl66l+l6mOCATw7jGm+zj5LggCbD2R/0jHSp
 gmtG3BVwhazw1F/at0yXesybNNhIn06B2P1vfiOwqavT18kF9Mts3Btyf5Z1o7eJkiXMX6aSdMvda
 nIHLVEHeOOCDnHNKDpY36vNY8D7lM58s+MrUwXtE5fNWqryLHVcKRbBHKl/BgpTj93+Jd35lfqejN
 F8mdRHp056+DffN4m4i3wranUNponIUKkosml/jak728k4nhQhxw+yUBcYYzzJeWy4ABtkFfigzT7
 lRKaoXoZtz+M+rH1+yZpmYYJJpIcLJkgnoG/7uQbCgvjdMtuscQdmz3rSocL7sKFRf4U4BziCPc7g
 Vqh0GjbzP46s6GASENMAFOFA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mCuEc-000Go3-96; Mon, 09 Aug 2021 01:37:47 +0000
Message-ID: <fb006a0427d71d5f05a6217ff19e12974a6b647d.camel@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>, Isaac Boukris <iboukris@gmail.com>
Date: Mon, 09 Aug 2021 13:37:42 +1200
In-Reply-To: <0a68b013c3d1d6988d54ef5473a47e50973d0892.camel@samba.org>
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
 <c328766b-d894-517f-966c-fa5305558633@samba.org>
 <a78f79643b03b31afbe505b932df2cc46fb0254d.camel@samba.org>
 <0a68b013c3d1d6988d54ef5473a47e50973d0892.camel@samba.org>
Content-Type: multipart/mixed; boundary="=-9MkaY6dj8Bk67IEB+YHH"
User-Agent: Evolution 3.36.5-0ubuntu1 
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


--=-9MkaY6dj8Bk67IEB+YHH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-08-09 at 11:12 +1200, Andrew Bartlett via samba-technical
wrote:
> On Fri, 2021-07-09 at 22:29 +1200, Andrew Bartlett via samba-
> technical
> wrote:
> > We now have a mostly-working branch of current Heimdal on current
> > Samba, compiling on all our supported system, which is pretty
> > impressive.
> 
> I just wanted to wrap back to the list with an update.  Thanks to
> some
> great work with Luke Howard recently, host of our pull requests with
> Heimdal have either been merged or will be shortly (as in, I made the
> requested changes and expect them to be accepted).
> 
> This means that we are actually fairly close to upstream Heimdal,
> closer than we ever have been I dare to suggest.
> 
> The remaining changes outstanding are:
> ...

There are also, which were on the Samba side, the attached.

I'm not really sure about them - I think

source4/heimdal/lib/krb5/init_creds_pw.c KRB5_NT_ENTERPRISE_PRINCIPAL
ctx->flags.canonicalize = 1

is trying to do the same as the Samba-side commit:

testprogs/blackbox/ --enterprise --canonicalize

Is that the case, and so could we drop the Heimdal side now?

I also don't know what 
source4/heimdal/lib/krb5/mcache.c anonymous resolving
is for or fixes.  Can you shed some light on this?

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions

--=-9MkaY6dj8Bk67IEB+YHH
Content-Disposition: attachment;
	filename*0=0001-source4-heimdal-lib-krb5-mcache.c-anonymous-resolvin.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-source4-heimdal-lib-krb5-mcache.c-anonymous-resolvin.patch";
	charset="UTF-8"

RnJvbSBhZjdhNzU0Nzg4NTllMTNmYTQwNjJmOWNlOGFlOTgxMWQ2Zjg2NjcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEub3JnPgpE
YXRlOiBXZWQsIDEgQXByIDIwMjAgMjM6MDk6NTcgKzAyMDAKU3ViamVjdDogW1BBVENIIDEvMl0g
c291cmNlNC9oZWltZGFsL2xpYi9rcmI1L21jYWNoZS5jIGFub255bW91cyByZXNvbHZpbmcKCihj
aGVycnkgcGlja2VkIGZyb20gU2FtYmEgY29tbWl0IDg3MWE0ZTdhMWNhYjI2NWIyODIwZmFjZGJj
NmYxOWExMTZlOWFmNzQpCi0tLQogbGliL2tyYjUvbWNhY2hlLmMgfCA3NiArKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9rcmI1L21jYWNo
ZS5jIGIvbGliL2tyYjUvbWNhY2hlLmMKaW5kZXggMGRiNmQ2NmI0NS4uNDIxZTYyY2VlNSAxMDA2
NDQKLS0tIGEvbGliL2tyYjUvbWNhY2hlLmMKKysrIGIvbGliL2tyYjUvbWNhY2hlLmMKQEAgLTgw
LDYgKzgwLDcgQEAgbWNjX2FsbG9jKGtyYjVfY29udGV4dCBjb250ZXh0LCBjb25zdCBjaGFyICpu
YW1lLCBrcmI1X21jYWNoZSAqKm91dCkKICAgICBrcmI1X21jYWNoZSAqbSwgKm1fYzsKICAgICBz
aXplX3QgY291bnRlciA9IDA7CiAgICAgaW50IHJldCA9IDA7CisgICAgdW5zaWduZWQgY3JlYXRl
X2Fub255bW91cyA9IDA7CiAKICAgICAqb3V0ID0gTlVMTDsKICAgICBBTExPQyhtLCAxKTsKQEAg
LTkyLDI3ICs5MywxOCBAQCBhZ2FpbjoKICAgICAgICAgZnJlZShtKTsKICAgICAgICAgcmV0dXJu
IEVBR0FJTjsgLyogWFhYICovCiAgICAgfQotICAgIGlmKG5hbWUgPT0gTlVMTCkKKyAgICBpZihu
YW1lID09IE5VTEwpIHsKIAlyZXQgPSBhc3ByaW50ZigmbS0+bmFtZSwgInUlcC0lbGx1IiwgbSwg
KHVuc2lnbmVkIGxvbmcgbG9uZyljb3VudGVyKTsKLSAgICBlbHNlCisgICAgfSBlbHNlIGlmIChz
dHJjbXAobmFtZSwgImFub255bW91cyIpID09IDApIHsKKwlyZXQgPSBhc3ByaW50ZigmbS0+bmFt
ZSwgImFub255bW91cy0lcC0lbGx1IiwgbSwgKHVuc2lnbmVkIGxvbmcgbG9uZyljb3VudGVyKTsK
KyAgICAgICAgY3JlYXRlX2Fub255bW91cyA9IDE7CisgICAgfSBlbHNlIHsKIAltLT5uYW1lID0g
c3RyZHVwKG5hbWUpOworICAgIH0KICAgICBpZihyZXQgPCAwIHx8IG0tPm5hbWUgPT0gTlVMTCkg
ewogCWZyZWUobSk7CiAJcmV0dXJuIGtyYjVfZW5vbWVtKGNvbnRleHQpOwogICAgIH0KLSAgICBp
ZiAoc3RyY21wKG0tPm5hbWUsICJhbm9ueW1vdXMiKSA9PSAwKSB7Ci0gICAgICAgIEhFSU1EQUxf
TVVURVhfaW5pdCgmKG0tPm11dGV4KSk7Ci0gICAgICAgIG0tPmFub255bW91cyA9IDE7Ci0gICAg
ICAgIG0tPmRlYWQgPSAwOwotICAgICAgICBtLT5yZWZjbnQgPSAxOwotICAgICAgICBtLT5wcmlt
YXJ5X3ByaW5jaXBhbCA9IE5VTEw7Ci0gICAgICAgIG0tPmNyZWRzID0gTlVMTDsKLSAgICAgICAg
bS0+bXRpbWUgPSB0aW1lKE5VTEwpOwotICAgICAgICBtLT5rZGNfb2Zmc2V0ID0gMDsKLSAgICAg
ICAgbS0+bmV4dCA9IE5VTEw7Ci0gICAgICAgICpvdXQgPSBtOwotICAgICAgICByZXR1cm4gMDsK
LSAgICB9CiAKICAgICAvKiBjaGVjayBmb3IgZHVwcyBmaXJzdCAqLwogICAgIEhFSU1EQUxfTVVU
RVhfbG9jaygmbWNjX211dGV4KTsKQEAgLTEyMiw3ICsxMTQsNyBAQCBhZ2FpbjoKICAgICBpZiAo
bV9jKSB7CiAgICAgICAgIGZyZWUobS0+bmFtZSk7CiAgICAgICAgIGZyZWUobSk7Ci0gICAgICAg
IGlmIChuYW1lKSB7CisgICAgICAgIGlmIChuYW1lICYmICFjcmVhdGVfYW5vbnltb3VzKSB7CiAg
ICAgICAgICAgICAvKiBXZSByYWNlZCB3aXRoIGFub3RoZXIgdGhyZWFkIHRvIGNyZWF0ZSB0aGlz
IGNhY2hlICovCiAgICAgICAgICAgICBtID0gbV9jOwogICAgICAgICAgICAgSEVJTURBTF9NVVRF
WF9sb2NrKCYobS0+bXV0ZXgpKTsKQEAgLTE0MSw3ICsxMzMsNyBAQCBhZ2FpbjoKICAgICAgICAg
cmV0dXJuIDA7CiAgICAgfQogCi0gICAgbS0+YW5vbnltb3VzID0gMDsKKyAgICBtLT5hbm9ueW1v
dXMgPSBjcmVhdGVfYW5vbnltb3VzOwogICAgIG0tPmRlYWQgPSAwOwogICAgIG0tPnJlZmNudCA9
IDE7CiAgICAgbS0+cHJpbWFyeV9wcmluY2lwYWwgPSBOVUxMOwpAQCAtMjc5LDE4ICsyNzEsNiBA
QCBtY2NfZGVzdHJveShrcmI1X2NvbnRleHQgY29udGV4dCwKIHsKICAgICBrcmI1X21jYWNoZSAq
Km4sICptID0gTUNBQ0hFKGlkKTsKIAotICAgIGlmIChtLT5hbm9ueW1vdXMpIHsKLSAgICAgICAg
SEVJTURBTF9NVVRFWF9sb2NrKCYobS0+bXV0ZXgpKTsKLSAgICAgICAgaWYgKG0tPnJlZmNudCA9
PSAwKSB7Ci0gICAgICAgICAgICBIRUlNREFMX01VVEVYX3VubG9jaygmKG0tPm11dGV4KSk7Ci0g
ICAgICAgICAgICBrcmI1X2Fib3J0eChjb250ZXh0LCAibWNjX2Rlc3Ryb3k6IHJlZmNudCBhbHJl
YWR5IDAiKTsKLSAgICAgICAgfQotICAgICAgICBpZiAoIU1JU0RFQUQobSkpCi0gICAgICAgICAg
ICBtY2NfZGVzdHJveV9pbnRlcm5hbChjb250ZXh0LCBtKTsKLSAgICAgICAgSEVJTURBTF9NVVRF
WF91bmxvY2soJihtLT5tdXRleCkpOwotICAgICAgICByZXR1cm4gMDsKLSAgICB9Ci0KICAgICBI
RUlNREFMX01VVEVYX2xvY2soJm1jY19tdXRleCk7CiAgICAgSEVJTURBTF9NVVRFWF9sb2NrKCYo
bS0+bXV0ZXgpKTsKICAgICBpZiAobS0+cmVmY250ID09IDApCkBAIC00NTgsNiArNDM4LDI0IEBA
IHN0cnVjdCBtY2FjaGVfaXRlciB7CiAgICAga3JiNV9tY2FjaGUgKmNhY2hlOwogfTsKIAorc3Rh
dGljIGtyYjVfbWNhY2hlICoKK21jY19nZXRfY2FjaGVfZmluZF9uZXh0X2ludGVybmFsKGtyYjVf
bWNhY2hlICpuZXh0KQoreworICAgIEhFSU1EQUxfTVVURVhfbG9jaygmbWNjX211dGV4KTsKKyAg
ICBmb3IgKDsgbmV4dCAhPSBOVUxMICYmIG5leHQtPmFub255bW91czsgbmV4dCA9IG5leHQtPm5l
eHQpIHsKKwkvKiBub29wOiBpdGVyYXRlIG92ZXIgYWxsIGFub255bW91cyBlbnRyaWVzICovCisg
ICAgfQorICAgIGlmIChuZXh0ICE9IE5VTEwpIHsKKwlIRUlNREFMX01VVEVYX2xvY2soJihuZXh0
LT5tdXRleCkpOworCW5leHQtPnJlZmNudCsrOworCUhFSU1EQUxfTVVURVhfdW5sb2NrKCYobmV4
dC0+bXV0ZXgpKTsKKwluZXh0ID0gbmV4dC0+bmV4dDsKKyAgICB9CisgICAgSEVJTURBTF9NVVRF
WF91bmxvY2soJm1jY19tdXRleCk7CisKKyAgICByZXR1cm4gbmV4dDsKK30KKwogc3RhdGljIGty
YjVfZXJyb3JfY29kZSBLUkI1X0NBTExDT05WCiBtY2NfZ2V0X2NhY2hlX2ZpcnN0KGtyYjVfY29u
dGV4dCBjb250ZXh0LCBrcmI1X2NjX2N1cnNvciAqY3Vyc29yKQogewpAQCAtNDY3LDE0ICs0NjUs
NyBAQCBtY2NfZ2V0X2NhY2hlX2ZpcnN0KGtyYjVfY29udGV4dCBjb250ZXh0LCBrcmI1X2NjX2N1
cnNvciAqY3Vyc29yKQogICAgIGlmIChpdGVyID09IE5VTEwpCiAJcmV0dXJuIGtyYjVfZW5vbWVt
KGNvbnRleHQpOwogCi0gICAgSEVJTURBTF9NVVRFWF9sb2NrKCZtY2NfbXV0ZXgpOwotICAgIGl0
ZXItPmNhY2hlID0gbWNjX2hlYWQ7Ci0gICAgaWYgKGl0ZXItPmNhY2hlKSB7Ci0JSEVJTURBTF9N
VVRFWF9sb2NrKCYoaXRlci0+Y2FjaGUtPm11dGV4KSk7Ci0JaXRlci0+Y2FjaGUtPnJlZmNudCsr
OwotCUhFSU1EQUxfTVVURVhfdW5sb2NrKCYoaXRlci0+Y2FjaGUtPm11dGV4KSk7Ci0gICAgfQot
ICAgIEhFSU1EQUxfTVVURVhfdW5sb2NrKCZtY2NfbXV0ZXgpOworICAgIGl0ZXItPmNhY2hlID0g
bWNjX2dldF9jYWNoZV9maW5kX25leHRfaW50ZXJuYWwobWNjX2hlYWQpOwogCiAgICAgKmN1cnNv
ciA9IGl0ZXI7CiAgICAgcmV0dXJuIDA7CkBAIC00OTAsMTcgKzQ4MSw4IEBAIG1jY19nZXRfY2Fj
aGVfbmV4dChrcmI1X2NvbnRleHQgY29udGV4dCwga3JiNV9jY19jdXJzb3IgY3Vyc29yLCBrcmI1
X2NjYWNoZSAqaWQpCiAgICAgaWYgKGl0ZXItPmNhY2hlID09IE5VTEwpCiAJcmV0dXJuIEtSQjVf
Q0NfRU5EOwogCi0gICAgSEVJTURBTF9NVVRFWF9sb2NrKCZtY2NfbXV0ZXgpOwogICAgIG0gPSBp
dGVyLT5jYWNoZTsKLSAgICBpZiAobS0+bmV4dCkKLSAgICB7Ci0gICAgCUhFSU1EQUxfTVVURVhf
bG9jaygmKG0tPm5leHQtPm11dGV4KSk7Ci0gICAgCW0tPm5leHQtPnJlZmNudCsrOwotICAgIAlI
RUlNREFMX01VVEVYX3VubG9jaygmKG0tPm5leHQtPm11dGV4KSk7Ci0gICAgfQotCi0gICAgaXRl
ci0+Y2FjaGUgPSBtLT5uZXh0OwotICAgIEhFSU1EQUxfTVVURVhfdW5sb2NrKCZtY2NfbXV0ZXgp
OworICAgIGl0ZXItPmNhY2hlID0gbWNjX2dldF9jYWNoZV9maW5kX25leHRfaW50ZXJuYWwobSk7
CiAKICAgICByZXQgPSBfa3JiNV9jY19hbGxvY2F0ZShjb250ZXh0LCAma3JiNV9tY2Nfb3BzLCBp
ZCk7CiAgICAgaWYgKHJldCkKLS0gCjIuMjUuMQoK


--=-9MkaY6dj8Bk67IEB+YHH
Content-Disposition: attachment;
	filename*0=0002-source4-heimdal-lib-krb5-init_creds_pw.c-KRB5_NT_ENT.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0002-source4-heimdal-lib-krb5-init_creds_pw.c-KRB5_NT_ENT.patch";
	charset="UTF-8"

RnJvbSBjNGU1MGQ0MmM5MDk4Y2RmZTU1MzBhMDVlMTk2MGEzNTJhYjc4ZjBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEub3JnPgpE
YXRlOiBNb24sIDYgQXByIDIwMjAgMTU6MTY6NDIgKzAyMDAKU3ViamVjdDogW1BBVENIIDIvMl0g
c291cmNlNC9oZWltZGFsL2xpYi9rcmI1L2luaXRfY3JlZHNfcHcuYwogS1JCNV9OVF9FTlRFUlBS
SVNFX1BSSU5DSVBBTCBjdHgtPmZsYWdzLmNhbm9uaWNhbGl6ZSA9IDEKCihjaGVycnkgcGlja2Vk
IGZyb20gU2FtYmEgY29tbWl0IDYzOWI2NGM4ZmQ3Y2VmYzBmNGU3MzQxNjIyMTZmMjU1YjVhNGVm
ZWIpCi0tLQogbGliL2tyYjUvaW5pdF9jcmVkc19wdy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9rcmI1L2luaXRfY3JlZHNfcHcuYyBi
L2xpYi9rcmI1L2luaXRfY3JlZHNfcHcuYwppbmRleCAwYzU1ZDJjNGJiLi4zMjViYThhNGMyIDEw
MDY0NAotLS0gYS9saWIva3JiNS9pbml0X2NyZWRzX3B3LmMKKysrIGIvbGliL2tyYjUvaW5pdF9j
cmVkc19wdy5jCkBAIC00MjgsNiArNDI4LDggQEAgZ2V0X2luaXRfY3JlZHNfY29tbW9uKGtyYjVf
Y29udGV4dCBjb250ZXh0LAogCiAgICAgaWYgKGN0eC0+aWNfZmxhZ3MgJiBLUkI1X0lOSVRfQ1JF
RFNfQ0FOT05JQ0FMSVpFKQogCWN0eC0+ZmxhZ3MuY2Fub25pY2FsaXplID0gMTsKKyAgICBpZiAo
a3JiNV9wcmluY2lwYWxfZ2V0X3R5cGUoY29udGV4dCwgY2xpZW50KSA9PSBLUkI1X05UX0VOVEVS
UFJJU0VfUFJJTkNJUEFMKQorCWN0eC0+ZmxhZ3MuY2Fub25pY2FsaXplID0gMTsKIAogICAgIGN0
eC0+cHJlX2F1dGhfdHlwZXMgPSBOVUxMOwogICAgIGN0eC0+YWRkcnMgPSBOVUxMOwotLSAKMi4y
NS4xCgo=


--=-9MkaY6dj8Bk67IEB+YHH--


