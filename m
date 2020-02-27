Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E30FF172621
	for <lists+samba-technical@lfdr.de>; Thu, 27 Feb 2020 19:11:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jBWoSQ/gizrCoImYhvby+QXQDcxaU7lapB30jtE5cBM=; b=P97gAcEgWBBy354hx2PHpPcYLl
	fl0p9C/8j+xQl4F+r/XrjXqOzvXmLzhShcCE2+GSG+zzU6s4OTVBQITTU2lbkUTImo2EuX7nIacx1
	JcVNjs9EdSNv4Knrej/32xVCjm9xARwtPa5BL0bw2bgfx28j5BbeZiD2YJB45xaqydOfAWmT4sb+X
	J07ERAb0fsjOJFV3/0qP3PtuxlOF8B9LBhVXpzvFei6beTeddqO4HtA+kbVkur/eT0VLBmg9kdxWI
	Ny7ho+/LVMWvPJLvm8ORuwPo3G8UqmPUkPsFPoASUSKohhfO0LCa9Rsn1YViPTNgswUWszFTkgygR
	msCGC4xw==;
Received: from localhost ([::1]:52788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j7NcD-00C8CZ-4x; Thu, 27 Feb 2020 18:10:29 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:43507) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j7Nc5-00C8CS-Qt
 for samba-technical@lists.samba.org; Thu, 27 Feb 2020 18:10:25 +0000
Received: by mail-lj1-x236.google.com with SMTP id e3so226198lja.10
 for <samba-technical@lists.samba.org>; Thu, 27 Feb 2020 10:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jBWoSQ/gizrCoImYhvby+QXQDcxaU7lapB30jtE5cBM=;
 b=jjNBZvNazpApl8lXU7Wo7rkiKPnYrQi8jkKuvsw50AfPSuj7LNHWnD+wmniwxSGFqr
 1HBQijX4pqypQqPTWmvsNbLiK2B5CFmA+PvTRgIzba5M1Dx1qtVdf6r4B5B9KVEiOymr
 lZesLnrZUh5LeJl3zMEzxSZJzbNaNpHgQuyef9S21NELBiphvaDeNFwbSxVqMs5z+RUc
 UEfQIeAGiTCVnDkJT5vLbP59dM/lGX2h5k2DsG6aVf5Ka+MTOkdlscuSsnqqQkaCiBn+
 zUSPDRGa68djALo2JYqZoGwdI9T3Ss0M6RHfqAjE4IRBnClnhNgD3dQlc6LXYYWelKzj
 Ai+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jBWoSQ/gizrCoImYhvby+QXQDcxaU7lapB30jtE5cBM=;
 b=eI+3DH0aczVDB4d/VjS+r/ah8rLC2td2SJtHPFvVPH2APg/yf08gudTF2uhxngF2nY
 y2v8P5Ia9azczKIi5qpZ3Ze6ESvcqyZvRJ4d9EwRMnoaNbxSpAHglRV0eldL9lJmvRkr
 pEB/DYuuBeUuaDZZT0EDVlEa5U/1FtA162mD44B2oN+baChHsSbXWKiq9v9V3u4rpoDN
 jWE6yfKh3p/X7qN2W1tdBPGHNNmb0Ipo8E0Dgil6qb3SFLggQz2TnFAlQJI5L153LU1V
 386iBWklnxSbLtaJMnxZly6fsXVaJNZeR035xDqre3kGvfZdtECB7n/fHoSDuUTqQW2f
 0OKw==
X-Gm-Message-State: ANhLgQ0fXozvkKr8lvnqhr7+gg48b8jk6Xt9eccXjo7tiD36/XuhTY0L
 FkJpiyF7REDIScqy1PTbl0tRlSsONf3UYWeMG50=
X-Google-Smtp-Source: ADFU+vsPN388Q9HR0jHs1iHty8ypDSqtmCWKtZCqnJ4aJ3FndNb8jZnrmwC5fwIezMngMWOe+z5ntD3uClCU41mAiJ8=
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr207401ljc.158.1582827020823; 
 Thu, 27 Feb 2020 10:10:20 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
 <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>
 <374481b4-af4c-7b0b-cb80-feec96046b53@samba.org>
 <CAC-fF8RVr4qA1HSthHiRn1eaWWxwN=ke8EtfZPMbQmK+Wf+ajQ@mail.gmail.com>
 <CAC-fF8Quxxrx+gaqBMtzaB2zdppJNWUG7OQ70BM_qP4k-b2aMQ@mail.gmail.com>
 <CAC-fF8TonKJ4JTPfxdTueW-pdqqEMAHH0qFkxfy1SLBm2Eme_w@mail.gmail.com>
 <CAC-fF8RxPDyQeVQTfskQdgXMqSfFbBW=cTCWCQy=cKyvh_3GbA@mail.gmail.com>
In-Reply-To: <CAC-fF8RxPDyQeVQTfskQdgXMqSfFbBW=cTCWCQy=cKyvh_3GbA@mail.gmail.com>
Date: Thu, 27 Feb 2020 19:10:09 +0100
Message-ID: <CAC-fF8TmWRW2BUmemqGPm3nDa=0gG7XHxJ1siPZ8VY+CRCeRZA@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Stefan Metzmacher <metze@samba.org>
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
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 26, 2020 at 11:55 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> So in the start-tls case, the input_chan_bindings provided by the ldap
> server seem not right.

Pushed an ugly fix, it now works ok in start-tls as well:
https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-metze-cbind

