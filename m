Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE0720374F
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 14:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uBd0uzsh66a+BcFKMiO9kvntXCtTJFZo5xcKGyCSpes=; b=dzox6aOCXw41UcLpjRitKPXvZJ
	1zY388h5fcayGdGtiuS1OL8/A5SUsnnczFSUH888pFRZRwqA10Kg6ve3z8olhNj059uIto66GihDb
	UaOD4v7NiCOGAVJI2/8ugoxIdXCRWUFPPY2u+Lj0C6451mTDHKPFZcXr4dQZxix763QXO3Ln3keqp
	kzXIFXpWy58UC1whqA8ao9nhZx5pOooEEs5EgnHDiTE7EfmiVsvgfkqR+SoNXNp17bEitfy9IEBg4
	1O9jMbjrw2t0mQc+m5flQhAQx+c8hBlLH9NWaiJXG0wATZq7SCG1luUuzMUjxxrPpAhII4WjWJmhN
	qvxWOtFw==;
Received: from localhost ([::1]:41410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnLxl-001nf6-VN; Mon, 22 Jun 2020 12:54:14 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46604) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnLxf-001ney-46
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 12:54:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id m21so13508080eds.13
 for <samba-technical@lists.samba.org>; Mon, 22 Jun 2020 05:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ISjUUZoN+VQO4IXBKzAVFC6DfqIiLDkPTCvZlF2e4o4=;
 b=NZG6sn9V6AOnx0gk7BEUghThK2uDigmIq7Sh8rlXueT6DSqvp1ewTDTXklWFC4IhVE
 ksvd6mt9nwmXKKWSLx9apNVNFxU1uEXieX5kAeroBdMCI0EkzsQ0VIKfl3LCHyRYvOwf
 5NM1ksCEckM+i5isfZihL8Eq5nxnmcGHy1OgTRLMBa/6ZIKEnHr3i+hCLyZSG48iu0ly
 eBagyeaSjDBGYTEHoy11Ph1Hm1ZFKA3n/sTVuRvswQ3S+ELN0XwDhGp9+Gsrk4DM1pqH
 HRUPdCq2lKhWaDB/JClTui+woJwdyw3ThBdO5NasSX0jKGofP6JQTnljWD7N3AVdWyIZ
 rGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ISjUUZoN+VQO4IXBKzAVFC6DfqIiLDkPTCvZlF2e4o4=;
 b=BllUUe4xsJgG4w9SvJvHb76AbtA1OLPdHpVG4PAKikUWpVmPqdKDeFaB6jJdZaaki2
 76CzytDMpApTjozXllJvSHcnIShb0lT9rI4rLuBd0ibSETnlLHM89MvhHI6ocCi4chp9
 DKjIbcsPxQ0i1tXVVRZqQLg/YIh1aUYbvsasQeH7+2nSSuCmF1PlhsgMEPw9Ey/jmdT5
 KWdfPSSm2kjiFT2OgXz04j10g3/n39pp/ZxUvg1KNA4rrCaz6SnxG7imraDTJJd1xUbW
 gdX+m1BEAakYdxEW/lFLF27sgdtvC7P6SQJtY3MRQ5E+GLUryxUEly2UhgiJ6+oehpjm
 KTgA==
X-Gm-Message-State: AOAM5312QsnuZatrmrRmxa4/7q6tvdxB1L5s6hr/JT4sxuanRfncSwR4
 PMM4KitncF8Q2oIS+3oT8fqYDZF36BhUwuQIH8r7FMPfJKI=
X-Google-Smtp-Source: ABdhPJxRyBmn/W9amUFM+tK1iC+/r/trCLsYENzGOPxiyW4OmGjngmoxB9L4RCtS3/BaIWYCUs9X5FuotEIgyJmugls=
X-Received: by 2002:aa7:dd8e:: with SMTP id g14mr6484811edv.208.1592830446191; 
 Mon, 22 Jun 2020 05:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCU=2HPWJHjgtMFx7wM061n-Jjo7aYRinxLPDtq8fo-OrA@mail.gmail.com>
 <20200622100601.GK3036357@onega.vda.li> <20200622134921.1e7347ab@samba.org>
In-Reply-To: <20200622134921.1e7347ab@samba.org>
Date: Mon, 22 Jun 2020 15:48:48 +0300
Message-ID: <CAH72RCWO8r=Sn3spEiESUcBiy+GT7DtKVFPEMLAPeBK_T5LXMw@mail.gmail.com>
Subject: Re: GSoC: Week 3 Progress Update
To: David Disseldorp <ddiss@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Cc: Alexander Bokovoy <ab@samba.org>,
 Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you, David.

On Mon, Jun 22, 2020 at 2:49 PM David Disseldorp <ddiss@samba.org> wrote:

> On Mon, 22 Jun 2020 13:06:01 +0300, Alexander Bokovoy via samba-technical
> wrote:
>
> > > Last Week's changes are in the develop branch of this repo:
> > > https://gitlab.com/HezekiahM/samba-ad-dc
> >
> > Thank you, Hezekiah!
> >
> > I made a short gallery of screenshots here:
> > https://www.samba.org/~ab/samba-ad-dc-cockpit/
>
> This looks like really nice progress - well done Hezekiah and mentors :)
>
> Cheers, David
>
