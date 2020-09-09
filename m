Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11396263491
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 19:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=INP3q49dtVY7fmaPmHxKqo4VLe2pXX7YeXHdHOGhfe8=; b=d0Hn2GjlRycBqXv+6umpXPiHHE
	FhSdefIyjATbNZWs+b83gkB21ztHcTaCyGaKRvU9SA2cVU1C7HQwS0qdHAHguoFH9g54ZARPeNAPY
	DL4/Vi4XCn+oA6A82naXCu4nDXA08w7tvR8fGSmLAOCiHb3j0I/pd9D+kQKot42YlvGwTPUMMa92q
	7LArlIt0rulpIulX3NnmoY+zftErOdQB05EF+DrtRFxLgJKO9XGMj/WukPId/0GkrGTJw4IXfHlOi
	/xdEvnb04oHD5YF7CzJO4dFBH9BGxYN4aHnPn2KOeSLIyJ2yxwHnUUWdEHHBrD053FfHztrqtpbQu
	O0sxWmEg==;
Received: from localhost ([::1]:33488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kG3qW-004nBB-VZ; Wed, 09 Sep 2020 17:25:25 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41015) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kG3qL-004nB4-RL
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 17:25:16 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id h20so2260744ybj.8
 for <samba-technical@lists.samba.org>; Wed, 09 Sep 2020 10:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=INP3q49dtVY7fmaPmHxKqo4VLe2pXX7YeXHdHOGhfe8=;
 b=UYkxOpcLhJRRt+BJzCZhLwS/l0e2yVKxbj2KU1KxgbEHytjjpYoSUFxsNkrck3LS41
 BPvnrUuXnVF9cIe0sJOwytcWSri3vsEA/Zm34UyWutjSMk68z+VIw8GancZSGgi4WXSH
 kuwH+Hy+XWDuCf7Pya38p+QBoZZrYngijz82BKkEo1jRLTLYr4LTTR0huW/d8QpUOFto
 sXfvziJJ1LiX/ZKdXOjvOQ0IRyoxEGRPVbRWIe3/8+dTfN6QY3+GC5UTAeFcnA2kgZVC
 WOV76kn/k/jxgVU9GwbVvOXlLZLmQ7CTKtGeDOTukSuN6LjJnAYvCF+Zgfv2sIUQQasq
 vUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=INP3q49dtVY7fmaPmHxKqo4VLe2pXX7YeXHdHOGhfe8=;
 b=m9tOOd5Up8Gxe5Uf6xMiU5Nv8LBysplJySRp+qoOApKLKgGBKX72AxMt4Y6/4SpG45
 61PqZkYHGUqxNloFaXm8YnKez+9G23qJyJUHuEMUJnQZ+pqsJw5ZXonwHDaVMglXbJ0v
 nJcCFBHjb1HSjS4V2rUccc5F80/U59BCBE3eThfF8SWTARfvePiJQN8TmQ1YzZH71JgH
 JKVjQLp4Jlis2/Cov4SYQKHZwLz8YdikEcGNv8uVYzhTeniZCksK8jgPbvLJynIsOBiy
 S1DcK48w7atPHOO19Dxk+M3ppwQS5QMQWuYtE70f0EFwBNNoMpkXs9ClZWYksWmE2GFm
 QM9w==
X-Gm-Message-State: AOAM5331ZX0dLunHlPp94n0kva8PFIIgEcW7v9v8u3bIlqOfb6PBpUdz
 nT2U3TLbhdc5NG5vvoH/dDX2bMm3t/T8ErepNjI=
X-Google-Smtp-Source: ABdhPJyWItvsBshr25INT6hwc+JNOagWP6BHehXT5M3JcGFY6WRzT2O0ZkTIdVob0TQ6LliYrlcqnrGqL/bPrid1jxU=
X-Received: by 2002:a25:aca3:: with SMTP id x35mr6809170ybi.3.1599672310941;
 Wed, 09 Sep 2020 10:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
 <87pn7t4kr9.fsf@suse.com>
 <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
 <87eeo54q0i.fsf@suse.com>
 <CANT5p=rxp3iQMgxaM_mn3RE3B+zezWr3o8zpkFyWUR27CpeVCA@mail.gmail.com>
 <CANT5p=qMHxq_L5RpXAixzrQztjMr8-P_aO4aPg5uqfPSLNUiTA@mail.gmail.com>
 <874ko7vy0z.fsf@suse.com>
In-Reply-To: <874ko7vy0z.fsf@suse.com>
Date: Wed, 9 Sep 2020 22:55:00 +0530
Message-ID: <CANT5p=o07RqmMkcFoLeUVTeQHhzh5MmFYpfAdv0755iiGbp1ZA@mail.gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, sribhat.msa@outlook.com,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Your understanding is correct. We could also go for a hybrid approach,
where we fallback to option b when option a fails to authenticate.
But for now, I'll resubmit a patch with option a as a fallback when
regular mount fails, just like you had suggested.

Regards,
Shyam

On Wed, Sep 9, 2020 at 7:43 PM Aur=C3=A9lien Aptel <aaptel@suse.com> wrote:
>
> Shyam Prasad N <nspmangalore@gmail.com> writes:
> > Thoughts?
>
> You are reaching the limits of my poor understanding of this kerberos
> stuff. What is the difference between keytab and credential cache?
>
> So IIUC you are proposing 2 ways to go about it:
>
> a) - do PAM login in mount.cifs (which in turns calls into sssd/winbind)
>    - implement umount.cifs for PAM logoff
>
> b) - ignore PAM and winbind/sssd and do kinit in mount.cifs manually
>    - would this requires umount.cifs as well?
>
> I like (b) because it feels we have more control and don't require a big
> external program like winbind *but* if (b) doesn't do the refreshing of
> the tickets then the mount will always stop working after they
> expire. This seems only useful for quick one-off mounting or
> testing/debugging. Real end users will find it unreliable unless they
> setup something like what winbind does essentially.
>
> So ultimately, to me, (a) seems like the better choice. Let me know if I
> misunderstood something.
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)



--=20
-Shyam

