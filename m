Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B248186057
	for <lists+samba-technical@lfdr.de>; Mon, 16 Mar 2020 00:07:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Wf1kZg8JHvWKhlG2DR9z0kO5EKLkK+UvZOrDdO+UlSQ=; b=jkyBqPMoaI+xvVgJK5gNcUlJ4V
	VBSI3aRa/x/mUdmJ469ahtXn/XcamY/zqWvzuxH58D3TStm6Av0+P87fffH/4zT4b6DO7zBx60NkK
	2Z9pLSSGC/qlU2NoQ9H0jbyH9QsYDiHyS09sFJfXJkelDsfOjU6jcjxsxqmvfCeQGKHdAOA2t7MG9
	sKHE97+VssiBYZ1qxdvkpYp1tpVH3rAYwTdh40qdS8CN+JUREnMHkqVLxkwpYRF8R6C7Zmu5GIqZv
	L2AqguMmxO2zXSYBPTTWVeqPFEQj4hkgCLsvu+5HAZJgOiejJVNLwqWLc9W9Cc8mJvlCxKpo8xPqq
	6mSdM6aQ==;
Received: from localhost ([::1]:28070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDcLm-0001Wi-Ot; Sun, 15 Mar 2020 23:07:18 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:43011) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDcLi-0001Wb-W7
 for samba-technical@lists.samba.org; Sun, 15 Mar 2020 23:07:17 +0000
Received: by mail-qk1-x72a.google.com with SMTP id x18so2952586qki.10
 for <samba-technical@lists.samba.org>; Sun, 15 Mar 2020 16:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Wf1kZg8JHvWKhlG2DR9z0kO5EKLkK+UvZOrDdO+UlSQ=;
 b=UOn1+ESPUV9oo0HgXMYrjUDp5fQvsSgvVyEOSIn8IYIEzNFGa3Tl9/HAq93xUNrLLK
 KXIevfdgBsuxTLEuGZtNewguc7mtpwxbWbvK4lso/awa/nlQPUjcpficPFTvKEu8K0OX
 mEIse8bYmT5+rOr5RbcI96QWPOqp0I/ud/FN+9rakoieMVEhrfBezd1U0UYstF/WL949
 2GX1SdYFdVULK9IzBNIK7lb9scdD6M2R/PTu2bT6O0HN2hSVsUaZKT3kpfKHiHaZRNKN
 wE8TLeEnrKNhgCuqKlgtd6oyB2bPvp0pi1tln/kyKb4mE0UwADbPrG5fCxTLr1d1Qk6Q
 lhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Wf1kZg8JHvWKhlG2DR9z0kO5EKLkK+UvZOrDdO+UlSQ=;
 b=K8aWTDY3IgYZKesL6ZPQox7JwaW17RJc3lYXHF+GCa26P0KPjAUyKKg7LD/bF4w1wU
 F04JP+tZUNcGiV3oqjumjZL5MhIclsRjuLe5zLmBZEZq3SicU6/kccl1rY78PNVb8iVi
 de0P3loDi46hvBqvJPl+mpGblYM7gCywFsdJIXqxAz3GSdL2ZQoedjbrekBNeTY8vheO
 9WSIkZ0udOZfeOkYy3BQXM6It8T/ebaT7DnlQO5ZC2BtkjIUzq0BVEzhGLWZUp5VTCGb
 ymCa/VFI14QTfCM5GPYjdcaQwtLNst7REARG/NI4RxJtNUYKLnb39cV4nGAnQZ0FowUt
 fkrw==
X-Gm-Message-State: ANhLgQ2K+ZtiVVcBNhPBPVtGK/5Ndpsj/Fpsdx7wVjJfUPcUPFty9m9m
 0J2uT3fvX0gDeBeCDsTPZD/jTSSs5XKDqcjDyM21DUqk
X-Google-Smtp-Source: ADFU+vs55TzVS4OS7NrxkGuoLBBUeweGw0Z2M6iyPGNNTinjzfdvo/CtOZ6ggrYie7eV8n9Cdgtswjr9b+2BB9D7T7Q=
X-Received: by 2002:a25:f20f:: with SMTP id i15mr30636068ybe.364.1584313633297; 
 Sun, 15 Mar 2020 16:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms_oxqwHm56nzabM-x2XMR1Ni-WD1_LEYYxOW_NkswsOQ@mail.gmail.com>
