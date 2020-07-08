Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 964A7219055
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jul 2020 21:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Duh0uzOj6J07aRq7UMRgOSSfvFLEiW5kUERh4WPwHHg=; b=GAo1AJb8fWq2WhNuolOOVSyikf
	qb/Zsrwi0RM2vXeP3l7uZDsQszmB2cnpoloF/D9/USEpC1dOl9eODzOD8wIU0bMHLPgyEEaQHP0OC
	Djr6c49ZCLVp4wk8ymfraUdRXBLYwzWFdU6ReCLJC+NBTTkrUHzedIwnGxBATooIb/8kk/B3qHqqk
	sfVtHmyedsWkw+fWY+EkwGw9B4IyZEGOTMxIUMbWGPoKPPN0EUsxGFoEnk5AgutrkMsVYTNCR2esD
	CNLtaR3dsIx7wfcW9eOkLFu8WFZYFMCM6TNwsbWw2vdKgCcLQYN0aUOopQtDSijryI63IoGVuvJ8l
	8QgbNT5A==;
Received: from localhost ([::1]:47286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtFYo-006Fwi-6X; Wed, 08 Jul 2020 19:16:50 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:33782) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtFYh-006Fwb-Os
 for samba-technical@lists.samba.org; Wed, 08 Jul 2020 19:16:46 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id o4so22802635ybp.0
 for <samba-technical@lists.samba.org>; Wed, 08 Jul 2020 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Duh0uzOj6J07aRq7UMRgOSSfvFLEiW5kUERh4WPwHHg=;
 b=MU2BzI+uKRRX9wijdtNdg9K/Ac/Jo6w5hccvcmiXRUqwLeUmzKWeu7jhgi2P0GTAY2
 SSb1Nn1zu9RhkZ0WTOr0hm5JwfJ+BkiLitNE4632uftowy24sspKlJGvV6pQYWCgTeig
 c7tAfOQQdrrN299fqm9t+xpNMWaxWMkRidW3+C3tp2gbK4Xtuh3/RUuo7sD7IlxpkUv3
 n8IJKYkikbttatKfRkMRsn7zJ6VyYrFOOhYqLIGZp4iPmfkAuQehczMpgcBcczNMkehp
 s8f3bpSqKuY7WkLmCQlNc3hWefbCa2FHMUl09wESI/nREDDthnBkK8CspaWDNUlliSRX
 VjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Duh0uzOj6J07aRq7UMRgOSSfvFLEiW5kUERh4WPwHHg=;
 b=cYNCU+jUi/llyN2tj0iGrFPSUGsGiEA5kwYwHC7Kcmp3peOfkv0LCAnsWZ5DnVqHyS
 uQBKGNWUkQPbWmU7dKI042AY6mdijedduzM/BvtDse0225A6Y3wZb7J5Qs0SkGbFSW6D
 mLxa8u5SzygWSs7wXf5Pj9cKQVRbLsZDs1k+58qrsuZE9oZ4Y/AJpmKFr4Hn9DhLkPzL
 b33Ieo1fieGdNAy3sBcWj33lDQM7r0zezqENP0kYB2d8/yw4FWkyO5ihOta4AdDTazEB
 RtvjgxV78ie3cEYcOdjEXGS4ZvsTh7KTezp8+KebruEmPHWmGj1DQO/yd1+ouViAS5pd
 bNBg==
X-Gm-Message-State: AOAM531j5aSzUBB6iOTifHwlSwkXbODK0snjP8HZCunAgPWni5+kI08/
 sbXx+qVZEQltGsVBksqVZan0Z3G2hNzLgTeUjxw=
X-Google-Smtp-Source: ABdhPJwuwAqtceG27ih5x1Na0TG3AUV//us/d4NpSqjtXx4sxn/ZVrDIPWl9miGXubPobCcrPGMAN3pvHHOKaJNsYSE=
X-Received: by 2002:a25:23c7:: with SMTP id
 j190mr32041122ybj.167.1594235800465; 
 Wed, 08 Jul 2020 12:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200707112741.9496-1-weiyongjun1@huawei.com>
 <87o8oq5bzb.fsf@suse.com>
In-Reply-To: <87o8oq5bzb.fsf@suse.com>
Date: Wed, 8 Jul 2020 14:16:29 -0500
Message-ID: <CAH2r5mujuy6NDioDDq0MyMhabZzK1NgeVNCnjgTRnidwbK7RYw@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: remove unused variable 'server'
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Steve French <sfrench@samba.org>, Hulk Robot <hulkci@huawei.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next (for 5.9 when merge window opens up)

On Wed, Jul 8, 2020 at 9:16 AM Aur=C3=A9lien Aptel via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
> Reviewed-by: Aurelien Aptel <aaptel@suse.com>
>
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>


--=20
Thanks,

Steve

