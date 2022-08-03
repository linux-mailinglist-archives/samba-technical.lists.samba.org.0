Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEEC588EE1
	for <lists+samba-technical@lfdr.de>; Wed,  3 Aug 2022 16:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YkbL0+MF4js/8wzojn/qVhmYhYuKUOoXosItyBD0QhE=; b=MMmifgh6bmzEFlgXr/OsDvsp2p
	cb4Gh/7JCkd9x/AiYVVClcG/9YJAPLkn5OxICvIqvZBhhd1rV9PUJ7hZECrxJdA0QFYCb/feKts2B
	IYcGXtJPtEmrD6uEpgFUDeZQfdSZWzwh5Sz7EyE7SO3Q65pG5Aad8mQJvPPv5blj7wwo6+zstrVSM
	h8WQ06/VBNIwM1Q3GyUdY13YHs+f2FEkTJW/rOAvYQPSb+uOmg49ESXEoycuTlDlQTOU5AJN5X4v0
	SFibKusfNscEFryoaAzXoxU+mrdSnja58y0wzvHDGl+TBXJ/DBc3NsljWgVwzJftmxI7xDDnh1xgU
	h2DALDLQ==;
Received: from ip6-localhost ([::1]:23286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oJFco-005Ea2-DB; Wed, 03 Aug 2022 14:45:30 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:58644) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oJFcj-005EZr-T7
 for samba-technical@lists.samba.org; Wed, 03 Aug 2022 14:45:28 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E939B1F891;
 Wed,  3 Aug 2022 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659537921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkbL0+MF4js/8wzojn/qVhmYhYuKUOoXosItyBD0QhE=;
 b=JTMcD0EuIrrKTpDrRNLmlwcArLYgjCWdLkjaPkVbhl6/g/xrGiJfnJVslDctmdJxRoV5Cc
 3do8kLhx1PA2rSyC/6YhgATmd+gP3nqjxRLH53LN7S+0/tSahkYw6lbKvbJoFziNP+5QQX
 sh+RKpM+3bQpTbe79dKkhuqBBWAAu38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659537921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkbL0+MF4js/8wzojn/qVhmYhYuKUOoXosItyBD0QhE=;
 b=hTau6IJBrMfyCZjgjyrNzoVWfeTky9WgOxIm/h+29yjm+ddGuAriRfuCLbQ0HqedZ+rTyb
 HA/xx5VYu2dklKAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7143313AD8;
 Wed,  3 Aug 2022 14:45:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 63aZDf+J6mKbIgAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Wed, 03 Aug 2022 14:45:19 +0000
Date: Wed, 3 Aug 2022 11:45:19 -0300
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [RFC PATCH 0/3] Rename "cifs" module to "smbfs"
Message-ID: <20220803144519.rn6ybbroedgmuaie@cyberdelia>
References: <20220801190933.27197-1-ematsumiya@suse.de>
 <c05f4fc668fa97e737758ab03030d7170c0edbd9.camel@kernel.org>
 <20220802193620.dyvt5qiszm2pobsr@cyberdelia>
 <6f3479265b446d180d71832fd0c12650b908ebe2.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6f3479265b446d180d71832fd0c12650b908ebe2.camel@kernel.org>
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
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, pc@cjr.nz,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 pshilovsky@samba.org, tom@talpey.com, smfrench@gmail.com,
 linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 08/02, Jeff Layton wrote:
>If the concern is "branding" then I don't see how this really helps.
>Very few users interact with the kernel modules directly.
>
>FWIW, I just called "modprobe smb3" on my workstation and got this:
>
>[ 1223.581583] Key type cifs.spnego registered
>[ 1223.582523] Key type cifs.idmap registered
>[ 1230.411422] Key type cifs.idmap unregistered
>[ 1230.412542] Key type cifs.spnego unregistered
>
>Are you going to rename the keyrings too? That will have implications
>for userland helper programs like cifs.upcall. There's also
>/proc/fs/cifs/*.
>
>These are a "stable interfaces" that you can't just rename at will.=A0If
>you want to change these interfaces then you need to do a formal
>deprecation announcement, and probably a period with /proc/fs/smbfs and
>/proc/fs/cifs coexisting.
>
>There are also a ton of printk's and such that have "CIFS" in them that
>will need to be changed.
>
>These costs do not seem worth the perceived benefit to me. You could
>probably hide a lot of what users see by just renaming (or symlinking)
>mount.cifs to mount.smb3.
>
>I think if you guys are serious about this, you should probably start
>somewhere else besides renaming the directory and module. This is going
>to impact developers (and people who make their living doing backports)
>far more than it will users.

I was thinking about the possible issues of a rename, and my
perspective/assessment of the impact is this:

For devs:
- from running userspace/upcall tools with "cifs" name for a while until
   everything eventually catches up
- not much else, really (enlighten me here please)

For backporters/distros:
- this might *look* like an issue first, because of the name conflicts it
   would arise when backporting fixes to older kernels, but these are
   _just_ a rename, without any functional changes whatsoever. It could
   be backported just fine as well, and customers/end users would still
   see no difference in behaviour

For customers/end users:
- at first, there should be no impact. "cifs" and "smb3" modules aliases
   are kept (and will be for a long while) and nothing else changes
   (procfs entry, idmap/spnego upcalls, mount.cifs, etc stays the same)

A note on backports: I myself (and Paulo) do the backports for our SLE
products, sometimes down to SLE11-SP4 (based on kernel 3.0) and I
could not see what other issues could appear given if we backport this
rename to released products.

Of course, I don't know every process for every distro vendors, so if
someone could provide feedback on this, I'd appreciate.

@Paulo I'd like to hear your opinion on possible issues of future backports,
if we backported this rename patch to SLES.


Cheers,

Enzo

