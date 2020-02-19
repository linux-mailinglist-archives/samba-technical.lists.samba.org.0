Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1BE164F47
	for <lists+samba-technical@lfdr.de>; Wed, 19 Feb 2020 20:54:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pBjYAowuIGw/j4IQ/QrGOj399z/ptL52UYzYwlEaHBs=; b=JtBa9wC2Ajm9KbwEySs6MrDUuV
	rznpoD3VG/IkCW+ktPdgF1uyY+KCxvqdmPacNao7+tWjaWpfBWJrZVRbM3oQXLI0yRGwd0n/OuJ7m
	mbl3mutsonRcRX0mGU91Jf1WkTlzpOoUTIJsKYJi1BbUEmjvD1dVdikYOXtec5W6c7Jq0Wf3DLD11
	lTjO+K0dnc6nLU8IL3ml7uYju7UCn+uyN3lEe+MYORzJ4GZJx8kkHmj/BzuktMv+FZ9LyRGkR+kX5
	DrmBKs+yi+y0UAv/LkX9h4bz6K1mjo3J6C/iitIykck2EhTp91uQM0OfxC2z7rtyClCtubVQ94CTK
	A5tm6zuQ==;
Received: from localhost ([::1]:36740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j4VPa-00Agog-FF; Wed, 19 Feb 2020 19:53:34 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:39140) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j4VPV-00AgoZ-0Q
 for samba-technical@lists.samba.org; Wed, 19 Feb 2020 19:53:31 +0000
Received: by mail-lf1-x143.google.com with SMTP id t23so1104919lfk.6
 for <samba-technical@lists.samba.org>; Wed, 19 Feb 2020 11:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pBjYAowuIGw/j4IQ/QrGOj399z/ptL52UYzYwlEaHBs=;
 b=i6XjnNhLTfbxPofb8rGcGXH0JXOxGqriudZFNiS2CDf41WSdB8ZBanAdUaom0xp5SK
 kNrk66LvuQccy9ayKWauRkXvsFJ+IhiHArx3fOKzlPhyOquCXeqKnFQXp3wa/5Yi0/Fy
 JoqogEx50WH2CcIFZDO/ylfVbLF66pnb2o4DiLdX7yeHwqYeWY+KGGkWkj0G/Nj+gYeO
 sSXbrhVPQMzDvReaNzlRT0yu2EoY3YL8bAIy9Wx2KcG0uz+QHSMail879jWxnObPMo7R
 Oq8CrqhmNs8MigxgnyGg67jYrHAeykMgpdvjUDm0/4JZRnnlx/cLc3w6gVne63Ldzt5Q
 iebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pBjYAowuIGw/j4IQ/QrGOj399z/ptL52UYzYwlEaHBs=;
 b=gU1IgdS2DMFbgfWxTCJQMnKbhMjVS7f2aiGNpDyGrYY1tbUY3H7utaMJciwOEWrXs4
 pf7IIvt5DT+T3BVHptonynCj3I95n28vgIzNTWaN4f3iy67H7wI2fz5LkvXHxg7ib0/w
 xC6ceN2jxlYeuRmMYiYscJiovgTo18n/1Cs5G8h59Yy1VjcWFDcqunqEyXqRuJTgld+8
 JrSpmH6agrqD2JuSSCDLs95S23yLUSQWdKxsPrkbqgE0TDrNOiJUm+ERuwiygr0A6agS
 A/8AAx06CWgqe1Pj4KQZGpb5xSKgk4XChS+KsmjVaDIylu7s3AfOxu1GMpuwKqWZzUCd
 wdWw==
X-Gm-Message-State: APjAAAV2oXTJPrHw85010l/wioPswUg9vdXhfvQ3Z6DVYL0W6kNBKdAZ
 BPRTF/VyhbQKItagh4WXUrTyqhOpkVfYGCpt8BZpKzo7
X-Google-Smtp-Source: APXvYqxU1bzIjNrCj8ooQXbSHf21S+QROU1cXCrsyK/gMpV2BfbYLyfaF/tQ+CWdn6j4oFB7A41javXngTibj5Iei7Y=
X-Received: by 2002:ac2:5f65:: with SMTP id c5mr12889059lfc.207.1582142007950; 
 Wed, 19 Feb 2020 11:53:27 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8RB99k4YXuXpCRqZoN-L7G2q603cnPa5vE43boNXaj23w@mail.gmail.com>
In-Reply-To: <CAC-fF8RB99k4YXuXpCRqZoN-L7G2q603cnPa5vE43boNXaj23w@mail.gmail.com>
Date: Wed, 19 Feb 2020 20:53:16 +0100
Message-ID: <CAC-fF8TCPzDOFrova2BjbmSgewEaJfozjzakjWE6xnyKKwtR+g@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Stefan Metzmacher <metze@samba.org>
Content-Type: multipart/mixed; boundary="0000000000005e556f059ef324c2"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000005e556f059ef324c2
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 19, 2020 at 12:27 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.org> wrote:
> >
> > I looked at it a bit, see
> > https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=ac8fd11f1d4b9deb48d6c7942af0c83b52d69d7f
> >
> > I think we need input from dochelp to answer 2 questions:
> > 1. which kind of channel bindings are expected/used by windows?
> >    I assume tls-server-end-point. I guess MS-ADTS would be the place
> >    to define these details for ldaps.
>
> This blog also suggests it's tls-server-end-point (about HTTP) :

It's definitely "tls-server-end-point:", I got ldapsearch working by
hardcoding my lab server certificate just before the gss_init_sec
call, see attached.

