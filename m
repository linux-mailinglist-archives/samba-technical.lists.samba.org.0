Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED861229B4
	for <lists+samba-technical@lfdr.de>; Mon, 20 May 2019 03:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dLGowd605TGgiEF9LE+kSadzQc7KbvCMX2YqZwW09gY=; b=iQpVj9fEzqr6kBo/8+P4F7WJUF
	cxBLfc7fAfWT7ji/6L6TWr6ti3jsdo1m+wwv/Tq7jH3/lqT2X1FFumbZaMo7EWPvYeupTcgyODPTD
	WZaoENO63mLJCNn30bJaRr+CjiUx5FOGt+ujhgntdXi/kTEnP3K6MZPncMzAf7edzddQeGiBeCAqe
	+h0MINqDh6vZuiqvSqXIzvtl8qs0mBZskqPNRz3ENOpbDBLnlBOJCGnExxKpWcYdpz5mbpz0C0OWm
	PThB7dvf+cH1DOs4nVehq8z5mbDE1N7V8b1xICPRaAS++rt22TVFPN7DNRN+OfZguvqf4xq9hRZCq
	bJE9J0MA==;
Received: from localhost ([::1]:64992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSWyi-000b1p-Rp; Mon, 20 May 2019 01:20:36 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44650) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSWye-000b1i-QE
 for samba-technical@lists.samba.org; Mon, 20 May 2019 01:20:34 +0000
Received: by mail-pg1-x544.google.com with SMTP id z16so5919629pgv.11
 for <samba-technical@lists.samba.org>; Sun, 19 May 2019 18:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dLGowd605TGgiEF9LE+kSadzQc7KbvCMX2YqZwW09gY=;
 b=XdL3IWjAD1FV+MhMS67oSDrUskQtqgM7vvr4+6/AJ0ASseWPJxbwHSzZaepORKwrR6
 CWxsdrla0ghPoAKf1VKpMtVswkSEL5Y4Me+UnJFPDMJ9nbJ0U/Nbu2SsUGUh4oKYhkrm
 +tdGobM3RlgQ5v4HI/EVGpr0DB57dQBMn7h1eZFhrYlykkqTWxy1BU5QiAhK8dHKSn7U
 aGAXLYo4fbCTBWT2IPU+/6801/bpnaBb0Y6ZyPX9pAqEpm3nKCD13hbuXsrj7Gb0DMC5
 a8rd1iSGNviyHsSPiVmKIg6zrOmPCsltalEcnS5s04EgEuOE+diFsiyNopzSBZjthIIt
 SRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dLGowd605TGgiEF9LE+kSadzQc7KbvCMX2YqZwW09gY=;
 b=GeAEqePwrYwjdxtH0kFflzSV0WLZJZBDeF0vR/eg3SzUgDALRkks6spDW7zjtqRKwQ
 qxJ73KgoFeN2qgUKmQon1esdtS2N7zZrl9kwW3E9Ky6S68cdLb3iSdU8ERtH7maqkFYP
 mvNZP9pV7VZqSxeUloPRzie9yr4b1+RisGeqtCPPr82mWC8b6XWomVctAtGse4Xfa/1G
 sCPflDPBnUDt53iEKoQaV6y9Np+KNHm96DFxkwELdkJI6J5tk1c6rUkvU7Pu4WCTmfNo
 /3Tbukp9IkDBkaPM1DNVrpHpc4V34cwgAIIH9GOc6fUzg45102xFxTzDuDh6EVDBQPxx
 HmHQ==
X-Gm-Message-State: APjAAAWwX/xt+jOw6Uud1q9o94KLWyxeMYFUhkkuMGKBTgGwQw65mttz
 6JzzOnPP2go6SrfNfcGNIcs1j6605d+DYhSmHNU=
X-Google-Smtp-Source: APXvYqw7Ze0TS0tXKiVTrOqkkzcY/f2Enpq+/Q7SuIXcZOdzLP+S/wVb8jcgB218cBW61fSaAICw6itdksz96UWv7eY=
X-Received: by 2002:a62:2b82:: with SMTP id
 r124mr68797198pfr.235.1558315229268; 
 Sun, 19 May 2019 18:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190517081233.11764-1-colin.king@canonical.com>
In-Reply-To: <20190517081233.11764-1-colin.king@canonical.com>
Date: Sun, 19 May 2019 20:20:18 -0500
Message-ID: <CAH2r5muO=GLx2Hh77rTPqCZ1yP6a0r5yjSEu5j58o__Mni1bsQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix memory leak of pneg_inbuf on -EOPNOTSUPP ioctl
 case
To: Colin King <colin.king@canonical.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next (and added cc:stable #v5.1)

On Fri, May 17, 2019 at 3:42 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently in the case where SMB2_ioctl returns the -EOPNOTSUPP error
> there is a memory leak of pneg_inbuf. Fix this by returning via
> the out_free_inbuf exit path that will perform the relevant kfree.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 969ae8e8d4ee ("cifs: Accept validate negotiate if server return NT_STATUS_NOT_SUPPORTED")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/smb2pdu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 710ceb875161..5b8d1482ffbd 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -1054,7 +1054,8 @@ int smb3_validate_negotiate(const unsigned int xid, struct cifs_tcon *tcon)
>                  * not supported error. Client should accept it.
>                  */
>                 cifs_dbg(VFS, "Server does not support validate negotiate\n");
> -               return 0;
> +               rc = 0;
> +               goto out_free_inbuf;
>         } else if (rc != 0) {
>                 cifs_dbg(VFS, "validate protocol negotiate failed: %d\n", rc);
>                 rc = -EIO;
> --
> 2.20.1
>


-- 
Thanks,

Steve

