Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A564316D
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 23:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cMcs5N0+5w+YMsPx8cioSSiHga6D/NRXY5khEKdKhoc=; b=KNIH2w4V5cfX5AwJ6nHQwvSqkf
	tdTVTy2AlarrSm1N1axkPK6lneZTZcoQHu09npcVpSx+x5Iwp76KyOXakki2iGKcdUi6wGXdEiVSn
	4U2KvhM4YenqjeqD2uy5/TgDhE4/Bw2IWLC9/6bZ484UF18nkS6j/fDpvB2ozNQkfDts6fjZ4gIyY
	PjxJXZTOkzX9mZAcdPekOwFi6lFD1JJLvWafKG0GmzGT6K/hnTGbm8/p050ds4ELKhIrQ9AKPgsIw
	rKjND8YnbS9QwkqAM0gNXIKAHfLcb+sMNwXfGPZz481lS/99hCgYlVHlCwGH042SVatKsxEUURqja
	l2pwMSew==;
Received: from localhost ([::1]:65370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hbAeC-001NR5-7G; Wed, 12 Jun 2019 21:19:08 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:43164) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbAe7-001NQy-9g
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 21:19:06 +0000
Received: by mail-lf1-x12d.google.com with SMTP id j29so13307506lfk.10
 for <samba-technical@lists.samba.org>; Wed, 12 Jun 2019 14:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mandsconsulting.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GfyKF79lwVoGWT5xKByAOFev305MraTGW4A5y+Ituq4=;
 b=lCdh14J3fIbRN9AN0flFVlw7jo8CSrEv17sG2miMRCX0+HudMUlghMucZbLmTuCGxZ
 62RX1IQBgP0r7MFu3i1gzpZ5BkzOaY8YTqQB7Ma7Nfnaq2GZu6oiWdkP2FkPHcOfFhaD
 8rPPYshr/nCkeiQ8pyu6Ds/OeHZftJYaP4Y8PQuzvcurMlySzj1UnljTpqZXbyiMkjMr
 ETAX+bxQzB40dKWhvPH7OOFE5bpRukto7POqX4htBsR+n445mlsxV9FfeHpzp54vBPNe
 Q2lwRT3h2NICW7fLy33futcqiM5oocschPqiwacJsfpMqoBMhfZvxqf+YhjqrlRf0ube
 m17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GfyKF79lwVoGWT5xKByAOFev305MraTGW4A5y+Ituq4=;
 b=mMsu3VomoxC0IeT028mdJ8E99kXocN5dhgcwZp+0QUcCdNjfS0g2gbbVGw4pEuFH2s
 gyel6E5VkZxmBj9FEWmBL6GQt3qHYZiy3a1mIanFPEcOUSYetsliJ08xF58shR07Ngwu
 WY/af8HK6jMe5l9RdKICCX9aWykP/NG8jQ8/72vfusaEFDIQyWDdHTf4J11s67wt+/bN
 eTPM0WeNTWTjNGU3bJyrgi3vETx+lDyIaB7C/+k52VYh3xuPl5jZxhaczmHp2zkfVC7B
 FglFTz5WDtTiASN8HpY23E5K67daSXvrZtzv9z5oyR1OdrpVVQYe97NsnjxWB/YhAmVi
 3I3Q==
X-Gm-Message-State: APjAAAXbaEG7FvEKgag+0F6No/97lf/shvDkdLRvEA+FefNxv2jpAzEJ
 0Uum7W5bx4sSvE/3i10gZhnNN+6/7yBLtl5B6uX85sq/IbM=
X-Google-Smtp-Source: APXvYqym2PAn9fBRS1X1YJFQilIA814FEH9s+qwx2DZ/2ALDNc7s+ME+uujaLkDoRyft4Sv4HeCcsmmL9zQANMDLwxw=
X-Received: by 2002:a19:ccc6:: with SMTP id
 c189mr10955879lfg.160.1560374342155; 
 Wed, 12 Jun 2019 14:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPKK0PPaLLXnh5Gu-EHeUGcKkATp4rva4LzcnhCU3SsACMyb4w@mail.gmail.com>
 <CAPKK0PPxz7RSLqE4NOmXah6_qvpbwM37XwxYOX035QQ9mi3XGg@mail.gmail.com>
 <52115dfa88ecbb8f13436cdf8d6641d0cda4728d.camel@samba.org>
In-Reply-To: <52115dfa88ecbb8f13436cdf8d6641d0cda4728d.camel@samba.org>
Date: Wed, 12 Jun 2019 17:18:32 -0400
Message-ID: <CAPKK0PPpCM9AELyFhCq87pRcE4oO_oTTdYh_UZGnxEL7z-4Z3g@mail.gmail.com>
Subject: Re: ChangeLog
To: Andrew Bartlett <abartlet@samba.org>
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
From: Steve Cook via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve Cook <steve.cook@mandsconsulting.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

So that tool will fire off on an individual user change password?

On Wed, Jun 12, 2019, 4:52 PM Andrew Bartlett <abartlet@samba.org> wrote:

> I think you are tooling for 'samba-tool user syncpasswords'.
>
> Samba can store passwords in GPG encrypted blobs (for plaintext) or
> crypt() format (for e.g. OpenLDAP, shadow files, Google etc).
>
> Andrew Bartlett
>
> On Wed, 2019-06-12 at 07:34 -0400, Steve Cook via samba-technical
> wrote:
> > Can anyone point me in the right direction?
> >
> > On Tue, Jun 11, 2019, 2:10 PM Steve Cook <
> > steve.cook@mandsconsulting.com>
> > wrote:
> >
> > > Hi All,
> > >
> > > Is there a implementation of a changelog within Samba4?  I need to
> > > be able
> > > to encrypt and store password changes for a user.  I then will have
> > > an
> > > external tool that will connect to the cn=changelog using the
> > > decryption
> > > password so that I can get the clear text password to change the
> > > password
> > > for the same user in another directory.
> > >
> > > Thank You,
> > >
> > > --
> > >
> > > Steve Cook
> > >
> > >
> > > [
> > >
> >
> >
> --
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>
>
