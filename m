Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9689B92EBDA
	for <lists+samba-technical@lfdr.de>; Thu, 11 Jul 2024 17:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=C9DBrAj0rHxRTqeEt2LhDGpKVNFnN0Gir9oIKhbF93g=; b=1dkgRhCWhZsHInAL+VZXxd0ZJi
	6JygHdr5SnDMBqiYMcKQpxLPGhtZmFNZ6KMUk2oKo58FLOiJaoJudDazEsnTDQx9bRVYPc9cGZDPa
	59Y+Nu7NuAss8yw+ZLRhiY+DCullgQg/x02Gvv0xrpO3eg4/bpx1kinyjE61l6BlfdaD8jtHQNiwe
	cHnHe3SQfEc2cyxkhPVFUYJ+0UTmqnUYgXMKEHkQL0wGGvt/fDS+/67c3u8VrRmdUn654CwGmJVX6
	++SPO5JFPPDl+aCa9kcw4MR4MDPOdzsvliBhuUWMlg/7alqZwgY+dB4mIx+kLYqvQgd4d13Ovlk2n
	zZRNXN9g==;
Received: from ip6-localhost ([::1]:63432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sRvuM-000Sgh-UA; Thu, 11 Jul 2024 15:40:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:58830) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sRvuH-000Sga-UI
 for samba-technical@lists.samba.org; Thu, 11 Jul 2024 15:40:32 +0000
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52e9fe05354so1568636e87.1
 for <samba-technical@lists.samba.org>; Thu, 11 Jul 2024 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720712428; x=1721317228; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C9DBrAj0rHxRTqeEt2LhDGpKVNFnN0Gir9oIKhbF93g=;
 b=bJnyK8uiiRBsOPBWW90jeMRQzcfgHL3y2VMaZftpoOcat3tR2Bu0yTn7SdZCKEl4Pn
 xqjQsgTbVy5RafGo3gFtGtcTT+MhRBJZTbmOoXurLs8mVbAALsk/y8jnLQTvnYIOQeWM
 pq2DBq07Fw3rSwwptLRq8s1uD36bacOuxrapYTUIUF4N8SpB+mwX/EKezF3VQiiAyt3z
 u5pxTDrBbINBM/esSJRUfNwBhti7Ge4pbPH0jKsLiFd2R7OU8HVjgQpYy2VNBmWuRabk
 dffydOWXhYyAH24A6czYMoh+15McwXztDZnvNTt8BkTT87ULmHsrVpqEpaWiOk7WuHap
 AGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720712428; x=1721317228;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C9DBrAj0rHxRTqeEt2LhDGpKVNFnN0Gir9oIKhbF93g=;
 b=bdmsqZza1S+Fx3ZiCTMSDRCFaSxj+JrGIJWj7rGxvcModQF4OxVycWPypgbHbi/j2+
 AYv2lCYRG3QTPtvvZqy4HCvQJXM8RKY8D+3QM2/y8lrsR1lLZRo4KEzKbBZTp7fjo7MV
 FWJWouypIUufih19yibnhmF7CYWWzkN7Uuff7EQPHDxNIF5u+KsAlMhfHXpCyB82a8N4
 WWBE9AO3Akodqu2NvrGYs50dP31uxoJgIfYBVmrgmCd8Yf0PA/pzi/XVlXu0ul1ZXPsT
 CTgCYLQ+7/qsdabpNfGWKFlReYqdAAdyPFv/5fX64zsken7+Y/DzHpi0ICbMCcXwuNnm
 kZsA==
X-Gm-Message-State: AOJu0Ywr0pkmUt9ox6MXVZGtI/9bZ9fBdVyg/7plJARvhV+5lom6zbEz
 9VDmmzI2WppbfkYw/nf18hXcAxsJARO3RPk75m/Nk5PT+WsQIIEOMvm9Y+nY0RkxWLO8/FPiZF1
 aWRsGzBT5SNaCBzIwqB6zJCSbqmk=
X-Google-Smtp-Source: AGHT+IGgz9eFMCRsDmzcRU3isK7q1k/7+zpQstHSEUmxnVf930LhPJDqnYx8AykSGPO99s66YUTNhMI81W3r735zMdo=
X-Received: by 2002:a05:6512:10ce:b0:52c:842b:c276 with SMTP id
 2adb3069b0e04-52eb99d1ff7mr7218451e87.53.1720712427852; Thu, 11 Jul 2024
 08:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv2V3vdupgmR75WsNGrfdbaPo0Mw+6x82KK9vgUYu5AkQ@mail.gmail.com>
