Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1392D5B6294
	for <lists+samba-technical@lfdr.de>; Mon, 12 Sep 2022 23:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OCzUBFDjZ9LDdzFT/vq01ardY8WFuVe7fdACs/gZjGI=; b=jzDoosc5ep+N/lVJzrJIFsBRsU
	5HJp5XG+HmRZG4DlY9wJsYsFLADPZEVo8rZz+F9tA7dUXm4m97JcmQ+evN/FDf7lovVPtDKldP/63
	XJvGq7lsYN/SppGHlTbtvRnv5WyorFQrSjHmju/q/uzUOpt4BY/PIrDzMxzBo9DYUi+qbciGDBox7
	N3AM1EyhgP6XySjZ8p8i9PqiQdLyzmjnxDZfujKql11dhEnDODUwBf+NMHPJdcVJcQiar722P8t1w
	L3A0zuk5Xsf365+Ib0IqxfR7Bo3ayOYUcvtXMyBVE1RcE0vx9/5+Y0Mx5jOE7eLj/z3nvo5U3KGwU
	x+5OYBVA==;
Received: from ip6-localhost ([::1]:29284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oXqie-000Dgz-Eu; Mon, 12 Sep 2022 21:11:52 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:33656) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oXqia-000Dgq-0c
 for samba-technical@lists.samba.org; Mon, 12 Sep 2022 21:11:50 +0000
Received: by mail-vk1-xa34.google.com with SMTP id k14so4886068vkk.0
 for <samba-technical@lists.samba.org>; Mon, 12 Sep 2022 14:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=OCzUBFDjZ9LDdzFT/vq01ardY8WFuVe7fdACs/gZjGI=;
 b=SQPxz6cF2tHwTiY2mY+R5z2Dcrlakc8plLsk1G3xMr/FSLXpt3qDSTVHHUaHZ2wBjf
 sHSx4GNqFgyDv6e1qJNvpNSWB1ukpvXWJB6iidQ9D0wMTq0zopkmIMbcX0Xzs7w/p2zH
 tM5Ne+aCy5rRwtUoGyEBhBqLkyFVSc4cvMc5tOFN/3KLeKBp8mB4XcbdgBot0975fO5f
 WVwQRcGWcWzRJD7WFHZ7sOuycNe75VlETVG8/mx9+KICaTAH3d6fGZ1u2V3pIzu0s6R9
 4LKu5BMOPxGZUff9fBmBYYsEyYcrlT23ZLZrKlVi+Pox0PB4zZlXi0M3qGL8TCk4xwck
 zQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=OCzUBFDjZ9LDdzFT/vq01ardY8WFuVe7fdACs/gZjGI=;
 b=4a7MerWA3xpV9xels1fK4G86j9BeIiAHsnaFaFB6uiypPTtaScnPGwTAh4SC0o6n4S
 JqKQE6gUHedFdyu2DtzDrGeD08ueFmz/5T1oZtCizkzOKhJsyFKlnxUesyf5VX4jFdaR
 JIxCtPGsxMTr239huWqmS/vopbaWZCrMNsnKV+i/EwPI6usLcyX257ZbiJ/uU8qrDq+E
 Hou2M+0YjwS/OesATGFGgFJQ80Bg43Fxzr3+SS4SbNkAFRxjKc+cj1BDM7j+3TwRcGhB
 Ci9L5vX0+iM3ySk20UKvl+hn9oSDOCmTGdVoZbV3n68DyBn39mfuJopaKPchENv5+SVp
 eXaA==
X-Gm-Message-State: ACgBeo046G2dlXFPrHUoOV7VbFnt0rDm/bJ8cp5qlGqbxux3dyw+9e7j
 TTQmH/jB8niI0t9GqUm9GBMq0S5bA8EpzbncZYmoH8zW
X-Google-Smtp-Source: AA6agR6IwwLmZBsGzfz65V1vWx8xt64MdJAMQX2IV+CShMb1M3QbAqvRy58sAYR6RLD/dBseJ74t/luJgzzrB87eGxc=
X-Received: by 2002:a1f:918d:0:b0:3a1:e376:7463 with SMTP id
 t135-20020a1f918d000000b003a1e3767463mr6048642vkd.38.1663017097634; Mon, 12
 Sep 2022 14:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvC5sqwuLyLt=3PXYvPegOm-8rqSMYcCpjM3+T64fv2sg@mail.gmail.com>
 <f19d2bf6-6b05-f782-fcfa-1c09c867dcb2@samba.org>
