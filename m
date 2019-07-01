Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E85FF5C4C8
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2019 23:06:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9TxhAvO9zqAfxuKK8PfvfOCDHKXA4YLihM6253x59/Q=; b=j9N2gMVqnm834yjC1ay+R5KNe3
	f9oMLuUIEexlaGeUvVrxvodm5ShpjCtTKsTFVFoG7RKcmypkzqg6aY/12wPTQLthAV1iuSifEgt1s
	AvQ8ntwB7S6fGB597vIztdQOILCc0KjDEabu/tgvLOm1E9062pSaJ0/Qll/EOMr0lT8iMoVgwBKj5
	3bVbQio4QpdHl20W5U5NHrmujBO6x0QTwN7UYMmp72uihDNfuNTwTgJMA+qmPisjEok2fXrlSOD6H
	QsqGpTwgHyWNtlpQMlTV2YTxsH3fcfkLBJ7mkfmP1yR4GRcXcXz+L8GDvfY+q9kduuX9Gyxna1sYf
	1u8foZ+A==;
Received: from localhost ([::1]:37926 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hi3U5-004LJN-2s; Mon, 01 Jul 2019 21:05:09 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42159) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hi3U0-004LJG-5B
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 21:05:06 +0000
Received: by mail-pl1-x643.google.com with SMTP id ay6so7903994plb.9
 for <samba-technical@lists.samba.org>; Mon, 01 Jul 2019 14:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9TxhAvO9zqAfxuKK8PfvfOCDHKXA4YLihM6253x59/Q=;
 b=JSJxaBstqFZKbF2uwtUC+RgbaVu19OlukIYYjnsLbDW8o7UXh++H+tFzsjZCkoGQeL
 4f8+/EX0gs8ZbQ0hYtLP0WushVycqWKx0cv7tHlcWSMj0N6az2xYwcpeogULMW4FKL/I
 1AZhuoDkhtXPqaagbe1grxRA3h/eAbGworSZveeSRu/9mT3iqRhk8DE8mRBxSephFWAy
 kg6HIlJpjZvT6yJfrdOK1yhheAQIMR7yewY46Sg1tC9GWKNPFpqHSYDYxgrvYumfEUvH
 fXfHVtAQmHuhVlfp3IlrHeHwCN9iRKwdR+Dc1n8Vkxl/SCdMJtt4SUzwCd8IeQVntUrn
 vtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TxhAvO9zqAfxuKK8PfvfOCDHKXA4YLihM6253x59/Q=;
 b=WS6Yr+yVXLy2bcIVxX1NY1B9eHPS5KhTPP1b0Vqr27rQUtu899Z80S+P7wVAAftWAY
 o9PovpiDKbBYCjtaV1D0DmzLRwWTzGMEWEgMIY72e0S3Cjnd20M4c727JHRBfcoq3Rqs
 xxxiH5rztU8uqgWiJREaj8b/r2lJnT//g6lrHxUUtmt47WMkP9AiyOwc2KzoxAN+7f4p
 TAcnicpTxkp0Ekt+vYV2clYNekLIvxMLF3o7mGxL5bX5Fl1L3mUp+OQzdKcVLVQVATPk
 ciBgESvNRo2bWcF9Uc3MXvZOJAhKRYScUGCEK1NV9QVHa6AvL5j2iyWh/c85dr829Cp4
 FnPA==
X-Gm-Message-State: APjAAAVI4dYK2KPWpjJgrg0DoZm9+B/Lqp63BHFg9XcPiaO+u4Erni/e
 7BFAx2YS+osUT9ZmXJXWqAgMAehCe9M31fUV5fI=
X-Google-Smtp-Source: APXvYqzhWaBYh+OXaLyUrrHU2hgCXHUa/EEucvYceNVZUyL8/hvy3wIdjun0LOA71RTxAo4nsKWQM2IIleJCfnADpio=
X-Received: by 2002:a17:902:2a68:: with SMTP id
 i95mr31602176plb.167.1562015100563; 
 Mon, 01 Jul 2019 14:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190701030325.18188-1-sergey.senozhatsky@gmail.com>
In-Reply-To: <20190701030325.18188-1-sergey.senozhatsky@gmail.com>
Date: Mon, 1 Jul 2019 16:04:49 -0500
Message-ID: <CAH2r5mutRM0d9oLG0rpRAzTC9DMWL61i0ewbri8v7Lgu1Ud5yQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix build by selecting CONFIG_KEYS
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000341b41058ca4fb33"
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000341b41058ca4fb33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I had already merged the attached (similar) fix into cifs-2.6.git for-next


