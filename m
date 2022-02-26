Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAEA4C566F
	for <lists+samba-technical@lfdr.de>; Sat, 26 Feb 2022 14:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9/LCC3EoMAN5DWykB5U5qACDXj3wL7fTfBmLP0xeOH4=; b=xD+g9RSn7KEOBIDyKK5JgV/lgX
	SUnFZ6Cozgrzv2hAJ9+xdlSP7tN3MNDibOXGiaHo5DNAs8hnSqFLfcVxxOUJL4bhHKq+PUkVcfImX
	wwum2gkpA4sRI0a7XiWYmJul5K/5jfpOS7ipvKqSN79mZ7tQhh8QrnK4PdioZ+gaP3hqmy3JOlD9K
	gZImn/YF9C+FDUQxRcn3BxM94DD813D1L27L7y3ZY6RzwP+EFkgHCyr78ZW/HGG6egW0tPfNIiNhb
	cHNQNmb9zuaMvWreTPJVFbOkvHZ+D6P+3vdJC3SJM+zoMIPdcaHabdLuYnZBJJVTqbeDdeWThwm1y
	4yPj7dMg==;
Received: from ip6-localhost ([::1]:32706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nNxYd-00CC4T-7R; Sat, 26 Feb 2022 13:56:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:39774) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nNxYY-00CC4K-BI
 for samba-technical@lists.samba.org; Sat, 26 Feb 2022 13:56:20 +0000
Received: by mail-lj1-x22f.google.com with SMTP id bn33so11142074ljb.6
 for <samba-technical@lists.samba.org>; Sat, 26 Feb 2022 05:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w6hbvtK/381byrzAsWeJVyIIIL888w9IJeVifJvVTY4=;
 b=KYK+PlITusd8SWTzBWPD4csp95CwQ2Urcst6JYhvaiXdIVJykOe62msWRzWbLzSvRs
 cQYXSG8GaAo71srCvM+qDoBrKpLGgm0/AFaofCV5ZB+2CGUW4ngY4knXQhqUkvPIDSL2
 fue5YskJu+yjuJe4vSJWXzUQGaotWcriRFYk9U19AM1SJtmjOhahUz6E9bKPyqu4Jrvq
 zouHwKirwTfBwr91z3nVEJoTrCulVwxm7Jh61Q1OTRFD4ZXlUoD17l9RS5lmo/dHUGK7
 9TAtWr7zP6rqNKL1H7ZTHV1t/xIPakwdGFXxpvDIhhIIn0Bx0Fw5dzopnxUCd0Nz+tCM
 WgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w6hbvtK/381byrzAsWeJVyIIIL888w9IJeVifJvVTY4=;
 b=0MpOct3upHcQA5ssqL0VqbJnkpxl8AxwFHa5nhtFj2Is8qoi1td1gI581faSLWurg8
 WPBYZiOzldzwqEzAbse1+Wiq7vfcbaU/sHNOOA1rdmTzhENvUitc5SJLsTYe7Z2YKC7U
 QwgNr3B5+haq1b4FEhY6wP/vD6vMisEaYeiPl6N8h56vIrvlB0QH2VPo5mNw9zvu8+ac
 vr7ZurcVGxW2TnavY0jak2SahQCXHc9JdBPWEo2h23lLiw+mHd0qqqAUh4yldE64zyLv
 Ie6/UkUBusonBZptxBEM7X7c6RuVRfLdVFF5ZTpYQdD4QoJqWBFZ1Z0IrByAOv4724A4
 t5yg==
X-Gm-Message-State: AOAM532UO2BrEwvKUXQ54OZNcQSfIr3XY0seNjEfl+fe2ukGinijvoW8
 t+yLOdqB/CmHoicwmd1Xswjbfwhs5eDYWuIANbZbK/fQ
X-Google-Smtp-Source: ABdhPJzpktz9e3J09h/oXUdEjS2nYvWdOTaKklFo3pr0Yv3GKhgFpsoAizT/JzOBUbEH/N094VhfLiRIlR/n2L8IGRA=
X-Received: by 2002:a2e:908f:0:b0:246:3e31:a80e with SMTP id
 l15-20020a2e908f000000b002463e31a80emr8528638ljg.23.1645883776809; Sat, 26
 Feb 2022 05:56:16 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mt9OfU+8PoKsmv_7aszhbw-dOuDCL6BOxb_2yRwc4HHCw@mail.gmail.com>
 <Yhf+FemcQQToB5x+@redhat.com>
 <CAH2r5mt6Sh7qorfCHWnZzc6LUDd-s_NzGB=sa-UDM2-ivzpmAQ@mail.gmail.com>
 <YhjYSMIE2NBZ/dGr@redhat.com> <YhjeX0HvXbED65IM@casper.infradead.org>
 <CAH2r5mt9EtTEJCKsHkvRctfhMv7LnT6XT_JEvAb7ji6-oYnTPg@mail.gmail.com>
 <YhkFZE8wUWhycwX2@redhat.com>
 <CAH2r5msPz1JZK4OWX_=+2HTzKTZE07ACxbEv3xM-1T0HTnVWMw@mail.gmail.com>
 <CAOQ4uxi+VJG56TPvcpOqoVAGgbb8gZQJEfvhXyGyB5VboRE2wA@mail.gmail.com>
In-Reply-To: <CAOQ4uxi+VJG56TPvcpOqoVAGgbb8gZQJEfvhXyGyB5VboRE2wA@mail.gmail.com>
Date: Sat, 26 Feb 2022 08:56:05 -0500
Message-ID: <CAH2r5msFj-csymszRvJHP5ngGnj_8jt6c-e6a1GR1J06B8Zx8A@mail.gmail.com>
Subject: Re: [Lsf-pc] [LSF/MM/BPF TOPIC] Enabling change notification for
 network and cluster fs
To: Amir Goldstein <amir73il@gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ioannis Angelakopoulos <jaggel@bu.edu>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc <lsf-pc@lists.linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It is common to have read leases on directories but they should not be a
problem with notify

On Sat, Feb 26, 2022, 05:22 Amir Goldstein <amir73il@gmail.com> wrote:

> On Fri, Feb 25, 2022 at 8:11 PM Steve French <smfrench@gmail.com> wrote:
> >
> > > IOW, in general disable all local events and let filesystems decide
> which
> > local events to generate? And locally cached write is one such example?
> >
> > The fs doesn't see cached writes so probably best to still use the common
> > existing code for notification on local writes
> >
>
> I guess SMB protocol does not allow client B to request a NOTIFY on change
> when client A has a directory lease, because requesting NOTIFY requires
> getting a read file handle on the dir?
>
> Effectively, smb client needs to open the remote directory for read in
> order
> to prove that the client has read access to the directory, which is the
> prerequisite for getting directory change notifications.
>
> The local check for permissions is not enough for remote notifications:
>         /* you can only watch an inode if you have read permissions on it
> */
>         error = path_permission(path, MAY_READ);
>
> Thanks,
> Amir.
>
