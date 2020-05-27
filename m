Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 599AD1E4FEE
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 23:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UNL1o8Moo5ryTVNHtP/npPsjLifhJ9OkCP0n/RPE6tU=; b=TWXPvSgnWrBUZIia7fuIMmzSD7
	FchIeJ/q9YN5Cmb0sNbgX08+IDswDNFhjZDOx7gm8YH+smyxMlKzfpx0V1jbCwYjvOmmCQiAtFqPq
	sdfqEkoY4PpLgrPssM4HGuv+DmGa1yjyQPiW2GBYtdnXOiXsTDfl95DogG0SOcinvnUT2bxHempTa
	sKS/p1AZCoRbbeP+29CReBW5gBkaz7PLCSpMeOTHJwoZjKIRJ7Q0DM6AWfCm91h3fyJDtChjF2xbr
	y05kuary1Iq6gfyzJF1Q5sUd7x9dK67PUgGylfTR7sDH/ow2tXeeEXI55DN4NlgRsWliFvxkAgsim
	+97fglAA==;
Received: from localhost ([::1]:23488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je3PV-0066A5-Ju; Wed, 27 May 2020 21:16:25 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:33128) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je3PQ-00669y-Ta
 for samba-technical@lists.samba.org; Wed, 27 May 2020 21:16:23 +0000
Received: by mail-lj1-x244.google.com with SMTP id w10so30793677ljo.0
 for <samba-technical@lists.samba.org>; Wed, 27 May 2020 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNL1o8Moo5ryTVNHtP/npPsjLifhJ9OkCP0n/RPE6tU=;
 b=mOStgycQBsnm4yxQLFyfY8wKSiaGOhFPJZijgcNmP164rARokHEmubi8+TTnY+SsDi
 /4n82tLnh2hA0CavRTCXlKtQJLMvinsNzMDCir6cghdZcJU2BRNQFN2LkwQzuysEw9gA
 ZTCZPKnWWisUvUTYQRDLX4rOt8CWxQzaYmb2xCDpsenGekEq+FLxu3T7tWLEXdYHDANI
 w6R3iPRD7PoSOmiBHh0hDBChee7/W4OYDSSjtNwKiWDZueQxoz/3mXsmUAWQrIIeIhDX
 ylGPgB4M0/0qa8XKTbf0BnBGADE5d8LSBHTvRd249bYRo6oPy0E7rC7rt7M/xJvMl61C
 yBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNL1o8Moo5ryTVNHtP/npPsjLifhJ9OkCP0n/RPE6tU=;
 b=tEo1aA6SXVm+Z/yosF8rF6OPlPwytbgOPQ3ISAQn/F8CZ1AXmtQp6/HBnB6U7U2EvF
 HRd6bescV25ZHhTA9Q8E8rRzyPPMLNNPInayHL6utgsujqc1G+bGVbXvjuIm48MfVEz1
 74BwVC9nInIMu+BONxjmVQHNWb7VuzbGlu7HO0ELKOMc22okeJ6u/S4SIURmHL8CDZ6F
 p/ppHN/F6DTTqht0bAyPdo8YLRO+ZzR1ednla/k/XDyqVV3hd4jQtIPoDHY6WTbK9IWO
 Mw+K84pYKv6QZQ6FVEO5J7c+oR7f8JVV1S/uQwq36wKULGNn3TFGVSjU0g/oTayuX2Sp
 wc2w==
X-Gm-Message-State: AOAM532FY/+A2SqsvFwJw03XstGKoP7yhddu4j0oJRLt06xP6ziFTezG
 MkVJEFJidBLpdXVFEGGd+3PXmcS3RQoBIbgdXxQ=
X-Google-Smtp-Source: ABdhPJwi2kHaqezXrSgNDjTDZV6x5wKh+AL3nsvmh2Ak1Bd2sSF87hhwI4MeOd3VmrepME5bz7iLrecSwgTDHOy4s7M=
X-Received: by 2002:a2e:9a19:: with SMTP id o25mr4138572lji.40.1590614179573; 
 Wed, 27 May 2020 14:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
 <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
In-Reply-To: <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
Date: Wed, 27 May 2020 23:16:08 +0200
Message-ID: <CAC-fF8S+Qwba9CTRBo_OB2YGRCWHWJ8W7NkB7=i6ucOf9Ygszw@mail.gmail.com>
Subject: Re: Kerberos features talk at sambaxp
To: Stefan Metzmacher <metze@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 27, 2020 at 9:20 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> StefanMetzmacher_sambaxp2020_Modern_Kerberos-rev0-compact.pdf
> can be found under:
> > https://www.samba.org/~metze/presentations/2020/SambaXP/

Excellent, thanks!

As a feature, I think RBCD will also be quite useful in samba deployments.

> Also checkout the latest wireshark!
> > I don't recall a problem with the enterprise principals in old
> > S4U2Self padata, but I mostly test MIT client, I'll give it a try.
>
> I'm also not 100% sure, but I thought you told me about it:-)

Maybe it was something else, I'll make a python test and try it
against windows :)

> I think the difference is also the client principal in the referral
> tickets on the way back.

Hmm, the PAC in the referral will be signed with user@dom@REALM, but
that doesn't depend on the padata type that was used.

> Isn't that what 'net ads kerberos pac dump' already does?

We should have an enterprise flag for net-ads-kerberos-pac-dump, I
think I have a patch for it somewhere.

