Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEDA93A97A
	for <lists+samba-technical@lfdr.de>; Wed, 24 Jul 2024 00:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ES59BCfEuAfxXID0F6oW+II6SH5dXpK5Bso9en7P/4M=; b=xvIWFeylwDCIVTf0qWaVRi7yY8
	tnj38wvyZPZ7XE2VJMzBxMYG3zXS/nAjmSBa9Zb6o9v26rUZmdI0yCGrY0+nt86JIbe5Kf3B+XT6L
	fbYNunCHqMpvQLZTP77lx140zz50O0BJV58JoiLzYaIEVyBgTN3MdxRLrg6MrufgZdX4Tys4TF1CL
	K7up6IEONNR3meCl1Y/o9a4WLWd22RNM0JHjJiimmifN67Rgg1pTEUB8+aum2VQtqyrl/rUdnWiFV
	4rtLe+uzXt161YT6uihPrSauLe3vKmpRusSc5y5uWzOU2llpDJ055xkGMvtfzNPPNVhOJ6HPNsbF8
	tD6fxMzg==;
Received: from ip6-localhost ([::1]:50782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sWOLY-001Mya-3b; Tue, 23 Jul 2024 22:51:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:46536) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sWOLU-001MyT-5Q
 for samba-technical@lists.samba.org; Tue, 23 Jul 2024 22:51:02 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso2859097e87.1
 for <samba-technical@lists.samba.org>; Tue, 23 Jul 2024 15:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721775058; x=1722379858; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ES59BCfEuAfxXID0F6oW+II6SH5dXpK5Bso9en7P/4M=;
 b=bQsvhk/BDQ/8L65koktmeJtQ//OwPudAC15RFkGhH9OLDTuBPQ9NacdQto+76m96lc
 Z92wc9/uYIQ9EUW+ca2Cmhi8wcM5Dcch+QJAvua2ZVb+ASjqDlmn8871KE3UPxVUMMzt
 MFHj+TDvCXYOAtTbI0nb7B6soY/wfZP2XxHA6Nz8VmGZtcReQ9w1MWwAg9COASgA6PwI
 8IJ0J5VVSL6h1cAVOtIV8QSCr0szL2bY4Kznms9WnIiTxEoaQ8wYZoZEH2cUZg6i0Bv3
 GGqISoK7ejSX/gNxKUCsDw0NyO8j8MQPdyVm9xhye73pRS03J3YHROQ6XBN9uMWwdN2p
 utTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721775058; x=1722379858;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ES59BCfEuAfxXID0F6oW+II6SH5dXpK5Bso9en7P/4M=;
 b=c9NKPx2LYQ+jWZ2TtAYr6wg9oDTHj1KO6O6saK1qyDPKtoXvettHJEvQAphWeudPvr
 iRv2eAF4g0mZ3FcPLnO9bNPpZnYaIeaCu85TzE7c0ZGV0MvnOZ/1RoDPHnWxWWDTSqdw
 lbllhiTRMRh3dQuSumTIBVINCw+UsirIXnkdeHFP+OpmGLB1zy0Rv0eBb+8VfoAFG8Ep
 9bZoDHEv3yaaUJFpsFcp5a1AlNGnKwdpoSvWziFrvZm7mbVFBzJvB45V19VG0Cn6OUM8
 fCaced/fFiwRs1BiPvMAFwsPej99fBnDV8Y3UJluUf6jkvJupooq9XXNgZAHQPfPrTMK
 trow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRGvbcScbUTHVFax7OxARNAbTH0bPXZkf0VrWYL7LGK5IswJO/ZPgQos2ejAPBFRFxJHVy0c7g4JiqLi5OlHtEUlxOWWdLEnFU5bGrBOOn
X-Gm-Message-State: AOJu0Yy1M6zag5swYohcEQv0Hx/bEbr8oDqfZYe5D9tR64eCLX8cfmMP
 A9iEMg64WPQeeRxXJtNWOT8z0WdViB/N1/2OPXrMoSJAgYSUkLA4F+AuyX5ZRUanqaUCBPdPEHk
 on1abkz/zLkb+d1BN1OklTxdkVpOL8w==