In-Reply-To: <f19d2bf6-6b05-f782-fcfa-1c09c867dcb2@samba.org>
Date: Mon, 12 Sep 2022 16:11:25 -0500
Message-ID: <CAH2r5mucwiYKjVSOCggeNJCTor2krV7UneZaVuDvF7wB2WhZ4g@mail.gmail.com>
Subject: Re: [PATCH][SMB3.1.1 client] fallback to query fs all info if posix
 query fs not supported
To: Stefan Metzmacher <metze@samba.org>
Content-Type: multipart/mixed; boundary="0000000000005ca3b005e88157ad"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000005ca3b005e88157ad
Content-Type: text/plain; charset="UTF-8"

updated the patch to remove the fall back - and simply do the
compounding for this code path (when statfs is posix query fs info) as
we already do for the non-POSIX statfs code path.

On Mon, Sep 12, 2022 at 12:51 AM Stefan Metzmacher <metze@samba.org> wrote:
>
> Am 12.09.22 um 07:36 schrieb Steve French via samba-technical:
> > A version of Samba that I was testing, supported POSIX extensions, but
> > not the query fs info
> > level.  Fall back to query fs all info if POSIX query fs info not
> > supported.
> >
> > Also fixes the problem that compounding wasn't being used for posix
> > qfs info in this path (statfs) but was being used in others, so
> > improves performance of posix query fs info.
>
> I don't think having hacks to work with work in progress branches should be
> added, instead the server should be fixed.
>
> metze
>


-- 
Thanks,

Steve

--0000000000005ca3b005e88157ad
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb311-compound-SMB311-posix-query-fs-info-for-statf.patch"
Content-Disposition: attachment; 
	filename="0001-smb311-compound-SMB311-posix-query-fs-info-for-statf.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l7z9filz0>
X-Attachment-Id: f_l7z9filz0

