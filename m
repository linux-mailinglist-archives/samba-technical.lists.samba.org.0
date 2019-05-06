Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C71555A
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 23:19:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Gj6cHoDgKm5gQ6ssloMkjav9C/MTiSHC3wRe+G+54AA=; b=yvNIwFc5WCguz9F1ipw0J6Xe3F
	um4XFEeIejCOLypIeehX90fREogQY/z0UoXN2Q094XCxf1c+tZ1/6CyV7YY15/LcPgw5xRuNZhMBy
	zy2zrQAwc5lpIGfaUL2ANAt2RMPPQ9AZaLBMmMlt538cniIJN1CgK0gCyeiHZI5ycj627fZQV7JHI
	6DPlxrkh+w1OlMrUkSngwbCQv1AXGgzSFdX0S6PLJdnkz1Vz5xBkjkrqWkQuzmyQYkQgxnkZWGSaM
	yMAVExoFmW2EUBfY6DDv21wIEqncZas+xUOZ0XMKBnaSuY+K1TKuh+H2/GsKvSXapBni2QCOhIPat
	5Cad5MAg==;
Received: from localhost ([::1]:37554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNl0x-002nlQ-Nr; Mon, 06 May 2019 21:19:11 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35705) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNl0s-002nlJ-8M
 for samba-technical@lists.samba.org; Mon, 06 May 2019 21:19:08 +0000
Received: by mail-pg1-x542.google.com with SMTP id h1so7099082pgs.2
 for <samba-technical@lists.samba.org>; Mon, 06 May 2019 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gj6cHoDgKm5gQ6ssloMkjav9C/MTiSHC3wRe+G+54AA=;
 b=tSJat57gHqfSHNIPcpxBlNuqd/Bm1UU35SWFywKBAdQN9SRLygwljIbSR5BkAHIhTa
 nSNouHxxRCJXJojh7j0hqydG3qrikOb8u3MmP0SKPMgYHfP4yttdyUejM6f/jQY9vLAS
 xyQiPmio2oOram5ulplBqpTCmnjqNEj8pk7pPGE3zb9yobi9Amy75Vgi/cOdG4KhrueM
 3LSHKh2gF4d6UdQwUC5c3Ot2aZbSwdwiXh+nzwce5qWCtyI8DYUp5MHeQL4PmxGE953x
 FeY2dysCxK0MsjL7uBJEeE6eG5lAAyIE1rHz3dGTOgsOLvmIX5X/u8UQRS7FEAp5ZnNy
 LS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gj6cHoDgKm5gQ6ssloMkjav9C/MTiSHC3wRe+G+54AA=;
 b=evErlBYjDdiDpTFKkipBWgVYgPmm7o5LfYB5Iwx1ti1I86IsMnAlMWjRhiFNHRhWmI
 215nJ3mWpW7kLshqAapRAKxGHKFuL8kLolU5EcvzJOaa5UISbXxgvz5qgEm8KEVRbCRC
 oCryfjLWG8nxvL9nUxNs3/wcHUPL21CVdZGsei6JrWAim9N5b6bAgawmunG1la0enpm8
 /2z+kshbooyxsDdbosAACrhRX6Aj0PQZUVJGYyVT+bUmqjsxiH5POCQIfeSWhrXXm8nX
 wd0DmYxblCpJCv9T7oaYoIBFWCRxC2iY5hrGPy0gDexnhjrzt+hOUQhFVxC8vwZY46gk
 9r6g==
X-Gm-Message-State: APjAAAW3uaL9XRTT+9SVwkgWCGUxF+xi1hOzrzRuqIz8umcnt5f4CnGh
 GRVxYkkXmfD1M4GvSP4ZB7njbDJ7HHIkKBo0Mts=
X-Google-Smtp-Source: APXvYqwsQaF7aFZK8j68xNsHDukwLbUJYNaZMW0/4X+T9F6yrm6JV2lOJGZNEbHoXTC4lZDyFshUP6I8yzxsoSgxVoQ=
X-Received: by 2002:a63:f843:: with SMTP id v3mr34943251pgj.69.1557177543611; 
 Mon, 06 May 2019 14:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <1557155792-2703-1-git-send-email-kernel@probst.it>
 <CAH2r5mtdpOvcE25P2UuNFpOwsNyFiBWRQELQFui+FJGVOOBV8w@mail.gmail.com>
 <20190506165658.GA168433@jra4>
 <CAH2r5msK6yNNm_QbdsFZuB5uS0iNRuqe8gSDKvVAiR0N6E3MWg@mail.gmail.com>
 <CAKywueR6DcfkzGcZUgydV4n6F4MKDEOvtCaM-gQSonX02tA9tg@mail.gmail.com>
