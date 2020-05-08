Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032A1CBAB2
	for <lists+samba-technical@lfdr.de>; Sat,  9 May 2020 00:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LwDV7aMXTJyCxSwGKIkMg/5Sbu7F5Op6/er54e7ZuVk=; b=KJ4KC9xyRW9p5Gkkp4Iy6QKJ05
	XoyZWlp0WVk5pvGplS0q1BTFKwotQeC9Roils4U2IngdbeYjPYLsBs3lacI9Wq0illgYBWBVT2DFv
	2wPVJ+Odtbz1oMF8tHMiZUE9OqDMWbypqDPW85BOm42x/APpLdWZxTvue8KPSYji3SiwPSxPFGaHa
	sSgch4fYex8Wq3p+QogPrkKTXu/Poa1+CY6aRKSQES4yqKbA9hWLxIfuXHv52Luhv0OuUAfE3m7BA
	ongR/SAwhPqzB355Xnd5AGC8EZLowirbElY92vCsZ8/7ESjPFsLgpI0HlIfIw7PvNQVj7rURWIhIw
	8pU8zlUQ==;
Received: from localhost ([::1]:42700 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXBRP-003Jdb-EI; Fri, 08 May 2020 22:25:59 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37352) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXBRK-003JdT-T2
 for samba-technical@lists.samba.org; Fri, 08 May 2020 22:25:57 +0000
Received: by mail-ed1-f65.google.com with SMTP id w2so2598285edx.4
 for <samba-technical@lists.samba.org>; Fri, 08 May 2020 15:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LwDV7aMXTJyCxSwGKIkMg/5Sbu7F5Op6/er54e7ZuVk=;
 b=dOmvno3Eq8EOFc29gvRFaBBqS57KUnjFxolQovcbfkziiU4uANTp4/Zt+vFIMYkVHU
 1a3usXtve+qDNbrnVjKu8/EYa+z005EZlVfxW3lqOqCcRr4fx4TgpDg0EjSzuq1jfkwn
 BMK3LR5Z64rX87A9+tA036SUouDmB09q2InpllFnMewkFjrcjiOq/umOgmHFf0daM7ej
 Qv6rAo9PQVWPz6//i5BEztK4FYcDlP7We+VpqBLOY+VWpmreCT2lnvKz8t1dOgOApQHA
 nn43sabUiii7OTKwDkj4HqeuhdkGU0H7y09Muk6L7AHKIN1CV5I5Io9x5s3e2EvQLqA8
 FPNQ==
X-Gm-Message-State: AGi0Pubm3DfHN2sjKYyA1oC5mjTSl1ZfT2mXxGrzq/qu4gSo4RHHY+Uf
 CxL7HOtlmO+i2UP9fgn2d3WlzwXEeSpoIDScXc4=
X-Google-Smtp-Source: APiQypKSBsHo/QaQ0vgcwCmNX5Rqbi5y8BFp3+tN0/FhiZwS1aR1LBh670FOCmWASmQ5e5L1KV2mTfkoOpxNRUx01As=
X-Received: by 2002:a05:6402:7d6:: with SMTP id
 u22mr4146370edy.149.1588976753368; 
 Fri, 08 May 2020 15:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <CALSyjX5G7ps8Pafurh5L+6U_JYBA9uTRxJaEhwKL5jTvU=2ZOQ@mail.gmail.com>
 <20200508222441.4f74c615@samba.org>
 <29c6778ebf0a22d063042589526b98922d06301d.camel@samba.org>
In-Reply-To: <29c6778ebf0a22d063042589526b98922d06301d.camel@samba.org>
Date: Fri, 8 May 2020 18:25:41 -0400
Message-ID: <CALSyjX7RkiukckU5P1xL4FBX6tWpZFB9E1t0CrO+t+0EwNaNWA@mail.gmail.com>
Subject: Re: [PATCH] snapper: add configure option to control build (default:
 auto)
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: multipart/mixed; boundary="000000000000f0ff6505a52a7a2b"
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
From: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Taylor <liverbugg@rinux.org>
Cc: Matt Taylor via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000f0ff6505a52a7a2b
Content-Type: text/plain; charset="UTF-8"

