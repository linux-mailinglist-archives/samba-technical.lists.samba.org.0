Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4BA6FB3BB
	for <lists+samba-technical@lfdr.de>; Mon,  8 May 2023 17:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=doKUVaATLsTFPCbjRKXgJuE91kYKCquuIZ7nxmmD9DQ=; b=BqH+PkNOSaalO8hTUIsxeWIN9C
	6Os2b0IUfOti9TS0OWIgzxW2ts5yK2NBVy5cilrd4oZB85NktDsup0iIdlTEArmBwU3z++3Cg5hOX
	qVlQu9lBm3nPH0AniojJZ1b3VCX3yf/8JRMFC0J5V9qjaDAx3z8EmE8h1SVkRnokLeM8HX6ifTC26
	5HlVJ0gcxNZdx35dVOe7/eD/3trisNaqDPidI/wFV+BqVGo9kw7iohVSwhc6VIdZGMgEtkYuyvX6/
	QmkXfgHftECFUQ9LYTQeRkVCs97L+l8DRAk/gMd1gtc7GIH63gcHdiPD9h4m/shIiJRvuDeTyqxhv
	nAdsA+dQ==;
Received: from ip6-localhost ([::1]:36240 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pw2kR-008uvY-Q4; Mon, 08 May 2023 15:25:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17840) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pw2kM-008uvO-VP
 for samba-technical@lists.samba.org; Mon, 08 May 2023 15:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=doKUVaATLsTFPCbjRKXgJuE91kYKCquuIZ7nxmmD9DQ=; b=tDIijWVBNAFohXdOAh7FmXOwDL
 cuwGK3AT1CzngNBkN/mM7uJueBkWHCXT5RnVUHWR8rdOPF+2u4NcUGRY9WEjzzjp+MjNhzCnfP+bC
 5ZlKmjpBy7nwEbqA+jrKpkckPM9g04DwvpGzADVzxnfeID318sDj24p8GZBFUjxs4THR0y/7ofxjU
 QqEN22NboLZFINRzSxklzNZlOzy5qhxDmacQRCvm+v8i16xqKivbJl39sqaqdzCA2YtFke9D0R5rT
 D1UVWwyn7SwxmSgq4LNulvA5bvmGf+QzesHIGrp/lAr1APKA5JROzJ4b5NVY6u1wbVZFa0NBxQ/3v
 L7TIwhre6SUwWylqHbS/ezFsGXwojIS36GWrk2jk2BrwNsnRtpwFCzTvvBtNLYfItg24CEfIztTW+
 luMoLg2VmALONWIAAE935GNzU++M2cJnWieNzLtXzy8oAwxFUlE4njaio76XwkXlJCaqsmjWz6ZTL
 PE7IBMg/HsiQ8XGGxVNW7DzL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pw2kJ-006f8F-82; Mon, 08 May 2023 15:25:51 +0000
Date: Mon, 8 May 2023 17:25:49 +0200
To: Vikram Bharti <vikrambharti33@gmail.com>
Subject: Re: Same error code 13
Message-ID: <ZFkUfX3wj1Ly70JP@jeremy-rocky-laptop>
References: <CAH_vq2GJs3HU2DK0tjHyq7eJT8FD-wPa2erLNk1+OmTBXvaKfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH_vq2GJs3HU2DK0tjHyq7eJT8FD-wPa2erLNk1+OmTBXvaKfQ@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 08, 2023 at 06:42:00PM +0530, Vikram Bharti via samba-technical wrote:
>Hi Team
>
>I am using libsmbclient API *smbc_getFunctionOpendir *to  open a
>file/directory . This function returns *error code 13 *in case of *wrong
>credentials *and also in case the user is not having permission to view the
>file/folder. Now I am unable to interpret whether the return code is due to
>wrong credential or forbidden access.
>
>
>Is there any such API which can *list out the allowed permissions* to a
>specific user . Or just to verify whether the * credential i*s valid for
>shares.

If a credential is valid for a share, you should be able
to open the root directory of that share. That will tell
you if the cred is valid before trying to open anything
else.