In-Reply-To: <CAKywueR6DcfkzGcZUgydV4n6F4MKDEOvtCaM-gQSonX02tA9tg@mail.gmail.com>
Date: Mon, 6 May 2019 16:18:52 -0500
Message-ID: <CAH2r5ms+RAoe_1c=dUYL=yCs3KWAvqoB00-T4SEpyTjRKiwA6A@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix strcat buffer overflow in
 smb21_set_oplock_level()
To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Christoph Probst <kernel@probst.it>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 6, 2019 at 2:03 PM Pavel Shilovsky
<pavel.shilovsky@gmail.com> wrote:
>
> The patch itself is fine but I think we have a bigger problem here:

Good point.  Perhaps make update to the same patch to include both changes

> 3052 >-------cinode->oplock =3D 0;
>
> here we reset oplock level of the inode, so forcing all the IO go to the =
server.
>
> 3053 >-------if (oplock & SMB2_LEASE_READ_CACHING_HE) {
> 3054 >------->-------cinode->oplock |=3D CIFS_CACHE_READ_FLG;
> 3055 >------->-------strcat(message, "R");
> 3056 >-------}
> 3057 >-------if (oplock & SMB2_LEASE_HANDLE_CACHING_HE) {
> 3058 >------->-------cinode->oplock |=3D CIFS_CACHE_HANDLE_FLG;
> 3059 >------->-------strcat(message, "H");
> 3060 >-------}
> 3061 >-------if (oplock & SMB2_LEASE_WRITE_CACHING_HE) {
> 3062 >------->-------cinode->oplock |=3D CIFS_CACHE_WRITE_FLG;
>
> this and 3 above cases are all racy with other threads opening the
> same file and the oplock break thread.
>
> 3063 >------->-------strcat(message, "W");
> 3064 >-------}
> 3065 >-------if (!cinode->oplock)
> 3066 >------->-------strcat(message, "None");
> 3067 >-------cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
> 3068 >------->------- &cinode->vfs_inode);
>
> Besides the fix in the patch I would temporarily suggest to not touch
> cinode->oplock more than once in this function - have a local variable
> cifs_oplock which accumulates flags and set cinode->oplock at the very
> end. It reduce raciness a little bit but this code requires much more
> thinking about proper locking I guess.
>
> Best regards,
> Pavel Shilovskiy
>
> =D0=BF=D0=BD, 6 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 10:02, Steve Frenc=
h via samba-technical
> <samba-technical@lists.samba.org>:
> >
> > We could always switch it to strncpy :)
> >
> > In any case - he is correct, it is better than what was there because
> > we should not strcat unless the array were locked across the whole
> > function
> >
> > On Mon, May 6, 2019 at 11:57 AM Jeremy Allison <jra@samba.org> wrote:
> > >
> > > On Mon, May 06, 2019 at 11:53:44AM -0500, Steve French via samba-tech=
nical wrote:
> > > > I think strcpy is clearer - but I don't think it can overflow since=
 if
> > > > R, W or W were written to "message" then cinode->oplock would be
> > > > non-zero so we would never strcap "None"
> > >
> > > Ahem. In Samba we have :
> > >
> > > lib/util/safe_string.h:#define strcpy(dest,src) __ERROR__XX__NEVER_US=
E_STRCPY___;
> > >
> > > Maybe you should do likewise :-).
> > >
> > > > On Mon, May 6, 2019 at 10:26 AM Christoph Probst <kernel@probst.it>=
 wrote:
> > > > >
> > > > > Change strcat to strcpy in the "None" case as it is never valid t=
o append
> > > > > "None" to any other message. It may also overflow char message[5]=
, in a
> > > > > race condition on cinode if cinode->oplock is unset by another th=
read
> > > > > after "RHW" or "RH" had been written to message.
> > > > >
> > > > > Signed-off-by: Christoph Probst <kernel@probst.it>
> > > > > ---
> > > > >  fs/cifs/smb2ops.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > > > > index c36ff0d..5fd5567 100644
> > > > > --- a/fs/cifs/smb2ops.c
> > > > > +++ b/fs/cifs/smb2ops.c
> > > > > @@ -2936,7 +2936,7 @@ smb21_set_oplock_level(struct cifsInodeInfo=
 *cinode, __u32 oplock,
> > > > >                 strcat(message, "W");
> > > > >         }
> > > > >         if (!cinode->oplock)
> > > > > -               strcat(message, "None");
> > > > > +               strcpy(message, "None");
> > > > >         cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
> > > > >                  &cinode->vfs_inode);
> > > > >  }
> > > > > --
> > > > > 2.1.4
> > > > >
> > > >
> > > >
> > > > --
> > > > Thanks,
> > > >
> > > > Steve
> > > >
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve
> >



--=20
Thanks,

Steve

