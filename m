Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483D8C44DC
	for <lists+samba-technical@lfdr.de>; Mon, 13 May 2024 18:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hlrkIL+5VeaHqrWJHY1AwO/gy5X9kZKher73VPElw3U=; b=texcZVCq/2rYCSdbZei3RR7CRv
	Qf0eX+W6SAoiD36qiquhSRMmDU00XPzN6k0xA31wT3Ugpf9z1H18Ai5DxpTDJLhYS7LqHGEfdNmVB
	xRNJGhbYhm2k+WnOML733a5nyE7yXeTRWama5nSfdbCKrbIEer/r75kYYVzQSD6aLoRLIXH8gl5zY
	FQEO+tcA6wYfXn34sL0JyrsJAqFfPluNsCY/rT8/aeHkDmfp83Atxn04vdXTqEqdLt1QYLQuT4Eh8
	giOsqOssQyi5qDgxBKmeCF1ogCaomD/taEyWCvY9pJoV3L9N3ZpxwjKGaaBBFoiANRjUalpcAVcDn
	uTNKuacQ==;
Received: from ip6-localhost ([::1]:30446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s6YFx-008nc6-M1; Mon, 13 May 2024 16:10:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52500) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s6YFt-008nby-PV
 for samba-technical@lists.samba.org; Mon, 13 May 2024 16:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=hlrkIL+5VeaHqrWJHY1AwO/gy5X9kZKher73VPElw3U=; b=WuskxAzF2N1MZOpRO1C3nIa2b+
 jfSgJWHGmOXp0rijxO3IWu5OFXOqplxSYCUjM6rTHBzFjCZUD+X9Tnn7X2onP2GEQZDZ27Vg0gsWW
 QMGIGVBg+XSvKcP2/5TbAcSwJ4anWsGOeMgDUuRchLE98Y9jZnn5ITlCgC5O3mtH5M6ZH7xUuQYNW
 gHvIVFsStvYEa6DbYzHNaJdJjS0HGytW5gi58CA071qJMUbf17P+S2fmoA7WDPRFoDPs3C05rDkbj
 vqquFVB8W8GTgK9/G8BBXJpmhNfNYOThn/ipm8iFapBuZei2q+8oE/9pNunDh3Yj4CZ0OJxQ2ko8k
 l2EJYN1HYaWJElbOR5zDG+YFXiQtzAREnZ3OYK9KRD8TocMwxsgBeItOv80kUnbWUriI3eagC2yRo
 YRC+RXhBk3l512lCQ3mNEWMEv2glu9qyMjhBf72YiuBVXnuXpMK4y2+f2fC62hGep0khxNssMRVy1
 czJCSv5Akf+iAm+yypBO8jon;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s6YFs-00BDqS-0z for samba-technical@lists.samba.org;
 Mon, 13 May 2024 16:10:24 +0000
Date: Mon, 13 May 2024 17:10:21 +0100
To: samba-technical@lists.samba.org
Subject: Re: Openchange and last Samba releases ?
Message-ID: <20240513171022.18943734@devstation.samdom.example.com>
In-Reply-To: <CAN4xyZOYsusPpMjOyUakgEsdjQQsXZRNTER-Jq4Zis20F6gKWQ@mail.gmail.com>
References: <CAN4xyZOYsusPpMjOyUakgEsdjQQsXZRNTER-Jq4Zis20F6gKWQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 13 May 2024 17:38:51 +0300
CpServiceSPb via samba-technical <samba-technical@lists.samba.org>
wrote:

> Was anybody successful in building of Openchange with the latest Samba
> versions ?

I thought that openchange was a dead project, I seem to remember that
it relied on private Samba protocols and it wouldn't build when these
changed.

> If yes, was it a git Openchage version or some customized/tuned one ?
> And what was the Samba version ?

The last Samba version I can recall it building with was around 4.2

> 
> Just in case,I founded the following quite git repositories:
> https://github.com/openchange/openchange
> https://github.com/openela-main/openchange/tree/el9/SOURCES
> <https://github.com/openela-main/openchange>
> https://github.com/Zentyal/openchange
> https://github.com/SlavekB/openchange

Yes, but they do not seem to have received any updates for years.

I am not saying 'do not try to build it with the latest Samba', but that
it will undoubtedly require a lot of work, including rewriting large
parts of openchange.

Rowland


