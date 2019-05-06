Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27915424
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 21:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KEDXiJHWKjviYqvoTWdg/VpobGoPEHk3jlyAFxU4pGQ=; b=mJdi5WfnA33XJWz+rRu7gQX2RT
	wWPn8qCpiGDm8Gl7h8S0AFvpoLFF4p84x5J4948utjtc38c/KataUufQf34MCgtVOO37g0ddIkeXv
	vQ8e2n0JydA2UaJiGSpFxlBW1VQZZptlqYYjgsm7qcApolysHYAKzmQ3GTA/NukVV6zXBaCDapkhx
	yRaDWyCgvBNyHo7N+FiBuFYAY+yWsiDZPUfqJwUmvmpxvG38vfQB9FyaoEqVIsSKwdYKyiHCRI4TP
	/rZf+n7V3u6pdB3wYzTjzin1ygq/GgyHDgP7A9WHWij35AdUEqtsqre6R1gZ+3mAgIHpEkmtXOlbw
	YMoBEBcw==;
Received: from localhost ([::1]:31680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNiu9-002muA-D2; Mon, 06 May 2019 19:04:01 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:35373) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNiu5-002mu3-8k
 for samba-technical@lists.samba.org; Mon, 06 May 2019 19:03:59 +0000
Received: by mail-lj1-x243.google.com with SMTP id m20so2839879lji.2
 for <samba-technical@lists.samba.org>; Mon, 06 May 2019 12:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KEDXiJHWKjviYqvoTWdg/VpobGoPEHk3jlyAFxU4pGQ=;
 b=pLTdkPoKFEcO9WR2wUZw9/qM5VyxwTnkPmLQfy/kmsOtWZhFhZMuF5e3k1w29bKKbY
 myFxg7Rfa5KQFfeqDqjzNI6fKgteSNL6lyWmGEvdzrkcKGHxoH2gBD9wWqjP10a9A/oD
 Np+6/YXrpJwN4B9IT0lyF4cTxARTM6qsGHEb8UYtPwDMUbbqvxQML0Aeh4ANyYXD5cvL
 EcGO+Fy/sbFUfrDsuZVhKXoM5OEH4XLyERFNyc+YwSdbD3MNltAKT93Uys0WTgcczjzz
 m7FkQGDFmbxeWxv6eN+guqn/i4roWZ1zQXeF1rVa/FV0s9NzmYCdoGbvukJLVttEYYr5
 KRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KEDXiJHWKjviYqvoTWdg/VpobGoPEHk3jlyAFxU4pGQ=;
 b=lC4LviBjQCiyb1DP1haEcUctiYLWL4mbw6xL/Du/t7If12t0EsWgvpuWXXF86nMgPo
 Jf1mKtsTPcdW/a+q6TtR9dPz9/8GGzIgnTC5EVHEQU/HWbP70JPiFj6NMF5/ZinDArYQ
 FHg1SL6s3d68ibc2wXIXzq5/4B6YzcEtk+kRhIHklcsQAC3I6BJEb91Xiwrtrmo+zJ5r
 DzSJGeTyDq+9LAVWAGhioXQce8kB9jCVy3Hrx0U/2lsxLzXTuLdkRqoQP9/ur+f8GJtI
 VYTLkTwuflqTaxPzTE79jNo3falMD3+xhj12wL1tNvChrwdsvjRjtYnMA3v/qlHRU0uF
 0flQ==
X-Gm-Message-State: APjAAAX4/N4/HxkeNKGh+vKDBQzeBZ4fmsP5hDftzkc+nNTyLhx+TfvI
 4x8ebdg0FaKSS8Q8IHMvGPPEd6VggGti+j28Jg==
X-Google-Smtp-Source: APXvYqzs4JPs9r9knhDNfuaG7vck0LQKmuH914uaQI3NGuFSQ5jL3XF6xd3BYRmkoWPVj9EfDZiyZbSINn0G7YfIHQ4=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr12526196ljg.82.1557169436484; 
 Mon, 06 May 2019 12:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <1557155792-2703-1-git-send-email-kernel@probst.it>
 <CAH2r5mtdpOvcE25P2UuNFpOwsNyFiBWRQELQFui+FJGVOOBV8w@mail.gmail.com>
 <20190506165658.GA168433@jra4>
 <CAH2r5msK6yNNm_QbdsFZuB5uS0iNRuqe8gSDKvVAiR0N6E3MWg@mail.gmail.com>
