Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C5692458
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 18:21:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7BHP2fItmZxAhIF+dGETIFKyy8RyKHo2ourV+tsrfd4=; b=MCF7elFhDfQPrJU6etyIBLkXOp
	rlm8jfoJQ87iQIqxomZ58OqawD4EFH3oBfnH7isqfUcuKLPppeA52fEJAgSh/FS9chnZTleyw0DEK
	2fZY0zpUByjNweGKZSKJLXycSD/rVhV52IhmgaCpiCe5zfEGgWCKPu/HlNbHj3O6GrGDyzdTYbaAw
	zFKBIepKRCdi9Nykw6GRxlT+SLer9y45wSR0xkMDXoViX1Aw3a5pfX7t/tO82pGsHSjL7bVndXkbn
	lzzmKmJ+op/mvBELvFx4sYFqmESKBv62yTVrd00zTejrUM/dx7WQiOvDLsUyKjKwgdNPFpd7E8jKM
	BUEuGo0A==;
Received: from ip6-localhost ([::1]:48978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQX5Q-00B1q7-Ta; Fri, 10 Feb 2023 17:21:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20846) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQX5N-00B1py-EM
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 17:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=7BHP2fItmZxAhIF+dGETIFKyy8RyKHo2ourV+tsrfd4=; b=ETfMwvzdzA9JrQEJ7MdQYyVRbQ
 Qdyzl436/Mmyg1zK1uLKREosBobVtqDzEQxH5jI4enTbGD9hgJF3eKhzuYjcnro4WqKFxHhHURVjF
 sPGA0crfpI1e6WAGh4eoWMEjGypsnHGz2P1jgApU3P3DFG3AqMnSK5zWUyYoBB+WpgYkxD7lEjH42
 EK59juDhqS9MEvGrH/kwiWZcqsokL42h1BeG7SU2ziC7EIYSGywdahRUUsLOJqIEMselv3fFznABR
 kThiO3WjdjQmofW77mr1YqKZABHgW+/qXiA8WCtvXvKRRrUVH00K541zAKs2Tgg+XM/Tn9bRdqCsj
 2t1EPcRUOKj7ICJPdMElAGN85XreVeDNh06Lfo9Tkx8zFbXMu/KOSSPwatDfsMO7PQaylMlkZBiul
 pzPxEGepvnYmmHdC/XpGSqg5Kj6trsnj0/uobni87i7L4aAUSbQurDWe6+c0XApyfXFRpTnou58y2
 EuIAB6EXRU1wa76HedPAbEFu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pQX5M-00D2E5-4y; Fri, 10 Feb 2023 17:21:20 +0000
Date: Fri, 10 Feb 2023 09:21:17 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: "smb ports" smb.conf option
Message-ID: <Y+Z9DT5IsMARzULL@jeremy-acer>
References: <CAH2r5mu5MhzONuh8HtnrDBrSzkz3_WeaTaOQ-tFiQZ_j4oUOdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mu5MhzONuh8HtnrDBrSzkz3_WeaTaOQ-tFiQZ_j4oUOdA@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 09, 2023 at 11:12:02PM -0600, Steve French via samba-technical wrote:
>Since Linux client ("port=" mount option) and Samba server ("smb
>ports=" smb.conf option) can use ports other than 445 - has there been
>a commonly used alternative (e.g. to work around port 445 blockage) or
>has the port chosen always been random?

Always been up to the user setting the option.

