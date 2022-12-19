Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD4C650735
	for <lists+samba-technical@lfdr.de>; Mon, 19 Dec 2022 05:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zOWdjwhBVj+xWiqKA6a4DktTuB76fDPziOrtO5t6cZA=; b=BVYGh5fm06QFY1aFGYRTLSZ3Yr
	LGMK4+g+EQrqZyP2x2g4b2/piP5/qPP9J5Apsd1BjI6PLznIcOOdUzHsGlKMTTHgN8irPmRzKiaxk
	XX5nkfYrwhGrNVL4TlgcWh1hve2bG4tCSnQRqJa6YavXRqQoehItk5UQ+fyIDPbinNTYRHp8w5uSO
	WSYTdVC15i02mrL3F1MOMp6yro5yYCKYs4TG0+OjsH66GjKlssxiXRE6IIxW98OToWift13oM1rZl
	yi0fmNx+W2/h0cX49CrqKHK9nrHY92B13W1OCpPE7fzZ8q/ywPH2eFZKp/R++oSDqVBU55aOUhuGQ
	3/lO29Cw==;
Received: from ip6-localhost ([::1]:25092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p77va-00A922-R4; Mon, 19 Dec 2022 04:39:02 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40598) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p77vT-00A91t-I5
 for samba-technical@lists.samba.org; Mon, 19 Dec 2022 04:39:00 +0000
Received: by mail-pf1-x42d.google.com with SMTP id k79so5394777pfd.7
 for <samba-technical@lists.samba.org>; Sun, 18 Dec 2022 20:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e+Ul2Q9fr7Kcb2S462GagUDHmPv3e8LHEIRxKGFu7zs=;
 b=LxihM1Yp8xf79PwmKuHZIOLLC41sSrBhzHCfXD60QH7LDGYenWErTV10ogobmHUr4G
 N0YTYA3nNqFY+bRHemhdGZE41CkDXjR3tiVfmbZyGjnTLhc2xd1y0QmX/Q1AtDciUSak
 oEEg25S4KXmQnw9t0VVUwFWcQLJpKVhupYNZdjiAHXVg2Y6APofKYOfKhirfWzckpgkk
 HRgRu7PlxplLZ8Y/vvnXBNzV+DVXwqYIWzZh/a00oZMsMLp7vB6GFmRRaiy6BP60t0PH
 U/JaQIxXl02Q0JXNKc9okTg3eiuigDAnUpE6f5v8ucDAuhdTd3om6IXdJqi1lBIw9Gpv
 Pu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e+Ul2Q9fr7Kcb2S462GagUDHmPv3e8LHEIRxKGFu7zs=;
 b=nGCSDVZYCbN6Ah9NqZjKr3FvYMcoZKuqA0sZxLhKctE1b0nbEGgHjVcpoPXHccDC2W
 uiJcNcwowelEac+WgjAH4pLyX4/FuZ0TLyAOR18cYxt9LUndPP8ye+QC8oE4+Pg14FbM
 86gVx6iXxHL62HIRPlnwLIlP0lUPb+GJcb1ez3FBhOt85fuRqNENkLuGRv5lFf68yopE
 0KttsSvoh4Ut5XE2nF9K3lEHfylZ9idKwd4NnFFaRYZHYltVd58JdD0VphQZga5wTE+N
 s708T2mmoO2CvhBuzAw5ruzXoRmxj4wD+LC+/JsEaM7wRWhuLBR5YAGYB1S15bz8d1Zy
 bxiw==
X-Gm-Message-State: ANoB5pkSfvoBkn+m9L0I6itv1U0G4JXbU+CKxeIBv4Yysjv6UAORKA0T
 Hwq5/XBMeLCK1q8khdLcCzOqGMvMVZkDnaRflygfzQ==
X-Google-Smtp-Source: AA0mqf6epG2IZoJ1LrgKCWM1mpxVimmYAryJCKxV36OTC/mbGtb03f/oeQWmH+4p/AmLxibFcEiY8NK9uuPLzBGPXKs=
X-Received: by 2002:aa7:848c:0:b0:576:ebcd:5e06 with SMTP id
 u12-20020aa7848c000000b00576ebcd5e06mr20699473pfn.6.1671424724227; Sun, 18
 Dec 2022 20:38:44 -0800 (PST)
MIME-Version: 1.0
References: <D3FFCE09-CD20-485D-9925-6EB995A8B6E5@karpukhin.com>
In-Reply-To: <D3FFCE09-CD20-485D-9925-6EB995A8B6E5@karpukhin.com>
Date: Sun, 18 Dec 2022 23:38:33 -0500
Message-ID: <CAB5c7xqJ1DaJhCTVQn8H1RWGW_xi8kp=vZhciTAEVkHKyk1MJA@mail.gmail.com>
Subject: Re: "access based share enum" is broken since 4.16.0
To: Vyacheslav Karpukhin <vyacheslav@karpukhin.com>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Dec 18, 2022 at 10:40 PM Vyacheslav Karpukhin via samba-technical <
samba-technical@lists.samba.org> wrote:

> Hi,
>
> It looks like the access-based share listing is broken in the recent
> versions: "smbclient -L" shows no shares if this option is used. Bisecting
> points at a7c65958a15149918415b7456d6f20ee8c9669d2. I rolled back to 4.15
> for now.
>
> Regards,
> Vyacheslav
>

FWIW, I have MR with fix here:
https://gitlab.com/samba-team/devel/samba/-/commits/anodos325-fix-access-based-share-enum
