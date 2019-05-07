Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC37158A1
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2019 06:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BufnoJNMJogpA6y/VRJBsAFVwDfizeLmZ7LIwKXtyYc=; b=fULKV6g10i3q5mRnBwZaem+Rvu
	TQhsNUjDGr0lHwKdNh/CklX8tB6cBLhoM4e5ZG65pJdrdJrOP2uvsk0ubaipsfBNr/d26pRzCUi5D
	Gm8Be5ORjfGV98yH5Jg8GuiRwyHizh6UHoNDTu6ccQ2gs/dfMawjZTwQhzzui9MsXBVC/q3MH3n7W
	IvS6mpA0qE5q6o5cBLcYhcZWa831k8m4iefAju6DraYatCzDVz2N3B3HlKahTDbiSRaBC6G1iEZnI
	bJAJX3ZZEDJqPjlVHW7uXScBPsuPCbDvMExTIJQFb4mAsdRRvTmVDr112nviXB4tjvrK9JY9lWVGd
	FheJB+MA==;
Received: from localhost ([::1]:46578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNs3H-002pJU-Kd; Tue, 07 May 2019 04:50:03 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33556) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNs3C-002pJN-7I
 for samba-technical@lists.samba.org; Tue, 07 May 2019 04:50:00 +0000
Received: by mail-ot1-x341.google.com with SMTP id 66so4245803otq.0
 for <samba-technical@lists.samba.org>; Mon, 06 May 2019 21:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BufnoJNMJogpA6y/VRJBsAFVwDfizeLmZ7LIwKXtyYc=;
 b=oleo+uiKJBsm29PP/kzoWUTzUJdVt6Q9I5+7TNcVozzczu+I2rbsm3ge9jeLVVaPb6
 Mli4wK561FgSpHMzHAbkdvgYkus/DkUOsyaf/JWnsypmwuULhAlLe7RiL/7yHgiDvG++
 pH9/onftXoOaKtsOz8xKN0wRXqQAqPg0KUl4LWFlHtMsSg+WHQXfCx6VdZhtWaBBz8Hr
 Z5wzmZj2CItzYlUQY1H98lSkfa7wWsNyniR1MhRv4NLkWujCN9ZUe30P9+QHm0mCx39I
 jxOuIECixr/PMEp/msiLeRe863ONV9e0D0eE/q/OXYmM8ZYabsRTIHC/vIXhCwILpzOB
 69Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BufnoJNMJogpA6y/VRJBsAFVwDfizeLmZ7LIwKXtyYc=;
 b=TCXQBXhwJ8NCkZagLhGXSnsYvWlWOdpq4/a9AA4xcoO4f/oXAIJXO2va7mZCkdMYaK
 42nBCigvuqOF3sOP6eS/BsPHBC8FtkX9BOIdyURB85jY/PcmN6g2usRRZ2RFL2G/wwDm
 /3odZQCqXJn7wJ3W9Vqi3Jjn3chpcE1fGVbisTtFVeRjB7SSe+bVNZ1yy95apCn7tvrE
 XM7KBNBG2vPYUmgjm5dB/kfhinNefPoDeuhC70GdTM1Ji6Qeucf2vFzw/Qt2tW3zTscl
 RmvKtKG3KCvDAg4eFjj2Cw0syr/UX46e5oHHI2unj2KMnfY/6/xTR2HGGS/ag2QkO1IN
 27XQ==
X-Gm-Message-State: APjAAAX9dzx9/Zgyy+PoUPjXBHRray7Gs1zBEq0y0Uyyenjv5QYUPWfA
 uR49B1MK+rms1Rn6ZxpMOkKffNJ7VOYzYN5TY4U=
X-Google-Smtp-Source: APXvYqy8ZC2C1grHzRV0Iz0baQ9ey3B1Q000UwiCCEkVjBXPI4HFNuk6XcW0mdGaqO25vyN0mXBAu1WJ7U/5IEQpkKY=
X-Received: by 2002:a9d:6748:: with SMTP id w8mr20767330otm.198.1557204596021; 
 Mon, 06 May 2019 21:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190502204231.60f35912@martins.ozlabs.org>
 <8D5F8F0CF9684655A019A5D8B63F3AD0@rotterdam.bazuin.nl>
 <20190503111940.0043767e@martins.ozlabs.org>
In-Reply-To: <20190503111940.0043767e@martins.ozlabs.org>
Date: Tue, 7 May 2019 14:49:44 +1000
Message-ID: <CAJ+X7mQkPZosagZvY0NijgVDL4m=5hRZNfeekXjup-3spLmu_A@mail.gmail.com>
Subject: Re: [PATCH] ctdb-scripts: Drop script configuration variable
 CTDB_MONITOR_SWAP_USAGE
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>, belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 3, 2019 at 11:21 AM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Louis,
>
> On Thu, 2 May 2019 14:47:05 +0200, "L. van Belle via samba-technical"
> <samba-technical@lists.samba.org> wrote:
>
> > > Monitoring of swap is based on the idea that swap
> > > space stacks on top of main memory, so that when a system starts
> > > filling swap space then this is supposed to be a good sign that
> > > the system is running out of memory.
> >
> > Not completely right in my option.
> > Swap can be full while your ram is not.
>
> Right.  That means my commit message is no good because that is why
> we're going to remove this configuration variable and no longer
> separately monitor swap.  :-)
>
> New patch attached with updated commit message.
>
> > Maybe its good to check swappiness also, most distro's have default
> > swappiness set to 60.
> > The parameter value set to 60 means that "your kernel will swap when RAM
> > reaches 40% capacity."
> > 40% ! All other is used for caching and/or services.
> >
> > [...]
>
> This was something I was planning to look into and you've given me an
> excellent explanation.  Thanks!
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

