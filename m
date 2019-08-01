Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2C7E0D3
	for <lists+samba-technical@lfdr.de>; Thu,  1 Aug 2019 19:13:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5LnDnssFNI2r2iy9SZB32EyFtQAl0/3mPNdPCS0dF4E=; b=gtkABPDbgYNs/ekpN+BupfHrqX
	DEvQUbgXS0uABq/AK3e8g+b3eiFqeh3+7euRHcWcJ0RXgmsPtSZVd45TtKnWRc4yExGEzzJLkuLF5
	jXyxasoKTQSS30FwbxHzLpaT5DgIhM/mcAMN5z7KrKqrB2C5ZO4HB0h1vgM8WuDMgCNrlsuKt1Nqf
	rGZvWvc3v5rKmpj0X+AKMK7aRg9feJKhlUXfhJABfYAGjrn8Hc8kmFZ0kuvUaLix5jqHXNW6lSOnH
	4twyIiggZv0YTWYk6FGrxg99YHrpBowrB1VyEss3C3Od+qYuPtHO3upjKBay9hohTtQA0EjHsAq9+
	hdJOkXzA==;
Received: from localhost ([::1]:34798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1htEe6-003QjF-0V; Thu, 01 Aug 2019 17:13:42 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36676) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1htEe1-003Qj8-8d
 for samba-technical@lists.samba.org; Thu, 01 Aug 2019 17:13:39 +0000
Received: by mail-pg1-x541.google.com with SMTP id l21so34554651pgm.3
 for <samba-technical@lists.samba.org>; Thu, 01 Aug 2019 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5LnDnssFNI2r2iy9SZB32EyFtQAl0/3mPNdPCS0dF4E=;
 b=Lr++wZb3TCNiBfHGSIk5iX5NVvJq1B2rUgiTsD/BhA88wtFvA1bEHazxfOkwkV6N2W
 +W6i4FSAx7DNZeQkBsnqXbFgVOIasLz0QoptaeTPzUbCVho1ON8lHKUxcqrVJtZpnzRW
 xyL0doZcWTB3I6KxODK6lhLtepwjleRipuylcNNyV9UODXyI2Apk59GcJtxpOKHJ53ye
 VgeIFMWRIP2jtmgJbUFUA6e8fnAeLWv0Tr+zU+itM0p2gXD4MxdDPpu7BNodo8Zc4nm2
 cUGdEB0UbMGpx9K2uyEtYKKJEgetzp1+OHiCH9jBF+x+xxbF9FJ1dOZfqy1f1j29mm2v
 6wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5LnDnssFNI2r2iy9SZB32EyFtQAl0/3mPNdPCS0dF4E=;
 b=YADGkyzDpC5BC0pj/8PAY++aLlIJT+egDk1LPZ4zs5KEqfZeqOB0NKZppmNGWSmruB
 WG7Awq6LtbRyerp8jDwfTzWQO7FaZDaua+YsH0f1rTWSRobdmEELF804SOODc0Zj1QGX
 gaw8pDwBJgADsTmj6oB/hMmZzs0KvkxfNiZ6rgiQtx0KIBZHvmU5eK45JQcvpSeD7rJt
 Q19s2+ZhH2hnRTs+PkR0oMpulcASd1UeJ9Obv9F75CI0Qm+84ZLtitLyJ7AP/pSoK4Yf
 +a7yWC7FjHYCg9n/OEBznnCIQkD+K/Nu6wN1UKs88Dad/E+5VAXv4AIFCpuI1xCcwfgz
 3Ugw==
X-Gm-Message-State: APjAAAW4+hu8FGfi6K7mrXUSME7UhGuJx9J//WXLm4eH27hUMoT0kOYs
 elGChIcv0Oh0tnfqJCUa9MYywnk2Js/RZGZs9Wo=
X-Google-Smtp-Source: APXvYqyBiZAeH63tq3e65AzxEfiBW7+4MBYxO6hEdY80yQd5rhRsrlcrp+JQZ18p5OHRTxuNtJxZu6DJPqs/jY3CdOo=
X-Received: by 2002:a63:724b:: with SMTP id c11mr41592880pgn.30.1564679614836; 
 Thu, 01 Aug 2019 10:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <380e1b86-1911-b8a5-6b02-276b6d4be4fe@wallix.com>
 <CAKywueSO=choOsw6THnEnmN4UwhACHU1o1pJX8ypx0wjVTmiKQ@mail.gmail.com>
In-Reply-To: <CAKywueSO=choOsw6THnEnmN4UwhACHU1o1pJX8ypx0wjVTmiKQ@mail.gmail.com>
Date: Thu, 1 Aug 2019 12:13:23 -0500
Message-ID: <CAH2r5ms1qgpPrB+oOHWF7TVoZ36g3iska1PQ3dBGMrscq2K51g@mail.gmail.com>
Subject: Re: PROBLEM: Kernel oops when mounting a encryptData CIFS share with
 CONFIG_DEBUG_VIRTUAL
To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000a15fb3058f115c54"
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Sebastien Tisserant <stisserant@wallix.com>, Cristian Popi <cpopi@wallix.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Steve French <sfrench@samba.org>, Cyrille Mucchietto <cmucchietto@wallix.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000a15fb3058f115c54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sebastien,
I cleaned up the patch and merged into cifs-2.6.git - can you
doublecheck it is correct?


On Thu, Jul 25, 2019 at 3:35 PM Pavel Shilovsky
<pavel.shilovsky@gmail.com> wrote:
>
> =D1=87=D1=82, 25 =D0=B8=D1=8E=D0=BB. 2019 =D0=B3. =D0=B2 09:57, Sebastien=
 Tisserant via samba-technical