X-Google-Smtp-Source: AGHT+IGyoPW8W2ZIVH4om3vY67WuHjE9OA4VsnmQGKnBi270ljt/ok4VRrS7XbofCa0WIsndrUHIvaMkofb4h/tKSmw=
X-Received: by 2002:a05:6512:2204:b0:52c:dbe7:cfd5 with SMTP id
 2adb3069b0e04-52fcf000c42mr177660e87.32.1721775057566; Tue, 23 Jul 2024
 15:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mu2LTRDPX7KbM3V_d7FybuPnvCMRd6YV3__H-7mn1N9uA@mail.gmail.com>
In-Reply-To: <CAH2r5mu2LTRDPX7KbM3V_d7FybuPnvCMRd6YV3__H-7mn1N9uA@mail.gmail.com>
Date: Tue, 23 Jul 2024 17:50:46 -0500
Message-ID: <CAH2r5muHFV8D2+SrDKQiUSkxzDfAG4zJ3rUdQnBXDT12u5D2Ww@mail.gmail.com>
Subject: Re: [PATCH][CIFS] fix reconnect with SMB1 Unix Extensions
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>, 
 CIFS <linux-cifs@vger.kernel.org>, Kevin Ottens <kevin.ottens@enioka.com>
Content-Type: multipart/mixed; boundary="000000000000b0bb5a061df1fe34"
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
Cc: Paulo Alcantara <pc@manguebit.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000b0bb5a061df1fe34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

updated to add missing #ifdef


On Tue, Jul 23, 2024 at 12:07=E2=80=AFAM Steve French <smfrench@gmail.com> =
wrote:
>
> Andrew had pointed out having problems with SMB1 Unix extensions to
> Samba when investigating an unrelated problem, and when I tried it I
> noticed a serious reconnect issue with the SMB1 Unix Extensions.
>
> When mounting with the SMB1 Unix Extensions (e.g. mounts
> to Samba with vers=3D1.0), cifs.ko reconnects no longer reset the
> Unix Extensions (SetFSInfo SET_FILE_UNIX_BASIC) after tcon so most
> operations (e.g. stat, ls, open, statfs) will fail continuously
> with:
>         "Operation not supported"
> if the connection ever resets (e.g. due to brief network disconnect)
>
> Fix attached
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

--000000000000b0bb5a061df1fe34
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-cifs-fix-reconnect-with-SMB1-UNIX-Extensions.patch"
Content-Disposition: attachment; 
	filename="0002-cifs-fix-reconnect-with-SMB1-UNIX-Extensions.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lyz0egn50>
X-Attachment-Id: f_lyz0egn50

