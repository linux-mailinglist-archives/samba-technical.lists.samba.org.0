Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A4686F50D
	for <lists+samba-technical@lfdr.de>; Sun,  3 Mar 2024 14:18:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8gSOJ89ME8qwRa6apyCFNs1SAdhbSeiP4s01GVpfvZ0=; b=HugLqxeKAfQE6ttyPMck55Ixcc
	kgTB0uyYon8vQc+Im+vahMbJwKd5tGMZvht9uOKJ3SVQGyVUhHPPOfk5rwr4VCvL7uUlJPeLxWx5D
	QPk9aKHg37msjGjNZt/LgyGBTwoVB/YOETSvb9CgtZtRksGM2pCQeYYx1RzK3Nc1znLLz/d0prbxy
	EIxAjuwuDUMNgtWk7FJwoN7fdI59HAf0lMdM621tsscmznRyeGRvKL8H721C7FuU9FFK1OF2T1InD
	pxKsiyijA+D1U7qbmGtQrkcyY0UwkcORGT8B50jgnnMnguSVnAUSy8kI2NpGLzZ4WnaKocBSHimhX
	noVLA2AQ==;
Received: from ip6-localhost ([::1]:32978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rglic-00Biru-2f; Sun, 03 Mar 2024 13:17:30 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:47111) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rgliT-00Birm-GU
 for samba-technical@lists.samba.org; Sun, 03 Mar 2024 13:17:25 +0000
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7bc332d3a8cso239526639f.2
 for <samba-technical@lists.samba.org>; Sun, 03 Mar 2024 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709471838; x=1710076638; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gSOJ89ME8qwRa6apyCFNs1SAdhbSeiP4s01GVpfvZ0=;
 b=D8qHg474OrL+rQzDMLOXW1f44jjOasuI5aPT6mtu5V+rWSPP419GL/zf2VJVT7gcaV
 m+rZzAubmy5FMVbywbk3XcKH+3MMRJXTgPUC3dArMRmZJWEqeRXeg1iJ1TAJ1CK201G0
 GenvCLMtxl+2NAmA7WsCFFhMAQYoRLCCSmvuEWBWcS+xdBLdp3TEilPq6W9rNf68ZUxQ
 /18nLy3f0FPUvPVjpZMaQkcl2mWUboEOoqdO9LZK5f1jujfzf2SgIb7vOcigQcvL7OjR
 ZA6umqhSXOI6azE4s+6KmugH1yn3k6n6YAlntpTE5O3O+gPBfruazj13mWXpQWwbp20I
 sroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709471838; x=1710076638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8gSOJ89ME8qwRa6apyCFNs1SAdhbSeiP4s01GVpfvZ0=;
 b=Zr3qx6Q3dfJJeHyz3kXg8phfZBSh58n787OWdKY9meYBQoZ8BBSe71fr3KIUOL9ysp
 78Q6OP8bmGD3clyVjHR0Vc3VwhCQG1NjfBnXqoqmivXtqpKr3w9XBWE1EV/NMEgmYUAT
 Ca9/9LrodChy8N0ScpJE0hXgTjGpPgdu5K9Ixb4roL0mhaGT3biKWTgDR9FFzRZiII77
 YcsdzPWTL2tqvJfIoamUZJuYg6KFWk09Z59OwRcGImhfaSRAhzNehurXurrG4W86A5Bj
 FPxN7O71tfxZ26LBtKgF8k5jF1EhilVrrg7TVua/5DbIGll5evEKX6jPEHGUk1EI4R6T
 Zzag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjz69YEEUFg+rNrm5oeU38Uz2SnVT14CN97LuOoj/S7KjD3kaJjpqQFqd/pZWWiGhTTs2M6tZttu/5OQuuTPNnKqLlr2pFv4gq7/R3xiic
