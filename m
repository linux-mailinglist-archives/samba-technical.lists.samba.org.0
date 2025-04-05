Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E782CA7CBE6
	for <lists+samba-technical@lfdr.de>; Sat,  5 Apr 2025 23:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=So9Is6ILrbdWFQUFqNQkV9su3TrSFA4oPKk1+22kua8=; b=WkEumB7q0zCq3lexYz+75ISLgb
	gIvYiCsH2sJrHzV1oJQhWvos/b75n5VAA05taQpmYo0OA5N/5QNLJH2HD20+aCkIossT/xIW2cluj
	OtjqJkaBQagX7uudLmC4hSnj0Lppd3m1ui1fMKpDiY7/7voxZ7FJ3q1rcgcAuhZ4pjl2QeOtBQvaH
	5fdHc5oy3P+Yov3bRnNM6YM/scqL+c0/syqjTfWIWdEio/SKTX8wVzt1MVc9PV0lWAnqdSESHrzQL
	gQeZt0+wKWNX+HO4v77fTTSB9Jb3IthSnNVrMMfcD0Qw+P3NRknCw+9KD2TbIhYXHMVpWxGOyR/ng
	mqPlWdVg==;
Received: from ip6-localhost ([::1]:23312 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u1BII-001lWn-BJ; Sat, 05 Apr 2025 21:43:14 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:56599) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u1BIE-001lWg-6B
 for samba-technical@lists.samba.org; Sat, 05 Apr 2025 21:43:12 +0000
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30c461a45f8so30862311fa.1
 for <samba-technical@lists.samba.org>; Sat, 05 Apr 2025 14:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743889376; x=1744494176; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=So9Is6ILrbdWFQUFqNQkV9su3TrSFA4oPKk1+22kua8=;
 b=CtT6Ejz8Zt21H86KPAb0kPYPWbOYp7Nl8G3OqmvYLEaiIh8EcL0epGrI/sWAnDueDY
 wtmIvxVt/29DZJ9I+ndzRtOPJd/g0Q4UT7p6pqAWmPEa6HxQtCuxvAdTh9FyPX6lWt5g
 zvfYk26LZ/1zAk1HwL16apujdLeJ9vARgiX6SdGJ3AHR4Szsbefi5rBhn7NSMNsZgI71
 B55LfGAZk4lPtDpVtXLl/zmA4FwpmM1V7tu7Z1xJeT03veKPTDFaedDcyb2NPXTqVrSQ
 Fqq8LlFATDhHHeOgIZ5/JquROrkygzx4AxCfMq0s6M8cIhJSRHMzuPOkA6lmBFg1K8eQ
 smWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743889376; x=1744494176;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=So9Is6ILrbdWFQUFqNQkV9su3TrSFA4oPKk1+22kua8=;
 b=btK6rNmMoDQjmJD7z3HbONUhylfHL0Zg5WT2dXFP7/eJVWdJJRnW+t+FpXCQu49Fuy
 kwcCagjUOfRLG5BLDyOp+DR8WkYiua7Zw4QDHcPvYKWx+08f2uuUjh9Xq074K5C1Jh2u
 cCKvukTn0LRG6RNcwVxj/FZPdqlMJUWz55glPZGGmoPb68/shgucFfQMHn2DFVLbgCnO
 9OH2i7M6zXfFJvpTu5ACeFuuf2+XkSOgt4k9AdrEFgipyRn6o0M7UMHNok+w1bi2nn5V
 wLHTRKHATqHvgABm/lHJ1YVLlekxwAYWni/GsqjgaxwIpxk9zG8F+3V6HwkbzbVftMqU
 Z53w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq5QD62MbatmTg2LcM8Y5iJtWzSh+2HCtN7jPbjD2XVgnSdBKvgzMEgKlfImYIT1qiBZN76/HqJQPaY19WfUY=@lists.samba.org
X-Gm-Message-State: AOJu0YyHGRMs2fshaG57gSR/gNMwCBu2Y0baXgZy34JqojKtCko3j5QM
 CHJ0eswrhPlI+8WUkB0FzYNa+mpu8w5qHDMOkzf9NwV3zTCoCAygW75bjRiAw8xUIopXqnaydXG
 /kq9S0U+siq66PhPHdTB1gadR6LQ=
