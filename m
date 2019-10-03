Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026CC98FF
	for <lists+samba-technical@lfdr.de>; Thu,  3 Oct 2019 09:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=A7DFRZxM5IY+U6c/fuez+7MdHShUzlJqZacdd3uY4EQ=; b=c638kZrWFErIxUY2+NwCjz1b4O
	KK+jUxkM4SX9nYf8wed5Ap9P0yJJdC8xuHcety4lM3rZlHSFtwscfVQErFR9tNCjoRCDBqVlPt+rM
	AuZMQCiPPQVTe3WuaUNzmKwEQxzOsQHU2QzsfWIVwi13DHcjh/tdLjDNSVbGMqGdbxaa4HGGcssSc
	76JG2ksCKexVi1Wzs0d+UuPXz9ZcJM5svEz09t9MyrrfT/H9obsjJlHdCxArSV5wXxK43dlwMIXw6
	nkRvC7aiY6XqLbtYshD/xkFoMQIumxqqQQWUDhABMzG3MhKPAgCC58JH/TKJk70A5jSC3MH28Xu0o
	JhR4QuYg==;
Received: from localhost ([::1]:50242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFvW6-000f6Q-MV; Thu, 03 Oct 2019 07:27:14 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:45726) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFvVs-000f6H-SW
 for samba-technical@lists.samba.org; Thu, 03 Oct 2019 07:27:03 +0000
Received: by mail-lf1-x135.google.com with SMTP id r134so946829lff.12
 for <samba-technical@lists.samba.org>; Thu, 03 Oct 2019 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A7DFRZxM5IY+U6c/fuez+7MdHShUzlJqZacdd3uY4EQ=;
 b=o3OzBGifz24pivneZo0z28M/bqibueMfUAFuftdfaC7QAR+cTVHIOst3DgN97QhEY3
 Rk28gkoiRg+sNGQmNbZbx0sdLhNhfOzTcrJiqpxeB+c7/uCt0WicSH7kh0MXy63lIPLd
 Bc51J4EYr45NyjuHtbgZnIpS7+gOJabf3k30U7/BVP746mWpVPwWO1cPxMBMAiq94Lrj
 xW9sDsgnjRr5+voaAs9IvsNVAnuS84wDBcYp/LDEch3TpIqBzlM0J74AyifTUSxaBDm6
 32S1XBiMweIvwDvWUt1V1CAnvY2bN7g04lueg+z8bF0LbRSH71AypuVQLhBZ8Si3RF5b
 T/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A7DFRZxM5IY+U6c/fuez+7MdHShUzlJqZacdd3uY4EQ=;
 b=Sqf2X1BQeCTuL3Zl4hxNfFbITc6ksEdEGdbHuNcm9Ie1SOXBkxLlCKSTUxr7PAnIQc
 72LsZeZchyzoquiFN96cbOtayqcV2MVGp/3lyD1dIKHM+jgze378BQm1x6APb6HYtndY
 eElfrhOp7twc8YFOpGlWe52nJ5zT4UZiY+CDWWt/8LI05+ODdj8O7VblWbUnncaSvDRl
 0XhA8g4un8AC/iDxVXN/4CKO0w+Y9Re0cOxyO70aNniHdk4UNCcSmkxJh5xaq0wSigPZ
 Vow+K1qn6RAlD6cRQbVYpAcTBA1KtdFJjDiibMcGCZP7DjedWwaR0r7LjHCWCb2PR4iv
 BLFA==
X-Gm-Message-State: APjAAAUvaXpexsbMWe1CdHAkLKICcTzL0dAInnnazJxpWU2DD22LPDM6
 jgFqLFj63s2dtcw218CTIdN926yDadwcPp4GZEc=
X-Google-Smtp-Source: APXvYqzT0f1JOIn3Mxbtp5r7HbZLyfQ3qQc+HufyQLYMdPaKK/JviXv7B5ONQskqKqMvDTOztUHIoyc5QDMBLE8TBF8=
X-Received: by 2002:ac2:4196:: with SMTP id z22mr4688289lfh.54.1570087619820; 
 Thu, 03 Oct 2019 00:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <1567389837.19432.26.camel@samba.org>
 <20191002172015.GJ5765@onega.vda.li>
In-Reply-To: <20191002172015.GJ5765@onega.vda.li>
Date: Thu, 3 Oct 2019 09:26:47 +0200
Message-ID: <CAC-fF8Q9DpEjrHmjvzFmGpueR9=U832zhgjEGZazp4HAnR10=w@mail.gmail.com>
Subject: Re: The road to removing Samba's internal copy of AES (and perhaps
 DES?)
To: Alexander Bokovoy <ab@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

On Wed, Oct 2, 2019 at 7:20 PM Alexander Bokovoy <ab@samba.org> wrote:
>
> On ma, 02 syys 2019, Andrew Bartlett via samba-technical wrote:
> >
> > On a related note, I plan to experiment with implementing our DES code
> > via GnuTLS using the CBC-DES cipher and an all-zero IV.  That may let
> > us remove that code as well, becoming essentially crypto-free and
> > therefore honouring FIPS mode correctly in all cases.  Do let me know
> > if you happen to experiment in this area so I don't double-up!
>
> But there are other parts where DES is used via libkrb5. They affect
> Samba AD deployment, domain join, tests, etc as MIT Kerberos 1.17
> removed DES support.
>
> Isaac has created WIP branch
> https://gitlab.com/samba-team/devel/samba/commits/iboukris_no_des_mit_118
> which passes autobuilds.

Right, it ifdefs the places where samba generates DES keys, i've
turned it into wip merge-request for better visibility:
https://gitlab.com/samba-team/samba/merge_requests/829

I was meaning to consult about this, with the removal of single DES
enctypes from upstream MIT, would it be ok to remove their usage from
samba too ? That would make the UAC flag USE_DES_KEY_ONLY
non-functional but I guess that's fine, any other considerations ?

Thanks!

