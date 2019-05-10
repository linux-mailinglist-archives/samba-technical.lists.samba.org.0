Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3157619622
	for <lists+samba-technical@lfdr.de>; Fri, 10 May 2019 03:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EOAh0EAXMprtkQdTUK5anaqS3bPD8b7XFPhn0PaErnA=; b=hs4VLwUXPo6Lq2fHhBKIOUTVbk
	EDVAtw9Sy7G1OulnnROUrYq0pCz0GW+1Hb6Pw4H9+4hj129Sqc+jwcdlITgrw89SLg3pcsThZrYFz
	NOvOg6fotXBU/hqvJGp8Wa9V4LHrSjuE636rs8u+3ceJF0mMSIPTpdTntbakmq5FEC+Ba1AFBGaY6
	E3iZeiRqIyMlfmB7gni4ye/ykjucbjU3oMPJI02wE9INzurMorazRP2k0AfmGXbtCdyyj5aNbBtaW
	o5pGO52hNsenIGE3AygP7OwiqyBecRfhu+NYvImUFRmwVCWePnONDx3uO05UPr4wMgdpxOAq5xRIx
	N7u5xvHw==;
Received: from localhost ([::1]:60450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOuIz-0037P9-AH; Fri, 10 May 2019 01:26:33 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:44630) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOuIu-0037P2-TF
 for samba-technical@lists.samba.org; Fri, 10 May 2019 01:26:31 +0000
Received: by mail-ot1-x335.google.com with SMTP id g18so3900386otj.11
 for <samba-technical@lists.samba.org>; Thu, 09 May 2019 18:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EOAh0EAXMprtkQdTUK5anaqS3bPD8b7XFPhn0PaErnA=;
 b=b5M1lpT6hP4qopKzw8EsnWW8dHzKzQewoR70I1tV+D07HTmilpC6NOuPqV+r5FdB17
 CzbozNUcA3tplMvBetj2Ru4Wcp5iFkvMVh66ha1RjUun+D6C5fHlq5XvHd/p23HouDAz
 iGoxcPG0OjKAdxCcZM2FSUB9OULzoDqMeZ68PQaiNFU+OGOfVmc1IUAHLv1G2PG6Jzbs
 1PC4DsgEHXPIunrnMR8fkfVkSViOCekfcHdrtLZRl1VjRHTUO2n7m6rn7SiaLqZ8AP6l
 lPoy9r3f7+Z1mMJAshqwA6vcua+hVVSiypBcv64jx8jNTJuyWiiOyrRxveDD9dYjmMpN
 /lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EOAh0EAXMprtkQdTUK5anaqS3bPD8b7XFPhn0PaErnA=;
 b=dxdXKX//BVYYhwWWUrOtH4p9CsXiKeW+c8qzrfPK33vT/rNW6AvOUerwTYc/LG+qFH
 Qq6Ike2btweY8D3C9ETdkR4wKAM0mr4cfGgldXWwIf9y6mVp+Vx3AnFx1PrQEmco66Hw
 9kYf4DTMBdqzAPk/fhHB8NhwVfgX2Ejmd18ImdEwlva8cpdPDOwXypcJtmC1fFJeavR9
 D1z39AH6N0L0fIabFxAgsKTXJxA+5VlzkadxGvvd2/Q562QqJKnzv/y2yuI95t/uxxAd
 bVpS0NJN71SFViMkusYUfw/BlwYVsPfTTqToN3wESpQWJzyfVrkfHP5rxvpG4g1VPxOU
 lY7w==
X-Gm-Message-State: APjAAAX6IYMBoERyBkU5en/XbNAa34ReZTwup7ry5YieIRq/5oKQ9PCA
 XP4Yuy6fumb0vmplrA3oZCOrqGvpxWOU26/dsgkOkQ==
X-Google-Smtp-Source: APXvYqxSnISjMICiihMBQK+fdupO5Q3LufZKG5zxfGu/A673DasPjEoFhzXdN3s6PvR/XIuOupJUKlfYtG6v711H984=
X-Received: by 2002:a9d:27c7:: with SMTP id c65mr4881492otb.335.1557451585730; 
 Thu, 09 May 2019 18:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190508113456.2540f112@martins.ozlabs.org>
In-Reply-To: <20190508113456.2540f112@martins.ozlabs.org>
Date: Fri, 10 May 2019 11:26:14 +1000
Message-ID: <CAJ+X7mQ7+=CKw8F+8Htj=035iMLSTuSAmcVhXfy+UA9wSvHOVQ@mail.gmail.com>
Subject: Re: [PATCH] ctdb-tests: Add dump-logs command for local daemons
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 8, 2019 at 11:35 AM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Dump a single merged log to stdout.
>
> Very useful for helping to debug local daemons test failures.  rsync
> ctdb/tests/var/simple from sn-devel, run this against it to see what
> was happening on all nodes.  :-)
>
> Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/60261138
> (just started)
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

