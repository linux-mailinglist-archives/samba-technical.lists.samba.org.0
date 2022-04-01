Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 715C24EFCDF
	for <lists+samba-technical@lfdr.de>; Sat,  2 Apr 2022 00:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ibv7hjPooUg+cfvEtghGL5hSRPahsD9zFXXRzSZ+XoY=; b=UYigYrQ96kTDeK6D4ipyz3+vQY
	WvqLxBgDLKqnrqVm4OniVSG/6U4x67ICFSlNE1lJIZwzFjTN6r3pNSrS+7q4lE2iHbZMPrGRw9c+1
	0CaYc8+71RLqE1azHM2eQyv4E+NXA/e8D8XbfHh5mvQRTzSNT3tQCztphxs6ljytVkD+T6u4h8XZR
	iyRmLpEGhzP/+sikwtcBUOTb+LlhIrh1YfRlnPXG70FHWUh89rhUZxsuX3STtOyksjNtQKlxih7q+
	XAokqVCzlRpWCxCF/lUO/LEEHHjwpLL2zcjK9rocINm/MA/Ml4pZWD1+WSb+JGHQQFTNLTyBxZXPT
	+pHiQoZg==;
Received: from ip6-localhost ([::1]:43242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1naQ0k-009MkR-7R; Fri, 01 Apr 2022 22:44:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:47080) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1naQ0e-009MkI-Gm
 for samba-technical@lists.samba.org; Fri, 01 Apr 2022 22:44:50 +0000
Received: by mail-lf1-x135.google.com with SMTP id e16so7356096lfc.13
 for <samba-technical@lists.samba.org>; Fri, 01 Apr 2022 15:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ibv7hjPooUg+cfvEtghGL5hSRPahsD9zFXXRzSZ+XoY=;
 b=PeGRrVIRDfksKrlCQFDeVeOo5EG4l/ke4QBxquqnC2URzOjxADt3EAKpBASnA24wWH
 4lujpUtOex3q36ISwLA7GqkE9FSVvTW6A72DIzt0EbRFJEUFialbBrrcyC/jVoNYqxon
 z66CEDQU8NfACq9o3OFhQ+j4JR0pjpSyK08adU82V7TaudcbmUfil4eXkuP/y6qfJff9
 zv288j4MbHmoHxzhBzM8Q1O8d4nIOBQ/Bh4kK0j+CBdDjgxvNy6/jWUq+VvHmy0PmI4n
 3xcLw4/LGxekXH/3Y8NEBiZcjFFyCof+wOguwC2XdcyC24srKC6Iz3IzZYPVRApWaq7K
 ZnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ibv7hjPooUg+cfvEtghGL5hSRPahsD9zFXXRzSZ+XoY=;
 b=mAa5w47eBvJWcIkNdpeLHuC/uhq951twJbYCGaSq/q868mPUb5WkrEC4vFywBVKy2J
 SaavfgPPZOr3tXIcBpQtIgi9Rf7HwEp7dNLbrAcyEZUKyjvotQUv1BSQs5+k5scKlYx1
 fFCXRUzpPbDmb1wwNhGzYd2EUAkFpK4rFZkOAWTmd2I1kqd2D0zG0eyeHFav9Rwpd6PQ
 nDGOonWK/cKA/6sHpsmaSwOWSt+4qwnMQIXHQorRBWisY+iLCY4VdintxKAvX4XrlkEg
 oo8qOr52Eqzz7J+JETsFIefysNx6GOk2vboa13NXhDWuUKklhtVf6c6thlELRe5+dusU
 pugA==
X-Gm-Message-State: AOAM533W09EVP/M1a7r21LJaMHsaYtJaN7qSuY7STS7VF74IpndOCxFk
 ILEydKk9+Il/PP2mqXAF8ahHeBiM9k36P7rWCHI=
X-Google-Smtp-Source: ABdhPJxrs5fSlNWnALwwUXR0mZMrAGAzRjdfOA/LjAHNqmMD9l69PAjCiqYAQtSdEHps123SkZCho3qgOEMHwfgdG9E=
X-Received: by 2002:ac2:5444:0:b0:44a:846e:ad2b with SMTP id
 d4-20020ac25444000000b0044a846ead2bmr15448715lfn.545.1648853087123; Fri, 01
 Apr 2022 15:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220331215541.883746-1-jakobkoschel@gmail.com>
In-Reply-To: <20220331215541.883746-1-jakobkoschel@gmail.com>
Date: Fri, 1 Apr 2022 17:44:36 -0500
Message-ID: <CAH2r5mv-GCwR74QEv4WncTN6KMHceCT+YcLX7SnmuZwO67DuFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] cifs: replace unnecessary use of list iterator
 variable with head
To: Jakob Koschel <jakobkoschel@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Steve French <sfrench@samba.org>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It looks like this no longer applies cleanly.   Can you recheck
fs/cifs/smb2pdu.c (function smb2_reconnect_server) and see if it
applies now that it has changed e.g.


/* allocate a dummy tcon struct used for reconnect */
tcon = kzalloc(sizeof(struct cifs_tcon), GFP_KERNEL);
if (!tcon) {
resched = true;
list_for_each_entry_safe(ses, ses2, &tmp_ses_list, rlist) {
list_del_init(&ses->rlist);
cifs_put_smb_ses(ses);
}
goto done;
}

You had this:

--- fs/cifs/smb2pdu.c
+++ fs/cifs/smb2pdu.c
@@ -3858,7 +3858,7 @@ void smb2_reconnect_server(struct work_struct *work)
  tcon = kzalloc(sizeof(struct cifs_tcon), GFP_KERNEL);
  if (!tcon) {
  resched = true;
- list_del_init(&ses->rlist);
+ list_del_init(&pserver->smb_ses_list);
  cifs_put_smb_ses(ses);
  goto done;
  }

On Fri, Apr 1, 2022 at 2:23 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> When list_for_each_entry() completes the iteration over the whole list
> without breaking the loop, the iterator variable will *always* be a
> bogus pointer computed based on the head element.
>
> To avoid type confusion use the actual list head directly instead of
> the last iterator value.
>
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  fs/cifs/smb2pdu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 7e7909b1ae11..4ac86b77a7c9 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -3858,7 +3858,7 @@ void smb2_reconnect_server(struct work_struct *work)
>         tcon = kzalloc(sizeof(struct cifs_tcon), GFP_KERNEL);
>         if (!tcon) {
>                 resched = true;
> -               list_del_init(&ses->rlist);
> +               list_del_init(&pserver->smb_ses_list);
>                 cifs_put_smb_ses(ses);
>                 goto done;
>         }
>
> base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275
> --
> 2.25.1
>


-- 
Thanks,

Steve

