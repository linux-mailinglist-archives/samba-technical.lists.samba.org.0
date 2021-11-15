Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A891450A37
	for <lists+samba-technical@lfdr.de>; Mon, 15 Nov 2021 17:54:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=k26W8xtMh0d+5SOCUDM/wjEcGZ+ELdJFPj7pdNOLbFU=; b=eU9sKqdIzMCqd8Qa6i0LHwMNqd
	mmNkDwHYN/pMVHejqQ2Z2NWWwa+3+B7yOon25xVP1Ilph4RwGPYTL/xmsVNMKDDcO0oB5NT5wYOXu
	NUGTw6wnDb11YE5EXp9yuV2vXKP+fvm2Oahk5CB5cSNHCYY51oKMmxOlUpvYM/HyqOMPBZV4QAZiu
	lYRHB6loBau4EXcPG0p+l7psE5Qs5XmfnRUX0Zz1NbMkTcZR2XXIxv3dIo/O0eA6qqPoOgdrFYcO7
	kaR1rq1UQ9dC7eEVITPCQjDfZxv53ZF/u3e6fSvwJa6Z2NCxCNQccMIB91o9vgBvC+vPG828dgVjI
	8HWQlXgw==;
Received: from ip6-localhost ([::1]:28018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mmfEn-001ZRQ-IV; Mon, 15 Nov 2021 16:53:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58258) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mmfEi-001ZRG-3M
 for samba-technical@lists.samba.org; Mon, 15 Nov 2021 16:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=k26W8xtMh0d+5SOCUDM/wjEcGZ+ELdJFPj7pdNOLbFU=; b=RC5iI1PcWA/ptyibSOhjwYXlEC
 WZ+xWnPJO3DCeFGpVHxCiCPwFiJgJ3Wh2aszx+vtRVG5HN73csE8UNSo+pkQqwgRRs6d4aWNoQqrV
 h4a+LAb0aq5p169ge/pA+OuBSydzbFx9wEXXPCmORVx9dkV/lyqzZ/Tx3EHgXJZdwKMA/RWrHVt3z
 qPvBkOs8HdqgCjt/JgPPFOWXZx2vw7Q46XomouCneAnvQ9VfQD7l3vUiE7iLiKVmnKR0DoxV/UNAK
 DLvemwRAAiPBpkGav7sK+LmXxF37b2qjE0NRnASVcd1LN2xAdQUOFr/p+wy9KvPYR1c5ES10F8T4m
 EBIA4MJmj1T4IeePKDGaz7lfVrRREMRN5QDDz0KQcwfFkT2dUUb99N8+JdzD6S1LPEye+5QvA9FNU
 bp+FMyWppayr8IohSr5nlWmx5+8bWgGCncIznC0f/ANf+2CDeB1S5fo3uNgKde6jnYXOadcSydbdE
 wk0/V1k5D25rBtjzKTqY6h+W;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mmfEg-007EZA-Q9; Mon, 15 Nov 2021 16:53:39 +0000
Date: Mon, 15 Nov 2021 08:53:36 -0800
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: GitLab CI runners rebuilt
Message-ID: <YZKQkOUG9cUzWkLC@jeremy-acer>
References: <f4f292d60951b18d7be31def569bb6e4c23258ef.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f4f292d60951b18d7be31def569bb6e4c23258ef.camel@samba.org>
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

On Fri, Nov 12, 2021 at 08:39:40PM +1300, Andrew Bartlett via samba-technical wrote:
>I've rebuilt the GitLab CI runners and destroyed the old bastion host.
>
>Hopefully nothing will be noticed, but just in case there are different
>wobbles over the weekend I figure I should tell folks.
>
>We need to do this every few weeks as the Rackspace images we use get
>updated, that keeps the runner start fast and the instances more
>secure.

Thanks for the maintanence work. It's not usually noticed or
appreciated, but stuff like this is what keeps Samba running :-).

Thanks !

