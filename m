Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF6827C50
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jan 2024 01:56:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=nn5AChTBCR51VMufCoVcLT8QHSXkHdgDPjOqMa0YGGI=; b=DQfZB1ecSOYkT8DtdwuPGARtLF
	ig/tsMLVx3d+/ZO1LhGmraCtM2xWPXp0YWrVuyqJYweCQhAEbruSfKB/A+aw47LMAronENkwOIbjs
	d34fctkUkTup7Z6/8jNAMM/7ZCJcD+zPrkatZRiIUOMgOf5RKtYhSs8ThnE1K63/xwEu6tW46faSR
	ISHlBmK/1AtvESO10paPT2+DqZ0Yh+X1UGF9zzEh28451zz8ADZ7F3Ba+p7CC1WfGK7LaXiB0FyFt
	0D+6vg8HTyAXe12YHyC7wLbae4O+fGV5TA8y0ob8Ga30BJMPh5+dWiJGtnh97w+ybg263fF+8zpID
	zcC8nIHA==;
Received: from ip6-localhost ([::1]:30168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rN0Q4-002pyP-5H; Tue, 09 Jan 2024 00:56:40 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1]:40626) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rN0Py-002pyI-5v
 for samba-technical@lists.samba.org; Tue, 09 Jan 2024 00:56:37 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4AC942204A;
 Tue,  9 Jan 2024 00:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704761791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nn5AChTBCR51VMufCoVcLT8QHSXkHdgDPjOqMa0YGGI=;
 b=gLUhqLodYaiD8PWxBYHCMxnu6owgFz+qROBmZLV+MX8YYbWUIRysW69WSFKYlvcNuWgdET
 +Yh4p58WXP91WyYuub6g8SzTduaLVg+dIYF7J2cmqOYTQuZA9EsjZ0pNKX3+jTJIgtNJva
 CQv6Y1+xY+/8oMNx6dR4bh7zZAnNG0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704761791;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nn5AChTBCR51VMufCoVcLT8QHSXkHdgDPjOqMa0YGGI=;
 b=BucA54GmhgenUKGWeVQHebgLfJEwCMCv6+JyT96diV/MCBYsOd8vxumIq2EnIRwMJWJGFc
 q1zj0mmcU1gkJ2DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704761791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nn5AChTBCR51VMufCoVcLT8QHSXkHdgDPjOqMa0YGGI=;
 b=gLUhqLodYaiD8PWxBYHCMxnu6owgFz+qROBmZLV+MX8YYbWUIRysW69WSFKYlvcNuWgdET
 +Yh4p58WXP91WyYuub6g8SzTduaLVg+dIYF7J2cmqOYTQuZA9EsjZ0pNKX3+jTJIgtNJva
 CQv6Y1+xY+/8oMNx6dR4bh7zZAnNG0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704761791;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nn5AChTBCR51VMufCoVcLT8QHSXkHdgDPjOqMa0YGGI=;
 b=BucA54GmhgenUKGWeVQHebgLfJEwCMCv6+JyT96diV/MCBYsOd8vxumIq2EnIRwMJWJGFc
 q1zj0mmcU1gkJ2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C43521392C;
 Tue,  9 Jan 2024 00:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kMVQIr6ZnGXcDwAAD6G6ig
 (envelope-from <ematsumiya@suse.de>); Tue, 09 Jan 2024 00:56:30 +0000
Date: Mon, 8 Jan 2024 21:56:28 -0300
To: Jacob Shivers <jshivers@redhat.com>
Subject: Re: Linux client SMB and DFS site awareness
Message-ID: <20240109005628.5xbwpkqc75okxmcg@suse.de>
References: <CALe0_77CgEXNiXrM4oQ47sfHnDoML18oz5rmEu-_57Av0KRTkg@mail.gmail.com>
 <20240108181751.natpy6fac7fzdjqd@suse.de>
 <CALe0_777GL=XQYSochOoph73madKm8DsRn+xQOcTmz9xh+wcHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CALe0_777GL=XQYSochOoph73madKm8DsRn+xQOcTmz9xh+wcHQ@mail.gmail.com>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; BAYES_HAM(-0.00)[12.83%];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -1.30
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
From: Enzo Matsumiya via samba-technical <samba-technical@lists.samba.org>
Reply-To: Enzo Matsumiya <ematsumiya@suse.de>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jacob,

On 01/08, Jacob Shivers wrote:
>Hello Enzo,
>
>Thank you for the response!

Thanks for elaborating.

>I failed to mention the initial aspect that is specific to mounting a
>domain based DFS share. This would contact a random domain controller
>instead of a DC local to the calling client's site, should it exist. A
>CLAP ping like that used by SSSD[0] could be used to identify the
>nearest domain controller prior to initiating a subsequent mount
>request. This is where the DNS discovery for a ldap entry would be
>applicable.
>
>Hope that helps to clarify the use case.

This is pretty much what I had in mind, but I still see it as a
server-side situation, both from the spec side, as from a personal POV.

The DC the client connects to should have all the info in-place and
ordered (either by site location or by cost) to return to the client,
where it will contain the highest priority target as the first entry on
the list (that will probably not be itself, see below).

On Windows Server, you can create a registry key [0] on the DC to force to
put the logon server (the server the client is authenticated to) as the
topmost entry on the DC referrals list.

This behaviour is disabled by default, and the reason (as I understand),
just like your proposal, is because it would defeat the transparency that
DFS offers; the client would be "forced" (either by manual input or by
discovery) to know beforehand where it's connecting to, where MS-DFSC shows
that the client shouldn't be aware of such details.

I haven't tested, but I would expect the DC I'm connecting to to offer
the closest targets, no matter if on the same domain, different
domain/same forest, or even in a forest-forest (with a trust
relationship) scenario.  Do you have a practical test case where this
doesn't happen?  OS type and version, along with an overview of the DFS
setup would be helpful to analyze as well.

[0]
add/set HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dfs\PreferLogonDC
(DWORD) to 1


Cheers,

Enzo

