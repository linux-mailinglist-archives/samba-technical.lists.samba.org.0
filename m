Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141FC30929
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 11:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WIjkPUNIRAE79TpWzYd8KOuj6zEfbu2marx4yh29XGg=; b=wVhWv5iQHhfITEv+L1XeKt6ziV
	wxXKw8sLzdVpawVLsHa7bEJ8ZiwubNLk/T57plWo6LtbySE+a+mPbcPXPPKM9HBFaFFODEx0Kfo+k
	0NeMGTmYSzbBdxPwgOaKduXQJZ6B1dRE1hQexPNFvjsQYEeDDUWZ6nzeWqx005W/CSnqPz/xnks+F
	X4SQKz+T5qkSszN42EqroacqT/sUulBoUA7FzH+Vll72ogXWjLgdQRFpt9jM6FA5c+6hzpoOGGUdp
	i1DkqGXl6Kwx/8tmX7AdE8kl62cHxp/4+v8ORw1wNZ0sixsXZrh3rUKD/+uSDGhk/pZ6deqGTYtvE
	i5hVjuCA==;
Received: from ip6-localhost ([::1]:36876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGEYQ-00BRwJ-34; Tue, 04 Nov 2025 10:46:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45642) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGEYK-00BRw7-OT
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 10:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WIjkPUNIRAE79TpWzYd8KOuj6zEfbu2marx4yh29XGg=; b=wK+0821yx2MvfDEJEB6p5YfJzl
 m/Yad9raOt66qnvqLa75AAO+FcG6gQ94F9jT8mFC1QGPtNoq0Kgb5r4BKxzQExGiRwUcurg0mZZ1V
 ekaKODFMCt42vEJmki23gpUjEwXoyKZ5Xkl1BseDNwzSkDbbq2ueR6dFjB9PW3wy1zAorWmuvgcdg
 2cE/Hinluy5gY/TPXce7ZTuPm5xNK/mvUzDrIWvNgbFmBu9TRwLkU46Ex2JsVWvyE3XbQBApmI78U
 Klj5SFdC4ejpmGQgbHghFvqFq0nXl4RkoFtO8Xzpku5oibnOZTBAvh3edLJdphJ0XoUO/zgGiCQey
 u+aq8n4d0YbYLXh9kYvEVGnyxsFzUO4Ca/LuAasPRXSik7DM9KGYVovkwWliHPESFXNfwI/+v/goZ
 LD9rOz/L0kfTP7hpwc0OiosyGVBdC4p5p4HpKWBVF8Q+6dXPnSTWWIW9duI1EiGg0CQRzRv5a0wiR
 SFY0VE/VPHCY8PR+YmY6GX+l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGEYJ-00CW0A-0C; Tue, 04 Nov 2025 10:46:15 +0000
To: samba-technical@lists.samba.org
Subject: Re: Top 20 developers with open Merge Requests
Date: Tue, 04 Nov 2025 11:46:14 +0100
Message-ID: <3942579.7Z3S40VBb9@magrathea>
In-Reply-To: <d2990f6b-3ef4-4753-9771-70a2921060fb@samba.org>
References: <7684109.rdbgypaU67@magrathea> <11918736.eNJFYEL58v@magrathea>
 <d2990f6b-3ef4-4753-9771-70a2921060fb@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 4 November 2025 11:25:53 Central European Standard Time Stefan 
Metzmacher via samba-technical wrote:
> --only-older-than= and --only-newer-than=

https://cpaste.org/?
78364f0cf6010f4d#G1BsLsYbMsJMRiB6HdknPFHchGubSYNTWVx9pzbqUF2c

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