In-Reply-To: <CAH2r5mv2V3vdupgmR75WsNGrfdbaPo0Mw+6x82KK9vgUYu5AkQ@mail.gmail.com>
Date: Thu, 11 Jul 2024 10:40:16 -0500
Message-ID: <CAH2r5msriif9aOTVa57n2PnEjUHYgpimuz7vTG8deS=KOZt3hw@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix setting SecurityFlags to true
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="00000000000005fbe8061cfa95a1"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000005fbe8061cfa95a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

V2 of patch

    If you try to set /proc/fs/cifs/SecurityFlags to 1 it
    will set them to CIFSSEC_MUST_NTLMV2 which no longer is
    relevant (the less secure ones like lanman have been removed
    from cifs.ko) and is also missing some flags (like for
    signing and encryption) and can even cause mount to fail,
    so change this to set it to Kerberos in this case.

    Also change the description of the SecurityFlags to remove mention
    of flags which are no longer supported.

On Tue, Jul 9, 2024 at 6:45=E2=80=AFPM Steve French <smfrench@gmail.com> wr=
ote:
>
> If you try to set /proc/fs/cifs/SecurityFlags to 1 it
> will set them to CIFSSEC_MUST_NTLMV2 which is obsolete and no
> longer checked, and will cause mount to fail, so change this
> to set it to a more understandable default (ie include Kerberos
> as well).
>
> Also change the description of the SecurityFlags to remove mention
> of various flags which are no longer supported (due to removal
> of weak security such as lanman and ntlmv1).
>
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

--00000000000005fbe8061cfa95a1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-fix-setting-SecurityFlags-to-true.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-fix-setting-SecurityFlags-to-true.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lyhfqqx20>
X-Attachment-Id: f_lyhfqqx20