As long as the option to disable is there that works for my scenario.
I figured since it was automatically including snapper if dbus was
found previously I would keep that automatic behavior.

Updated patch attached.  Snapper is enabled by default and configure
will error out if dbus is not found and --disable-snapper was not
passed.

I'm contributing as an individual with no corporate
involvement/restrictions, so does that mean no Signed-Off-by tag is
needed?  I have another trivial spelling patch to send after this.

Thanks,

-Matt

On Fri, May 8, 2020 at 4:36 PM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Fri, 2020-05-08 at 22:24 +0200, David Disseldorp via samba-technical
> wrote:
> > On Fri, 8 May 2020 14:05:16 -0400, Matt Taylor via samba-technical
> > wrote:
> >
> > > Recently the samba packages on Gentoo Linux had a hard dependency
> > > on
> > > dbus added.  This is because the vfs_snapper module is enabled
> > > automagically on the existence of dbus headers with no option to
> > > disable it.  See: https://bugs.gentoo.org/721320 for the Gentoo bug
> > > where it was suggested this be reported upstream.
> > >
> > > This patch adds a configure option to control the build of snapper
> > > similar to other vfs modules.
> > >
> > > Signed-off-by: Matt Taylor <liverbugg@rinux.org>
> >
> > Thanks for the patch Matt!
> > The change looks reasonable, although I think I'd prefer to see the
> > default be True, so that existing packagers aren't affected.
> >
> > Also, if this work is contributed on behalf of your employer, you'll
> > need to sign the DCO as described at:
> > https://www.samba.org/samba/devel/copyright-policy.html
>
> I agree.  I do not like ./configure parameters that default to 'auto'
> (and the same goes for features), because of the inverse of this, that
> the absense of a header on a build machine would mean that a feature is
> unintentionally lost.
>
> The recent practice has been to have a configure option to allow a
> distribution to disable a feature (as is desired here) but to otherwise
> give an error if the header/library is not available and point to the
> flag.
>
> Andrew Bartlett
>
> --
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>

--000000000000f0ff6505a52a7a2b
Content-Type: text/plain; charset="US-ASCII"; name="samba-snapper_option.patch.txt"
Content-Disposition: attachment; filename="samba-snapper_option.patch.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k9yrmk9i0>
X-Attachment-Id: f_k9yrmk9i0

