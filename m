Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AFB357BE
	for <lists+samba-technical@lfdr.de>; Tue, 26 Aug 2025 10:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=mVN2K8uxhY9+5ApShLTTN14yBvTHyBQXog3Fkzrmpmc=; b=KoHOUAVuIp/ezlQdhXsrVT0HuE
	niAAhvjVkkNVLyKeMOTbxED4prOOp6TNFQdDkAOe/aPCrgwmW07sbIeANhVuB4TuwlD6LY2ZQPVMa
	Mv7K1Ab4b2MT4NY4eskKQPDqHu8dbI0MQk2zI3Tvb9L1sgXt4gIMQUwDnwuWCdNZ0ZAvVtt+8QULb
	HepvjZUMl3hIhfXtVH4/0v2TPIxc3WdGEvhuJXO5JWy5j/B17+4F8bAIlzBSf2H1gMvUVwIT80w+t
	GETHcvX8tfAbzsA6xHhRU/qd3BCoJKq6LkGdxaYVnCqAkkgOTltNj7vzE8Vwsm1A0dX8yLYPyXFv3
	CjnzYvSQ==;
Received: from ip6-localhost ([::1]:34520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqpUy-000ZTj-Qj; Tue, 26 Aug 2025 08:57:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11122) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqpUt-000ZTb-Am
 for samba-technical@lists.samba.org; Tue, 26 Aug 2025 08:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=mVN2K8uxhY9+5ApShLTTN14yBvTHyBQXog3Fkzrmpmc=; b=u7nv1DV7mpjVpwbFmk7rSk97sO
 tycibwnXhYHJ1fItbS7BcUZ+MO3Wa1Y3PvmAX/+1akz1TW/Dd/ym4EsjTConSyaLZgpOZL+sDqC15
 aI90Fj7wY1xFrzDzdqoZUiZIbkdg+Q0V+3wQOszVl7KqFMldxpG+ZZ7IuLSORlmBQUCdhhd5zC99p
 Apl3eaKy/8jMO6vOJvigo1Gwxjl3LNyxIR6CZdTmYEs6Zhvrtx4Cel47tDs2+22G6FlK9WhpxItrK
 D3U+dh4EzHTxBEOQYRR4kk+thJEIkF947TpUTer/t3z4kaeLjJZrkm7D6Wuk+2vVipU+dI5tyDVJS
 fqQIhj/AnLq0ad+PUT+r6pjZ3bxmXP30je4an8+L2vrEDPqlGtaVyvBvC/4+F8Cer8ZLsgvkQO4sk
 4h0Y5nPZ6N4KpLM8AMsO+1+FvfJ+29ES2LB7pcYfao5GS/ZfdYRVDpFOpwFIj8nTIbY6AqAi0eeT3
 T3pAmwv3X8//QwhNew4crUy9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqpUs-000tr3-1g; Tue, 26 Aug 2025 08:57:42 +0000
Message-ID: <1e5ef18c-061c-4b36-ad55-7e63b444e3e1@samba.org>
Date: Tue, 26 Aug 2025 10:57:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 4.23.0 WHATSNEW entries missing
To: Jule Anger <janger@samba.org>, samba-technical@lists.samba.org
References: <60902b9c-3b00-4f23-a590-68651036243c@samba.org>
Content-Language: en-US
In-Reply-To: <60902b9c-3b00-4f23-a590-68651036243c@samba.org>
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

Hi Jule,

here the section about QUIC:

Add support for SMB3 over QUIC
------------------------------

The new "client smb transports" and "server smb transport"
allow a more flexible configuration for the used tcp
sockets.

It also got the ability specify "quic" as possible transport.
If quic should be used in addition to the defaults something
like "server smb transports = +quic" can be used.

For the client quic only works with name based uncs,
ip address based uncs are not supported.

Note for the server 'quic' requires the quic.ko kernel module
for Linux from https://github.com/lxin/quic (tested with Linux 6.14).
Future Linux versions may support it natively, here's the
branch that will hopefully accepted upstream soon:
https://github.com/lxin/net-next/commits/quic/

For the client side there's a fallback to the userspace ngtcp2
library if the quic kernel module is not available.

Check the smb.conf manpage for additional hints
about the "client smb transports" and "server smb transport"
options and interactions with tls related options.

metze

