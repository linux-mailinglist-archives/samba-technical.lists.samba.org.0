Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BB63561C7
	for <lists+samba-technical@lfdr.de>; Wed,  7 Apr 2021 05:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9j0DCy8sJ733anRZLilr+NyewqL/6bujarkcjlcVY/E=; b=OaPaQS0tzsjCP4e5bkBT0KvXAF
	Unvmw9CFA8UwTr+Yp5yla3PggC+SvEdc0b/OZWN0T5MQ+wXVgV5ylZ/Qw1H+23B5c/kxlwLRhcGWE
	Xhaa1UvR0szvMyIUyEadWh0ASagbh68YDTwfuJIiF6yADItlLN6ci46pJh4qITkZ+kgx6Cnh0yyX6
	Hx0A5c+7fZeos/ZJ0kpduvHW4JCpbqgT5eQ4LvJ885rHbXAjt4cZPxjNH3ho40nYNATabLYDJe5h9
	OstbEcgqcrJWCIp+vaSeG08NbWJjBAew8QXzhtFAakCpihk3x+7d/7tTtxCXalIbj3M+O2u7pJnve
	a+i1gIpQ==;
Received: from ip6-localhost ([::1]:28844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lTycz-00AHeu-Jl; Wed, 07 Apr 2021 03:13:13 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37536) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lTycu-00AHen-5R
 for samba-technical@lists.samba.org; Wed, 07 Apr 2021 03:13:10 +0000
Received: by mail-ej1-x632.google.com with SMTP id w3so25197011ejc.4
 for <samba-technical@lists.samba.org>; Tue, 06 Apr 2021 20:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comae-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U2R7ad/hNIMZyEkCtY8+P24Ve1JMSTTaU3I/02o41qU=;
 b=Yjwe0xMyJ7VL2KvszGiXhiTkAy/8brIxQ5jW3Mwa0QqEC1VSR3nhBy4zgk6OFeR04N
 e/NNKwKKTAn1NIm5N4K7lhT7hgpvM68jPGPrq9V/qldS2ZaTisq6mAEd/x73e23XbU2d
 iinoG1Xi9DbFwO5bQ9Vs6979eStzNiweIka41+jvwxS6/4gEBC0JePug9pimK0ON0hF4
 nbWaiEl1wpYr4+Ks1zVqEpaGI3uJLDDQDP/bE1ZCSQFSp7Qj0zD/fe8BIZj0Cvem2b97
 U2cg/wYydCem3BCAdEDWwkoTD92qF2+zokr9IvHt91TrfITX20CdQoCr9+pnnY1+Ibpb
 ZLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2R7ad/hNIMZyEkCtY8+P24Ve1JMSTTaU3I/02o41qU=;
 b=OYBufZYQrZLfhRtxv78a8k6Ql1/Z9GqdS9iwVI9LnswKlt41TRr8baB6kx7T03NkqB
 Ai8NSfuKP5OPBkUwjs/o0quzkoVeckN2okFE3LkCR4KngIV5R66Sdc6bsSMlQ6B4a8ez
 PDLD8Ls4xJpYqD484uk+y2I5ti02zJ8mBO2Fi5ssxzdejReT4zyp/T5639ofuosF2ndO
 RXHZkW0dpXQuI5IiB0hetnkOgbuG8uY8IaKLsQvy5PZqTPqOvkxEHyIYls2M/mxJmfz2
 i2gyvZebypgkAqeOzDq1Z+De81h41wTXpRXmrqQQ9EkdFppGuKt+VPZK8yrIXVdyZFI4
 D/Fw==
X-Gm-Message-State: AOAM530R6mftCQwrRuWy6bZ8B6xzj9EsJEMqOwANa4Yn7xxR8KR/pBr2
 KPHO+RyP/+GLj14kj20nRvkwwRKD23MsfeGZVIPsH2sgT4b2h5ny
X-Google-Smtp-Source: ABdhPJzwcxeWN0veRsZu+70tuYjq4Vyo7mD0T189ku2/lmgoT040CphKUXeLTW1ttTMA8Ah05xGJw9HVUHRfOkPRO2M=
X-Received: by 2002:a17:906:2e14:: with SMTP id
 n20mr1295933eji.16.1617765186329; 
 Tue, 06 Apr 2021 20:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+NQ6=xa2itZO0oYTPp784jfHqg6uAVYhEGkCuLynhgkd6eKzQ@mail.gmail.com>
 <54514b4fbafd8eeab3a96af4f6a76fea92db988f.camel@samba.org>
In-Reply-To: <54514b4fbafd8eeab3a96af4f6a76fea92db988f.camel@samba.org>
Date: Wed, 7 Apr 2021 07:12:55 +0400
Message-ID: <CA+NQ6=yDt2gogU53gjtR+SDD2tRmd5JUvZD_iHtf1DNjMbg9Wg@mail.gmail.com>
Subject: Re: Improving LZXpress decompression/compression algorithms
To: Andrew Bartlett <abartlet@samba.org>
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
From: Matt Suiche via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Suiche <msuiche@comae.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

No worries at all, if there are more samples we could add for testing I'd
recommend we do so too.
--
*Re-watch OPCDE Livestream on YouTube! *More information:
https://www.opcde.com
--
*   Matt Suiche *
   Founder, Comae

*M:* msuiche@comae.com
*T: *+1 415-466-5067
@msuiche <https://www.twitter.com/msuiche>





On Wed, Apr 7, 2021 at 7:11 AM Andrew Bartlett <abartlet@samba.org> wrote:

> On Thu, 2021-04-01 at 12:13 +0400, Matt Suiche via samba-technical
> wrote:
> > First of all, thanks a lot to Douglas Bagnall for the assistance.
> >
> > While I was revisiting the LZXpress implementation, I discovered that
> > the 2
> > official documented cases from MS-XCA were not supported:
> >
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-xca/72da4f8d-2ba3-437d-b772-2e4173713a0b?redirectedfrom=MSDN
> >
> > The attached implementation includes bug fixes in the decompression
> > algorithm, a rewrite of the compression function and additional tests
> > as it
> > only had a single test.
>
> Thanks Matt for taking care of this, it is really appriciated having
> someone look back over this code, and adding tests in particular.
>
> Andrew Bartlett
>
> --
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
>
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
>
>
>
>
>
>
