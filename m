Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F69933A4A8
	for <lists+samba-technical@lfdr.de>; Sun, 14 Mar 2021 13:13:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=eTAapuMtkgcbeUzI1qucnDMGdIhcQxAiHU45JNcZQSw=; b=cWzRWMisPvIAajWaAiCv08cu0C
	Dxv4h4BzfPZkTI42DE2VhAH6e5SXC6iHZnNMEjpMpzYvWPshWnR6ogBdLCJ0QOY3Qs9bOtos97dVP
	9gt8xk4DtsbeNoOJpn/8RnFye5Uw7yiiEiNnqYtqjGxu1uQSN7p2qbfllz60VlFaaImVNNSUUUGdo
	nUnTTCmXO2jy/39wTAg5F1Gld4bKlnVrON2h4vEUKMvtBqlE+49V1Jl5wKr3IhGEYc2+VNWMOuTC4
	3DEYSPZBDFQ3bTuQi+mOuZGcbs2pjyrZlVn02USha06+2pXm8rlGD3s9zfFQfmr/UXtXdeeaPgtg8
	PHpv7rcQ==;
Received: from ip6-localhost ([::1]:55458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lLPbL-005UU1-Dd; Sun, 14 Mar 2021 12:12:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23076) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lLPbF-005UTu-Uf
 for samba-technical@lists.samba.org; Sun, 14 Mar 2021 12:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=eTAapuMtkgcbeUzI1qucnDMGdIhcQxAiHU45JNcZQSw=; b=ksQvR4moW050ZUx/9GHPSb1b60
 QiKuGH7RHmkERmaGU4i1GZjfgaXuNOFfFdYua1BpR9K1brX7CvOuvss1INojRVWE3uM9DyBhy1Jz9
 hqqVIBqD4uwEO8zHftGYQUZuY8gzQ4v/EQJMa1Y7LCWXYSL748wwdvXK8MJcse6gxe++RtW+kUwgy
 1VlNUjm9VZOU5OHPnfy9ryIcL5dFLz3kfxfniek6mtfj9rmFQRd4+3JF7yZR3J+WaBXdbEAxUpXto
 c+ce6pLKW0WjGax85rAMJWNGtnmyGUCk+K0Oez2FZ4hR7C4bZrI/kZLWt1epqHkOyJgCKZwGtYclg
 lyXbp9H0ufD8y8vYPeRY9jVmyzSdpW/YKVX9s9bGBpsdwa2Q2c5fvCyjTcRFCzkgaPdAv8gmo12uh
 Z+D9VumGmQjTrZYXAyXattDCDdx0fMll1Z+fOCIPwwGcTgTrCVqDKJ2OTyQioWi8Fo7REpU2HE/bn
 NSVoULf2jaHFjWX54iZHjEKq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lLPbB-0000b3-QV
 for samba-technical@lists.samba.org; Sun, 14 Mar 2021 12:11:57 +0000
Subject: Re: Time for gpupdate
To: samba-technical@lists.samba.org
References: <b8305d58-1cc1-f38d-2abf-9252d5a679bf@kania-online.de>
Message-ID: <5660194a-a740-892f-f7b3-08341e1dd9e2@samba.org>
Date: Sun, 14 Mar 2021 12:11:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b8305d58-1cc1-f38d-2abf-9252d5a679bf@kania-online.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 13/03/2021 09:40, Stefan Kania via samba-technical wrote:
> Hello everybody,
>
> I still trying Linux-client-GPOs. Now I read in the manpage of smb.conf:
> ---------------
> The Group Policy update interval is defined as every 90 minutes, plus a
> random offset between 0 and 30 minutes.
> ---------------
> The wiki: https://wiki.samba.org/index.php/Group_Policy
> says:
> ---------
> Policies are enforced by winbind at a random interval between 90 and 120
> seconds.
> ---------
> What is the right time?
>

Probably both 😁

 From my reading of this, 'Group Policy update' runs 'gpupdate' and 
'winbind' enforces the Policies, so they are doing different things.

Rowland



