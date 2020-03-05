Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D15179FD9
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 07:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YofGJwFrLrY2gJiH2YaegEN5Mu4rJFyBFcM/HTNfHy8=; b=Tfg0A6Sr4dquah6fNqMUlriHAy
	/D3fjyf7xNWy8YnCSQCWJ6EDXTBtzfv78lkafsgkvMx9ga9WZP55J1dRwV3LVaDOuUruJeGrnph4m
	Pvu6iasDoYYnYVlM8Isu4eNfqvdmmHXlQuU7YmOoAuVtlTYGizYGwV+n4NFba1ryhBBbQMVNEgx4d
	ozeYQupVVAPZM9YX4YRq+S3r/MP+lR9/tMJwyVierocZebkgJBJNb986IZjsxc8xiwrWbLvS+pAoE
	kyd7kF06z5E+bebg2a/Eq1lnFxuHn1LxryoGA0PcLyZsrTS1k/Kid7pY/J/bn7ZpjGZ7/X33suFnV
	KvvxCSCA==;
Received: from localhost ([::1]:19456 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9jmZ-00F0Gw-Cs; Thu, 05 Mar 2020 06:14:55 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:46307) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9jmV-00F0Gp-35
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 06:14:53 +0000
Received: by mail-io1-xd41.google.com with SMTP id f3so2512153ioc.13
 for <samba-technical@lists.samba.org>; Wed, 04 Mar 2020 22:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YofGJwFrLrY2gJiH2YaegEN5Mu4rJFyBFcM/HTNfHy8=;
 b=lMNHED7FNS0887Lfgg+0QMw0K47ZK05YmCrzH0TGXv1BuSy4NEzXKRyL19XcRunhng
 wMgYCbSVdHW22HjbmEDPtFgIWWuRJvmzwlOzZL1WbP5ZMezIXkPA7hp3uDYTvHBhiiTk
 n5anaCCZSk0PCUG3YxAXomrhQQJu5Xifpu9k7bog4qQu1+VCDdDARHGEO3N2XQ17h0Kf
 GEMBOG4zOVw9PsFV6HZxtdZ+XrEkehbrSRUQsE53Y21+KMCatSyBwLZWg/n6G8wwNblO
 axQBA6kOPnQouPiyYa0nhFS62hFJhoYw2smr0hnZI1iWWi0/FX71lAabXnQkunfPI/9l
 QHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YofGJwFrLrY2gJiH2YaegEN5Mu4rJFyBFcM/HTNfHy8=;
 b=gNoOkthx4zdlI/wHqNYDaNdch18Hnj7PDYBHKhmA/oX+RlPHvqya/CukymvSJu9i+w
 YjC22vZB3fYtaBv8PHrjiwKoOW7d+mXESL2mF3pLos21diFcWcNaXmzDKRZR9+x8hTsW
 SZ8MQ6r0wNvx7Ddl9FbNxVv+krsqDW7dzcaDymLbzJtTm4dw9qoC0vyxE8lTJwgc/3RT
 vlpNmX7ck9Qn+8qs6iKarMSt51CGGUCVsqRznvyMTRgzE02gYX48HMxLTAAJdR7n/Egw
 PgRplJOgU+jXPOZMuY55fG4Q5uVuic4aBUc7dwlqdSHd/KHqf6Gj+mO4bQCCZ5p1OW30
 vLuQ==
X-Gm-Message-State: ANhLgQ2tvQ+IzYyS1dYsDX41kghfm04IPgniLCWf9sVbLPthPgL9l001
 wClB7ETzRklPztr3HXdepK5QbvM497w+usxpJ8I=
X-Google-Smtp-Source: ADFU+vtC9PIMu3SX4jJ4b95JF5ZsuJPzclJ56YJFeRfKT/dnBj4lofWg8WfbxcUO2QF15HXNFqjF8hJcWQOjR0pTubU=
X-Received: by 2002:a5e:d512:: with SMTP id e18mr4963545iom.209.1583388889112; 
 Wed, 04 Mar 2020 22:14:49 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5msKRKFdpg16DE-HvEGDDMZQOw2=nhL3xbBJoYEvyzHwnQ@mail.gmail.com>
In-Reply-To: <CAH2r5msKRKFdpg16DE-HvEGDDMZQOw2=nhL3xbBJoYEvyzHwnQ@mail.gmail.com>
Date: Thu, 5 Mar 2020 16:14:37 +1000
Message-ID: <CAN05THQq5mfBue=d0_kK2PqtdedYFVx3gLaYRLgq+1FFGOWDKQ@mail.gmail.com>
Subject: Re: [CIFS][PATCH] Make warning when using default version (default
 mount) less noisy
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Acked-by me


On Thu, Mar 5, 2020 at 4:03 PM Steve French <smfrench@gmail.com> wrote:
>
>     The warning we print on mount about how to use less secure dialects
>     (when the user does not specify a version on mount) is useful
>     but is noisy to print on every default mount, and can be changed
>     to a warn_once.  Slightly updated the warning text as well to note
>     SMB3.1.1 which has been the default which is typically negotiated
>     (for a few years now) by most servers.
>
>           "No dialect specified on mount. Default has changed to a more
>            secure dialect, SMB2.1 or later (e.g. SMB3.1.1), from CIFS
>            (SMB1). To use the less secure SMB1 dialect to access old
>            servers which do not support SMB3.1.1 (or even SMB3 or SMB2.1)
>            specify vers=1.0 on mount."
>
>
> --
> Thanks,
>
> Steve