import hashlib
md = hashlib.sha256()
md.update(bytes.fromhex(certificate_bytes_from_wireshare))
mydata = b'tls-server-end-point:' + md.digest()

--0000000000005e556f059ef324c2
Content-Type: text/x-patch; charset="US-ASCII"; name="cyrus.patch"
Content-Disposition: attachment; filename="cyrus.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k6tqe55c0>
X-Attachment-Id: f_k6tqe55c0

RnJvbSA5Y2RkYmQ2NjQwZjc2MjVkNjM3ZWM0OGZhZTJhMDY3Y2M5ZDY5MzA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBJc2FhYyBCb3VrcmlzIDxpYm91a3Jpc0BnbWFpbC5jb20+CkRh
dGU6IFdlZCwgMTkgRmViIDIwMjAgMjE6MTY6MjIgKzAyMDAKU3ViamVjdDogW1BBVENIXSB0bXAK
Ci0tLQogcGx1Z2lucy9nc3NhcGkuYyB8IDE3ICsrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BsdWdp
bnMvZ3NzYXBpLmMgYi9wbHVnaW5zL2dzc2FwaS5jCmluZGV4IDlkMWQxMjcuLjNlM2FmZDAgMTAw
NjQ0Ci0tLSBhL3BsdWdpbnMvZ3NzYXBpLmMKKysrIGIvcGx1Z2lucy9nc3NhcGkuYwpAQCAtMTY0
MCw2ICsxNjQwLDE2IEBAIHN0YXRpYyBpbnQgZ3NzYXBpX2NsaWVudF9tZWNoX25ldyh2b2lkICpn
bG9iX2NvbnRleHQsCiAgICAgcmV0dXJuIFNBU0xfT0s7CiB9CiAKK3VpbnQ4X3QgbXlkYXRhW10g
PSB7CisgICAgMHg3NCwgMHg2YywgMHg3MywgMHgyZCwgMHg3MywgMHg2NSwgMHg3MiwgMHg3NiwK
KyAgICAweDY1LCAweDcyLCAweDJkLCAweDY1LCAweDZlLCAweDY0LCAweDJkLCAweDcwLAorICAg
IDB4NmYsIDB4NjksIDB4NmUsIDB4NzQsIDB4M2EsIDB4ZGMsIDB4YmIsIDB4ZDQsCisgICAgMHhl
YiwgMHg0MiwgMHgyYSwgMHgwMSwgMHg5OSwgMHg3OSwgMHhiMiwgMHg4OCwKKyAgICAweDdhLCAw
eDA0LCAweGMyLCAweGJhLCAweDRmLCAweDc4LCAweGEzLCAweGNkLAorICAgIDB4NmIsIDB4ZjEs
IDB4ZjgsIDB4N2QsIDB4MTcsIDB4YTQsIDB4NTYsIDB4ZGMsCisgICAgMHg0MSwgMHhiMiwgMHhk
OSwgMHg1NCwgMHg5YgorfTsKKwogc3RhdGljIGludCBnc3NhcGlfY2xpZW50X21lY2hfc3RlcCh2
b2lkICpjb25uX2NvbnRleHQsCiAJCQkJICAgc2FzbF9jbGllbnRfcGFyYW1zX3QgKnBhcmFtcywK
IAkJCQkgICBjb25zdCBjaGFyICpzZXJ2ZXJpbiwKQEAgLTE2NjMsNiArMTY3MywxMSBAQCBzdGF0
aWMgaW50IGdzc2FwaV9jbGllbnRfbWVjaF9zdGVwKHZvaWQgKmNvbm5fY29udGV4dCwKICAgICBp
bnB1dF90b2tlbi0+bGVuZ3RoID0gMDsKICAgICBnc3NfY3JlZF9pZF90IGNsaWVudF9jcmVkcyA9
IChnc3NfY3JlZF9pZF90KXBhcmFtcy0+Z3NzX2NyZWRzOwogCisgICAgLyogWFhYICovCisgICAg
c3RydWN0IGdzc19jaGFubmVsX2JpbmRpbmdzX3N0cnVjdCBjYiA9IHswfTsKKyAgICBjYi5hcHBs
aWNhdGlvbl9kYXRhLmxlbmd0aCA9IHNpemVvZihteWRhdGEpOworICAgIGNiLmFwcGxpY2F0aW9u
X2RhdGEudmFsdWUgPSBteWRhdGE7CisKICAgICBpZiAoY2xpZW50b3V0KQogICAgICAgICAqY2xp
ZW50b3V0ID0gTlVMTDsKICAgICBpZiAoY2xpZW50b3V0bGVuKQpAQCAtMTc4NSw3ICsxODAwLDcg
QEAgc3RhdGljIGludCBnc3NhcGlfY2xpZW50X21lY2hfc3RlcCh2b2lkICpjb25uX2NvbnRleHQs
CiAJCQkJCXRleHQtPm1lY2hfdHlwZSwKIAkJCQkJcmVxX2ZsYWdzLAogCQkJCQkwLAotCQkJCQlH
U1NfQ19OT19DSEFOTkVMX0JJTkRJTkdTLAorCQkJCQkmY2IsLy9HU1NfQ19OT19DSEFOTkVMX0JJ
TkRJTkdTLAogCQkJCQlpbnB1dF90b2tlbiwKIAkJCQkJTlVMTCwKIAkJCQkJb3V0cHV0X3Rva2Vu
LAotLSAKMi4yNC4xCgo=
--0000000000005e556f059ef324c2--

