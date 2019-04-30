Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78CF2B6
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 11:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=O71BR93nfVKV7X+BaaevcM23d4NroedovEN8YpLCNFc=; b=B++HvAAGsyQdYGlFR/jL6K7560
	oPS3IWRpGZUXlHUhvzY1MmVCvA9V/kCMB047BMpQOYGSU54VDx1Ds4cljZQLZ6RG91tF14a7uv5Ls
	T/lAJxERpvywqqnfHa+UT3u8L4aaaagAQM8hcema7+jAG8ei/5cD3e3nU4i7TojFrU3+E0s9ASXYJ
	9OfUK8cxKOjunK8RJ9PwJSLmicMRwtkw7MH7ngj0htifLwKaXjNkltHqbIFKdk4UKM+oghuEgUJLc
	sjE7gCmeik08c169DGay7YZHSgOxxs+2jiglducFXUWRtf0SBPlVH8xSes3EEAQLG8zxdWxDkJsOR
	F6LTo4UA==;
Received: from localhost ([::1]:32790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLOyN-003ohz-Ax; Tue, 30 Apr 2019 09:22:47 +0000
Received: from mail-yw1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:46929) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLOyI-003oh6-Ts
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 09:22:45 +0000
Received: by mail-yw1-xc2e.google.com with SMTP id v15so5340093ywe.13
 for <samba-technical@lists.samba.org>; Tue, 30 Apr 2019 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O71BR93nfVKV7X+BaaevcM23d4NroedovEN8YpLCNFc=;
 b=JcInW5rB9D8GUPZ8eanzEAStA6lvRQhboAjNfLzzLdXysYXomWALWwxj8+wTzvVYpa
 jLBy7vcbQaJD7mn8T5Sntys7faEG9YVKoEsGk7SwAh6x6cEYHNgmj8A2haTuJ+kyho0w
 ZloKwHb4U+H7rrb30t5RK0fyGo//KfIGrV7iYEYDfmnKtk/4nU3zTb2cnI0ux3hc2VF5
 MFyzzzTCYOA3bKMbJEnpkbcJGTbyxNno8ZMlD/MqkP3wKpg4r67bP3mhDMRpFThrIpcB
 tP9+3s8Xdq/IhNwAbwJJBEstIfHnp22w7/Kbmxgi5D9Ezmvu6/T0JG1EBV0Vwc/j2rrY
 X9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O71BR93nfVKV7X+BaaevcM23d4NroedovEN8YpLCNFc=;
 b=IOfO9lIBhu7/f6WWnx/TNxQnf13a2FATxXQD4xVRZ7Y6OcahEueARJUWzvDUAGMxqc
 zUiFSXmJfzKLfdwUXBg9Zw5SFleg55zWH+VQdxy7qGy+BpLAE3h75r4UQOQh/Cf7HTHO
 mRcFjPI5vIOv6FwfXPICaKKnQtSVh9M9vmUuZGhS0ixcDlEOI4BNFRNHhElxz6+/c7PL
 RPje/OJglQtKuxdP40oOvHMSe+oc527D7vh+7CyeLuyBdIELDJSPoSKNxOrj96ThnUce
 kFXqXF8Sbx6MpTn7MEI8ls+L22OOroQsjAIJsUrugBBlKedbm/liAsYsLGtMQ4THMuN3
 e2jw==
X-Gm-Message-State: APjAAAX6G892lGfr4rjKXT7ekuVHc6Yvooxq6vUF7/SnAjf0ViiS9Oa9
 OLsE0brqJbcsBEMZ4O/Ck+KL46mIdhpRPoT9p8U=
