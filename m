Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC525836E1
	for <lists+samba-technical@lfdr.de>; Thu, 28 Jul 2022 04:29:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cZFlsUJOaADCOjobBXWN+Ry6rplJfP66zaPfTmczUmE=; b=pBR2rQb144dsMJGy0YPdUZEYBl
	3fk6JAtiUxHvq0vE/R5RNpJREEva4rjEFaipscLTZYb1yEcKW/I0AaQS3KwzlVU6V6i5cdftX+wfb
	DeV4GpomSf3AFknlD8q0qVPZrRNd6NSUtnLb20dXp/YdhqHQNwdQnQuetHx/06qQ60YlNb61zjt+L
	ECAmnWAop0y5rTa0GOY6hKzv1wVLLt2esrgD/j7GhDfwcOWYtnBXCNmDdCntxIdk5N9cgmErjpcgH
	HLi8FUjk6DNO/lcDet6ETwQcHGSmDQQHzazkUTt3G8JLRi6OFBVjWeP/dncvPamuZo4xVSblKJU9Q
	sGH/RxqA==;
Received: from ip6-localhost ([::1]:58678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oGtFP-002Q3O-Sc; Thu, 28 Jul 2022 02:27:35 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:43811) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oGtFI-002Q3F-8C
 for samba-technical@lists.samba.org; Thu, 28 Jul 2022 02:27:33 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id d187so398054vsd.10
 for <samba-technical@lists.samba.org>; Wed, 27 Jul 2022 19:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cZFlsUJOaADCOjobBXWN+Ry6rplJfP66zaPfTmczUmE=;
 b=XT6C+CtssjABaCZvXmadnHkws66JxdUFWFpS9Ci/f99W/0HcTl0nVrjqUaQ/YOahZH
 viPF0LtQxBhvgUqVpWoGic3U+usnS04aUEqxsPFCjRnHrc/cBYegoHrnzGTRimb17peB
 L9F0+7FeuS4ihTtFTP5sUuwy/WlWwvxHto457qIscz3b7xbIV/hqYbzS6vhdtjkmkWy2
 ca3KxotxpYdewZFlhWWK7vTKkYcIBS23UzQSurFIsw1i4IbDtcBLU+AfjoGHEjaTNtNG
 Hz8/uPV1Pf5JOXr/jZdCH3baRG2duH7NOEI3lVq6JdU+GFCNjegDLhpcLMtJRXqyKJNI
 c8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cZFlsUJOaADCOjobBXWN+Ry6rplJfP66zaPfTmczUmE=;
 b=FxUpuEksGTbnw5BI5T+/L7P3U9neR1LaINVL56QdHsqjT9XSLHVzUf4bw5xvSVR4bT
 ffsIypDZcH6iN5Q4HXHjV2khUpq++ru+gIMwUIgl5U4TTJ/4UQ5S0PUleJTWC/1Mkn65
 VNHgWBoNH3p+pQ7ciIyGWSGnkKiqbXySbdt53aMp/GVbogtCmQYBNsVUN9UkaodIhoaH
 cng+rKlzQa0v4ib8YtzUIDqYToAhfLuX64X0HQiHvkh16rOyjbPm47FYTuJzI0h3NTD6
 M+jkqAZ6B4+WlKNT0Hx2rNIcdYZ6XgvA2kPIMIAyzgWEnCxJ+7y0h9WeG7tx3cDc3Lji
 fmpg==
X-Gm-Message-State: AJIora/0nBPhc/1eIVLGoVpWDVEo/P4X2WadFM1LKwKYjVxHMwexr83e
 mClVkYYm5tAi0ZZZRLD4JwAYvoUtkpuIJE/1oC0=
X-Google-Smtp-Source: AGRyM1svemPRfB9LuqoREtDBGyHsaC9y38k6KATXp0QjoGbrPCj2bOAvpTi7rIqC+53WbHRV2PqRFuwflXEdY9VzgAk=
X-Received: by 2002:a67:ef07:0:b0:358:611e:9105 with SMTP id
 j7-20020a67ef07000000b00358611e9105mr5084670vsr.61.1658975244833; Wed, 27 Jul
 2022 19:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjSBvRk-ksUBOiQzJd=e19UZKvOSZs1UHahK5U0QVh6RQ@mail.gmail.com>
 <fda96c5c-9007-4147-3be1-8c9deca0442c@gmail.com>
In-Reply-To: <fda96c5c-9007-4147-3be1-8c9deca0442c@gmail.com>
Date: Wed, 27 Jul 2022 21:27:13 -0500
Message-ID: <CAH2r5ms+uCF-sC1Hw6izmMhCb2jR55jB0pf8rK8OkkUh0hNGfg@mail.gmail.com>
Subject: Re: Possible regression: unable to mount CIFS 1.0 shares from older
 machines since 76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c
To: Clemens Leu <clemens.leu@gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, regressions@lists.linux.dev,
 samba-technical <samba-technical@lists.samba.org>,
 Davyd McColl <davydm@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Is using userspace tools (like Samba's "ftp like" smbclient tool) an
option to migrate these files?

On Wed, Jul 27, 2022 at 3:04 PM Clemens Leu <clemens.leu@gmail.com> wrote:
>
> Hi all
>
> Here follows now another practical reason why it is at the moment a
> quite unhappy decision to ditch the NTLM/CIFS 1.0 support entirely.
>
> I am on Kubuntu 20.04 LTS and the access to my Apple Time Capsule worked
> fine. This changed when kernel 5.15.0-41-generic was installed some time
> ago. Since then I have in dmesg the known "kernel: bad security option:
> ntlm" and "kernel: CIFS: VFS: bad security option: ntlm" messages and no
> access is possible any longer to the Time Capsule.
>
> So it looks that commit "[76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c]
> cifs: remove support for NTLM and weaker authentication algorithms" has
> completely broken my Time Capsule access.
>
> Yes, I know, ntlm is more than 20 years old and a quite insecure
> protocol. It is absolutely understandable to disable it as default.
> However, it should be also regarded that there exist companies which
> decided because of narrow-minded reasons to implement only the old SMB1
> protocol also on not so old hardware. Apple is such an example, they
> really implemented on all of their Time Capsule models (which were using
> a special Samba implementation) only the stone-age variant of SMB/NTLM.
> This is true even for the last 2013 variant which was discontinued on
> April 26, 2018. Apple could for sure support a more recent SMB version
> but they didn't do it most likely to make their own AFP3 protocol look
> and perform better.
>
> So the alternative would be AFP in my case, unfortunately it's not so
> easy. While we have thanks to Netatalk a rock-solid AFP support in Linux
> at the server side, this is unfortunately not true for the client one.
> The corresponding "afpfs-ng" (Apple Filing Protocol Library, a client
> implementation of the Apple Filing Protocol) project is unmaintained and
> dormant for years.
>
> Long story short, the current situation in this topic is as I said quite
> unhappy. While I fully agree to disable NTLM/CIFS 1.0 as default, it
> shouldn't be removed entirely. Maybe it is possible to enable it only
> for accessing older network volumes/shares while on the same time block
> the possibility to create insecure NTLM network shares? I am aware that
> the risk in enabling this old and flawed protocol will be my own
> problem. I won't complain if I get into trouble because of it. ;-)
> Unfortunately I have no alternative other than buying a new NAS or
> downgrading to an older kernel which is also not a really practical option.
>
> Whatever, many thanks for all your great work!
>


-- 
Thanks,

Steve

