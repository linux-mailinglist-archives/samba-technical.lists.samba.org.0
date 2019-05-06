Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2798E15236
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 19:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Qy+Uvnt48sjAfiUPJQkldDmklRLHRIc2GGNrnTuoC0Q=; b=XgAFzqh6tk5aBKfQC3yuKm7dZD
	mTPZ+aCWlagNaYugLG60rB7L85V1MiTYGEkECtGjBRQ5bGIynw4HRqWpcyVnPUBxQGmnFWbCTX49r
	p//wDkzO20GM57BR60l8zkVm69AXfjkPz3sQaKtnfABkFFScCL9nKqcDPglYn4iSlu8lnnYRtJYKJ
	eJb2MeD9GLfMOIHZY0J6ZIz0G+pUeb7R1u3Xqxb38URtwJ4jnjbf6j550V6h0XkzGjo3MppBJF5AR
	TVp3amLR/p/m16t/4QmpLvR+d0vvuCqpfAStabCPZSSqXQZsKsK8M/TbaHaOdzPZNcMMrlrorpr4F
	WhOmRqWw==;
Received: from localhost ([::1]:25782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNh0V-002m2Z-4e; Mon, 06 May 2019 17:02:27 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45163) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNh0Q-002m2S-MH
 for samba-technical@lists.samba.org; Mon, 06 May 2019 17:02:24 +0000
Received: by mail-pf1-x442.google.com with SMTP id e24so7076101pfi.12
 for <samba-technical@lists.samba.org>; Mon, 06 May 2019 10:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qy+Uvnt48sjAfiUPJQkldDmklRLHRIc2GGNrnTuoC0Q=;
 b=Cz5Eejokd6UGPW9qdjFeTimi9ZTg0DcaFj32df9nbInXYCObQYSCoEkyAChntWZ5H+
 E5FD/xoLySqtV06cAIB523RuTsFNGsmeMHQuQ4PFZrzOzU3NjbnNgPM1zDbIHwE0ras+
 1fmQJDHy3FiA3btWdLmfXNWo+a5ebrpr1qHcEfK+w6CNAlPW69DoCwB9JXNyTOoYKBxk
 +OS7iAiP5ajY19lxbGlrIJAPdtFbDNLsHIqsP2I8eRLJD7+kC4JzLqaj9TJW5LHMsclL
 dDnaa9ZXEAz4Kdq300KGoFHfc4fXwki4OiMKZks27JiVbmI/Pb1QUsVRpUoaN3SuOPEj
 mdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qy+Uvnt48sjAfiUPJQkldDmklRLHRIc2GGNrnTuoC0Q=;
 b=c/w3ntPh/YjBOAdHlqqUyIBaaSwHCzpn0GBwII6WxtaAZNjQIWhB27roh3DPYEWMva
 yPJr5qsY3DLbI37Cd3Vew5RyMO88OUovQt4ckYHHuaJLeWLZpWIMv/m9Sf+ZwA+7RBsl
 USbiqQR3XTwjFKv2ZGrrHkqaoz46Kbe8k1nXeE1bNSNaYGcpHdErsxr53U/p0ZOOfTg+
 vsUJF66TAbRmnfOPrqSuJxrIdsui4aVF3J0um5MZzKyO4Dz4mta3LohmT6gKRPTfOAmC
 +gFPtzFbVWxXeLq6gJidR+Z9BLwGfURekPPADQCacUxxIKma/8rF7rUdhuwqyYdAreva
 JN7w==
X-Gm-Message-State: APjAAAVI8ue2tIfVPVG1mcAPq/h8nMd1b18kXlOKeflsytG4aZ2Rp26S
 mqu5R0a5gvgSV2yi8Ixj1WnLdtzbxd/fIEu+RGc=
X-Google-Smtp-Source: APXvYqzyPYN8ElDG7RR+MU74p733KZu/WFf/OnvpHRT8RjSxRlE0QQwZSM9VxyhJNbI6zJ2HAwg5yMapk+3YEKzN6XQ=
X-Received: by 2002:a62:479b:: with SMTP id p27mr35842131pfi.111.1557162138865; 
 Mon, 06 May 2019 10:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <1557155792-2703-1-git-send-email-kernel@probst.it>
 <CAH2r5mtdpOvcE25P2UuNFpOwsNyFiBWRQELQFui+FJGVOOBV8w@mail.gmail.com>
 <20190506165658.GA168433@jra4>
In-Reply-To: <20190506165658.GA168433@jra4>
Date: Mon, 6 May 2019 12:02:07 -0500
Message-ID: <CAH2r5msK6yNNm_QbdsFZuB5uS0iNRuqe8gSDKvVAiR0N6E3MWg@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix strcat buffer overflow in
 smb21_set_oplock_level()
To: Jeremy Allison <jra@samba.org>
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
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Probst <kernel@probst.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We could always switch it to strncpy :)

In any case - he is correct, it is better than what was there because
we should not strcat unless the array were locked across the whole
function

On Mon, May 6, 2019 at 11:57 AM Jeremy Allison <jra@samba.org> wrote:
>
> On Mon, May 06, 2019 at 11:53:44AM -0500, Steve French via samba-technical wrote:
> > I think strcpy is clearer - but I don't think it can overflow since if
> > R, W or W were written to "message" then cinode->oplock would be
> > non-zero so we would never strcap "None"
>
> Ahem. In Samba we have :
>
> lib/util/safe_string.h:#define strcpy(dest,src) __ERROR__XX__NEVER_USE_STRCPY___;
>
> Maybe you should do likewise :-).
>
> > On Mon, May 6, 2019 at 10:26 AM Christoph Probst <kernel@probst.it> wrote:
> > >
> > > Change strcat to strcpy in the "None" case as it is never valid to append
> > > "None" to any other message. It may also overflow char message[5], in a
> > > race condition on cinode if cinode->oplock is unset by another thread
> > > after "RHW" or "RH" had been written to message.
> > >
> > > Signed-off-by: Christoph Probst <kernel@probst.it>
> > > ---
> > >  fs/cifs/smb2ops.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > > index c36ff0d..5fd5567 100644
> > > --- a/fs/cifs/smb2ops.c
> > > +++ b/fs/cifs/smb2ops.c
> > > @@ -2936,7 +2936,7 @@ smb21_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock,
> > >                 strcat(message, "W");
> > >         }
> > >         if (!cinode->oplock)
> > > -               strcat(message, "None");
> > > +               strcpy(message, "None");
> > >         cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
> > >                  &cinode->vfs_inode);
> > >  }
> > > --
> > > 2.1.4
> > >
> >
> >
> > --
> > Thanks,
> >
> > Steve
> >



-- 
Thanks,

Steve

