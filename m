Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD0D4EBD92
	for <lists+samba-technical@lfdr.de>; Wed, 30 Mar 2022 11:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NNnkhHQ01C7+huvKBI3XEi50SrW7iSV3C4lmPY490Ro=; b=R54qXDR4rYwBdl5dh6senfwspc
	BSGrsQjyn7iFUK+WBSDICqbYgw8Dw0XFR6t0PXoVXAI9BLks4bMOqGlQfAUFK7r4IEvaMz4vs20OP
	WKCle3kMUl1j5cKYw7osjH/ImSGejXSI0inOfAC+HK/56p0BaAnlJSQVUod2d8W7R7tfbQHvShje4
	xG73HkIYJbs61ZxyAfIN1NFuXqA0SoKE1MJ9y1SF6MoTOBsx5kIxfLPQ14IiBl6p5YF2lPuj18Znv
	6CY+uyEdmPmpwJ1F7MIIxlwBIXEXNa0vOPn7mFpjqA5aYewU17zhMStXuDcDkDlo70SMA+uhb3/KG
	drYVasKA==;
Received: from ip6-localhost ([::1]:39930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZUWx-006hvY-L0; Wed, 30 Mar 2022 09:22:19 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:33713) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZUWt-006hvO-Hg
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 09:22:17 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso14547879otj.0
 for <samba-technical@lists.samba.org>; Wed, 30 Mar 2022 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vWKaWjNmMGz9cYhxdh5TEJGrRfT6CkUHshuyjvAeXHE=;
 b=Qb6DKhyA+pIatB8jrq1kyNa2r/FaW7TVHzMKSujzxbVon6Lrtfc3xYm5QSSDtRASsp
 OjpABrEn7/Ab08zGNblLMwSGL+U+H4WJLA5JLwy3diBwKYDrDZXuUba72CMc3hkPHJ/+
 AXg5iqa7i20JKu0jy92n3SbmXVmNykC/yCRnm19GmPVA0KrLdnO3GVRdj424g968pV84
 QcU2dQPg5Q+5AyrQFOJyBC2Wd1bu/s0Gj49OzfApJOezVbOlHZ27DCfHR2g7Jb2r7s9C
 gSh53Hac7OFMywoDGaFdG+obEV1Xqr75HprHEMX5L/YqIDlrds9SwcSp63trq/eLzLq5
 cQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vWKaWjNmMGz9cYhxdh5TEJGrRfT6CkUHshuyjvAeXHE=;
 b=7Jq4iSfakZu2m4rmITKh0NnoL4o4CsEAo3kJuJJnXTKtNYSTTeYcotLm4H2HTDGpd8
 rWsUlSBqCKzpAx2gqBvv0dRQro+MBMZtXrYpqPXFUh5rr/uJb3gd3NuVTJSQJWIZqjeF
 rzQXvk16g5EAAYiEaJBWZS0BWSMLUsdhwjo2jRdsimUuWhcLlK+AkS5zYPsbTIiCI7CH
 S6cSWifyw9tNjyIxT8QVm7dDtZN0XjF+XfOSK7IDu19lSlC3iBNJMOxhrJE/1nA1MRQo
 sbFawo7hAMugeTTo3CYCWEbwLlEEGsIXiCbSZqa+BB7dfhQiV4Io95kM1wKOxK5Edgqh
 eZgg==
X-Gm-Message-State: AOAM530QWmUkmfhzVtusJZPRqMGVzozXN2GEyulY6P7MN06EWFEbCu3V
 oNVi0jgHsDK3r6YSZOQc5xzbzUY8905k0lrthKYfE5qkFQk=
X-Google-Smtp-Source: ABdhPJwj7QvJW10Pxlz3F9gX4isv6axH5TzLsFtiUcRuKZIb3JmVREnJSMNeevG+hYDPFPxYC/5CsFtuJ6+ZwS9qJxw=
X-Received: by 2002:a9d:608b:0:b0:5b2:53a1:235f with SMTP id
 m11-20020a9d608b000000b005b253a1235fmr2684537otj.199.1648632132844; Wed, 30
 Mar 2022 02:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAM61p33mA2Oc7v_+iQj8-uuowyJJh2WTfbLGWQHUxiZdAmbLcg@mail.gmail.com>
 <6b999085-4639-ec62-0026-e99d26c5d6f6@samba.org>
 <CAM61p315WDPO0ZKzw2s4z7VPyJw5fV+9pgsesTmLjgo1uBT3tA@mail.gmail.com>
 <f255591a-ecb0-b860-5ac7-582678caff86@tranquil.it>
In-Reply-To: <f255591a-ecb0-b860-5ac7-582678caff86@tranquil.it>
Date: Wed, 30 Mar 2022 14:52:00 +0530
Message-ID: <CAM61p33+=fySB5ED+mZH2SoaW8zXMrB_4gHceyQ0x=yA-LQ1Zw@mail.gmail.com>
Subject: Re: Regarding Mac os behaviour in samba domain
To: Denis CARDON <dcardon@tranquil.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Prince Chaudhary via samba-technical <samba-technical@lists.samba.org>
Reply-To: Prince Chaudhary <chaudharyprince64@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yes i have not checked it with windows server.

On Wed, Mar 30, 2022, 2:38 PM Denis CARDON <dcardon@tranquil.it> wrote:

> Hi Prince,
>
> Le 30/03/2022 =C3=A0 03:46, Prince Chaudhary via samba-technical a =C3=A9=
crit :
> > Hi,
> > Thanks for your reply, i have checked this issue on apple forums but
> there
> > is no exact solution on it.
>
> can you reproduce the issue by joining that computer to a Microsoft-AD?
>
> Cheers,
>
> Denis
>
>
> >
> >
> > Btw thanks
> >
> >
> > On Wed, Mar 30, 2022, 12:32 AM David Mulder via samba-technical <
> > samba-technical@lists.samba.org> wrote:
> >
> >> On 3/27/22 10:36 AM, Prince Chaudhary via samba-technical <
> >> samba-technical@lists.samba.org> wrote:
> >>> Hello team,
> >>>    I am writing this mail after spending two three months on
> understanding
> >>> samba and implementing on mixed os environment (window,mac,linux).
> >>>
> >>> Samba domain works fine in case of linux and windows system,
> >>> But in case of mac when i am joining a mac machine to samba domain it
> >> join
> >>> properly and shows all domain users as well, all ok, but when i resta=
rt
> >> my
> >>> machine "other users" option which allow domain users to login won't
> >> appear.
> >>> I have to relogin in local user and then i have to logout then other
> user
> >>> options appear and then i am able to login with domain users.
> >>>
> >>> Can you help me with this?,
> >>> Why this is happening and what should i do? To make it happen all i
> want
> >>> that other users option on login screen of mac os machine should alwa=
ys
> >> be
> >>> there whenever i restart my machine
> >>>
> >>
> >> It sounds like the MacOS client is having a problem. You should contac=
t
> >> Apple Support.
> >>
> >>
>