X-Google-Smtp-Source: APXvYqyJZqlIcP4RcRxCE9J+CCDpDAOQezVG4wmzGr92TpdSb96QB+9P1jtwCzw83+ORzm1Cz6J4GtL1iisDo0MaJVw=
X-Received: by 2002:a81:1150:: with SMTP id 77mr54593542ywr.241.1556616160900; 
 Tue, 30 Apr 2019 02:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxjQdLrZXkpP30Pq_=Cckcb=mADrEwQUXmsG92r-gn2y5w@mail.gmail.com>
 <CAOQ4uxhuxoEsoBbvenJ8eLGstPc4AH-msrxDC-tBFRhvDxRSNg@mail.gmail.com>
 <20190426145006.GD25827@fieldses.org>
 <e69d149c80187b84833fec369ad8a51247871f26.camel@kernel.org>
 <CAOQ4uxjt+MkufaJWoqWSYZbejWa1nJEe8YYRroEBSb1jHjzkwQ@mail.gmail.com>
 <8504a05f2b0462986b3a323aec83a5b97aae0a03.camel@kernel.org>
 <CAOQ4uxi6fQdp_RQKHp-i6Q-m-G1+384_DafF3QzYcUq4guLd6w@mail.gmail.com>
 <1d5265510116ece75d6eb7af6314e6709e551c6e.camel@hammerspace.com>
 <CAOQ4uxjUBRt99efZMY8EV6SAH+9eyf6t82uQuKWHQ56yjpjqMw@mail.gmail.com>
 <95bc6ace0f46a1b1a38de9b536ce74faaa460182.camel@hammerspace.com>
 <CAOQ4uxhQOLZ_Hyrnvu56iERPZ7CwfKti2U+OgyaXjM9acCN2LQ@mail.gmail.com>
 <b4ee6b6f5544114c3974790a784c3e784e617ccf.camel@hammerspace.com>
 <bc2f04c55ba9290fc48d5f2b909262171ca6a19f.camel@kernel.org>
 <BYAPR21MB1303596634461C7D46B0A773B6390@BYAPR21MB1303.namprd21.prod.outlook.com>
 <CAOQ4uxirAW91yUe1nQUPPmarmMSxr_pco8NqKWB4srwyvgnRRA@mail.gmail.com>
 <677e86ee-59b9-0826-481f-955074d164ed@samba.org>
In-Reply-To: <677e86ee-59b9-0826-481f-955074d164ed@samba.org>
Date: Tue, 30 Apr 2019 05:22:29 -0400
Message-ID: <CAOQ4uxiwDPDyQPrPkUzZCO8jkySRiSK+AZu1dxppXvVA4q6XnA@mail.gmail.com>
Subject: Re: Better interop for NFS/SMB file share mode/reservation
To: Uri Simchoni <uri@samba.org>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 Jeff Layton <jlayton@kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Trond Myklebust <trondmy@hammerspace.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Pavel Shilovskiy <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 30, 2019 at 4:12 AM Uri Simchoni <uri@samba.org> wrote:
>
> On 4/30/19 3:31 AM, Amir Goldstein via samba-technical wrote:
> >>
> >> About O_DENYDELETE: I don't understand how we may reach a good interop=
 story without a proper implementation of this flag. Windows apps may set i=
t and Samba needs to respect it. If an NFS client removes such an opened fi=
le, what will Samba tell the Windows client?
> >>
> >
> > Samba will tell the Windows client:
> > "Sorry, my administrator has decided to trade off interop with nfs on
> > share modes,
> > with DENY_DELETE functionality, so I cannot grant you DENY_DELETE that =
you
> > requested."
> > Not sure if that is workable. Samba developers need to chime in.
> >
> > Thanks,
> > Amir.
> >
>
> On Windows you don't ask for DENY_DELETE, you get it by default unless
> you ask to *allow* deletion. If you fopen() a file, even for
> reading-only, the MSVC standard C library would open it with delete
> denied because it does not explicitly request to allow it. My guess is
> that runtimes of other high-level languages behave that way too on
> Windows. That means pretty much everything would stop working.
>

I see. I was wondering about something else.
Windows deletes a file by opening it for DELETE_ON_CLOSE
and then "The file is to be deleted immediately after all of its handles ar=
e
closed, which includes the specified handle and any other open or
duplicated handles.".
What about hardlinks?
Are open handles associate with a specific path? not a specific inode?

I should note that Linux NFS client does something similar called silly
rename. To unlink a file, rename it to temp name, then unlink temp name
on last handle close to that file from that client.

If, and its a very big if, samba could guess what the silly rename temp nam=
e
would be, DENY_DELETE could have been implement as creating a link
to file with silly rename name.

Of course we cannot rely on the NFS client to enforce the samba interop,
but nfsd v4 server and samba could both use a similar technique to
coordinate unlink/rename and DENY_DELETE.

Thanks,
Amir.

