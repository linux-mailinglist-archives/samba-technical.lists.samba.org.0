Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE634EB3C8
	for <lists+samba-technical@lfdr.de>; Tue, 29 Mar 2022 21:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=/TKnfTaPSIjxK1KQZ3FqqIMbgHfNL7XNIr7+enmmo3g=; b=FSjIyqNnCFn1fzGSHO9IAD5WVi
	tjTUqFZTbvdw+dU+kA/9Fs+nngwemjzDR1d/Q95xNog4BqDsrvHIDCsVbML2HH+mMR1S4vFOYwcV9
	BdF622wszluOfGZ/iT1sA+YO0LuAWed/hgyT7zKx2j3/taf04U9Dm4QoOdZq/xe1W5vCy6bm4uB/9
	6kREc51TtZiKbKaTHHqILkCAIv2SK9pEqdCMTxTXFQhhvKBomqUmcjTyqSJrHWWjPCoxKpIorl6ZB
	5ivYCwwCmnc0B0+5gQiO8Z1lhAPWCxc6zdcNWO3he+mvmlgbmcNqoymiPU5udvpggsvTC5E9s3ZeG
	HEMPp0gg==;
Received: from ip6-localhost ([::1]:56898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZH4v-006SGO-C0; Tue, 29 Mar 2022 19:00:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38006) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZH4f-006SGF-7u
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 19:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=/TKnfTaPSIjxK1KQZ3FqqIMbgHfNL7XNIr7+enmmo3g=; b=QwTNLnJCGT2LfzsQUQroAgXmF5
 i9ohToGPPer54LyStUiIWG+OQ30eKELQQhu28NJ7gqzwixhBWTklNiujBox+v8JnF8AJ7e1f8LjS2
 Y9QvcybTEApWu0lWa+LX8wDs6vxjykbgrb0YfN/0tosHv6ZTvaD4t6xmd6dRxkpm4sFFh3x8gB+gj
 urTKMwGx0A1uiOjFXkTcG3fimYwcfbkLBBK1JnR57q/RdDyOXJrJv8NUsPLSmFHP9rwiVeV6gMtKx
 6mEsPetXO9sahJdiozFF/v1elOn7AXyUxCiQWRNA/1lotfto3bACnKGP2REkuWCHBYi3dBNZFf2xU
 2kTs62qqz0KwCxkcj/nTcS2i9owUARqwA4ZaPBHLzL8L0YwU38XQf57H+fAuXWisl/O2ypiiGH02M
 LV8/fIYy240GRAeoShmcsmxl+kiITqmB+ACkLQbty4CufyHxok1i4jh7TSwy2VE9mGEuYXlzcTms6
 kpAIjcfvS6M84I9Z4cL02jK3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZH4c-004FlE-B6
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 19:00:10 +0000
Message-ID: <6b999085-4639-ec62-0026-e99d26c5d6f6@samba.org>
Date: Tue, 29 Mar 2022 13:00:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: samba-technical@lists.samba.org
Subject: Re: Regarding Mac os behaviour in samba domain
References: <CAM61p33mA2Oc7v_+iQj8-uuowyJJh2WTfbLGWQHUxiZdAmbLcg@mail.gmail.com>
In-Reply-To: <CAM61p33mA2Oc7v_+iQj8-uuowyJJh2WTfbLGWQHUxiZdAmbLcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: dmulder@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 3/27/22 10:36 AM, Prince Chaudhary via samba-technical <samba-technical@lists.samba.org> wrote:
> Hello team,
>   I am writing this mail after spending two three months on understanding
> samba and implementing on mixed os environment (window,mac,linux).
> 
> Samba domain works fine in case of linux and windows system,
> But in case of mac when i am joining a mac machine to samba domain it join
> properly and shows all domain users as well, all ok, but when i restart my
> machine "other users" option which allow domain users to login won't appear.
> I have to relogin in local user and then i have to logout then other user
> options appear and then i am able to login with domain users.
> 
> Can you help me with this?,
> Why this is happening and what should i do? To make it happen all i want
> that other users option on login screen of mac os machine should always be
> there whenever i restart my machine
> 

It sounds like the MacOS client is having a problem. You should contact Apple Support.

