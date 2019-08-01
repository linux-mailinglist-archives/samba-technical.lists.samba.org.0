Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB4C7E0B1
	for <lists+samba-technical@lfdr.de>; Thu,  1 Aug 2019 19:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WGPyF/jz2yKuYFU7gzQ1L/LMsgV9YTZ2vw6QCV6Vnss=; b=FC6qM0OfsFDkQCem6h4eoeJ+GI
	CRzryq/Y/1OIUBfVKDqI+2izot2Q9Sxp4bN/CPLhzYfwVFmJCOIAvsqAZ8z3kiTSS0Hf+9zrzVJ7K
	dj/qEWJQ1uJ61XxV00lM9XA0wG93ep9P4YlDcI9r0mrO/CpyLw0hAdaigfTEqmBdDFuCEvNA1MNAm
	VGq2TgPO4pDpyP6Z9Hssur9L4Xhb8JfRqAHSx0amZpFTIrP4WV2aEO6nDm3kFl+HGZpaw7ojcIf79
	2fbSXPHvQIs5uxWmvgdxDjWYGuvowYaDEp/CrPykVr+gNq2cX7aJRQp3BXUS0JgT1L5r6/oY2qpDX
	sSm2ZuVg==;
Received: from localhost ([::1]:33976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1htERl-003Qbf-Pe; Thu, 01 Aug 2019 17:00:57 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42689) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1htERg-003QbY-Ik
 for samba-technical@lists.samba.org; Thu, 01 Aug 2019 17:00:55 +0000
Received: by mail-pf1-x444.google.com with SMTP id q10so34402515pff.9
 for <samba-technical@lists.samba.org>; Thu, 01 Aug 2019 10:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WGPyF/jz2yKuYFU7gzQ1L/LMsgV9YTZ2vw6QCV6Vnss=;
 b=sGWP0fErmKQgCjE58NXoxmrj6L7FQzRJa9+jCi2n/GxkHB/xpz3L93gva3RvfziNta
 BPAXRRhRYolWQODuGp6caxy9kqfFS2cRDZlBzVt0w66rKNTU88AUyNASwK103/FeLuGy
 IvyXPKwbB1SG2ZNkOfIbWBX7EP7B3DOeOZM4NxF6fnJXYBG1ccKIi+YlF86t18TJ3qrG
 h6huSgunJmOEpK32CV3ruEsJxK+WC9+l9d0HO6Skl5UtdhTHXTya9OWN3RNsJ4yWZK34
 rP+oWK9LVjAGws1nttGsu+bBMdkccSBGABlbwzpOZaEfTMXQw52/eKVtWfbnz72QJMhv
 JS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WGPyF/jz2yKuYFU7gzQ1L/LMsgV9YTZ2vw6QCV6Vnss=;
 b=FRDVEzdwCG4Y4YvfmIZPGq0LMoS/rAovT/p8nqjnUJShXBL4hmdEIyMzhHpQkoQWiC
 DsOMy8yq8f4Spjpo1/k7v8HCxDWGASfop1xLVuxiGaLRJ43acOCWNDBtVbTp6QFMyv2a
 Mri4VELqWynZr26wdrNwLXeVOZghliEjpDafeX2VpRJOn2bU81mXBkAfTvqafadTgC5K
 EodkI7qiDT24CTI8CjY7x+g/PzufB2MAfTiYo/p3Liv3Upmhq90FbxikVRxTThQa69o7
 ho8WHU0nHwwNoTBCG4r5ZkzCRWOlUJnLoVisHs5LWG3ZvLHOP1/MWl8ONxT0RAQNRSal
 WHUQ==
X-Gm-Message-State: APjAAAUGQSroOIXgsGwprJjIoSQoxggrIUWxQIEwivTND5Z1Ufb/jF9o
 aKs/z/fjh8S9jc2sy5eOdXLdLx84RVXMSrcYMYc=
X-Google-Smtp-Source: APXvYqxlnoZ7H66e1GLk8MqU9jRtl8FsWM4cquNdSP23TFAWWxy+fPwsayD6YLTVS7VXcsI01KJ2dq1MjFDDLk6SktI=
X-Received: by 2002:a17:90a:360c:: with SMTP id
 s12mr9971211pjb.30.1564678849452; 
 Thu, 01 Aug 2019 10:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190731090526.27245-1-colin.king@canonical.com>
 <87r266seg4.fsf@suse.com> <20190731122841.GA1974@kadam>
 <87lfwerze8.fsf@suse.com>
 <2f562159-8118-f4a5-9e00-c82cf0841fd5@canonical.com>
In-Reply-To: <2f562159-8118-f4a5-9e00-c82cf0841fd5@canonical.com>
Date: Thu, 1 Aug 2019 12:00:37 -0500
Message-ID: <CAH2r5msukKuhEcbpBfXOrwFEA=fyXQKSL+hDwdOFYX7DNLe8TQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
To: Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 samba-technical <samba-technical@lists.samba.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Jul 31, 2019 at 10:54 AM Colin Ian King
<colin.king@canonical.com> wrote:
>
> On 31/07/2019 16:34, Aur=C3=A9lien Aptel wrote:
> > "Dan Carpenter" <dan.carpenter@oracle.com> writes:
> >> You're just turning off GCC's static analysis (and introducing false
> >> positives) when you do that.  We have seen bugs caused by this and nev=
er
> >> seen any bugs prevented by this style.
> >
> > You've never seen bugs prevented by initializing uninitialized
> > variables? Code can change overtime and I don't think coverity is
> > checked as often as it could be, meaning the var could end up being use=
d
> > while uninitialized in the future.
>
> gcc/clang should pick up uninitialized vars at compile time. also I run
> coverity daily on linux-next.
>
> Colin
>
> >
> > Anyway I won't die on this hill, merge this if you prefer.
> >
> > Cheers,
> >
>


--=20
Thanks,

Steve