In-Reply-To: <CAH2r5msK6yNNm_QbdsFZuB5uS0iNRuqe8gSDKvVAiR0N6E3MWg@mail.gmail.com>
Date: Mon, 6 May 2019 12:03:45 -0700
Message-ID: <CAKywueR6DcfkzGcZUgydV4n6F4MKDEOvtCaM-gQSonX02tA9tg@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix strcat buffer overflow in
 smb21_set_oplock_level()
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Christoph Probst <kernel@probst.it>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The patch itself is fine but I think we have a bigger problem here:

3052 >-------cinode->oplock =3D 0;

here we reset oplock level of the inode, so forcing all the IO go to the se=
rver.

3053 >-------if (oplock & SMB2_LEASE_READ_CACHING_HE) {
3054 >------->-------cinode->oplock |=3D CIFS_CACHE_READ_FLG;
3055 >------->-------strcat(message, "R");
3056 >-------}
3057 >-------if (oplock & SMB2_LEASE_HANDLE_CACHING_HE) {
3058 >------->-------cinode->oplock |=3D CIFS_CACHE_HANDLE_FLG;
3059 >------->-------strcat(message, "H");
3060 >-------}
3061 >-------if (oplock & SMB2_LEASE_WRITE_CACHING_HE) {
3062 >------->-------cinode->oplock |=3D CIFS_CACHE_WRITE_FLG;

this and 3 above cases are all racy with other threads opening the
same file and the oplock break thread.

3063 >------->-------strcat(message, "W");
3064 >-------}
3065 >-------if (!cinode->oplock)
3066 >------->-------strcat(message, "None");
3067 >-------cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
3068 >------->------- &cinode->vfs_inode);

Besides the fix in the patch I would temporarily suggest to not touch
cinode->oplock more than once in this function - have a local variable
cifs_oplock which accumulates flags and set cinode->oplock at the very
end. It reduce raciness a little bit but this code requires much more
thinking about proper locking I guess.

Best regards,
Pavel Shilovskiy

=D0=BF=D0=BD, 6 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 10:02, Steve French =
via samba-technical
<samba-technical@lists.samba.org>:
>
> We could always switch it to strncpy :)
>
> In any case - he is correct, it is better than what was there because
> we should not strcat unless the array were locked across the whole
> function
>
> On Mon, May 6, 2019 at 11:57 AM Jeremy Allison <jra@samba.org> wrote:
> >
> > On Mon, May 06, 2019 at 11:53:44AM -0500, Steve French via samba-techni=
cal wrote:
> > > I think strcpy is clearer - but I don't think it can overflow since i=
f
> > > R, W or W were written to "message" then cinode->oplock would be
> > > non-zero so we would never strcap "None"
> >
> > Ahem. In Samba we have :
> >
> > lib/util/safe_string.h:#define strcpy(dest,src) __ERROR__XX__NEVER_USE_=
STRCPY___;
> >
> > Maybe you should do likewise :-).
> >
> > > On Mon, May 6, 2019 at 10:26 AM Christoph Probst <kernel@probst.it> w=
rote:
> > > >
> > > > Change strcat to strcpy in the "None" case as it is never valid to =
append
> > > > "None" to any other message. It may also overflow char message[5], =
in a
> > > > race condition on cinode if cinode->oplock is unset by another thre=
ad
> > > > after "RHW" or "RH" had been written to message.
> > > >
> > > > Signed-off-by: Christoph Probst <kernel@probst.it>
> > > > ---
> > > >  fs/cifs/smb2ops.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > > > index c36ff0d..5fd5567 100644
> > > > --- a/fs/cifs/smb2ops.c
> > > > +++ b/fs/cifs/smb2ops.c
> > > > @@ -2936,7 +2936,7 @@ smb21_set_oplock_level(struct cifsInodeInfo *=
cinode, __u32 oplock,
> > > >                 strcat(message, "W");
> > > >         }
> > > >         if (!cinode->oplock)
> > > > -               strcat(message, "None");
> > > > +               strcpy(message, "None");
> > > >         cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
> > > >                  &cinode->vfs_inode);
> > > >  }
> > > > --
> > > > 2.1.4
> > > >
> > >
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
> > >
>
>
>
> --
> Thanks,
>
> Steve
>