X-Gm-Gg: ASbGncsZEK/PsBui9kwZJiaM18R3ATmRrRhJvMw9L+x52rxI216lcN3ICL0X4af+hTd
 dgEqacjPDgk/zzXNE7zXuU+wfsGK+Sgp5EWXp4RFDiyJunYa46xedyRQN2VGP45QZg70RS4uQba
 N4SFPCLQnveS/XEjDK7bR/emXfsHsSGqDVG9ZcL/KvMbGxJRwjrqmqh7J3YMN3
X-Google-Smtp-Source: AGHT+IEJ0VJ3Y7UBL0sdL3wuH24mVdOCQo0qTUSuFgCFX6YAWwh27CJ/+AtxuQ0/LB6+m51ybMbBHrPFSzQOIT/nHms=
X-Received: by 2002:a05:651c:30cb:b0:30b:cd41:89c7 with SMTP id
 38308e7fff4ca-30f0bf4fcbbmr22065401fa.22.1743889375701; Sat, 05 Apr 2025
 14:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAJXSQBms+s2Whk7SfugzQ1kby-xyJ62aVLVvM05rPtFAo7247Q@mail.gmail.com>
 <CAH2r5ms2=o4baY-6_aLmHpJhBYwvaWXUKwZufKs-iT3vsEg_hA@mail.gmail.com>
 <20250405172030.4ptuwa73nnqhkzdy@pali>
 <CAH2r5mtFPSe7ccQjVdaoL+OCBP8Dya9s8wjSyd1aQtstQnX7dA@mail.gmail.com>
 <20250405195923.aieo7ad2g3kynudr@pali>
In-Reply-To: <20250405195923.aieo7ad2g3kynudr@pali>
Date: Sat, 5 Apr 2025 16:42:43 -0500
X-Gm-Features: ATxdqUH-WzUmL4KhLwgloDfAkjcEhPpwO7vBPj6_fMKn3tW1UiABJ_pwh9DO18U
Message-ID: <CAH2r5msWXanWt7VvpiagZ-ekOdX=xRo=3O0kkOnunXN4rGzyJA@mail.gmail.com>
Subject: Re: Issue with kernel 6.8.0-40-generic?
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000c453df06320ee2fe"
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org,
 Junwen Sun <sunjw8888@gmail.com>, profnandaa@gmail.com,
 samba-technical <samba-technical@lists.samba.org>, 1marc1@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000c453df06320ee2fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lightly updated version of Pali's patch description, merged into
cifs-2.6.git pending more review and testing.

Junwen,
Let me know if you see any problems.  I have tested it but the more
testing the better