X-Gm-Message-State: AOJu0YyuYa+xp+yNB3KHN8FfMSlS/l6pjYWwlYGDSjcET7EjbcwyjoN+
 RKXyOiT1WNkBiJB+WZ+O9y1KRQL7CKJqK8R1pBC6+YzrQgKryl1QMz5i/CkdwzSpJcZ1mON2pIP
 F8cLAmfqg8tI66WTgZsEdglhY7bWataRq
X-Google-Smtp-Source: AGHT+IG8khD7kHrlQyugsbhMWBnuFuDVCOxJQOex/p2ReFEaaCU4p3mrgWZ7YhHyY2gEHwGRCvmkpYaZc6ueaFxArZ0=
X-Received: by 2002:a6b:e013:0:b0:7c8:4f23:2299 with SMTP id
 z19-20020a6be013000000b007c84f232299mr821658iog.15.1709471838160; Sun, 03 Mar
 2024 05:17:18 -0800 (PST)
MIME-Version: 1.0
References: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
 <ZdIU8U1tFrsf0Yi2@toolbox>
 <CAOCN9rwCGJOhK2EkCDJOeahbt7j1R5fNpbd+55rjrKrtCbqjtA@mail.gmail.com>
 <Zd2jaaIxgSWMiZ6f@toolbox>
 <CAOCN9rz3nPyzGyyZVHAydFxaO0wDstMnDSZUttYs6D+c4VXk3w@mail.gmail.com>
 <6b86a32e36a815cd2394e05600d963262601f7c1.camel@samba.org>
 <CAOCN9ry_QhZ6ZvUMpx7mzLgjdLFBeX1-1=CmbCsBSDKadnRaYQ@mail.gmail.com>
 <ba174768cd7099d45ea9ea33842845be7d69cac9.camel@samba.org>
In-Reply-To: <ba174768cd7099d45ea9ea33842845be7d69cac9.camel@samba.org>
Date: Sun, 3 Mar 2024 08:17:06 -0500
Message-ID: <CAOCN9rzd7XSbQAUcBhkbVTtQQ+cecDJYO1rfp=t5oHyY-CmCQg@mail.gmail.com>
Subject: Re: Samba 4.20.0rc2 fails to support "--with-includelibs" or build
 Heimdall Kerberos
To: Andrew Bartlett <abartlet@samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: Alexander Bokovoy <ab@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

And in turn, I appreciate your folk's work. It compiles successfully
now, but doesn't package. Something about the heimdal activation is
causing problems with RPM debuginfo handling, much to my chagrin.

Is the patch for use of the MIT KDC near acceptance, so I can stop
using the Heimdal workaround?

Nico Kadel-Garcia

On Thu, Feb 29, 2024 at 3:41=E2=80=AFPM Andrew Bartlett <abartlet@samba.org=
> wrote:
>
> So glad to have helped, and very appreciative of your work.
>
> Andrew,
>
> On Thu, 2024-02-29 at 08:41 -0500, Nico Kadel-Garcia wrote:
>
> It's a *veru good* red herring! It helped show me where the dang shark
>
> was gobbling all the little fishies. Namely the latest samba.spec from
>
> the Fedora published SRPM for samba delete the heimdal directory, "to
>
> ensure the use of gnutls".
>
>
> Bad Red Hat! No biscuit!
>
>
> It's compiling successfully now. though it still requires tuning for
>
> slightly different files in the RPM. Thank you for the pointer..
>
>
>
> On Wed, Feb 28, 2024 at 10:10=E2=80=AFPM Andrew Bartlett <
>
> abartlet@samba.org
>
> > wrote:
>
>
> I think this is a red herring.  The files did move, but so did the heimda=
l_build directory that references them.
>
>
> Andrew,
>
> --
>
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead                https://catalyst.net.nz/services/samba
> Catalyst.Net Ltd
>
> Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group compa=
ny
>
> Samba Development and Support: https://catalyst.net.nz/services/samba
>
> Catalyst IT - Expert Open Source Solutions
>
>

