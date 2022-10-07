Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DA75F7DED
	for <lists+samba-technical@lfdr.de>; Fri,  7 Oct 2022 21:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5C9GlnWH2PQfTnwA7VvBSXTuKeGaXDov8qfQoZWnQ2Q=; b=Ro4GdEQAq02ZigNMYV2XkUBttQ
	gb3mRANhZDnZDWCNrLmA4nj91rrLTJRYfn0hQpaF6hxt+6jsXSeiThvYkYUsW7Oeorgs2DcY5NlHB
	t1Lvevf7YIY0eGn2xEGZO/beX7zLD0T/VaC7MKZ/uNa5IOmiSeEG+guAfK7uWfCD+/3a8an+T3+9n
	0cY6eQvslQSHEtjDtvemCru+ZXjjKsZvW5jBoWv8V5K1f0knxEM4NtLJp6gtKd+i0pBjNL/1LfXSG
	CMNYLYfeD/2IPVJ+jGBpoFhivlk5DN7P12W9GIouRdI4v/vzwnPcLgZ3DxgXygZY8nXc7zDBBYKil
	Ayn7jWDw==;
Received: from ip6-localhost ([::1]:42116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogswM-000iTi-By; Fri, 07 Oct 2022 19:23:22 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:37088) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogswC-000iTZ-1v
 for samba-technical@lists.samba.org; Fri, 07 Oct 2022 19:23:19 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D5F6D1F7AB;
 Fri,  7 Oct 2022 19:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665170581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5C9GlnWH2PQfTnwA7VvBSXTuKeGaXDov8qfQoZWnQ2Q=;
 b=NSxASkEeqmb+U2+NeQXIWzIbCesMTV+RHAhMCKOr0H3s97maz0aOjrmgkX8uo1VTkNH9LI
 Ga79KR7ZlBXfXZ7zjgDths0DLdumDHIrsU+QhB1//pQqC7Jz11kovTMzLiW95IPnQtAJjl
 OVXDonP3zma3FKPsZDNTWzsWb+6C54I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665170581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5C9GlnWH2PQfTnwA7VvBSXTuKeGaXDov8qfQoZWnQ2Q=;
 b=iT/9+zw18bGxYwbsCqYfuJcGbFRaQ+xerYjzTkrnm+/GdF2xl1NzAlIvIativFbYg7ft0K
 yaotfZq2yfGM/GBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5999113A3D;
 Fri,  7 Oct 2022 19:23:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HZUFCpV8QGPCfQAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Fri, 07 Oct 2022 19:23:01 +0000
Date: Fri, 7 Oct 2022 16:22:59 -0300
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 1/2] cifs: remove initialization value
Message-ID: <20221007192259.lte3xpsjneg352um@suse.de>
References: <20221004062333.416225-1-usama.anjum@collabora.com>
 <20221004142306.ysgh45nhgdo4z3ok@suse.de>
 <fbb39e4354434cb99b6f6731cab2e0c9@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fbb39e4354434cb99b6f6731cab2e0c9@AcuMS.aculab.com>
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
From: 'Enzo Matsumiya' via samba-technical <samba-technical@lists.samba.org>
Reply-To: 'Enzo Matsumiya' <ematsumiya@suse.de>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Paulo Alcantara <pc@cjr.nz>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/05, David Laight wrote:
>From: Enzo Matsumiya
>> Sent: 04 October 2022 15:23
>>
>> Hi Usama,
>>
>> On 10/04, Muhammad Usama Anjum wrote:
>> >Don't initialize the rc as its value is being overwritten before its
>> >use.
>>
>> Being bitten by an unitialized variable bug as recent as 2 days ago, I'd
>> say this is a step backwards from the "best practices" POV.
>
>Depends on your POV.

My POV was, considering "unitialized variables" is a _whole_ class of
security bugs, a patch to specifically deinitialize a variable is pretty
much like saying "let's leave this to chance".

https://cwe.mitre.org/data/definitions/457.html

>If you don't initialise locals there is a fair chance that the
>compiler will detect buggy code.
>
>If you initialise them you get well defined behaviour - but
>the compiler won't find bugs for you.
>
>Mostly the kernel is in the first camp.

My money is on the smaller unfair chances that the compiler cannot catch
even the smallest bit of complexity of uninitialized use.

Also, initializing something to 0/NULL will, most of the time, if at all,
be "just" a bug, whereas an uninitialized variable bug might turn into a
security bug and even go unnoticed for years.

Anyway, this patch got merged and I seem to be alone with this
concern...


>	David

Cheers,

Enzo