> <samba-technical@lists.samba.org>:
> ...
> >
> > mount works without CONFIG_DEBUG_VIRTUAL
> >
> > If we don't set CONFIG_VMAP_STACK mount works with CONFIG_DEBUG_VIRTUAL
> >
> >
> > We have the following (very quick and dirty) patch :
> >
> > Index: linux-4.19.60/fs/cifs/smb2ops.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- linux-4.19.60.orig/fs/cifs/smb2ops.c
> > +++ linux-4.19.60/fs/cifs/smb2ops.c
> > @@ -2545,7 +2545,15 @@ fill_transform_hdr(struct smb2_transform
> >  static inline void smb2_sg_set_buf(struct scatterlist *sg, const void =
*buf,
> >                     unsigned int buflen)
> >  {
> > -    sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
> > +      void *addr;
> > +      /*
> > +       * VMAP_STACK (at least) puts stack into the vmalloc address spa=
ce
> > +      */
> > +      if (is_vmalloc_addr(buf))
> > +              addr =3D vmalloc_to_page(buf);
> > +      else
> > +              addr =3D virt_to_page(buf);
> > +      sg_set_page(sg, addr, buflen, offset_in_page(buf));
> >  }
> >
> >  /* Assumes the first rqst has a transform header as the first iov.
> >
> >
>
> Thanks for reporting this. The patch looks good to me. Did you test
> your scenario all together with it (not only mounting)?
>
>
> Best regards,
> Pavel Shilovskiy



--=20
Thanks,

Steve

--000000000000a15fb3058f115c54
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-Kernel-oops-mounting-a-encryptData-share-with-C.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-Kernel-oops-mounting-a-encryptData-share-with-C.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jysxu1660>
X-Attachment-Id: f_jysxu1660

RnJvbSBlN2FmZGE2NWJlMzE5ODYzOWRlMGZjZjE3OTZkZGQwYTEwMWUxYWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWJhc3RpZW4gVGlzc2VyYW50IDxzdGlzc2VyYW50QHdhbGxp
eC5jb20+CkRhdGU6IFRodSwgMSBBdWcgMjAxOSAxMjowNjowOCAtMDUwMApTdWJqZWN0OiBbUEFU
Q0hdIFNNQjM6IEtlcm5lbCBvb3BzIG1vdW50aW5nIGEgZW5jcnlwdERhdGEgc2hhcmUgd2l0aAog
Q09ORklHX0RFQlVHX1ZJUlRVQUwKCkZpeCBrZXJuZWwgb29wcyB3aGVuIG1vdW50aW5nIGEgZW5j
cnlwdERhdGEgQ0lGUyBzaGFyZSB3aXRoCkNPTkZJR19ERUJVR19WSVJUVUFMCgpTaWduZWQtb2Zm
LWJ5OiBTZWJhc3RpZW4gVGlzc2VyYW50IDxzdGlzc2VyYW50QHdhbGxpeC5jb20+ClJldmlld2Vk
LWJ5OiBQYXZlbCBTaGlsb3Zza3kgPHBzaGlsb3ZAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9jaWZz
L3NtYjJvcHMuYyB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9jaWZzL3NtYjJvcHMuYyBiL2ZzL2Np
ZnMvc21iMm9wcy5jCmluZGV4IGZjNDY0ZGMyMGIzMC4uM2UzMjQzZDcxNTJjIDEwMDY0NAotLS0g
YS9mcy9jaWZzL3NtYjJvcHMuYworKysgYi9mcy9jaWZzL3NtYjJvcHMuYwpAQCAtMzUxMCw3ICsz
NTEwLDE1IEBAIGZpbGxfdHJhbnNmb3JtX2hkcihzdHJ1Y3Qgc21iMl90cmFuc2Zvcm1faGRyICp0
cl9oZHIsIHVuc2lnbmVkIGludCBvcmlnX2xlbiwKIHN0YXRpYyBpbmxpbmUgdm9pZCBzbWIyX3Nn
X3NldF9idWYoc3RydWN0IHNjYXR0ZXJsaXN0ICpzZywgY29uc3Qgdm9pZCAqYnVmLAogCQkJCSAg
IHVuc2lnbmVkIGludCBidWZsZW4pCiB7Ci0Jc2dfc2V0X3BhZ2Uoc2csIHZpcnRfdG9fcGFnZShi
dWYpLCBidWZsZW4sIG9mZnNldF9pbl9wYWdlKGJ1ZikpOworCXZvaWQgKmFkZHI7CisJLyoKKwkg
KiBWTUFQX1NUQUNLIChhdCBsZWFzdCkgcHV0cyBzdGFjayBpbnRvIHRoZSB2bWFsbG9jIGFkZHJl
c3Mgc3BhY2UKKwkgKi8KKwlpZiAoaXNfdm1hbGxvY19hZGRyKGJ1ZikpCisJCWFkZHIgPSB2bWFs
bG9jX3RvX3BhZ2UoYnVmKTsKKwllbHNlCisJCWFkZHIgPSB2aXJ0X3RvX3BhZ2UoYnVmKTsKKwlz
Z19zZXRfcGFnZShzZywgYWRkciwgYnVmbGVuLCBvZmZzZXRfaW5fcGFnZShidWYpKTsKIH0KIAog
LyogQXNzdW1lcyB0aGUgZmlyc3QgcnFzdCBoYXMgYSB0cmFuc2Zvcm0gaGVhZGVyIGFzIHRoZSBm
aXJzdCBpb3YuCi0tIAoyLjIwLjEKCg==
--000000000000a15fb3058f115c54--

