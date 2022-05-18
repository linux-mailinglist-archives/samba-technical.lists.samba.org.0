Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE40952C114
	for <lists+samba-technical@lfdr.de>; Wed, 18 May 2022 19:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=j9qJZlrf7XoV6nz7xVhAyF2e66TQZQKnJoytCZw7JvM=; b=Arj08SpADArDbWZtjJQg3Co7wX
	vQvuw7bLnzsTTsMhIDF0ucx2d8IRLTJtxw01tP/rp8a2vOG+9b2d3yb1HC/txPk7WeivmfSROlVZ/
	gCh4WXdeGvhqHXAp/AQfSWURFrZmlkFlJPPtyORDjebKMC+D7tKPRqwxpNbB3YaIy2QKJ691WmlYK
	FdisRxjDGgCCAx8cztj+UEqrtBMbslwWWlF3FJcypJdK8vEj3+MRxNV4PvE1LjHVD2GBOjnaeG+bs
	ZyffpfnWmWnH/uT8ArYQ/ccPo/bl6HP4ndhDpR89jfhUBbGvHNKLt/dNMtnstILQWKIoo/UxQebeB
	ntY7mO/Q==;
Received: from ip6-localhost ([::1]:38864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrNkp-001xK1-MU; Wed, 18 May 2022 17:46:35 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:45976) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrNkk-001xJs-RC
 for samba-technical@lists.samba.org; Wed, 18 May 2022 17:46:33 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so1844159otq.12
 for <samba-technical@lists.samba.org>; Wed, 18 May 2022 10:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=92CM9Ai3YWS8mAkaamrUnIWVXdAxeCX6dhGUfQ8U8ck=;
 b=a8qW8hu/mS9VJs/zlgh1xYQz02tVdgzRQUTeaF1rflIBpImn0p21Qi4YiNAfNcQYTf
 ShEoNdH+dcCiAcjKY0zUPmXRO0yp9ZcxO4veH91KBL8R070+0K8fO7XDV6Y0yMpUfzXc
 xIxZjqgnZ0k2Hi7BdEO5tsm3HhFkz+fKY6l/3FiVijbg9E8PNLAZobwdW1e44lGLE5c+
 blM0fvFpoYaf/W86zvl5sKUz4Z9w4+7b0GlNLbdyne7KHuvGM0yLExHXA1I64VRCBq+O
 3FcqR6PMMe6VlUqBs5qRFmsMP/9srRAQRQA1lUrAbu+awGpTPupF2iUPZP6GzZ1WptwZ
 +0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=92CM9Ai3YWS8mAkaamrUnIWVXdAxeCX6dhGUfQ8U8ck=;
 b=rntb4Ci8U1NjVkY9mbKiuFtXSmoDRd972CX9OGXvHKnpvnv4ROeNbH68nakChV2J2w
 RmlPSb5dP9DszrX9t3etPMoyZ2b86t4suil6ZnRSPC53rTIX9wp2gjukma3TinAY8Gox
 iIi3X2EIUICuv0E00qoJs0R/JYhLx8aPUjnqtlim1MXw1EFcl4i8pXKNIPBWIrEgKBy0
 O3dUKtweWlLf3u67FDLV2szWxjAtsIJW+FkAjogYPHrJPCQgSQaG6pV9/8rO1fs3rVMG
 nwZiSZmT+FYpFuthkAhI2GWlSwDlOMdQsuQexdHXUj9SILu+hrlmIHMi0m2uQD9RPfUS
 qyXQ==
X-Gm-Message-State: AOAM533u1I8r1hFBq9AE2cqoOOl1HydhqxaKm6kcalPZ1i4fcMovHHGA
 67pFqZbjRMb3+1PC/+K/LblNEkVLAtFEGxxfeZNOz+vmF/k=
X-Google-Smtp-Source: ABdhPJyXXztHxipLy0ASYc1CwrxxlyL+DyuuZTd279T/XIeuOYWOHAUZL+rCvxwc/yAGtac1qLhmvcsBA1Vy6v+RkUQ=
X-Received: by 2002:a05:6830:16c5:b0:606:30e1:1a08 with SMTP id
 l5-20020a05683016c500b0060630e11a08mr328573otr.199.1652895988654; Wed, 18 May
 2022 10:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAM61p32DPdUCwLLSXx7Pez_HD8xc7nLQYkVhZFrhNDJ5wT7yBA@mail.gmail.com>
 <68118e13ab297de53be260deeeb3094563ce7f3d.camel@samba.org>
 <CAM61p30zXBnE9dTuyUN=dnqJzJh-=+5W_OvH0hTMGJD4K9Gr8A@mail.gmail.com>
 <a10954d586be4609ef129d45677dad92d25e2969.camel@samba.org>
In-Reply-To: <a10954d586be4609ef129d45677dad92d25e2969.camel@samba.org>
Date: Wed, 18 May 2022 23:16:16 +0530
Message-ID: <CAM61p32khmA0u-YZ2yOLd7_XrcF-OYf_XDoz3amCYhL3JbOMaA@mail.gmail.com>
Subject: Re: ** server can't find 36.40.168.192.in-addr.arpa: NXDOMAIN
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ok thanks for informing me.

On Wed, May 18, 2022, 11:15 PM Rowland Penny via samba-technical <
samba-technical@lists.samba.org> wrote:

> On Wed, 2022-05-18 at 23:06 +0530, Prince Chaudhary wrote:
> > Hello Rowland,
> >  I have this mail id only, can u please share mailing list email id.
>
> You need to go here:
>
> https://lists.samba.org/mailman/listinfo/samba
>
> Register and then post to the samba list.
>
> The samba-technical mailing list is meant for discussion about the
> internal code, not about problems you may have.
>
> Rowland
>
> >
> >
> > On Wed, May 18, 2022, 12:43 PM Rowland Penny via samba-technical <
> > samba-technical@lists.samba.org> wrote:
> > > On Tue, 2022-05-17 at 11:55 +0530, Prince Chaudhary via samba-
> > > technical
> > > wrote:
> > > > Hello Samba Team,
> > > > i am getting this error *{** server can't find 36.40.168.192.in-
> > > > addr.arpa:
> > > > NXDOMAIN} *while i do nslookup to my server ip, this came after i
> > > > added
> > > > reverse lookup zone and tried to get server name using ip address
> > > > although all other tests are successful, could you please guide
> > > me if
> > > > i am
> > > > missing something?
> > >
> > > You are asking in the wrong place, trying asking on the 'samba
> > > mailing
> > > list'
> > >
> > > Rowland
> > >
> > >
> > >
>
>
>
