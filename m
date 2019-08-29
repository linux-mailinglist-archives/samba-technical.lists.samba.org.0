Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE96CA1032
	for <lists+samba-technical@lfdr.de>; Thu, 29 Aug 2019 06:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YU1YHjbF48DNiDGJ/sscFH+VTiFvXEQv14JcR6j+IMU=; b=o3OgzsxdFh09NJ+Vn1uj42VVAJ
	av3NN8pAc2XwxRPrBctaQn7cUzppIqDhFboW48hXLogCGEK139pX8klmvH9MrgvqNBweKny9zXTZr
	BvOCfudeykBTk24eLnl9L4KTfnHo6PDkLlEDvKBDK8pjRi1chgBQkjQ5ytFdN2BJFS8EvmKXW6974
	2xyvfXw31WuAWGTE8OhHC7dhXjphth57CiSAH1mJPo5trM0DKWbMtMyZv2yLCyQYEzQidvHiE8+we
	jicb8e6YkhvcuBNFKvXEvS6mltXHR1Csmt0eTt8TLFa+AJ1a1tt1dMsun/sEoomIfXs8sBXtsubtn
	ak2AWdlw==;
Received: from localhost ([::1]:25712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i3Bkz-0009ID-CH; Thu, 29 Aug 2019 04:09:57 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:35854) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i3Bku-0009I6-EW
 for samba-technical@lists.samba.org; Thu, 29 Aug 2019 04:09:55 +0000
Received: by mail-io1-xd30.google.com with SMTP id o9so4162318iom.3
 for <samba-technical@lists.samba.org>; Wed, 28 Aug 2019 21:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YU1YHjbF48DNiDGJ/sscFH+VTiFvXEQv14JcR6j+IMU=;
 b=bTpepsNJjZwXWh3JW5H4Ce7efx57U0QBAypMjHr2aJhmxYvbZ4l9uUtc6UMlNwMCVJ
 rLlM8Vuv3UZLoMQqhxPfSciTslDnYspvytfvb/vz8K2fmL1kCztbZVNCT5neQNLSfNkp
 qWBHRHtafx3W65LeuqM2KbWB2E3HPtZsAI/KMVTjkBAIPdQN7XKEbIKijAU6vjg9Fuaf
 bp0Pn17+wxMtNr9KWvB+NPLxdLh1yE9mQhv4Mb2tA8gukZv0oRe5fsDjlDKE4B8fJ/bJ
 XqKYm9LeOOGfR66D2NLd8hFML4RtuW4fzzWLP6+mCHpTLLGaGIuz1+mGmeSk0/c85frc
 andQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YU1YHjbF48DNiDGJ/sscFH+VTiFvXEQv14JcR6j+IMU=;
 b=qlhJ56gy8qLop7BaUq24FF2gNRcLRJuMQZWFDWKgSkP7vzPPBNnPZFMcTdSlsB2q1i
 QWEiDCk334loic4p8loXGYEvxIchhvTDMr81F3TVcxYEGx35VZuiuH6g4CuHOkZQL7Sz
 cal8n+wCgV3fmJnMmLbqNU64IvaucU0zf+C0DtBzyDMKBWGnuZn8MK2Y0c2Rf8HGZgaW
 rH6Pr0HNz5fmMlaUcBIZlF1JPsC7PF9uOp0Qm+M0x+Q6cKZMIZquYlcFsQTH96jqmEO7
 AtjABa13hKXNiiVdnDtcAfN2POU181IBXtRukzX3hcO3suYbboF0h3BbB2uD/Y5ZLbYF
 fOOw==
X-Gm-Message-State: APjAAAWQLKYz/VV4vdx03Tp3K4jhO00h7bvIFX+Ml9MYYCwpkvV0y8/7
 KhZGQF6EN7iC4yRxOZbVUGpRDrd1MZm13aErO24=
X-Google-Smtp-Source: APXvYqwjBWoTXise9Yyur+0EvpWqlBurQEVkTw/X47GmfjP60IPzgICVqLLRTVW8GZeXgC76n+oVDlvxAVlDDLuFDis=
X-Received: by 2002:a5e:da48:: with SMTP id o8mr8716584iop.252.1567051787467; 
 Wed, 28 Aug 2019 21:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190829000006.24187-1-colin.king@canonical.com>
 <CAH2r5mtSSwS7_E2WkS3Lsk02BEf_UwZ4H9oCEFTSf94U=4Cm9Q@mail.gmail.com>
In-Reply-To: <CAH2r5mtSSwS7_E2WkS3Lsk02BEf_UwZ4H9oCEFTSf94U=4Cm9Q@mail.gmail.com>
Date: Thu, 29 Aug 2019 14:09:35 +1000
Message-ID: <CAN05THSTwX_a7hry4EpD86EEr7NaZ75XUhDKpr_Dgwqqt+rBuw@mail.gmail.com>
Subject: Re: [PATCH][cifs-next] cifs: ensure variable rc is initialized at the
 after_open label
To: Steve French <smfrench@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Colin King <colin.king@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 29, 2019 at 2:00 PM Steve French <smfrench@gmail.com> wrote:
>
> Merged into cifs-2.6.git for-next
>
> Ronnie,
> You ok with merging this as a distinct patch?

Sure thing.
Thanks for the fix Colin.


>
> On Wed, Aug 28, 2019 at 7:02 PM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > A previous fix added a jump to after_open which now leaves variable
> > rc in a uninitialized state. A couple of the cases in the following
> > switch statement do not set variable rc, hence the error check on rc
> > at the end of the switch statement is reading a garbage value in rc
> > for those specific cases. Fix this by initializing rc to zero before
> > the switch statement.
> >
> > Fixes: 955a9c5b39379 ("cifs: create a helper to find a writeable handle by path name")
> > Addresses-Coverity: ("Uninitialized scalar variable")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  fs/cifs/smb2inode.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/cifs/smb2inode.c b/fs/cifs/smb2inode.c
> > index 70342bcd89b4..939fc7b2234c 100644
> > --- a/fs/cifs/smb2inode.c
> > +++ b/fs/cifs/smb2inode.c
> > @@ -116,6 +116,7 @@ smb2_compound_op(const unsigned int xid, struct cifs_tcon *tcon,
> >         smb2_set_next_command(tcon, &rqst[num_rqst]);
> >   after_open:
> >         num_rqst++;
> > +       rc = 0;
> >
> >         /* Operation */
> >         switch (command) {
> > --
> > 2.20.1
> >
>
>
> --
> Thanks,
>
> Steve

