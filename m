Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6A1AC4CB
	for <lists+samba-technical@lfdr.de>; Sat,  7 Sep 2019 07:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=R9cucSBhalXgk29DccZHZwkD0QprFgu3ZyhnkriZFlw=; b=OJB3yzrRwgkG0eZYhWonM/mCMP
	u6Zxzh12ehVxpG9Em3CmGMNrrTkS7T58U1UiYJkITd/jlRnatmQNwAJ7PPPTM1DJf1jByqsh+Zcgb
	GUjVzU/vxh+G4ya1fp4E7DH9jbT80fJIYW5JkVkvkEh4t0+3QhNIKq8LNBMBBUPgpTgfQ9g1k1rKl
	hu5a/R2VA1yXqC3AbKmJCjpR2bg6mjL5ubu0pEo738jgFQRDsDhAvYEtGrWCzK2Z2CIZw205FUT4u
	PqqoZHJIP9ijfExCvxh06cLRgAu30PnjEUa9+eQqxvaGbr1iZNzRjUl9dYorNL5CyQGKazyNd+mTY
	0Ryn8qbg==;
Received: from localhost ([::1]:44304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6TZo-0049VW-LR; Sat, 07 Sep 2019 05:48:00 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:35722) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6TZi-0049VP-C6
 for samba-technical@lists.samba.org; Sat, 07 Sep 2019 05:47:58 +0000
Received: by mail-oi1-x22d.google.com with SMTP id a127so6829609oii.2
 for <samba-technical@lists.samba.org>; Fri, 06 Sep 2019 22:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=R9cucSBhalXgk29DccZHZwkD0QprFgu3ZyhnkriZFlw=;
 b=EL9rzWhKNbo23399FjTDCAPllUHA08eO+z1HUjfpfxKrFy9LeDMH4SfyP+qM+jnaxn
 hxX9h6j5Yti+zTxqsTFAdFZp3X9kSgsIpaUZrrKlRZIgFkt8F0GvtXTpxCisNXe/F2fR
 JihNJ/eWBqcruFZ10gP3b+OhymByg1+jO8qDfxwl9i//j1HGmpN5lL7z7jwUafqqGKyk
 dTagl4SVou6XO8A5nd0B8RSSv/FKQC/r77u8UUmWsA3QcQr8WDNe9CmzLrJL87pue/E6
 9pno6xQ/+/jCaIBTjKG8WClbm3q0LOM9/aMowifTgZV3OxofRaBJxqCxjzcFA0TQG6OQ
 KxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=R9cucSBhalXgk29DccZHZwkD0QprFgu3ZyhnkriZFlw=;
 b=WbWQth82ktXElWGRtJgWxN4gUF1OghTmNO+hGPhqjU00QCSIMXs/pyGjFEJ0GqyfgB
 Cd297x6+BiXiAP6KdOOTFlGP9u3lpHP0OC0X9uRD38AxTOQR6re8Hq20NLZTYduk3uiV
 kCUpgzH+42bnQnN4q9TzLKMDQ51QUleZktYQVDBVPnVtsOkLG7eCQ8yupWzB5qse0bc/
 JdW1kAm2hRxTNgZhskxxZbKNr8Vq8Bv4t/65mpyB5LwVUbt+qbXk9VjKK1R991WbprSH
 ypurIHv0F++epIsKeXqKH/QzgxJJ8T3ilmrR5YzoiCaZeza88nwJKFzVdf/GtiIhqpQA
 B+Tw==
X-Gm-Message-State: APjAAAXuK6ZcDNLDSIcpq1Yp1lQVJKy/W9iLRhGGldrmcrcB52tD9Phx
 RasGOOKAup0nHLpVWO3rlc+t06dBSSNF7KofELc=
X-Google-Smtp-Source: APXvYqyf9Uc8ShVYIOe1MOUG7cUTkgsgK+z5CG2N2rxJnVmR5n6G5VmRAaSoqUmaGsO7RxercgHPKFUnb9rNb/Y/P6Y=
X-Received: by 2002:aca:2809:: with SMTP id 9mr9936111oix.163.1567835262629;
 Fri, 06 Sep 2019 22:47:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:1d4b:0:0:0:0:0 with HTTP;
 Fri, 6 Sep 2019 22:47:41 -0700 (PDT)
In-Reply-To: <20190907022637.GA313196@tigerII.localdomain>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com> <20190906161845.GA192819@jra4>
 <CAKYAXd-uR9RCQeVKsfREAvegP7J06nHDZ4nfeo1M+5KnkZ4VjQ@mail.gmail.com>
 <20190906230552.GA37629@jra4>
 <67731bdad1bd3dda0d25a9ba1a8aebe8f7d17d92.camel@samba.org>
 <CAKYAXd_VO+9=aNm2Fii-_AVuFR9uDSHz+3nN2uKPCJ9BcO1Q7g@mail.gmail.com>
 <20190907021115.GA305442@tigerII.localdomain>
 <20190907022637.GA313196@tigerII.localdomain>
Date: Sat, 7 Sep 2019 14:47:41 +0900
Message-ID: <CAKYAXd_J_4ZcB3mTRKAK9U7oTUWnZfDK72zTgD0k0jMYe4UcSA@mail.gmail.com>
Subject: Re: samba performance difference between old and the latest ?
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@gmail.com>
Cc: Namjae Jeon <namjae.jeon@samsung.com>, samba-technical@lists.samba.org,
 Jeremy Allison <jra@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2019-09-07 11:26 GMT+09:00, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>:
> On (09/07/19 11:11), Sergey Senozhatsky wrote:
>> On (09/07/19 09:57), Namjae Jeon wrote:
>> > >> > Yes, I compared two versions in the same test environment.
>> > >>
>> > >> Just checking :-). In that case doing a cachegrind run
>> > >> on each of the two different versions might show where
>> > >> the issue is.
>> > >
>> > > Perhaps it negotiated different protocol versions or encryption
>> > > settings?
>> > Both are mounted with smb3.11, and no encryption setting.
>> > I checked smb packets using tcpdump...
>>
>> gcc -O0 vs. gcc -O2?
>
> I mean development and release versions probably use different
> compilation flags.
Ah, No, it's not samba released by some linux distribution. I downloaded
and directly build it from the samba.org site.
>
> 	-ss
>

