Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E91195F6D6D
	for <lists+samba-technical@lfdr.de>; Thu,  6 Oct 2022 20:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lZAn0nc20ZSyu2thsRn/Tj7cNaQyvi2UZJAOsvF4BlQ=; b=Eu0X/HEZWYyG7Rhhm2FYdXf5EI
	ac4M5SxTuykWVPv+pmegmvQ+ESP1zlVw3cAKTMx5v8dNO67iXHhmGIP090Lx9TOfwestWsmXFvT2m
	yE6S2dLYw8+cGnQDNFCzSBILmeBs4h4t5yTwTMbBqGg2i0xf6Q0nb2ymvk+vFLbQV9mIgeK4EDQTO
	RYWrg8OH1kmrf1cny8BVxAgC8+ZQBFYY67ihdcFv3DJ9FKKCljVP44Z1x/oCj8iSXobl35qPYlcFZ
	ofk4J+4p0uM+ICxrN4vjuAGe0R4ky2dLyF5aQW/fBh9VnG8ZDIkJHXM3QcVuBQIZCkgQGPfTkvnFD
	tCiYV04Q==;
Received: from ip6-localhost ([::1]:63722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogVTG-000HJm-N8; Thu, 06 Oct 2022 18:19:46 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:39508) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogVTB-000HJd-Dc
 for samba-technical@lists.samba.org; Thu, 06 Oct 2022 18:19:43 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id d187so2835275vsd.6
 for <samba-technical@lists.samba.org>; Thu, 06 Oct 2022 11:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=lZAn0nc20ZSyu2thsRn/Tj7cNaQyvi2UZJAOsvF4BlQ=;
 b=daGdrzrc5o5rRc5vGwqSwIeYm7Mh1AZPs0ePiUur68WtEzHBcIhLpPaJtCLqBbBuM7
 4qtpTomSrvmIXsREz+y0Z6/XRuHKpCO4rAKUZKl9cEBx5tEvV/mDhs3g+7ERCBg0vRsf
 nlCkJiFFxzkbMmkmHO/QqkXmSvbVxK5SBhXFgMPYJX37CuzZ8SvobF1bkPimRDckXk7C
 MrulpME8IKzrnUBKjdaklB8j/3WSFl9mEyeYiJgYRXdh0UXkwUTS9BGGKueuOPsfPlsf
 iXo57iwc838tM+ulwWFZNzKGOdPvIyH7girRGj954WxCTiAlAYrekLuq4lTpa9Kj3qYt
 TFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=lZAn0nc20ZSyu2thsRn/Tj7cNaQyvi2UZJAOsvF4BlQ=;
 b=YFUINg1ybekITo6D4bmaeYVPCbXWk7m27Bgih1jhQkUq4/9Q3xNMEOreTUgPTd2TZ8
 WMUeoQPHujvaV5vPhlIxbI1Zu6JuM0zS83c2sP6VIzcPnD5uSO/vL8MYlahnODt5muKg
 bEj17h5wRSGgJcCIN3X1DEA/zhVI5jL9BorH+mJ5sPv8zfjP6I06geaUHdRXxbcwDRl2
 ahKKLROWTK1ujkA6OVE/sedhzcbRWDXTBHFi9vVFr0b7+8SvSuPAAEsGJa4nJIJr5NSk
 TsdIN2d/C6iE/3HXIHK0J61Oz+djo+iOMA+iJOJXVqKmszoQ7P8vOjlbSu/+/psvpq+v
 WDqg==
X-Gm-Message-State: ACrzQf3KSHUADwHNHSttCI8JfnHkbAbJKllTEJ1QyvDg9CMErFZDktDj
 HmdC2NpnooLHweHJYDG4zSYNclzrtNYzeTFCdC4wzt8LI0w=
X-Google-Smtp-Source: AMsMyM6LYZHChCSVA4dq/kWFMPqdj1yU9NVfw9/LfL+G6tUmcWQr9ydPOFLl4HZLj33v/3O5XKIqdCOZeoPfa6b8wFw=
X-Received: by 2002:a67:f603:0:b0:3a6:ff45:997e with SMTP id
 k3-20020a67f603000000b003a6ff45997emr877666vso.6.1665080379233; Thu, 06 Oct
 2022 11:19:39 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 6 Oct 2022 13:19:28 -0500
Message-ID: <CAH2r5mtt7TCJJ12nzSF3NeZpBwV9wbu03N4amGhhY7mGL90T2g@mail.gmail.com>
Subject: missing multichannel crediting patch in Linux client
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Was looking through old patches and noticed one from Aurelien that
looks important but didn't seem to get incorporated into the current
pick_channel code on the client.
It looks like without this patch we could have cases where we assigned
requests to a channel which was out of credits rather than one with
enough credits.
round robin channel allocation is probably fine for many cases except
when other channels have more credits and this channel is short of
credits.  Thoughts?
It might explain some of the perf problems we see with multichannel
not scaling as well as expected on some workloads

"Subject: [PATCH] cifs: try to pick channel with a minimum of credits

Check channel credits to prevent the client from using a starved
channel that cannot send anything.

Special care must be taken in selecting the minimum value: when
channels are created they start off with a small amount that slowly
ramps up as the channel gets used. Thus a new channel might never be
picked if the min value is too big.


-- 
Thanks,

Steve

