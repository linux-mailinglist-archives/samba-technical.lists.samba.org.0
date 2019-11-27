Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152610AB3B
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2019 08:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0nA08AFetha4Hu508WYLqKZhVJUwRT9plFEvSeDp6ts=; b=3S4rnWMP498MJd+QBlkStZQT4D
	rkfVGrcFOBaEhQBV1Npt/4k+vFTMV0ib+2qe64BG1cMZaz9Lu1JgQ8t7PAnqZSweINFbHSWBB0spk
	vhnae8M1co5vixZbkyvj082gxKZ55aXzsLA0QEnqDkb7B1tpmaJswhB07EP+0+KXDYyZUD0NBv4XO
	ZMBtYI/UnCxTz4bw2ZEf7QMVp1nwa/ONydWxGJXR1Tu5+gbBy3b1JnLBZhV28ihC6LtwOIEnlqK8N
	lDURBWByAzOldi7wMN2c+/0VO9xYAsRfw9DRcVRaOxoViacGEthjCJdSWks4psX9W9qxMP3uHZJ7M
	UFJ6jmgA==;
Received: from localhost ([::1]:64316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZrrM-002bqs-Uw; Wed, 27 Nov 2019 07:35:37 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:36477) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZrrF-002bql-Ix
 for samba-technical@lists.samba.org; Wed, 27 Nov 2019 07:35:33 +0000
Received: by mail-lf1-x135.google.com with SMTP id f16so16307631lfm.3
 for <samba-technical@lists.samba.org>; Tue, 26 Nov 2019 23:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nA08AFetha4Hu508WYLqKZhVJUwRT9plFEvSeDp6ts=;
 b=HGg3tn4cp1C1lvefQ88bFlUZxxt+Mnep6OLdct/R5oRw2+E6Y1nY7DtYbG/uIzcB/G
 sx1iwLt9BnDJK+ytjWUhTwmeOxlrH5JNArkY0U4KUTGbBNQIIBwEHUeRu1xkp7cBucwh
 fvxstoqb92JO6XfivfNaVP8t4ZeHbSuxnDOZkYdRKheA/g0GhUfjKUHjpgt0JBu12bCA
 s+3euS3hdZixbycnIyN0LnN++iAIUSHKHSQf215ZQXAmiPlDFuv/LoyaiNAsTgd7bVsM
 k4FxBff5eyNNxgpzOmVDXINUOY+Q3iYEKHW0T/9bVClfUqPoEHd+LNq+alteQpiQ+EeD
 fP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nA08AFetha4Hu508WYLqKZhVJUwRT9plFEvSeDp6ts=;
 b=EZ1GCEQ2kFp3Wnj+yBYxn12HXiK0+Jqp7jha0B3yb0Nj1BYRm/WHB0boTWiExbarA+
 l6lwE/hBXC2FbaKw7oHCoLQsid8wACJvNIHQV8zcNLEn+eKXYgCsJZJ7X0k/7JHsJvvn
 D1/nZceef/F5cwIWEE/7VYVa6+PhKzpdsJ0a8o4IEFISJ68QcP8u8wUDvB8dtT19rTeO
 rJv6aTKMuxY8MgdDdjeQr3Jg0DaTQy8TA/LN34rL8rTts+HGEXd1xs2jrMPTu9mVNqdS
 9qTPDv8nthnnSSUzYeGCW9LkHBTK9Ay0lBXsStTTZUSyVzoqslCxyaWYD2yKIDu/DcWx
 NoWw==
X-Gm-Message-State: APjAAAWQGzRbk2gJf1JNtHOijZP66Ndnqo61qjKvyYb2MZeJvaNI+q1g
 Sg/5UVfFT4uTQ0Z7Gy77EiBwQ3HRwwxEGAWVOzg=
X-Google-Smtp-Source: APXvYqxxdCjmtPqp/n2fmLuK4VH70D1cYIAeR6D7MBGGgJZtUNRXxWzrY7p+CSc6YbcPmOXybmn0yaaQ0DkHpMF57LY=
X-Received: by 2002:ac2:4ac1:: with SMTP id m1mr27813681lfp.182.1574840126844; 
 Tue, 26 Nov 2019 23:35:26 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8T2bviHcpRgmjmVoiAvtpLEmFkr-5P9Q9dr=AoKCiEyMw@mail.gmail.com>
 <CAC-fF8REXgwh+cdLcucsOA=5NAFWuAva1g_LOztbK8Eu+ojBuQ@mail.gmail.com>
 <28a851709bc2447081fc5d55abadbe8bde780e79.camel@samba.org>
In-Reply-To: <28a851709bc2447081fc5d55abadbe8bde780e79.camel@samba.org>
Date: Wed, 27 Nov 2019 08:35:14 +0100
Message-ID: <CAC-fF8RDeH7379sQchKoEd-k1GEgbms9YBJRcJadmM+0TTvBkg@mail.gmail.com>
Subject: Re: MR !854 | sess_crypt_blob() fails to decrypt its own cipher text
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 27, 2019 at 6:07 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Sat, 2019-11-23 at 14:30 +0100, Isaac Boukris via samba-technical
> wrote:
> > On Thu, Nov 21, 2019 at 6:52 PM Isaac Boukris <iboukris@gmail.com>
> > wrote:
> > >
> > > While adding tests for sess_crypt_blob() I noticed it fails when
> > > the
> > > input is not aligned to block size of 8, and it looks like we
> > > always
> > > use it this way (see also comment above sess_encrypt_string()), see
> > > pipeline:
> > > https://gitlab.com/samba-team/devel/samba/commits/iboukris-dtest
> >
> > I now realize this branch doesn't prove much, since callers don't
> > check the return value yet, but i also tested with abort().
>
> I've checked the callers in the server, and I'm pretty confident this
> size requirement (being a multiple of 8) is an axiom you can trust.

Thanks for looking at it, that helps.

