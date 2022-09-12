Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 944C65B53A6
	for <lists+samba-technical@lfdr.de>; Mon, 12 Sep 2022 07:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Pa2tM8kQKr8724t5VPraRwpy8UCxXWndh5kdpjMinLs=; b=AtsxhMLBndkyoofsOGMinIJmAC
	hCM1FWxvGCXwsdH+iruzFTOXw/rDeeX4DdhWfN1hpx9KjO69DXr5tqCAaAutJAw3j4guZcDOm+eng
	1oph5WvBOClLbuxIyxRibn3W7i2wtVda80w4zzqkpY83oOZ7XCs0Q4CCB+Pf6nvajn8YosWSXNYez
	LkOX37QHhiRwmgNZI7fOIBv3DCV5BP4bjQcKzN3SwBYEsToM/FWNBiIxqc07vbFrosRk7ahRZKXyf
	m3CEnIu48MVl6JbrBXuhhD3UVxhDyIC8+kq+9iLRlzG7l/daexe0pEzY3eOo1LvCA8xHvq30ThAKj
	6ouhbP6w==;
Received: from ip6-localhost ([::1]:28084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oXcM7-0000fg-V8; Mon, 12 Sep 2022 05:51:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31226) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oXcM3-0000fV-Dv
 for samba-technical@lists.samba.org; Mon, 12 Sep 2022 05:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Pa2tM8kQKr8724t5VPraRwpy8UCxXWndh5kdpjMinLs=; b=KGEEi9/ta6VFfr3JYxWlM88Q8p
 szOKdHqxb+aC5k28SkEQuTulJ7R9lSMXwbFKLzI+1Db88r+fXICqam2lSZBlGkTkC6lFvy3P37E9Q
 VoCnwZEtSlAbEHgFlSmv3QSbg+z88j0Kjsiquw5ykQnfPfHEGEdU1yeIdaUYDJet4ZQ3KY0133V9S
 cNRbileC9CF/cnkXRpD5+zcQundcv88WMy9yTejeiHqHnnYWaliP2me7X68CCvTzjIO2LazvJkLJh
 dprVy44GW9612EIgmKapw0a3KFrkEFMAD0v5QEpp/0QVa76/2VM/Uyhc8Az9fVaRKUPol56mwNJo/
 dMzequq2KUmk4ic7n8me2/OcBD0ASVMD2S1AWgpaoIiC6WitLOdn8TcwSsrXE8T33gtsGrvs2Udpf
 bE3CDSQ/T/OGYGhDpKVzY5VZs/1wjjor52Pbn2JMPAbvzqpwsq5v+VID9x6aiUSdqr5FazEz+iBAM
 fLdUBNyTxS8iMMDFAyfUmyi/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oXcM2-0000UY-18; Mon, 12 Sep 2022 05:51:34 +0000
Message-ID: <f19d2bf6-6b05-f782-fcfa-1c09c867dcb2@samba.org>
Date: Mon, 12 Sep 2022 07:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH][SMB3.1.1 client] fallback to query fs all info if posix
 query fs not supported
Content-Language: en-US
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAH2r5mvC5sqwuLyLt=3PXYvPegOm-8rqSMYcCpjM3+T64fv2sg@mail.gmail.com>
In-Reply-To: <CAH2r5mvC5sqwuLyLt=3PXYvPegOm-8rqSMYcCpjM3+T64fv2sg@mail.gmail.com>
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

Am 12.09.22 um 07:36 schrieb Steve French via samba-technical:
> A version of Samba that I was testing, supported POSIX extensions, but
> not the query fs info
> level.  Fall back to query fs all info if POSIX query fs info not
> supported.
> 
> Also fixes the problem that compounding wasn't being used for posix
> qfs info in this path (statfs) but was being used in others, so
> improves performance of posix query fs info.

I don't think having hacks to work with work in progress branches should be
added, instead the server should be fixed.

metze