RnJvbSA0YzUzM2E4MjAwY2EyODg5MTE3YTYwNDU5OTcwMTlmMGVhM2UzZDE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgMTEgU2VwIDIwMjIgMTk6NDk6MDQgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzMTE6IGNvbXBvdW5kIFNNQjMxMSBwb3NpeCBxdWVyeSBmcyBpbmZvIGZvciBzdGF0ZnMKCkZp
eGVzIHRoZSBwcm9ibGVtIHRoYXQgY29tcG91bmRpbmcgd2Fzbid0IGJlaW5nIHVzZWQgZm9yIHBv
c2l4CnFmcyBpbmZvIGluIHRoaXMgcGF0aCAoc3RhdGZzKSBidXQgd2FzIGJlaW5nIHVzZWQgaW4g
b3RoZXJzLCBzbwppbXByb3ZlcyBwZXJmb3JtYW5jZSBvZiBwb3NpeCBxdWVyeSBmcyBpbmZvLgoK
U2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0K
IGZzL2NpZnMvc21iMm9wcy5jICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tCiBmcy9jaWZzL3NtYjJwZHUuYyAgIHwgIDIgKy0KIGZzL2NpZnMvc21iMnByb3Rv
LmggfCAgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9mcy9jaWZzL3NtYjJvcHMuYyBiL2ZzL2NpZnMvc21iMm9wcy5j
CmluZGV4IDQyMWJlNDNhZjQyNS4uZDZkZDgzOWNhMWJiIDEwMDY0NAotLS0gYS9mcy9jaWZzL3Nt
YjJvcHMuYworKysgYi9mcy9jaWZzL3NtYjJvcHMuYwpAQCAtMjU1NywzMSArMjU1NywzNyBAQCBz
dGF0aWMgaW50CiBzbWIzMTFfcXVlcnlmcyhjb25zdCB1bnNpZ25lZCBpbnQgeGlkLCBzdHJ1Y3Qg
Y2lmc190Y29uICp0Y29uLAogCSAgICAgICBzdHJ1Y3QgY2lmc19zYl9pbmZvICpjaWZzX3NiLCBz
dHJ1Y3Qga3N0YXRmcyAqYnVmKQogeworCXN0cnVjdCBzbWIyX3F1ZXJ5X2luZm9fcnNwICpyc3A7
CisJc3RydWN0IGt2ZWMgcnNwX2lvdiA9IHtOVUxMLCAwfTsKKwlGSUxFX1NZU1RFTV9QT1NJWF9J
TkZPICppbmZvID0gTlVMTDsKKwlpbnQgYnVmdHlwZSA9IENJRlNfTk9fQlVGRkVSOwogCWludCBy
YzsKLQlfX2xlMTYgc3JjaF9wYXRoID0gMDsgLyogTnVsbCAtIG9wZW4gcm9vdCBvZiBzaGFyZSAq
LwotCXU4IG9wbG9jayA9IFNNQjJfT1BMT0NLX0xFVkVMX05PTkU7Ci0Jc3RydWN0IGNpZnNfb3Bl
bl9wYXJtcyBvcGFybXM7Ci0Jc3RydWN0IGNpZnNfZmlkIGZpZDsKIAogCWlmICghdGNvbi0+cG9z
aXhfZXh0ZW5zaW9ucykKIAkJcmV0dXJuIHNtYjJfcXVlcnlmcyh4aWQsIHRjb24sIGNpZnNfc2Is
IGJ1Zik7CiAKLQlvcGFybXMudGNvbiA9IHRjb247Ci0Jb3Bhcm1zLmRlc2lyZWRfYWNjZXNzID0g
RklMRV9SRUFEX0FUVFJJQlVURVM7Ci0Jb3Bhcm1zLmRpc3Bvc2l0aW9uID0gRklMRV9PUEVOOwot
CW9wYXJtcy5jcmVhdGVfb3B0aW9ucyA9IGNpZnNfY3JlYXRlX29wdGlvbnMoY2lmc19zYiwgMCk7
Ci0Jb3Bhcm1zLmZpZCA9ICZmaWQ7Ci0Jb3Bhcm1zLnJlY29ubmVjdCA9IGZhbHNlOwotCi0JcmMg
PSBTTUIyX29wZW4oeGlkLCAmb3Bhcm1zLCAmc3JjaF9wYXRoLCAmb3Bsb2NrLCBOVUxMLCBOVUxM
LAotCQkgICAgICAgTlVMTCwgTlVMTCk7CisJcmMgPSBzbWIyX3F1ZXJ5X2luZm9fY29tcG91bmQo
eGlkLCB0Y29uLCAiIiwKKwkJCQkgICAgICBGSUxFX1JFQURfQVRUUklCVVRFUywKKwkJCQkgICAg
ICBGU19QT1NJWF9JTkZPUk1BVElPTiwKKwkJCQkgICAgICBTTUIyX09fSU5GT19GSUxFU1lTVEVN
LAorCQkJCSAgICAgIHNpemVvZihGSUxFX1NZU1RFTV9QT1NJWF9JTkZPKSwKKwkJCQkgICAgICAm
cnNwX2lvdiwgJmJ1ZnR5cGUsIGNpZnNfc2IpOwogCWlmIChyYykKLQkJcmV0dXJuIHJjOworCQln
b3RvIHBxZnNfZXhpdDsKIAotCXJjID0gU01CMzExX3Bvc2l4X3Fmc19pbmZvKHhpZCwgdGNvbiwg
ZmlkLnBlcnNpc3RlbnRfZmlkLAotCQkJCSAgIGZpZC52b2xhdGlsZV9maWQsIGJ1Zik7CisJcnNw
ID0gKHN0cnVjdCBzbWIyX3F1ZXJ5X2luZm9fcnNwICopcnNwX2lvdi5pb3ZfYmFzZTsKIAlidWYt
PmZfdHlwZSA9IFNNQjJfU1VQRVJfTUFHSUM7Ci0JU01CMl9jbG9zZSh4aWQsIHRjb24sIGZpZC5w
ZXJzaXN0ZW50X2ZpZCwgZmlkLnZvbGF0aWxlX2ZpZCk7CisJaW5mbyA9IChGSUxFX1NZU1RFTV9Q
T1NJWF9JTkZPICopKAorCQlsZTE2X3RvX2NwdShyc3AtPk91dHB1dEJ1ZmZlck9mZnNldCkgKyAo
Y2hhciAqKXJzcCk7CisJcmMgPSBzbWIyX3ZhbGlkYXRlX2lvdihsZTE2X3RvX2NwdShyc3AtPk91
dHB1dEJ1ZmZlck9mZnNldCksCisJCQkgICAgICAgbGUzMl90b19jcHUocnNwLT5PdXRwdXRCdWZm
ZXJMZW5ndGgpLAorCQkJICAgICAgICZyc3BfaW92LAorCQkJICAgICAgIHNpemVvZihGSUxFX1NZ
U1RFTV9QT1NJWF9JTkZPKSk7CisJaWYgKCFyYykKKwkJY29weV9wb3NpeF9mc19pbmZvX3RvX2tz
dGF0ZnMoaW5mbywgYnVmKTsKKworcHFmc19leGl0OgorCWZyZWVfcnNwX2J1ZihidWZ0eXBlLCBy
c3BfaW92Lmlvdl9iYXNlKTsKIAlyZXR1cm4gcmM7CiB9CiAKZGlmZiAtLWdpdCBhL2ZzL2NpZnMv
c21iMnBkdS5jIGIvZnMvY2lmcy9zbWIycGR1LmMKaW5kZXggNjM1MmFiMzJjN2U3Li4wMWYwY2Mx
NjIwYmQgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMnBkdS5jCisrKyBiL2ZzL2NpZnMvc21iMnBk
dS5jCkBAIC01MjUxLDcgKzUyNTEsNyBAQCBzbWIyX2NvcHlfZnNfaW5mb190b19rc3RhdGZzKHN0
cnVjdCBzbWIyX2ZzX2Z1bGxfc2l6ZV9pbmZvICpwZnNfaW5mLAogCXJldHVybjsKIH0KIAotc3Rh
dGljIHZvaWQKK3ZvaWQKIGNvcHlfcG9zaXhfZnNfaW5mb190b19rc3RhdGZzKEZJTEVfU1lTVEVN
X1BPU0lYX0lORk8gKnJlc3BvbnNlX2RhdGEsCiAJCQlzdHJ1Y3Qga3N0YXRmcyAqa3N0KQogewpk
aWZmIC0tZ2l0IGEvZnMvY2lmcy9zbWIycHJvdG8uaCBiL2ZzL2NpZnMvc21iMnByb3RvLmgKaW5k
ZXggM2Y3NDBmMjRiOTZhLi5jOTZjNmNhZDkwYTQgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMnBy
b3RvLmgKKysrIGIvZnMvY2lmcy9zbWIycHJvdG8uaApAQCAtMjY3LDYgKzI2Nyw4IEBAIGV4dGVy
biBpbnQgc21iMl92YWxpZGF0ZV9hbmRfY29weV9pb3YodW5zaWduZWQgaW50IG9mZnNldCwKIGV4
dGVybiB2b2lkIHNtYjJfY29weV9mc19pbmZvX3RvX2tzdGF0ZnMoCiAJIHN0cnVjdCBzbWIyX2Zz
X2Z1bGxfc2l6ZV9pbmZvICpwZnNfaW5mLAogCSBzdHJ1Y3Qga3N0YXRmcyAqa3N0KTsKK2V4dGVy
biB2b2lkIGNvcHlfcG9zaXhfZnNfaW5mb190b19rc3RhdGZzKEZJTEVfU1lTVEVNX1BPU0lYX0lO
Rk8gKnJlc3BvbnNlX2RhdGEsCisJCQkJCSAgc3RydWN0IGtzdGF0ZnMgKmtzdCk7CiBleHRlcm4g
aW50IHNtYjMxMV9jcnlwdG9fc2hhc2hfYWxsb2NhdGUoc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAq
c2VydmVyKTsKIGV4dGVybiBpbnQgc21iMzExX3VwZGF0ZV9wcmVhdXRoX2hhc2goc3RydWN0IGNp
ZnNfc2VzICpzZXMsCiAJCQkJICAgICAgc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAqc2VydmVyLAot
LSAKMi4zNC4xCgo=
--0000000000005ca3b005e88157ad--