On Sat, Apr 5, 2025 at 2:59=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> wr=
ote:
>
> Steve, thank you for testing. I will do some other my own tests too.
>
> For explanation, the function parse_reparse_point() is called by
> reparse_info_to_fattr() and then return value from
> reparse_info_to_fattr() is checked against -EOPNOTSUPP for handling name
> surrogate reparse points. This logic was added in the commit
> b587fd128660 ("cifs: Treat unhandled directory name surrogate reparse
> points as mount directory nodes").
>
> So this code in reparse_info_to_fattr() requires to know if the reparse
> point was handled by the parse_reparse_point() function or not. Hence
> reverting commit cad3fc0a4c8c ("cifs: Throw -EOPNOTSUPP error on
> unsupported reparse point type from parse_reparse_point()") would cause
> that the above logic stop working.
>
> To fix both problems, the one reported by Junwen about unsupported
> OneDrive reparse point, and the name surrogate reparse points, I'm
> proposing in my change to "mask" the -EOPNOTSUPP not in the called
> parse_reparse_point() function but instead in the caller
> reparse_info_to_fattr().
>
> During writing b587fd128660 and cad3fc0a4c8c I somehow forgot about the
> case which cause this issue.
>
> Linux SMB client should not filter out unknown/unhandled reparse points.
> Reparse points are processed by the SMB server (with few exceptions for
> UNIX special files).
>
> In the attachment I'm sending the patch, now with the commit message and
> Fixes lines.
>
> On Saturday 05 April 2025 14:30:22 Steve French wrote:
> > This was easy to reproduce on mainline for me as well (and presumably
> > the same on 6.12 and 6.13 since it has been picked up by stable, and
> > even looks it has been picked up in 6.6. stable) by simply mounting a
> > Windows share that was exporting a onedrive directory.
> >
> > Pali,
> > I did verify that your suggested fix worked for my experiment
> > (exporting onedrive dir as share).   Could you give more specific
> > examples of
> >
> >       'Reverting "cifs: Throw -EOPNOTSUPP error on unsupported reparse
> > point type from parse_reparse_point()" would
> >       break processing of the name-surrogate reparse points.
> >
> > ie some repro examples that Junwen etc. could try
> >
> > Welcome any other Tested-by/Reviewed-by/Acked-by for the two
> > alternatives - reverting the patch, vs. Pali's workaround
> >
> >
> > On Sat, Apr 5, 2025 at 12:20=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.or=
g> wrote:
> > >
> > > Hello Junwen,
> > >
> > > Could you please provide me more details about your issue? What exact
> > > kernel version is affected and what error message you see? Because in
> > > email subject is version 6.8 and in description is 6.12, so I quite
> > > confused.
> > >
> > > I will look at this issue, just I need all detailed information.
> > > It looks like that the error handling is missing some case there.
> > >
> > > Thanks
> > >
> > > Pali
> > >
> > > On Saturday 05 April 2025 12:16:27 Steve French wrote:
> > > > Good catch - it does look like a regression introduced by:
> > > >
> > > >         cad3fc0a4c8c ("cifs: Throw -EOPNOTSUPP error on unsupported
> > > > reparse point type from parse_reparse_point()")
> > > >
> > > > The "unhandled reparse tag: 0x9000701a" looks like (based on MS-FSC=
C
> > > > document) refers to
> > > >
> > > >     "IO_REPARSE_TAG_CLOUD_7   0x9000701A  Used by the Cloud Files
> > > > filter, for files managed by a sync engine such as OneDrive"
> > > >
> > > > Will need to revert that as it looks like there are multiple repars=
e
> > > > tags that it will break not just the onedrive one above
> > > >
> > > >
> > > > On Fri, Apr 4, 2025 at 10:24=E2=80=AFPM Junwen Sun <sunjw8888@gmail=
.com> wrote:
> > > > >
> > > > > Dear all,
> > > > >
> > > > > This is my first time submit an issue about kernel, if I am doing=
 this
> > > > > wrong, please correct me.
> > > > >
> > > > > I'm using Debian testing amd64 as a home server. Recently, it upd=
ated
> > > > > to linux-image-6.12.20-amd64 and I found that it couldn't mount
> > > > > OneDrive shared folder using cifs. If I boot the system with 6.12=
.19,
> > > > > then there is no such problem.
> > > > >
> > > > > It just likes the issue Marc encountered in this thread. And the =
issue
> > > > > was fixed by commit 'ec686804117a0421cf31d54427768aaf93aa0069'. S=
o,
> > > > > I've done some research and found that in 6.12.20, there is a new
> > > > > commit 'fef9d44b24be9b6e3350b1ac47ff266bd9808246' in cifs which a=
lmost
> > > > > revert the commit 'ec686804117a0421cf31d54427768aaf93aa0069'. I g=
uess
> > > > > it brings the same issue back to 6.12.20.
> > > > >
> > > > > Thanks very much in advance if someone can have a look into this =
issue again.
> > > > >
> > > > > =E5=AD=99=E5=B3=BB=E6=96=87
> > > > > Sun Junwen
> > > >
> > > >
> > > >
> > > > --
> > > > Thanks,
> > > >
> > > > Steve
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve



--=20
Thanks,

Steve

--000000000000c453df06320ee2fe
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-cifs-Ensure-that-all-non-client-specific-reparse-poi.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-Ensure-that-all-non-client-specific-reparse-poi.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m94qp6g90>
X-Attachment-Id: f_m94qp6g90

RnJvbSA0OTY2ZjY3NWM4NjAxN2U1YzAzYzdkZjBkODBmYWQzNWFjMzM1YjUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/UGFsaT0yMFJvaD1DMz1BMXI/PSA8cGFsaUBr
ZXJuZWwub3JnPgpEYXRlOiBTYXQsIDUgQXByIDIwMjUgMTk6NTE6MDcgKzAyMDAKU3ViamVjdDog
W1BBVENIXSBjaWZzOiBFbnN1cmUgdGhhdCBhbGwgbm9uLWNsaWVudC1zcGVjaWZpYyByZXBhcnNl
IHBvaW50cyBhcmUKIHByb2Nlc3NlZCBieSB0aGUgc2VydmVyCk1JTUUtVmVyc2lvbjogMS4wCkNv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVu
Y29kaW5nOiA4Yml0CgpGaXggcmVncmVzc2lvbiBpbiBtb3VudHMgdG8gZS5nLiBvbmVkcml2ZSBz
aGFyZXMuCgpHZW5lcmFsbHksIHJlcGFyc2UgcG9pbnRzIGFyZSBwcm9jZXNzZWQgYnkgdGhlIFNN
QiBzZXJ2ZXIgZHVyaW5nIHRoZQpTTUIgT1BFTiByZXF1ZXN0LCBidXQgdGhlcmUgYXJlIGZldyBy
ZXBhcnNlIHBvaW50cyB3aGljaCBkbyBub3QgaGF2ZQpPUEVOLWxpa2UgbWVhbmluZyBmb3IgdGhl
IFNNQiBzZXJ2ZXIgYW5kIGhhcyB0byBiZSBwcm9jZXNzZWQgYnkgdGhlIFNNQgpjbGllbnQuIFRo
b3NlIGFyZSBzeW1saW5rcyBhbmQgc3BlY2lhbCBmaWxlcyAoZmlmbywgc29ja2V0LCBibG9jaywg
Y2hhcikuCgpGb3IgTGludXggU01CIGNsaWVudCwgaXQgaXMgcmVxdWlyZWQgdG8gcHJvY2VzcyBh
bHNvIG5hbWUgc3Vycm9nYXRlIHJlcGFyc2UKcG9pbnRzIGFzIHRoZXkgcmVwcmVzZW50IGFub3Ro
ZXIgZW50aXR5IG9uIHRoZSBTTUIgc2VydmVyIHN5c3RlbS4gTGludXgKY2xpZW50IHdpbGwgbWFy
ayB0aGVtIGFzIHNlcGFyYXRlIG1vdW50IHBvaW50cy4gRXhhbXBsZXMgb2YgbmFtZSBzdXJyb2dh
dGUKcmVwYXJzZSBwb2ludHMgYXJlIE5URlMganVuY3Rpb24gcG9pbnRzIChlLmcuIGNyZWF0ZWQg
YnkgdGhlICJta2xpbmsiIHRvb2wKb24gV2luZG93cyBzZXJ2ZXJzKS4KClNvIGFmdGVyIHByb2Nl
c3NpbmcgdGhlIG5hbWUgc3Vycm9nYXRlIHJlcGFyc2UgcG9pbnRzLCBjbGVhciB0aGUKLUVPUE5P
VFNVUFAgZXJyb3IgY29kZSByZXR1cm5lZCBmcm9tIHRoZSBwYXJzZV9yZXBhcnNlX3BvaW50KCkg
dG8gbGV0IFNNQgpzZXJ2ZXIgdG8gcHJvY2VzcyByZXBhcnNlIHBvaW50cy4KCkFuZCByZW1vdmUg
cHJpbnRpbmcgbWlzbGVhZGluZyBlcnJvciBtZXNzYWdlICJ1bmhhbmRsZWQgcmVwYXJzZSB0YWc6
IiBhcwpyZXBhcnNlIHBvaW50cyBhcmUgaGFuZGxlZCBieSBTTUIgc2VydmVyIGFuZCBoZW5jZSB1
bmhhbmRsZWQgZmFjdCBpcyBub3JtYWwKb3BlcmF0aW9uLgoKRml4ZXM6IGNhZDNmYzBhNGM4YyAo
ImNpZnM6IFRocm93IC1FT1BOT1RTVVBQIGVycm9yIG9uIHVuc3VwcG9ydGVkIHJlcGFyc2UgcG9p
bnQgdHlwZSBmcm9tIHBhcnNlX3JlcGFyc2VfcG9pbnQoKSIpCkZpeGVzOiBiNTg3ZmQxMjg2NjAg
KCJjaWZzOiBUcmVhdCB1bmhhbmRsZWQgZGlyZWN0b3J5IG5hbWUgc3Vycm9nYXRlIHJlcGFyc2Ug
cG9pbnRzIGFzIG1vdW50IGRpcmVjdG9yeSBub2RlcyIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnClJlcG9ydGVkLWJ5OiBKdW53ZW4gU3VuIDxzdW5qdzg4ODhAZ21haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBTdGV2
ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvc21iL2NsaWVudC9pbm9k
ZS5jICAgfCAxMCArKysrKysrKysrCiBmcy9zbWIvY2xpZW50L3JlcGFyc2UuYyB8ICA0IC0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9mcy9zbWIvY2xpZW50L2lub2RlLmMgYi9mcy9zbWIvY2xpZW50L2lub2RlLmMKaW5k
ZXggYTAwYTlkOTFkMGRhLi45YjU2MTk4ZjcyMzAgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQv
aW5vZGUuYworKysgYi9mcy9zbWIvY2xpZW50L2lub2RlLmMKQEAgLTEyMjgsNiArMTIyOCwxNiBA
QCBzdGF0aWMgaW50IHJlcGFyc2VfaW5mb190b19mYXR0cihzdHJ1Y3QgY2lmc19vcGVuX2luZm9f
ZGF0YSAqZGF0YSwKIAkJCQljaWZzX2NyZWF0ZV9qdW5jdGlvbl9mYXR0cihmYXR0ciwgc2IpOwog
CQkJCWdvdG8gb3V0OwogCQkJfQorCQkJLyoKKwkJCSAqIElmIHRoZSByZXBhcnNlIHBvaW50IGlz
IHVuc3VwcG9ydGVkIGJ5IHRoZSBMaW51eCBTTUIKKwkJCSAqIGNsaWVudCB0aGVuIGxldCBpdCBw
cm9jZXNzIGJ5IHRoZSBTTUIgc2VydmVyLiBTbyBtYXNrCisJCQkgKiB0aGUgLUVPUE5PVFNVUFAg
ZXJyb3IgY29kZS4gVGhpcyB3aWxsIGFsbG93IExpbnV4IFNNQgorCQkJICogY2xpZW50IHRvIHNl
bmQgU01CIE9QRU4gcmVxdWVzdCB0byBzZXJ2ZXIuIElmIHNlcnZlcgorCQkJICogZG9lcyBub3Qg
c3VwcG9ydCB0aGlzIHJlcGFyc2UgcG9pbnQgdG9vIHRoZW4gc2VydmVyCisJCQkgKiB3aWxsIHJl
dHVybiBlcnJvciBkdXJpbmcgb3BlbiB0aGUgcGF0aC4KKwkJCSAqLworCQkJaWYgKHJjID09IC1F
T1BOT1RTVVBQKQorCQkJCXJjID0gMDsKIAkJfQogCiAJCWlmIChkYXRhLT5yZXBhcnNlLnRhZyA9
PSBJT19SRVBBUlNFX1RBR19TWU1MSU5LICYmICFyYykgewpkaWZmIC0tZ2l0IGEvZnMvc21iL2Ns
aWVudC9yZXBhcnNlLmMgYi9mcy9zbWIvY2xpZW50L3JlcGFyc2UuYwppbmRleCAyYjllOTg4NWRj
NDIuLmY4NWRkNDBmMzRhZiAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9yZXBhcnNlLmMKKysr
IGIvZnMvc21iL2NsaWVudC9yZXBhcnNlLmMKQEAgLTEwNjIsOCArMTA2Miw2IEBAIGludCBwYXJz
ZV9yZXBhcnNlX3BvaW50KHN0cnVjdCByZXBhcnNlX2RhdGFfYnVmZmVyICpidWYsCiAJCQljb25z
dCBjaGFyICpmdWxsX3BhdGgsCiAJCQlzdHJ1Y3QgY2lmc19vcGVuX2luZm9fZGF0YSAqZGF0YSkK
IHsKLQlzdHJ1Y3QgY2lmc190Y29uICp0Y29uID0gY2lmc19zYl9tYXN0ZXJfdGNvbihjaWZzX3Ni
KTsKLQogCWRhdGEtPnJlcGFyc2UuYnVmID0gYnVmOwogCiAJLyogU2VlIE1TLUZTQ0MgMi4xLjIg
Ki8KQEAgLTEwOTAsOCArMTA4OCw2IEBAIGludCBwYXJzZV9yZXBhcnNlX3BvaW50KHN0cnVjdCBy
ZXBhcnNlX2RhdGFfYnVmZmVyICpidWYsCiAJCX0KIAkJcmV0dXJuIDA7CiAJZGVmYXVsdDoKLQkJ
Y2lmc190Y29uX2RiZyhWRlMgfCBPTkNFLCAidW5oYW5kbGVkIHJlcGFyc2UgdGFnOiAweCUwOHhc
biIsCi0JCQkgICAgICBsZTMyX3RvX2NwdShidWYtPlJlcGFyc2VUYWcpKTsKIAkJcmV0dXJuIC1F
T1BOT1RTVVBQOwogCX0KIH0KLS0gCjIuNDMuMAoK
--000000000000c453df06320ee2fe--

