Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B993732EB
	for <lists+samba-technical@lfdr.de>; Wed,  5 May 2021 01:54:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=t75tWXbBgByRZFTkhAR9/oUxzRmr0oZo8LZvBN0cUtA=; b=wFcE+yj41ZdLANskwZmPCzofRr
	rxqaCu9jXhrYVHlZflwZLgYGtTVhvF1ba+yIcK9wjjoTGHlVgkCWuO0wTsw5vubkwZsHxcGpkASgw
	vZdl4sLhp+Ki91VZmxOpier/T0in162+OWr7b/mGY/iy8A2/LXksSlM2Ftsyj2ESFt0+fhlkX7hzG
	vDHZsJmvyEGDKf/FCm04n1udRmdWnPJ+UZP19CUxkIFuICnK87oE5QiBxPHEtxaNpBmox0oTY1Lyr
	caspWG9lPoKqjA4pPNkP7wnvYbKAa3cwVbVgxMaL46rpg4lK/401Sx23sOjsLA3TS4ANAoRBm97UR
	eNsYtqfQ==;
Received: from ip6-localhost ([::1]:19226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1le4qP-00FTZ7-3y; Tue, 04 May 2021 23:52:49 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38638) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1le4qI-00FTYy-6t
 for samba-technical@lists.samba.org; Tue, 04 May 2021 23:52:44 +0000
Received: by mail-ed1-x52b.google.com with SMTP id n25so12455666edr.5
 for <samba-technical@lists.samba.org>; Tue, 04 May 2021 16:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t75tWXbBgByRZFTkhAR9/oUxzRmr0oZo8LZvBN0cUtA=;
 b=HAGWlcDcJbckYVcOSDvbBR7PearmDEARbBUyf7VdDy2o453GyFU7NkIE4KMN1C7T1b
 PnqNvTtyflXsCajoJcXZ1iXsrDFu2W7aZoCpSuXi9y4KYKGeZQRjsHTItyLE7syfJEX9
 qyW9wBzH5S7NOT7hiNBnYOlhv7wBC65nTfNl3YVeAfN7kf+4a7dSouF014TUBP9M1Gp9
 V/4V5XhYBjAuAOxUxJIP9EzoB5IAmCneyBL1ZdA44r2US4zL3TMUTWSpaz5b6dqEHU6h
 VeYKbkT09xWBNIDgTDDQDvSD4HeGVkt3LK54QGLBQfxDJdBuUbuQMP8rC7F5G/IuPmXm
 TWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t75tWXbBgByRZFTkhAR9/oUxzRmr0oZo8LZvBN0cUtA=;
 b=r8uebAu3iAnsNDVYLDb4SlpnEOiVF2sdbM0ijSCfN2h055LpVwbuiLYjlJKU83BuQt
 k8isp9kNSAFfqUP074mh0NisPyi3590PnY+9OgxBBTfdj2uc3pqpshnFCX/iQCP2kbJI
 9OtqfN4bnm58XtCjT4Grwa0saU/49LnnIJdUfCt63Y4uAu9ORulpIPHjwfOawFgMDpmB
 /Iy6D4ENM1mbRNPP6Z76nxiMpRV9iNvsknPKFkpkX4Zz1TdRo4r5CUZuUyBahosYEQJ7
 l5ilcClH7ok+T7KVnVIl7umEMGFQyp2IwUF9BloJRGfSHND6G9txpLrcEMEegHKg7OyK
 xRUg==
X-Gm-Message-State: AOAM531LrumT3wq/oVamd5VhLORkdQCa3bcN6obU6XOt3DMSNMTVyn5g
 hxUJFYJx/zrzCBlheUUki4oPCWnT67tlKtg6YLo=
X-Google-Smtp-Source: ABdhPJyvbH50lMvnBqimGhuTMkE/vCQMFzw6IKIywOhJvTsjdET41lWgSkGgHdchpCOgYrdjgNvcfN/ulEzeh4e52kA=
X-Received: by 2002:a05:6402:12c6:: with SMTP id
 k6mr28356528edx.372.1620172361427; 
 Tue, 04 May 2021 16:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAC6SzHJXOrFWYas9TT7EkE3AuiwXHEZtQaVsCHVg7DbhpeAbJQ@mail.gmail.com>
 <ab76b10f3f63cdf970843fb407cae78c8b88eeb3.camel@samba.org>
In-Reply-To: <ab76b10f3f63cdf970843fb407cae78c8b88eeb3.camel@samba.org>
Date: Wed, 5 May 2021 07:52:32 +0800
Message-ID: <CAC6SzHJiuxD4YnJ59wtMXPxgFYR0oje-TX9MEpQ9rt=jyE4GEg@mail.gmail.com>
Subject: Re: simple password sync method
To: Andrew Bartlett <abartlet@samba.org>
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
From: d tbsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: d tbsky <tbskyd@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Andrew Bartlett <abartlet@samba.org>
> On Tue, 2021-05-04 at 15:39 +0800, d tbsky via samba-technical wrote:
> If you know the target password type (eg crypt()) then we can store
> some such passwords without the need for the GPG key, and run the sync
> from there.
>
> eg set "password hash userPassword schemes = CryptSHA512"
>
> We won't be adding the 'samba3' style password sync to the AD DC, due
> to locking requirements.  At the point where we can process a password
> sync, we have to lock the DB against all other changes, and it would
> risk service to all other users to start making calls at this point.

  I can not predict the password type of the service may need sync.
but thanks a lot for the explanation so I can understand why it won't
be implemented.
I assume you mean system will lock the DB when password change so it
can not process other request at the same time.
if that's true, then a correct ugly hack to trigger a script would
just cause system slow down instead of horrible race condition?







> Of course Samba remains Free Software and you may make whatever changes
> you desire for your private use, but this is our feeling regarding what
> we will allow upstream.
>
> Andrew Bartlett
>
> --
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
>
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
>

