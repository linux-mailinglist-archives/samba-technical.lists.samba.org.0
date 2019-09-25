Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4850BDDFE
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 14:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KzV3Bac68m0dv5dUGYt6C8o/uAV+0rOKYK7VemLgsAY=; b=EFY/Chlv5MEnAQzsmRNAVj1oKB
	TO8SIntee7g+iddAXSZBb7Lei2slvx4OOPjwc6erxn2PtPm8o612Xa9JG1PdtFt7IxdtubBDrdkaD
	fGVmFW+vYxDWE0RcB+q2ilZy7cDhIUevyGw5Dtw+6msU4De9Zg3VqnEE7RbgyKWjoydgKfpCk9W+B
	BAmAbgGSV/0qvbYQltLO0pIktWWUIil5ozBZhVPArLnLS+MuiCvVLQsHIFyXfKlEaDLPdUYI0+bll
	73AN/GHLXUp2zGcDK6uLY6PweC8ynfaKXG5R4XVmkRRR5DB/1gPQbpvCLHSSzD6/vpWFw29ltOjt3
	D2VuN+vQ==;
Received: from localhost ([::1]:25488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iD6EX-008V9x-Ok; Wed, 25 Sep 2019 12:17:25 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:38039) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD6ES-008V9o-Ge; Wed, 25 Sep 2019 12:17:23 +0000
Received: by mail-yb1-xb34.google.com with SMTP id o18so954965ybp.5;
 Wed, 25 Sep 2019 05:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZnBO1kEwFFIrNBOBN50w7ZX9kS8zy7NFEzSpGL2S1KQ=;
 b=u86Ljky42igq+MzwGy2NBowLZ2unTvVj05dezkyrJYhD95+Pvxi2fXc+H5f3nwkO7b
 VfRaLs4S0pW0BgpOSDDOs+orc5WG3UyEDTpo8zPtV+cnJb++FCCO711G9njbv+i1tt29
 vYENvVeEk9gxcQoDfjCdVC+QF8rB62m2ZgZ6vqkmS9JSEHZlqvJC/1A4g5MZ0y4gcBs3
 AQKyZlLiuwRgWaf2IILyBZWfP1XlkaYaf0QqZQPWo3DXCnrSI+sW6GqulTkk0jNy96R0
 lTDFUNPorwVTk62askSdMOYsQ05gEJMrWkpHslAj30MokUTONMdqQ4ohAbtGgr26FKsp
 gCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZnBO1kEwFFIrNBOBN50w7ZX9kS8zy7NFEzSpGL2S1KQ=;
 b=g22E5j7XCfBxwCP5BprNXozFDKNHTqPT9Fh+FxJsIB4UM1eNT880rSMPuv/7bcgI+/
 JbsdS6iWZHh1dnxLgoHMUUcUeIKDV2fYkl6cy0j4yNpIjnzmqruqQ4ILjO0yyraLfTJ5
 Sq16uTTMv8bOh3WAHCPhmd5BXlngffkk8yW/U2hVKiGJuTnKrCLECnT3WJrSN3zvjcz2
 Vw8AF+KSsyAT0qoIDPULgJ4NLeDBvfCXFUriGgtq9849QbGXDi2ejoJtMUJ5Xxj/gvq/
 /HH9ivMyisVHduapZDK/X4xPIvRdKRFRRePzZf8q/kx3p6xYWmaxN2wtTJQw193riF6M
 xJkA==
X-Gm-Message-State: APjAAAUlkzgu4/GnKyNrpf55nc9gehjiESoDIvtsSr916iMWu5HkKZDc
 RCSypEDYtL1HGrgf77VVFTB8eUBV70rIVfoILYN/eg==
X-Google-Smtp-Source: APXvYqwb/y0J0wZfXPpuPf6SsFOF0AuWGBD2fugROVMz41WYm9ulLQRLJAZ2fy50spmj8wUv+CZci1LZXso+32JZsQE=
X-Received: by 2002:a25:bb45:: with SMTP id b5mr2777402ybk.224.1569413838852; 
 Wed, 25 Sep 2019 05:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAG+HqKQcLgAw9EFHCqTGkVXEO8FbF3oUjGeOhDEoqS5rRk_YCw@mail.gmail.com>
 <37da4574d589033cc87ab985227fb7be1b2f1fb9.camel@samba.org>
In-Reply-To: <37da4574d589033cc87ab985227fb7be1b2f1fb9.camel@samba.org>
Date: Wed, 25 Sep 2019 17:47:45 +0530
Message-ID: <CAG+HqKTP++AO8Qk6Ymk5NS-__6jvr7Ms0d5PwH1nOrMxvqyMJA@mail.gmail.com>
Subject: Re: [Samba] In mac guest user is not working when AD connected -
 samba 4.9.3
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
From: VigneshDhanraj G via samba-technical <samba-technical@lists.samba.org>
Reply-To: VigneshDhanraj G <vigneshdhanraj.g@gmail.com>
Cc: Samba Listing <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

If I give register user as vignesh/guest, its working fine. While selecting
the Guest radio button, guest user is not working.

Guest user is working fine without AD connection.
Kindly do the needful.

Thanks,
Vignesh.
On Wed, Sep 25, 2019 at 4:28 PM Andrew Bartlett <abartlet@samba.org> wrote:

> On Wed, 2019-09-25 at 16:24 +0530, VigneshDhanraj G via samba wrote:
> > Hi Team,
> >
> > I have configured server signing as mandatory in smb.conf. After
> > configured, guest user is not working when AD is connected.
> >
> > In mac while connecting to samba if i give register user as
> vignesh/guest,
> > guest user is working. But if I click Guest radio button, guest user is
> not
> > working.
>
> server signing as mandetory makes no sense with a guest connection,
> where there is no password with which to secure the session.
>
> You need to decide on one or the other.
>
> I hope this clarifies things,
>
> Andrew Bartlett
>
> --
> Andrew Bartlett                       http://samba.org/~abartlet/
> Authentication Developer, Samba Team  http://samba.org
> Samba Developer, Catalyst IT
> http://catalyst.net.nz/services/samba
>
>
>
