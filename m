Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE48A58D6C
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 23:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=waq4UrhklMWTyCBwScmZGD52NdRJjpozkGpLrrrGTik=; b=MudsqgjVvBIAHUVFc0az4/q/UT
	e4mn45HbE7s7c8on4opfxFOr5ATLjkT/ZTHNhxuQEiz2KzOIq3iV44EykwUtoremg3Xfj3N/fQ6tv
	egEFzni2D743z7111D18dK807DaFrrfmSzDj+Bwr77dCsQ244z+Pj7ArtA69r3Wnf1qvBRzGtXoth
	iPo104Bkga2a9lgeuHU+cDM2nQj7uiA4GasejOAArNnD/lHRAiWK76lYdxpqW0k4qxEKk83AzVYe+
	JYE2WgwjpEqNqGQfrXGow2QD7nBHkjb/IkhVacfY3zS58wM8loApjEHL+sANxrMVe6DT0/UjljjXY
	lZLd0Iuw==;
Received: from localhost ([::1]:53102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgcOx-002EkO-75; Thu, 27 Jun 2019 21:57:55 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:45526) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgcOr-002EkH-AP
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 21:57:53 +0000
Received: from [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 2952F810D7; 
 Fri, 28 Jun 2019 09:57:37 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1561672657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=waq4UrhklMWTyCBwScmZGD52NdRJjpozkGpLrrrGTik=;
 b=aR/JupcF8Afm0nX+OYjP3n9GByCzGaXAZ5bOi7JvFN1n1PLqLUQJzqtS104HinuyjVTqDF
 9bVvDzrCm7zlVJiH5KseTiuujxFjl4sniUXiH/bF1LgVk8/KFVUFGWBkIz5FUERK08x1Mq
 +d7+3aW9VTxeNTNJoyPEZFA7u4RPlcUYK6qTdYIvS0UO8s5wu1AlhcEZPKxr/3yqKbbwvK
 mvRn5xyTapWraYOUT3912M8sL4FQPQoE3y0smgTib9rvJIPv3ZQBjhgBmsxt9vNAyYTmke
 XxjLzIvfyhHfQI1doorcVN/p8FnHkKFYS8+1kcucDlEvshNCN9M4FSlYWj1rHQ==
Subject: Re: bug 9612 fix
To: =?UTF-8?B?0KHQtdGA0LPQtdC5INCa0L7RgNGH0LDQug==?= <skorchak@astralinux.ru>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <ximss-1128743@fe1.astralinux.ru>
Openpgp: preference=signencrypt
Message-ID: <890d064e-9f34-91b0-6186-3b9925719abd@catalyst.net.nz>
Date: Fri, 28 Jun 2019 09:57:36 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <ximss-1128743@fe1.astralinux.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1561672657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=waq4UrhklMWTyCBwScmZGD52NdRJjpozkGpLrrrGTik=;
 b=tZfBlk0m3N0Um5Fri8zHmG5pX59ZChzz4y+gLNAcy3FU0+l6fQQk6OhrIaoRQE/3PBn1dc
 cYrAxZMuBUnePjUB2c3q+R1/aw8pVtbNo389xmGuS91NZ3NtkelV4CLwEejkdE5qX3oKQx
 ARQ+/k8ApSfbOm4QgfvtBXYVQ4yh1kgdbP1xK3jvwnx7u9cF0o4x0BzTrV1xl+loYuZRZl
 trsfVdz6MxEfCHFbZM4GI/9wutDQ4l9PbfZw6a2dctBRkPbSiua3vrAAZKTXDKc54ybFzx
 pXMIUyVyLokzlo6nQsaa9lvPtD5vO3wJsPGI6XV3iLMleZW6eHOU7X2WASEWSw==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1561672657; a=rsa-sha256;
 cv=none;
 b=WQNcYlpcrweODaKpyfKV+Gmr0nWNjHqbBfermWq0dmAEL6WRmRhIEXEHvPgJZqYurbXL+5
 1JkOiO/KJaXUZoT4TmtAb0ippXOekXCErG10W5no89J8OXBVJOjDoa1Hon27UZZT8Q5TDk
 u4NNdkxSZ+ryEPPsDaQAcSpjzkrzcp9kRNeK+RwctbcWVIoHB0EopNK9VKEWqrLj60YCv9
 S/9Xt+zWhSaH3AHCLtRXWa+rmCC0Jvo53K+aH6OQsJunWWzrsGMsNKz0Omm1sVKwYlcJq9
 USTsVXJpKI2x4gsFYx3E9nIMm1F/treHhZY4NA7gwc+pjMGm3RSA0dwJYWKisg==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Sergey,

On 27/06/19 11:03 PM, Сергей Корчак via samba-technical wrote:
> Hello!
> My name Sergey Korchak, and i work in AstraLinux company. see
> http://astralinux.ru
>
> I have fixed bug 9612
> https://bugzilla.samba.org/show_bug.cgi?id=9612
> 
> According to GNU GPL we wish to publish our patch.

Thanks for your work on Samba!

There are a few more steps to get through, not all of which will be
easy for this patch, for unfortunate non-technical reasons.

Firstly, and this is the tricky one, as mentioned in
https://bugzilla.samba.org/show_bug.cgi?id=9612#c5, our Heimdal is
horribly entangled with upstream Heimdal, so we really want to get
patches via upstream.

Secondly, I anticipate there might be stylistic issues with the patch,
though it isn't for me to say, since we're delegating review to
upstream Heimdal. Nevertheless, I wouldn't recommend doing this:

> +// Begin of AstraLinux patch by Sergey Korchak

> +// End of AstraLinux patch by Sergey Korchak

People will use `git blame` to find that out when they need to.

Thirdly, if you are wanting to contribute to Samba directly, could you
please send in a Developer's Certificate of Origin as described at
https://www.samba.org/samba/devel/copyright-policy.html.

Thanks

Douglas

