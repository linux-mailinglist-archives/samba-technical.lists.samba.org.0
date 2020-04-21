Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0D51B2450
	for <lists+samba-technical@lfdr.de>; Tue, 21 Apr 2020 12:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ngf/QJNoLPkbr33G43erLtvjdepFX+w3/5/OAcrCc0k=; b=xVVxdygZmhZiG65JeVXsqusVpV
	8+xPtgUPceXTlVP5vetDmTqi1IUMZQuyYOy59coaX7ZY/NjC+5gFJCMIesWqTN7gSfFJWiSxBqXfE
	6yF7HG2vRCfYKdyjoekkMO5f+6gj+nsKMuwDNGFRlmrOCdQdcR6IKiQYGstt0HopJyvj4ro2sM9fb
	FOD+T8b37Z0tcaj/D+vXqxH9KKaxBcl2WK6UYhKGoxO7QAJkqC1azC2WrSuLAmmEjKF08f8XYdkC5
	kvb2StVq6UhHJzbWEeXbyQ+9KfcEqFKDRhf5nwC1xbgMJL4PtmrLeMzCSLuf4hYE0Ssi7/gYGV4/0
	2gkM7A+Q==;
Received: from localhost ([::1]:22038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jQqST-001N9P-KE; Tue, 21 Apr 2020 10:48:53 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:37380) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQqSM-001N9I-Rp
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 10:48:49 +0000
Received: by mail-io1-xd43.google.com with SMTP id u11so14548364iow.4
 for <samba-technical@lists.samba.org>; Tue, 21 Apr 2020 03:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngf/QJNoLPkbr33G43erLtvjdepFX+w3/5/OAcrCc0k=;
 b=HIkIFZT8qT3vQ0g5wTef0guyS+9vkQoEDDzDSKvzxqc349UrB8FrMo17JrtUe1bQni
 tK15U6ufIgOpq4NvSnjyMAMKBKSWsZlPtfGwTx8CDW1qcXlp9KWSHhjFmVdCb6nRTqBf
 dcgDI/pmlQUqoNdjUtHxkpTX6oq6+5Xfv0hzUhhy7zbk0Q/bJKVDER4/NfnSvI7qd6J7
 O4V/XLno29/dulSI5TYMl0CInM5dv/c4PCsH6mwJR53KXZvYDlDwjXRzvpqm6l7ViSCJ
 uguWrv+AyKaWrr65Rs+aK81IFl6a6ouIzuEiS7cBZvfO67PRQqoGOcrkiFSlNx7SIexU
 nDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngf/QJNoLPkbr33G43erLtvjdepFX+w3/5/OAcrCc0k=;
 b=Bx2sT+QDASq9hKiBBFSbniwR+jf4MxP3IqBt8cjV6PYBNn3dW9YJgvmsTFhukh7bGf
 mWWv6SKpVi9Fo9ioPtLC8yll6zfDadeef0hnC5sfEZH9aTdvxhevq1WWXsVc7fLUCJl5
 r67rqDQ2XaYDEMxPR1SQKoooWyyVgeaVK8vBhEWJ07RDRIQP98JcrmRKP+HDxvp/9XgA
 yakbS8wSmeHIcCoL4FxxoF64pnVCDN8BwL7QVi4X3kGGHBwc2LLxjwgMp88TOj40beRf
 yc3IGBycEAoSm4WyPLqvWj9MNjDyINXm55/T1ddgmhKoAszRPqMO/KklZoSgO+HWLbs/
 iVuA==
X-Gm-Message-State: AGi0PuZmaXbPigx6D27hVHFj9P75FLU+wxsmrdPwHnsUpRueaOFLbGqy
 vSV95ByI9NnzchlcwXfxOoodduaM2IMXAiB/mXQ=
X-Google-Smtp-Source: APiQypLQaqfAcQS/YqcLKdT4ZU5tBP1e1L7GgGmYhCTRc3/Jty+5caS/qwL+I+ImaS0QHoDyYQ/hM6XmrQw1T+La4TI=
X-Received: by 2002:a5d:940d:: with SMTP id v13mr20035780ion.1.1587466124914; 
 Tue, 21 Apr 2020 03:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200421024424.3112-1-pc@cjr.nz>
In-Reply-To: <20200421024424.3112-1-pc@cjr.nz>
Date: Tue, 21 Apr 2020 20:48:33 +1000
Message-ID: <CAN05THQxSOa-YLmNODTXdcdOoEUkX2vMqcNyjP1bcf2=yb_9+g@mail.gmail.com>
Subject: Re: [PATCH 1/3] cifs: do not share tcons with DFS
To: Paulo Alcantara <pc@cjr.nz>
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Aurelien Aptel <aaptel@suse.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

series looks good after initial review

Reviewed-by: Ronnie Sahlberg <lsahlber@redhat.com>


On Tue, Apr 21, 2020 at 12:45 PM Paulo Alcantara <pc@cjr.nz> wrote:
>
> This disables tcon re-use for DFS shares.
>
> tcon->dfs_path stores the path that the tcon should connect to when
> doing failing over.
>
> If that tcon is used multiple times e.g. 2 mounts using it with
> different prefixpath, each will need a different dfs_path but there is
> only one tcon. The other solution would be to split the tcon in 2
> tcons during failover but that is much harder.
>
> Signed-off-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
> Reviewed-by: Aurelien Aptel <aaptel@suse.com>
> ---
>  fs/cifs/connect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 95b3ab0ca8c0..ac6d286fe79f 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3373,7 +3373,7 @@ cifs_find_tcon(struct cifs_ses *ses, struct smb_vol *volume_info)
>         spin_lock(&cifs_tcp_ses_lock);
>         list_for_each(tmp, &ses->tcon_list) {
>                 tcon = list_entry(tmp, struct cifs_tcon, tcon_list);
> -               if (!match_tcon(tcon, volume_info))
> +               if (!match_tcon(tcon, volume_info) || tcon->dfs_path)
>                         continue;
>                 ++tcon->tc_count;
>                 spin_unlock(&cifs_tcp_ses_lock);
> --
> 2.26.0
>

