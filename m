Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90178616651
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 16:38:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=0mT1R9H59HQ29iu+APjmobDh/XMTJtzGO+2vtR2/e+E=; b=4Fmo4jgzYSHYQTe63XOxOJoQfX
	nbY4r3AhpBMF4Vor1uTzn0+IJmp3hEuxZaoV6JJ4q7g532jBzBXPFiTXtVQT3ZaY78Dk+Pyg9Be3b
	KC2HDIsG2j7N4B538bA9/kBYzvZBO21lEXaXWsqpsFvAjA/2Wuo+J1WAFiJkxVy5yvO7ftbORIJZ/
	0Vw+/yckgEpzgZDIaVi7sDZ9i55yw0zX6YojiA98vR9vmxJPJDuAimdbW6sKAnXm2Bzcx+4HaqQti
	zC48GrJD5kkFMPh3XU+MatNsJrzsQsKjn3MJ88bj2DPeTy0CiiMx1+MziILCQHUl+BrjxyMWvUE0R
	xJ60bSBw==;
Received: from ip6-localhost ([::1]:21848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqFnw-00A44B-Qx; Wed, 02 Nov 2022 15:37:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60146) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqFnq-00A442-0N
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 15:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=0mT1R9H59HQ29iu+APjmobDh/XMTJtzGO+2vtR2/e+E=; b=q3WlDQQlxfYHWZKCMtg1UpCxg5
 8NemwxiUon2ZAq5UDf2nO+PTv7MEEG5CDvxvC8SoC4TMQD6U6vdH77LpdqIGCoCAWnCB6X8i7UTFw
 XKaYkeEWXi4X1RDFDHzyRVTb3IHXK0B4d5gfuk99zmNU4KBzGgi/3qildYIcc4Y845tFFs4wEzScB
 CW+cokhr+v8D6okp8p9Gdkc/U64u4UeR/n/ILTpF2d+CC2J5WVDHYXSTs9SwUP7MnIORz3IZEsFT7
 C5XT8jRIDY6Hogc+JLlEDpDDpgqtCo06t7dpnpptnDXN+BcxBgNGuu82GI7taT0gi4+L+PDXWzfSZ
 dvmhox1wXV/fbrGDbYUJCLF2CTzOCtKzzh9wbEwT9EL/vR/QD2rKFammjuhEBuGNfywIoAgSJr06J
 BZvMMyIM2WoFfwaUCj8OxWpZSvWJLhneryTv/khTlmN4mpvtWXyNZAUbqUoDa1OWf1LjxHHDNuebN
 AoLG2DWajV8XUdG72MfkrK2p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oqFno-006szM-LM; Wed, 02 Nov 2022 15:37:16 +0000
Message-ID: <825cbe37-9d71-85aa-b0d0-2518e452e31a@samba.org>
Date: Wed, 2 Nov 2022 16:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: omitting SONAMEs for plugins?
Content-Language: en-US, de-DE
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
References: <13f38497-ad24-254f-68d8-0a3c66da04c0@msgid.tls.msk.ru>
In-Reply-To: <13f38497-ad24-254f-68d8-0a3c66da04c0@msgid.tls.msk.ru>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 31.10.22 um 10:22 schrieb Michael Tokarev via samba-technical:
> Hi!
> 
> What's different between a shared library and a plugin is that
> a plugin does not have a SONAME, while a library should have
> one.
> 
> When samba is built, SONAME is added to all shared objects, be
> it a library or a plugin.
> 
> I'm not familiar with waf (and with python) enough to understand
> how the final link command is constructed, the thing is quite
> a bit complicated there, with multiple layers and multiple
> operating systems and linkers support.
> 
> Is there a way to omit the SONAME field for plugins?

We have SAMBA_PLUGIN() instead of SAMBA_LIBRARY() and SAMBA_MODULE()

metze