ZGlmZiAtdXIgc2FtYmEtbWFzdGVyL3NvdXJjZTMvd3NjcmlwdCBzYW1iYS1tYXN0ZXItcGF0Y2gv
c291cmNlMy93c2NyaXB0Ci0tLSBzYW1iYS1tYXN0ZXIvc291cmNlMy93c2NyaXB0CTIwMjAtMDUt
MDggMDc6MTY6MTguMDAwMDAwMDAwIC0wNDAwCisrKyBzYW1iYS1tYXN0ZXItcGF0Y2gvc291cmNl
My93c2NyaXB0CTIwMjAtMDUtMDggMTc6MjI6NDguMDAwMDAwMDAwIC0wNDAwCkBAIC03NSw2ICs3
NSw4IEBACiAgICAgb3B0LnNhbWJhX2FkZF9vbm9mZl9vcHRpb24oJ2dsdXN0ZXJmcycsIHdpdGhf
bmFtZT0iZW5hYmxlIiwgd2l0aG91dF9uYW1lPSJkaXNhYmxlIiwgZGVmYXVsdD1UcnVlKQogICAg
IG9wdC5zYW1iYV9hZGRfb25vZmZfb3B0aW9uKCdjZXBoZnMnLCB3aXRoX25hbWU9ImVuYWJsZSIs
IHdpdGhvdXRfbmFtZT0iZGlzYWJsZSIsIGRlZmF1bHQ9VHJ1ZSkKIAorICAgIG9wdC5zYW1iYV9h
ZGRfb25vZmZfb3B0aW9uKCdzbmFwcGVyJywgd2l0aF9uYW1lPSJlbmFibGUiLCB3aXRob3V0X25h
bWU9ImRpc2FibGUiLCBkZWZhdWx0PVRydWUpCisgICAgCiAgICAgb3B0LmFkZF9vcHRpb24oJy0t
ZW5hYmxlLXZ4ZnMnLAogICAgICAgICAgICAgICAgICAgaGVscD0oImVuYWJsZSBzdXBwb3J0IGZv
ciBWeEZTIChkZWZhdWx0PW5vKSIpLAogICAgICAgICAgICAgICAgICAgYWN0aW9uPSJzdG9yZV90
cnVlIiwgZGVzdD0nZW5hYmxlX3Z4ZnMnLCBkZWZhdWx0PUZhbHNlKQpAQCAtMTc1MiwxMSArMTc1
NCwxNiBAQAogICAgIGlmIE9wdGlvbnMub3B0aW9ucy5lbmFibGVfdnhmczoKICAgICAgICAgY29u
Zi5ERUZJTkUoJ0hBVkVfVlhGUycsICcxJykKIAotICAgIGlmIGNvbmYuQ0hFQ0tfQ0ZHKHBhY2th
Z2U9J2RidXMtMScsIGFyZ3M9Jy0tY2ZsYWdzIC0tbGlicycsCisgICAgaWYgT3B0aW9ucy5vcHRp
b25zLndpdGhfc25hcHBlcjoKKyAgICAgICAgaWYgY29uZi5DSEVDS19DRkcocGFja2FnZT0nZGJ1
cy0xJywgYXJncz0nLS1jZmxhZ3MgLS1saWJzJywKICAgICAgICAgICAgICAgICAgICAgICBtc2c9
J0NoZWNraW5nIGZvciBkYnVzJywgdXNlbGliX3N0b3JlPSJEQlVTLTEiKToKLSAgICAgICAgaWYg
KGNvbmYuQ0hFQ0tfSEVBREVSUygnZGJ1cy9kYnVzLmgnLCBsaWI9J2RidXMtMScpCisgICAgICAg
ICAgICBpZiAoY29uZi5DSEVDS19IRUFERVJTKCdkYnVzL2RidXMuaCcsIGxpYj0nZGJ1cy0xJykK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kIGNvbmYuQ0hFQ0tfTElC
KCdkYnVzLTEnLCBzaGxpYj1UcnVlKSk6Ci0gICAgICAgICAgICBjb25mLkRFRklORSgnSEFWRV9E
QlVTJywgJzEnKQorICAgICAgICAgICAgICAgIGNvbmYuREVGSU5FKCdIQVZFX0RCVVMnLCAnMScp
CisgICAgICAgIGVsc2U6CisgICAgICAgICAgICBjb25mLmZhdGFsKCJ2ZnNfc25hcHBlciBpcyBl
bmFibGVkIGJ1dCBwcmVyZXF1aXNpdGUgREJVUyBsaWJyYXJpZXMgIgorICAgICAgICAgICAgICAg
ICAgICAgICAib3IgaGVhZGVycyBub3QgZm91bmQuIFVzZSAtLWRpc2FibGUtc25hcHBlciB0byBk
aXNhYmxlICIKKyAgICAgICAgICAgICAgICAgICAgICAgInZmc19zbmFwcGVyIHN1cHBvcnQuIik7
CiAKICAgICBpZiBjb25mLkNIRUNLX0NGRyhwYWNrYWdlPSdsaWJ1cmluZycsIGFyZ3M9Jy0tY2Zs
YWdzIC0tbGlicycsCiAgICAgICAgICAgICAgICAgICAgICAgbXNnPSdDaGVja2luZyBmb3IgbGli
dXJpbmcgcGFja2FnZScsIHVzZWxpYl9zdG9yZT0iVVJJTkciKToK
--000000000000f0ff6505a52a7a2b--