In-Reply-To: <CAH2r5ms_oxqwHm56nzabM-x2XMR1Ni-WD1_LEYYxOW_NkswsOQ@mail.gmail.com>
Date: Sun, 15 Mar 2020 18:07:02 -0500
Message-ID: <CAH2r5mvN5ri_7x3dVah8tUft6Xxbjia9MSANZV04TkVwtqY9Tw@mail.gmail.com>
Subject: Re: [SMB3] New compression flags
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000005376cf05a0ecc32b"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000005376cf05a0ecc32b
Content-Type: text/plain; charset="UTF-8"

And one more small set of structures for the updated transform header.
See MS-SMB2 2.2.42.1 and 2.2.42.2


On Sun, Mar 15, 2020 at 5:50 PM Steve French <smfrench@gmail.com> wrote:
>
> Some compression related flags I noticed were added in the latest MS-SMB2
>
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

--0000000000005376cf05a0ecc32b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-Additional-compression-structures.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-Additional-compression-structures.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k7tnf80b0>
X-Attachment-Id: f_k7tnf80b0

RnJvbSBlZWI2NzJmYzVlMGVjMDdkMzU1YTBkNzgyYTIwZjljZDI4ZjM0YmU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjAgMTg6MDQ6MTMgLTA1MDAKU3ViamVjdDogW1BBVENIXSBT
TUIzOiBBZGRpdGlvbmFsIGNvbXByZXNzaW9uIHN0cnVjdHVyZXMKCk5ldyB0cmFuc2Zvcm0gaGVh
ZGVyIHN0cnVjdHVyZXMuIFNlZSByZWNlbnQgdXBkYXRlcwp0byBNUy1TTUIyIGFkZGluZyBzZWN0
aW9uIDIuMi40Mi4xIGFuZCAyLjIuNDIuMgoKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxz
dGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvc21iMnBkdS5oIHwgMTcgKysrKysr
KysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9zbWIycGR1LmggYi9mcy9jaWZzL3NtYjJwZHUuaApp
bmRleCA0YTdkMTU0ZmZmYWUuLjhiOGZiYmM0NjRjNyAxMDA2NDQKLS0tIGEvZnMvY2lmcy9zbWIy
cGR1LmgKKysrIGIvZnMvY2lmcy9zbWIycGR1LmgKQEAgLTEzNyw2ICsxMzcsMjEgQEAgc3RydWN0
IHNtYjJfdHJhbnNmb3JtX2hkciB7CiAJX191NjQgIFNlc3Npb25JZDsKIH0gX19wYWNrZWQ7CiAK
Ky8qIFNlZSBNUy1TTUIyIDIuMi40Mi4xICovCitzdHJ1Y3QgY29tcHJlc3Npb25fcGxheWxvYWRf
aGVhZGVyIHsKKwlfX2xlMTYJQWxnb3JpdGhtSWQ7CisJX19sZTE2CVJlc2VydmVkOworCV9fbGUz
MglMZW5ndGg7Cit9IF9fcGFja2VkOworCisvKiBTZWUgTVMtU01CMiAyLjIuNDIuMiAqLworc3Ry
dWN0IGNvbXByZXNzaW9uX3BhdHRlcm5fcGF5bG9hZF92MSB7CisJX19sZTE2CVBhdHRlcm47CisJ
X19sZTE2CVJlc2VydmVkMTsKKwlfX2xlMTYJUmVzZXJ2ZWQyOworCV9fbGUzMglSZXBpdGl0aW9u
czsKK30gX19wYWNrZWQ7CisKIC8qCiAgKglTTUIyIGZsYWcgZGVmaW5pdGlvbnMKICAqLwpAQCAt
MTE4Niw3ICsxMjAxLDcgQEAgc3RydWN0IHNtYjJfd3JpdGVfcmVxIHsKIAlfX2xlNjQgT2Zmc2V0
OwogCV9fdTY0ICBQZXJzaXN0ZW50RmlsZUlkOyAvKiBvcGFxdWUgZW5kaWFubmVzcyAqLwogCV9f
dTY0ICBWb2xhdGlsZUZpbGVJZDsgLyogb3BhcXVlIGVuZGlhbm5lc3MgKi8KLQlfX2xlMzIgQ2hh
bm5lbDsgLyogUmVzZXJ2ZWQgTUJaICovCisJX19sZTMyIENoYW5uZWw7IC8qIE1CWiB1bmxlc3Mg
U01CMy4wMiBvciBsYXRlciAqLwogCV9fbGUzMiBSZW1haW5pbmdCeXRlczsKIAlfX2xlMTYgV3Jp
dGVDaGFubmVsSW5mb09mZnNldDsKIAlfX2xlMTYgV3JpdGVDaGFubmVsSW5mb0xlbmd0aDsKLS0g
CjIuMjAuMQoK
--0000000000005376cf05a0ecc32b--

