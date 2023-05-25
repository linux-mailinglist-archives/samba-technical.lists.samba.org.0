Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B729E710A69
	for <lists+samba-technical@lfdr.de>; Thu, 25 May 2023 12:57:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=k6Pgg5MYTu3woPKV5DNXP1ipgLfX0qRf9L756ApFYd0=; b=ylLILDeGy4jpO92pixHMVVX5KN
	RfKsaUbqKzffQzwsp+eyVTAMMTg1Oad61/0DynVWK/rRLO2yjbuNYJ/CMp75iJAmz2tKU0gn4FtTn
	1YPYgXYV8VkJ8udakl6xmym288+PbIJixrljIxmWwgUgeKpCJujnZdK7sbrpMErl1MBLCn2n71Dvh
	5gmu628z/izMpdZF5bqkTYI5MUSFowWAaJd9k6zXVTT8yPOxmRkpcdQiRChO7vm8dcZ/ltSQcdRnN
	m2KN5MQcth8Vzotq/Bstc5JbTRsBGslG4/CZKPiBJK7alAjMPlhvW0L4Gy/d2R4xHnOCKsa+InbjK
	rQrMTMRw==;
Received: from ip6-localhost ([::1]:39022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q28f2-00C95w-9z; Thu, 25 May 2023 10:57:36 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:53647) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q28ey-00C95n-0d
 for samba-technical@lists.samba.org; Thu, 25 May 2023 10:57:34 +0000
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-514454733b8so603868a12.3
 for <samba-technical@lists.samba.org>; Thu, 25 May 2023 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685012250; x=1687604250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k6Pgg5MYTu3woPKV5DNXP1ipgLfX0qRf9L756ApFYd0=;
 b=kfoObmMZ6EzsuOH7B/fdbjB4O86L71DUQZAiD5s/4uQllBTlqc9EPooLBcUYXkgPSt
 XcTdVs8jJPeh2T85vHarF+AwgIKp6+pbU6j1q1GWMH+GGNUDHWf5hyMaJCz7AJNvtNkP
 d70Ssle1lL1zTAOVAZHtwx19yYfUbKmcVBIKhzlReQawiLQboEl1P2fYJF7QoviEaQwY
 H5RFA1Pmn3hKAIqupSpaW5v7mluWWlZMeuWc1DBDQTqp4g+c3SZEjr3zf2S4WFqbsCoX
 L7A8yrAoeH3oqPR+kUlRZ8APvGQx2fwXRJrYD0Gb2Znr84FZeG6+4NWGY0/lfzbZ0gGv
 ShXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685012250; x=1687604250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k6Pgg5MYTu3woPKV5DNXP1ipgLfX0qRf9L756ApFYd0=;
 b=KSM6pRJuLeYtAWUgOt7HMymNdz1MdhRma7lTYi7800r7LHQUzC/s+S5i/Dcb1qaAIR
 PmyTbU26CM8v2UxPJqxQLR545xcQx8u9t6qwGcqg/S/LIRg/3FXjadVP97G+ospSjrSp
 gXzSy7H65Kbez/Goi9Dh7zlkxWsn1MQLfnZppE9p6wLIx7QuCCbLvSUFB5ekTeykkM/U
 QMKjd6YQhOsGsjDErel788AwNaffHWyI9CXbETitf4IyEZ0U8PCKoSKvJXM8+wVrVlgH
 6L8S4umz3m4JihZfPzop6KEXPpdHOH1d1oLTOo4UNCT36ibfhcxOX2Oe1HCbt5vilDUq
 xdiw==
X-Gm-Message-State: AC+VfDw7p3YJpH4hFMq37R28vQpVZNOYZwHytI4/4zxb3r8HzZZr331t
 XiF2DM6Yqgzvi/LlyC69+7ChdWAC41P1OifPejk=
X-Google-Smtp-Source: ACHHUZ4hWK7KF+x9ZbDG4tjBWYnpf2EraJ4WkN0KGTXqqMxpzsfg/aylHZUH6TALXInZHIIK4kXF9eT2fcPIFxD7DO0=
X-Received: by 2002:a17:907:2dab:b0:96f:a0ee:114b with SMTP id
 gt43-20020a1709072dab00b0096fa0ee114bmr1145128ejc.21.1685012250235; Thu, 25
 May 2023 03:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
 <ZGzo+KVlSTNk/B0r@jeremy-rocky-laptop>
 <CAN05THQyraiyQ9tV=iAbDiirWzPxqPq9rY4WsrnqavguJCEjgg@mail.gmail.com>
 <ZG0/YyAqqf0NqUuO@jeremy-rocky-laptop>
In-Reply-To: <ZG0/YyAqqf0NqUuO@jeremy-rocky-laptop>
Date: Thu, 25 May 2023 20:57:18 +1000
Message-ID: <CAN05THSWHq-3bJ5+tzZ==j9uGFGfbALw0FoLVa9UyucaZ92bGQ@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Jeremy Allison <jra@samba.org>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 24 May 2023 at 08:34, Jeremy Allison <jra@samba.org> wrote:
>
> On Wed, May 24, 2023 at 07:44:36AM +1000, ronnie sahlberg wrote:
> >On Wed, 24 May 2023 at 02:25, Jeremy Allison <jra@samba.org> wrote:
> >>
> >> On Tue, May 23, 2023 at 10:59:27AM +1000, ronnie sahlberg wrote:
> >>
> >> >There are really nice use-cases for ADS where one can store additional
> >> >metadata within the "file" itself.
> >>
> >> "Nice" for virus writers, yeah. A complete swamp for everyone
> >> else :-).
> >
> >Viruses? I don't think they use ADS much since most tools under
> >windows understand ADS.
>
> https://insights.sei.cmu.edu/blog/using-alternate-data-streams-in-the-collection-and-exfiltration-of-data/
>
> "Malware that takes advantage of ADSs is not new. MITRE lists over a
> dozen named malware examples that use ADSs to hide artifacts and evade
> detection. Attack tools, such as Astaroth, Bitpaymer, and PowerDuke,
> have been extensively detailed by various parties, providing insight
> into how these threats take advantage of ADS evasion on a host system.
> Authors, such as Berghel and Brajkovska, downplay the risks of ADSs. Our
> opinion, however, is that ADSs introduced the host of concealment and
> obfuscation techniques outlined above, but little has been done to
> mitigate these worries since their publication in 2004."
>
> As I also recall the published US "hacking toolset" also used
> an ADS on the root directory of a share to exfiltrate data
> from the target.
>
> ADS - "Just Say No !"

I think that is a flawed argument.
It only really means that the virus scanners are broken. So we tell
the virus scanner folks to fix their software.
Viruses hide inside all sort of files and metadata.
There are viruses that hide inside JPEG files too and some of them
even gain privilege escalations through carefully corrupted JPEG
files.
We fix the bugs in the parser, we don't "drop support for JPEG files".

ronnie s

>
> :-).