RnJvbSBhMjE0Mzg0Y2UyNmI2MTExZWE4YzhkNThmYTgyYTFjYTYzOTk2YzM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMjIgSnVsIDIwMjQgMjM6NDA6MDggLTA1MDAKU3ViamVjdDogW1BBVENIIDIv
M10gY2lmczogZml4IHJlY29ubmVjdCB3aXRoIFNNQjEgVU5JWCBFeHRlbnNpb25zCgpXaGVuIG1v
dW50aW5nIHdpdGggdGhlIFNNQjEgVW5peCBFeHRlbnNpb25zIChlLmcuIG1vdW50cwp0byBTYW1i
YSB3aXRoIHZlcnM9MS4wKSwgcmVjb25uZWN0cyBubyBsb25nZXIgcmVzZXQgdGhlClVuaXggRXh0
ZW5zaW9ucyAoU2V0RlNJbmZvIFNFVF9GSUxFX1VOSVhfQkFTSUMpIGFmdGVyIHRjb24gc28gbW9z
dApvcGVyYXRpb25zIChlLmcuIHN0YXQsIGxzLCBvcGVuLCBzdGF0ZnMpIHdpbGwgZmFpbCBjb250
aW51b3VzbHkKd2l0aDoKICAgICAgICAiT3BlcmF0aW9uIG5vdCBzdXBwb3J0ZWQiCmlmIHRoZSBj
b25uZWN0aW9uIGV2ZXIgcmVzZXRzIChlLmcuIGR1ZSB0byBicmllZiBuZXR3b3JrIGRpc2Nvbm5l
Y3QpCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogUGF1bG8gQWxjYW50
YXJhIChSZWQgSGF0KSA8cGNAbWFuZ3VlYml0LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RldmUgRnJl
bmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL3NtYi9jbGllbnQvY29ubmVjdC5j
IHwgMTcgKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9jb25uZWN0LmMgYi9m
cy9zbWIvY2xpZW50L2Nvbm5lY3QuYwppbmRleCA3YTE2ZTEyZjVkYTguLjg5ZDlmODZjYzI5YSAx
MDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9jb25uZWN0LmMKKysrIGIvZnMvc21iL2NsaWVudC9j
b25uZWN0LmMKQEAgLTM2ODYsNiArMzY4Niw3IEBAIGludCBjaWZzX21vdW50KHN0cnVjdCBjaWZz
X3NiX2luZm8gKmNpZnNfc2IsIHN0cnVjdCBzbWIzX2ZzX2NvbnRleHQgKmN0eCkKIH0KICNlbmRp
ZgogCisjaWZkZWYgQ09ORklHX0NJRlNfQUxMT1dfSU5TRUNVUkVfTEVHQUNZCiAvKgogICogSXNz
dWUgYSBUUkVFX0NPTk5FQ1QgcmVxdWVzdC4KICAqLwpAQCAtMzgwNywxMSArMzgwOCwyNSBAQCBD
SUZTVENvbihjb25zdCB1bnNpZ25lZCBpbnQgeGlkLCBzdHJ1Y3QgY2lmc19zZXMgKnNlcywKIAkJ
ZWxzZQogCQkJdGNvbi0+RmxhZ3MgPSAwOwogCQljaWZzX2RiZyhGWUksICJUY29uIGZsYWdzOiAw
eCV4XG4iLCB0Y29uLT5GbGFncyk7Ci0JfQogCisJCS8qCisJCSAqIHJlc2V0X2NpZnNfdW5peF9j
YXBzIGNhbGxzIFFGU0luZm8gd2hpY2ggcmVxdWlyZXMKKwkJICogbmVlZF9yZWNvbm5lY3QgdG8g
YmUgZmFsc2UsIGJ1dCB3ZSB3b3VsZCBub3QgbmVlZCB0byBjYWxsCisJCSAqIHJlc2V0X2NhcHMg
aWYgdGhpcyB3ZXJlIG5vdCBhIHJlY29ubmVjdCBjYXNlIHNvIG11c3QgY2hlY2sKKwkJICogbmVl
ZF9yZWNvbm5lY3QgZmxhZyBoZXJlLiAgVGhlIGNhbGxlciB3aWxsIGFsc28gY2xlYXIKKwkJICog
bmVlZF9yZWNvbm5lY3Qgd2hlbiB0Y29uIHdhcyBzdWNjZXNzZnVsIGJ1dCBuZWVkZWQgdG8gYmUK
KwkJICogY2xlYXJlZCBlYXJsaWVyIGluIHRoZSBjYXNlIG9mIHVuaXggZXh0ZW5zaW9ucyByZWNv
bm5lY3QKKwkJICovCisJCWlmICh0Y29uLT5uZWVkX3JlY29ubmVjdCAmJiB0Y29uLT51bml4X2V4
dCkgeworCQkJY2lmc19kYmcoRllJLCAicmVzZXR0aW5nIGNhcHMgZm9yICVzXG4iLCB0Y29uLT50
cmVlX25hbWUpOworCQkJdGNvbi0+bmVlZF9yZWNvbm5lY3QgPSBmYWxzZTsKKwkJCXJlc2V0X2Np
ZnNfdW5peF9jYXBzKHhpZCwgdGNvbiwgTlVMTCwgTlVMTCk7CisJCX0KKwl9CiAJY2lmc19idWZf
cmVsZWFzZShzbWJfYnVmZmVyKTsKIAlyZXR1cm4gcmM7CiB9CisjZW5kaWYgLyogQ09ORklHX0NJ
RlNfQUxMT1dfSU5TRUNVUkVfTEVHQUNZICovCiAKIHN0YXRpYyB2b2lkIGRlbGF5ZWRfZnJlZShz
dHJ1Y3QgcmN1X2hlYWQgKnApCiB7Ci0tIAoyLjQzLjAKCg==
--000000000000b0bb5a061df1fe34--