On Sun, Jun 30, 2019 at 10:24 PM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> CONFIG_CIFS_ACL had a dependency "depends on KEYS" which was
> dropped with the removal of CONFIG_CIFS_ACL. This breaks the
> build on systems which don't have CONFIG_KEYS in .config:
>
> cifsacl.c:37:15: error: variable =E2=80=98cifs_idmap_key_acl=E2=80=99 has
>                  initializer but incomplete type
>    37 | static struct key_acl cifs_idmap_key_acl =3D {
>       |               ^~~~~~~
> cifsacl.c:38:3: error: =E2=80=98struct key_acl=E2=80=99 has no member
>                 named =E2=80=98usage=E2=80=99
>    38 |  .usage =3D REFCOUNT_INIT(1),
>       |   ^~~~~
> [..]
>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> ---
>  fs/cifs/Kconfig   | 1 +
>  fs/cifs/cifsacl.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/fs/cifs/Kconfig b/fs/cifs/Kconfig
> index 3eee73449bdd..5912751e6f09 100644
> --- a/fs/cifs/Kconfig
> +++ b/fs/cifs/Kconfig
> @@ -17,6 +17,7 @@ config CIFS
>         select CRYPTO_ECB
>         select CRYPTO_AES
>         select CRYPTO_DES
> +       select KEYS
>         help
>           This is the client VFS module for the SMB3 family of NAS protoc=
ols,
>           (including support for the most recent, most secure dialect SMB=
3.1.1)
> diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
> index 78eed72f3af0..8ca479caf902 100644
> --- a/fs/cifs/cifsacl.c
> +++ b/fs/cifs/cifsacl.c
> @@ -24,6 +24,7 @@
>  #include <linux/fs.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/key.h>
>  #include <linux/keyctl.h>
>  #include <linux/key-type.h>
>  #include <keys/user-type.h>
> --
> 2.22.0
>


--=20
Thanks,

Steve

--000000000000341b41058ca4fb33
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-CIFS-Fix-module-dependency.patch"
Content-Disposition: attachment; 
	filename="0001-CIFS-Fix-module-dependency.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jxkvgaqw0>
X-Attachment-Id: f_jxkvgaqw0

RnJvbSAyNzVlMzUxNTJlNzEzY2IxODYzMzhiZDI1NzEzOWVkMjhkNDk4NzI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgMzAgSnVuIDIwMTkgMTg6MDA6NDEgLTA1MDAKU3ViamVjdDogW1BBVENIXSBD
SUZTOiBGaXggbW9kdWxlIGRlcGVuZGVuY3kKCktFWVMgaXMgcmVxdWlyZWQgbm90IHRoYXQgQ09O
RklHX0NJRlNfQUNMIGlzIGFsd2F5cyBvbgphbmQgdGhlIGlmZGVmIGZvciBpdCByZW1vdmVkLgoK
U2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0K
IGZzL2NpZnMvS2NvbmZpZyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9LY29uZmlnIGIvZnMvY2lm
cy9LY29uZmlnCmluZGV4IGNiMzA5NmZhYmJiZS4uZTM5YzE1MjY3YmI0IDEwMDY0NAotLS0gYS9m
cy9jaWZzL0tjb25maWcKKysrIGIvZnMvY2lmcy9LY29uZmlnCkBAIC0xNyw2ICsxNyw3IEBAIGNv
bmZpZyBDSUZTCiAJc2VsZWN0IENSWVBUT19FQ0IKIAlzZWxlY3QgQ1JZUFRPX0FFUwogCXNlbGVj
dCBDUllQVE9fREVTCisJc2VsZWN0IEtFWVMKIAloZWxwCiAJICBUaGlzIGlzIHRoZSBjbGllbnQg
VkZTIG1vZHVsZSBmb3IgdGhlIFNNQjMgZmFtaWx5IG9mIE5BUyBwcm90b2NvbHMsCiAJICAoaW5j
bHVkaW5nIHN1cHBvcnQgZm9yIHRoZSBtb3N0IHJlY2VudCwgbW9zdCBzZWN1cmUgZGlhbGVjdCBT
TUIzLjEuMSkKQEAgLTExMCw3ICsxMTEsNyBAQCBjb25maWcgQ0lGU19XRUFLX1BXX0hBU0gKIAog
Y29uZmlnIENJRlNfVVBDQUxMCiAJYm9vbCAiS2VyYmVyb3MvU1BORUdPIGFkdmFuY2VkIHNlc3Np
b24gc2V0dXAiCi0JZGVwZW5kcyBvbiBDSUZTICYmIEtFWVMKKwlkZXBlbmRzIG9uIENJRlMKIAlz
ZWxlY3QgRE5TX1JFU09MVkVSCiAJaGVscAogCSAgRW5hYmxlcyBhbiB1cGNhbGwgbWVjaGFuaXNt
IGZvciBDSUZTIHdoaWNoIGFjY2Vzc2VzIHVzZXJzcGFjZSBoZWxwZXIKQEAgLTE3Nyw3ICsxNzgs
NyBAQCBjb25maWcgQ0lGU19ERUJVR19EVU1QX0tFWVMKIAogY29uZmlnIENJRlNfREZTX1VQQ0FM
TAogCWJvb2wgIkRGUyBmZWF0dXJlIHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBDSUZTICYmIEtFWVMK
KwlkZXBlbmRzIG9uIENJRlMKIAlzZWxlY3QgRE5TX1JFU09MVkVSCiAJaGVscAogCSAgRGlzdHJp
YnV0ZWQgRmlsZSBTeXN0ZW0gKERGUykgc3VwcG9ydCBpcyB1c2VkIHRvIGFjY2VzcyBzaGFyZXMK
LS0gCjIuMjAuMQoK
--000000000000341b41058ca4fb33--