RnJvbSBlNjk2YWExYzA4NWNkZTg5YzMzZTc1OWM3ZmFkZTU5ZTgwYTdmMGNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgOSBKdWwgMjAyNCAxODowNzozNSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIGNp
ZnM6IGZpeCBzZXR0aW5nIFNlY3VyaXR5RmxhZ3MgdG8gdHJ1ZQoKSWYgeW91IHRyeSB0byBzZXQg
L3Byb2MvZnMvY2lmcy9TZWN1cml0eUZsYWdzIHRvIDEgaXQKd2lsbCBzZXQgdGhlbSB0byBDSUZT
U0VDX01VU1RfTlRMTVYyIHdoaWNoIG5vIGxvbmdlciBpcwpyZWxldmFudCAodGhlIGxlc3Mgc2Vj
dXJlIG9uZXMgbGlrZSBsYW5tYW4gaGF2ZSBiZWVuIHJlbW92ZWQKZnJvbSBjaWZzLmtvKSBhbmQg
aXMgYWxzbyBtaXNzaW5nIHNvbWUgZmxhZ3MgKGxpa2UgZm9yCnNpZ25pbmcgYW5kIGVuY3J5cHRp
b24pIGFuZCBjYW4gZXZlbiBjYXVzZSBtb3VudCB0byBmYWlsLApzbyBjaGFuZ2UgdGhpcyB0byBz
ZXQgaXQgdG8gS2VyYmVyb3MgaW4gdGhpcyBjYXNlLgoKQWxzbyBjaGFuZ2UgdGhlIGRlc2NyaXB0
aW9uIG9mIHRoZSBTZWN1cml0eUZsYWdzIHRvIHJlbW92ZSBtZW50aW9uCm9mIGZsYWdzIHdoaWNo
IGFyZSBubyBsb25nZXIgc3VwcG9ydGVkLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2ln
bmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIERv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2lmcy91c2FnZS5yc3QgfCAzNiArKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0KIGZzL3NtYi9jbGllbnQvY2lmc2dsb2IuaCAgICAgICAgICAgICAgICAgfCAg
NCArLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9jaWZzL3VzYWdlLnJzdCBi
L0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2lmcy91c2FnZS5yc3QKaW5kZXggYWE4MjkwYTI5
ZGM4Li5mZDRiNTZjMDk5NmYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
Y2lmcy91c2FnZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9jaWZzL3VzYWdl
LnJzdApAQCAtNzIzLDQwICs3MjMsMjYgQEAgQ29uZmlndXJhdGlvbiBwc2V1ZG8tZmlsZXM6CiA9
PT09PT09PT09PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09CiBTZWN1cml0eUZsYWdzCQlGbGFncyB3aGljaCBjb250cm9s
IHNlY3VyaXR5IG5lZ290aWF0aW9uIGFuZAogCQkJYWxzbyBwYWNrZXQgc2lnbmluZy4gQXV0aGVu
dGljYXRpb24gKG1heS9tdXN0KQotCQkJZmxhZ3MgKGUuZy4gZm9yIE5UTE0gYW5kL29yIE5UTE12
MikgbWF5IGJlIGNvbWJpbmVkIHdpdGgKKwkJCWZsYWdzIChlLmcuIGZvciBOVExNdjIpIG1heSBi
ZSBjb21iaW5lZCB3aXRoCiAJCQl0aGUgc2lnbmluZyBmbGFncy4gIFNwZWNpZnlpbmcgdHdvIGRp
ZmZlcmVudCBwYXNzd29yZAogCQkJaGFzaGluZyBtZWNoYW5pc21zIChhcyAibXVzdCB1c2UiKSBv
biB0aGUgb3RoZXIgaGFuZAogCQkJZG9lcyBub3QgbWFrZSBtdWNoIHNlbnNlLiBEZWZhdWx0IGZs
YWdzIGFyZTo6CiAKLQkJCQkweDA3MDA3Ci0KLQkJCShOVExNLCBOVExNdjIgYW5kIHBhY2tldCBz
aWduaW5nIGFsbG93ZWQpLiAgVGhlIG1heGltdW0KLQkJCWFsbG93YWJsZSBmbGFncyBpZiB5b3Ug
d2FudCB0byBhbGxvdyBtb3VudHMgdG8gc2VydmVycwotCQkJdXNpbmcgd2Vha2VyIHBhc3N3b3Jk
IGhhc2hlcyBpcyAweDM3MDM3IChsYW5tYW4sCi0JCQlwbGFpbnRleHQsIG50bG0sIG50bG12Miwg
c2lnbmluZyBhbGxvd2VkKS4gIFNvbWUKLQkJCVNlY3VyaXR5RmxhZ3MgcmVxdWlyZSB0aGUgY29y
cmVzcG9uZGluZyBtZW51Y29uZmlnCi0JCQlvcHRpb25zIHRvIGJlIGVuYWJsZWQuICBFbmFibGlu
ZyBwbGFpbnRleHQKLQkJCWF1dGhlbnRpY2F0aW9uIGN1cnJlbnRseSByZXF1aXJlcyBhbHNvIGVu
YWJsaW5nCi0JCQlsYW5tYW4gYXV0aGVudGljYXRpb24gaW4gdGhlIHNlY3VyaXR5IGZsYWdzCi0J
CQliZWNhdXNlIHRoZSBjaWZzIG1vZHVsZSBvbmx5IHN1cHBvcnRzIHNlbmRpbmcKLQkJCWxhaW50
ZXh0IHBhc3N3b3JkcyB1c2luZyB0aGUgb2xkZXIgbGFubWFuIGRpYWxlY3QKLQkJCWZvcm0gb2Yg
dGhlIHNlc3Npb24gc2V0dXAgU01CLiAgKGUuZy4gZm9yIGF1dGhlbnRpY2F0aW9uCi0JCQl1c2lu
ZyBwbGFpbiB0ZXh0IHBhc3N3b3Jkcywgc2V0IHRoZSBTZWN1cml0eUZsYWdzCi0JCQl0byAweDMw
MDMwKTo6CisJCQkJMHgwMEM1CisKKwkJCShOVExNdjIgYW5kIHBhY2tldCBzaWduaW5nIGFsbG93
ZWQpLiAgU29tZSBTZWN1cml0eUZsYWdzCisJCQltYXkgcmVxdWlyZSBlbmFibGluZyBhIGNvcnJl
c3BvbmRpbmcgbWVudWNvbmZpZyBvcHRpb24uCiAKIAkJCSAgbWF5IHVzZSBwYWNrZXQgc2lnbmlu
ZwkJCTB4MDAwMDEKIAkJCSAgbXVzdCB1c2UgcGFja2V0IHNpZ25pbmcJCQkweDAxMDAxCi0JCQkg
IG1heSB1c2UgTlRMTSAobW9zdCBjb21tb24gcGFzc3dvcmQgaGFzaCkJMHgwMDAwMgotCQkJICBt
dXN0IHVzZSBOVExNCQkJCQkweDAyMDAyCiAJCQkgIG1heSB1c2UgTlRMTXYyCQkJCTB4MDAwMDQK
IAkJCSAgbXVzdCB1c2UgTlRMTXYyCQkJCTB4MDQwMDQKLQkJCSAgbWF5IHVzZSBLZXJiZXJvcyBz
ZWN1cml0eQkJCTB4MDAwMDgKLQkJCSAgbXVzdCB1c2UgS2VyYmVyb3MJCQkJMHgwODAwOAotCQkJ
ICBtYXkgdXNlIGxhbm1hbiAod2VhaykgcGFzc3dvcmQgaGFzaAkJMHgwMDAxMAotCQkJICBtdXN0
IHVzZSBsYW5tYW4gcGFzc3dvcmQgaGFzaAkJCTB4MTAwMTAKLQkJCSAgbWF5IHVzZSBwbGFpbnRl
eHQgcGFzc3dvcmRzCQkJMHgwMDAyMAotCQkJICBtdXN0IHVzZSBwbGFpbnRleHQgcGFzc3dvcmRz
CQkJMHgyMDAyMAotCQkJICAocmVzZXJ2ZWQgZm9yIGZ1dHVyZSBwYWNrZXQgZW5jcnlwdGlvbikJ
MHgwMDA0MAorCQkJICBtYXkgdXNlIEtlcmJlcm9zIHNlY3VyaXR5IChrcmI1KQkJMHgwMDAwOAor
CQkJICBtdXN0IHVzZSBLZXJiZXJvcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwODAw
OAorCQkJICBtYXkgdXNlIE5UTE1TU1AgICAgICAgICAgICAgICAJCTB4MDAwODAKKwkJCSAgbXVz
dCB1c2UgTlRMTVNTUCAgICAgICAgICAgCQkJMHg4MDA4MAorCQkJICBzZWFsIChwYWNrZXQgZW5j
cnlwdGlvbikJCQkweDAwMDQwCisJCQkgIG11c3Qgc2VhbCAobm90IGltcGxlbWVudGVkIHlldCkg
ICAgICAgICAgICAgICAweDQwMDQwCiAKIGNpZnNGWUkJCQlJZiBzZXQgdG8gbm9uLXplcm8gdmFs
dWUsIGFkZGl0aW9uYWwgZGVidWcgaW5mb3JtYXRpb24KIAkJCXdpbGwgYmUgbG9nZ2VkIHRvIHRo
ZSBzeXN0ZW0gZXJyb3IgbG9nLiAgVGhpcyBmaWVsZApkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVu
dC9jaWZzZ2xvYi5oIGIvZnMvc21iL2NsaWVudC9jaWZzZ2xvYi5oCmluZGV4IDU1N2I2OGU5OWQw
YS4uMTQzOTljYjliNGFmIDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2NpZnNnbG9iLmgKKysr
IGIvZnMvc21iL2NsaWVudC9jaWZzZ2xvYi5oCkBAIC0xOTE4LDggKzE5MTgsOCBAQCByZXF1aXJl
IHVzZSBvZiB0aGUgc3Ryb25nZXIgcHJvdG9jb2wgKi8KICNkZWZpbmUgICBDSUZTU0VDX01VU1Rf
U0VBTAkweDQwMDQwIC8qIG5vdCBzdXBwb3J0ZWQgeWV0ICovCiAjZGVmaW5lICAgQ0lGU1NFQ19N
VVNUX05UTE1TU1AJMHg4MDA4MCAvKiByYXcgbnRsbXNzcCB3aXRoIG50bG12MiAqLwogCi0jZGVm
aW5lICAgQ0lGU1NFQ19ERUYgKENJRlNTRUNfTUFZX1NJR04gfCBDSUZTU0VDX01BWV9OVExNVjIg
fCBDSUZTU0VDX01BWV9OVExNU1NQKQotI2RlZmluZSAgIENJRlNTRUNfTUFYIChDSUZTU0VDX01V
U1RfTlRMTVYyKQorI2RlZmluZSAgIENJRlNTRUNfREVGIChDSUZTU0VDX01BWV9TSUdOIHwgQ0lG
U1NFQ19NQVlfTlRMTVYyIHwgQ0lGU1NFQ19NQVlfTlRMTVNTUCB8IENJRlNTRUNfTUFZX1NFQUwp
CisjZGVmaW5lICAgQ0lGU1NFQ19NQVggKENJRlNTRUNfTUFZX1NJR04gfCBDSUZTU0VDX01VU1Rf
S1JCNSB8IENJRlNTRUNfTUFZX1NFQUwpCiAjZGVmaW5lICAgQ0lGU1NFQ19BVVRIX01BU0sgKENJ
RlNTRUNfTUFZX05UTE1WMiB8IENJRlNTRUNfTUFZX0tSQjUgfCBDSUZTU0VDX01BWV9OVExNU1NQ
KQogLyoKICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgotLSAKMi40My4wCgo=
--00000000000005fbe8061cfa95a1--

